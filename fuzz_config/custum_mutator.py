#!/usr/bin/env python3
import random
import struct

def init(seed):
    random.seed(seed)

def deinit(): pass

def generate_block(block_type):
    """生成单个block"""
    header = random.randint(1, 10000)
    if block_type == 1:
        numbers = [random.randint(0, 256) for _ in range(64)]
    else:
        numbers = [random.randint(0, 256) for _ in range(8)]
    return [header] + numbers

def mutate_block(block, block_type):
    """变异单个block"""
    if not block or len(block) < 2:
        return generate_block(block_type)
    
    # 变异header
    if random.random() < 0.3:
        block[0] = random.randint(1, 10000)
    
    # 确定数字数量并调整
    num_count = 64 if block_type == 1 else 8
    if len(block) > num_count + 1:
        block = block[:num_count+1]
    elif len(block) < num_count + 1:
        block.extend([random.randint(0, 256) for _ in range(num_count + 1 - len(block))])
    
    # 变异数字
    for i in range(1, len(block)):
        if random.random() < 0.2:
            block[i] = random.randint(0, 256)
        else:
            block[i] = max(0, min(256, block[i]))
    
    block[0] = max(1, min(10000, block[0]))
    return block

def generate_bigblock():
    """生成一个完整的大数据块(包含block1-7)"""
    bigblock = []
    # block1
    bigblock.append("[BLOCK1]")
    bigblock.extend(map(str, generate_block(1)))
    # block2-7
    for i in range(2, 8):
        bigblock.append(f"[BLOCK{i}]")
        bigblock.extend(map(str, generate_block(i)))
    return bigblock

def mutate_bigblock(bigblock):
    """变异一个大数据块"""
    if not bigblock:
        return generate_bigblock()
    
    # 分割出各个block
    blocks = {}
    current_block = []
    current_type = 0
    
    for item in bigblock:
        if item.startswith("[BLOCK"):
            if current_block and current_type > 0:
                blocks[current_type] = current_block
            current_type = int(item[6])
            current_block = []
        else:
            try:
                current_block.append(int(item))
            except ValueError:
                current_block.append(random.randint(0, 256))
    
    if current_block and current_type > 0:
        blocks[current_type] = current_block
    
    # 确保有7个block
    for i in range(1, 8):
        if i not in blocks:
            blocks[i] = generate_block(i)
    
    # 变异各个block
    mutated = []
    for i in range(1, 8):
        mutated.append(f"[BLOCK{i}]")
        mutated.extend(map(str, mutate_block(blocks.get(i, []), i)))
    
    return mutated

def fuzz(buf, max_size):
    try:
        # 解析输入数据
        data = buf.decode('ascii').strip().split()
        bigblocks = []
        current_bigblock = []
        
        for item in data:
            if item == "[BIGBLOCK]":
                if current_bigblock:
                    bigblocks.append(current_bigblock)
                current_bigblock = []
            elif item == "[ENDBLOCK]":
                if current_bigblock:
                    bigblocks.append(current_bigblock)
                current_bigblock = None  # 等待下一个BIGBLOCK
            elif current_bigblock is not None:
                current_bigblock.append(item)
        
        if current_bigblock:
            bigblocks.append(current_bigblock)
    except:
        bigblocks = []
    
    # 确保至少有一个大数据块
    if not bigblocks:
        bigblocks = [generate_bigblock()]
    
    # 变异各个大数据块
    mutated_blocks = []
    for block in bigblocks:
        mutated_blocks.append("[BIGBLOCK]")
        mutated_blocks.extend(mutate_bigblock(block))
        mutated_blocks.append("[ENDBLOCK]")
    
    # 生成输出
    result = " ".join(mutated_blocks).encode('ascii')[:max_size]
    return result

if __name__ == "__main__":
    init(0)
    test_cases = [
        b"[BIGBLOCK] [BLOCK1] 5000 " + b" 0"*64 + b" [BLOCK2] 100 " + b" 128"*8 + b" [ENDBLOCK]",
        b"[BIGBLOCK] [BLOCK1] 1 " + b" 0"*64 + b" [BLOCK2] 10000 " + b" 256"*8 + b" [ENDBLOCK]",
        b"invalid data",
        b"[BIGBLOCK] [BLOCK1] 8000 " + b" 255"*64 + b" [BLOCK2] 5000 " + b" 128"*8 + b" [ENDBLOCK] [BIGBLOCK] [BLOCK1] 1 " + b" 0"*64 + b" [ENDBLOCK]"
    ]
    for case in test_cases:
        print(f"Original: {case.decode('ascii', errors='replace')}")
        mutated = fuzz(case, 2000)
        print(f"Mutated: {mutated.decode('ascii')}\n")