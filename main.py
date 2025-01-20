
from random import randint
def generateInputs(output_dir,BUFFER_SIZE=8,LEN=8):
    with open(output_dir,"w") as f:
        for i in range(BUFFER_SIZE):
            for j in range(LEN):
                f.write(str(randint(0, 255))+" ")

if __name__==    "__main__":
    outputdir="./input.txt"
    generateInputs(outputdir)