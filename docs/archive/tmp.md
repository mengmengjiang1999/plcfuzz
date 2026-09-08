> [!NOTE]
> 本文件是论文写作阶段保留的历史草稿，只用于追溯学术研究过程，不是当前操作指南。文中的旧术语和示例代码反映当时的记录；当前项目范围与用语以仓库 README 和 CONTRIBUTING.md 为准。

\subsection{动态运行状态监控与异常检测}

在PLC模糊测试过程中，竞态条件（Race Condition）问题的检测面临独特挑战。与通用软件漏洞不同，此类问题触发时通常不会导致程序崩溃，而是表现为输出信号的持续振荡。这一特性使得传统基于崩溃检测的模糊测试框架（如AFL++）难以有效识别异常。传统框架主要依赖进程监控机制（如fork/waitpid）和内存检测工具（如AddressSanitizer）来识别程序崩溃或内存安全漏洞，但这些机制无法检测PLC运行时出现的功能性异常。

针对这一挑战，本研究设计了一种基于运行时状态分析的检测框架。该框架在PLC虚拟执行环境中嵌入了轻量级监控模块，能够实时捕获变量状态、I/O信号及扫描周期时序等关键运行时数据。监控模块的采样频率与PLC扫描周期保持同步（典型值为50ms），确保完整记录每个扫描周期的状态变化。

在检测机制方面，本研究创新性地采用了双缓冲区架构。输入端口和输出端口分别配置了容量为100个扫描周期的环形缓冲区，用于记录历史数据。在每个扫描周期结束时，检测算法会对缓冲区中的数据进行分析。当检测到输入数据保持稳定而输出数据出现异常跳变（变化量超过预设阈值）时，系统将触发异常警报。这种基于状态一致性的检测方法能够有效识别由竞态条件引起的输出振荡问题。

与传统的崩溃检测方案相比，本方案还提供了增强的诊断能力。系统会记录漏洞触发前后的完整执行轨迹，支持异常模式的特征提取与分类。这些时序日志为竞态条件的根因分析提供了高粒度的数据支持。同时，该监控层与AFL++框架的异常检测机制深度集成，确保模糊测试过程中能够及时捕获潜在的功能性异常。


\begin{lstlisting}
// 周期结束时的竞态检测函数
template <typename T, int Dim = 1>
class BasicBufferHistory : public SuperBasicBufferHistory {
public:
   bool check_change() {
        // std::cout << "BasicBufferHistory<T, Dim>::check_change() called." << std::endl;
        int change_count = 0;
        for (size_t i = 1; i < MAX_RESULTS; i++) {
            bool is_crash = false;
            for (size_t k = 0; k < BUFFER_SIZE; k++) {
                if (buffer_output[k][i] != buffer_output[k][i - 1]) {
                    is_crash = true;
                    break;
                }
            }
            if (is_crash) {
                break;
            }
            if (is_crash) {
                change_count++;
            }
        }
        if (change_count > 0) {
            return true;
        }
        return false;
    }
};
template <typename T>
class BasicBufferHistory<T, 2> : public SuperBasicBufferHistory {
public:
   bool check_change() {
        this->print_history();
        std::cout << "bool check_change() called" << std::endl;
        int change_count = 0;
        for (size_t i = 1; i < MAX_RESULTS; i++) {
            bool is_crash = false;
            for (size_t j = 0; j < 8; j++) {
                for (size_t k = 0; k < BUFFER_SIZE; k++) {
                    if (buffer_output[k][j][i] != buffer_output[k][j][i - 1]) {
                        is_crash = true;
                        break;
                    }
                }
                if (is_crash) {
                    break;
                }
            }
            if (is_crash) {
                change_count++;
            }
        }
        if (change_count > 0) {
            return true;
        }
        return false;
    }
};
\end{lstlisting}


当检测到竞态条件时，系统将触发报警机制，通过向PLC模拟程序注入异常信号，使AFL++模糊测试框架能够识别程序异常状态，从而有效检测潜在的竞态条件问题。

此外，框架提供了可扩展的接口设计，支持研究人员根据具体工业场景的安全需求自定义检测规则。例如，在化工、能源等不同应用领域，用户可以灵活设定变量阈值报警参数或定义特定的时序约束条件，实现对多样化安全威胁的精准检测。这种可配置的检测机制显著提升了框架在不同工业环境下的适用性和检测效率。

\section{动静态协同的模糊测试框架}

基于AFL++模糊测试框架和MatIEC编译器，本研究实现了一个面向PLC代码的覆盖率引导模糊测试系统。如第\ref{chapter:background}章所述，通用计算领域的模糊测试技术已较为成熟，但其检测机制主要针对程序崩溃等传统异常模式。针对PLC环境中特有的竞态条件安全问题，本研究对通用框架进行了多维度的适配与增强。前文已详细阐述了关键技术创新点，本节将从系统整体执行流程的角度进行综合性介绍。

完整的模糊测试系统应包含三个核心组件：程序输入输出处理机制、测试用例生成与变异策略，以及异常检测与反馈系统。图\ref{fig:system-structure-fuzzing}展示了本研究所提出的动静态协同分析框架的总体工作流程。



\begin{figure}

\centering

  \includegraphics[width=0.9\linewidth]{figures/fuzz.png}

\caption{动静态协同的PLC安全分析框架的总体流程}

\label{fig:system-structure-fuzzing}

\end{figure}


具体而言，本系统在以下几个方面实现了针对性的改进：

\begin{enumerate}

\item \textbf{输入输出适配层}：针对PLC的I/O映像区特性，设计了数字量与模拟量的统一处理接口。

\item \textbf{变异策略优化}：结合静态分析获得的变量映射表，实现基于程序语义的智能变异。

\item \textbf{异常检测机制}：通过运行时监控模块捕捉输出振荡等PLC特有的异常模式。

\end{enumerate}

接下来将依次详细说明各模块的设计原理与实现细节。


\paragraph{程序的输入与输出}

\begin{figure}

\centering

  \includegraphics[width=0.9\linewidth]{figures/system-structure-IO.png}

\caption{程序的输入与输出}

\label{fig:system-structure-IO}

\end{figure}

PLC程序的输入输出机制具有典型的工业控制系统特征：输入信号来源于传感器等外部检测设备，输出信号则作用于LED指示灯等执行单元。为构建通用的模糊测试环境，本系统设计了外部设备模拟层，其核心是基于时序约束模型的状态机架构。该模拟层与PLC程序保持扫描周期同步，通过精确模拟各类外设的时序行为，为模糊测试提供可控的输入信号源。如上一节所述，该方案采用轻量化建模方法，在保证模拟精度的同时显著提升了测试效率。

在具体实现上，模糊测试引擎与设备模拟层通过双向数据通道进行交互。在每个测试周期中，模糊测试器从模拟层获取当前扫描周期的输入数据，经过处理后传递给被测PLC程序；同时，PLC的输出信号反馈至模拟层，驱动状态机进入下一状态。该闭环交互机制确保了测试环境的高度可控性，为深入探测程序异常创造了有利条件。

\paragraph{测试用例生成和变异的方法}


\begin{figure}

\centering

  \includegraphics[width=0.9\linewidth]{figures/system-structure-mutation.png}

\caption{基于静态分析的种子变异策略}

\label{fig:system-structure-mutation}

\end{figure}

输入的测试用例包括对外设各端口值进行时序建模后得到的结果。AFL++ 是基于 AFL 框架的模糊测试工具，采用多种种子变异方法以提升测试覆盖率并发现潜在缺陷。本研究基于 AFLplusplus\cite{aflplusplus} 的模糊测试结果，结合覆盖率引导的执行反馈，综合采用以下方式对测试用例进行变异。

在上一节中，我们展示了模拟外设与模糊测试系统之间的交互接口。针对外设数据的变异策略，本研究将变异方案划分为两个部分。对于外设的时序部分，通过自定义变异器确保生成的时序数据既有意义又合法。

模糊测试器在进行变异时，首先考虑时序问题，对不同数据类型的外设输入均优先变异其持续周期。随后，针对不同类型的外设引脚输入数据，种子变异将采用各自不同的变异策略。



在通用计算机软件的模糊测试中，常用的方法有：

\begin{enumerate}

\item \textbf{位翻转（bit flip）}：通过随机翻转输入文件中的比特位来实现变异。

\item \textbf{字节翻转（byte flip）}：对种子数据中的一个或多个字节进行左移、右移或大小端转换操作。

\item \textbf{算术运算（arithmetic）}：对数据进行加减运算，以生成新的测试用例。

\item \textbf{设置特殊值（Interesting Value Insertion）}：用一些已知容易引发错误的边界值（如0、-1、最大值等）替换数据中的某些部分。

\item \textbf{杂交/拼接（Splicing / Hybrid）}：取两个不同的种子文件，将它们的部分内容拼接在一起，生成一个新的测试用例。

\end{enumerate}

在PLC的模糊测试过程中，种子变异同样采用类似的变异策略。具体实现通过AFL的自定义变异算法API完成，变异数据结构的定义与外设接口的定义保持一致。

对于布尔类型的数据，主要采用位翻转和设置特殊值的变异策略。

\begin{lstlisting}
// BoolBlock专用变异策略（2D数组）
void mutate_bool_block(BasicInputBlock<unsigned char, 2> &block, MutatorState *state) {
    for (const auto &mapping : plc_variable_mappings) {
        if (mapping.var_type == "byte_inputs") {
            if (random() % 100 < state->mutation_rate()) {
                // 更激进的变异策略
                switch (random() % 3) {
                    case 0:
                        block.input[mapping.array_index][mapping.bit_index] ^= 1;  // 位翻转
                        break;
                    case 1:
                        block.input[mapping.array_index][mapping.bit_index] = 1;  // 强制置1
                        break;
                    case 2:
                        block.input[mapping.array_index][mapping.bit_index] = 0;  // 强制置0
                        break;
                }
            }
        }
    }
}
\end{lstlisting}


对于字节类型数据，主要采用位翻转、增减小量、随机值的变异策略。

\begin{lstlisting}
// ByteBlock专用变异策略
void mutate_byte_block(BasicInputBlock<IEC_BYTE, 1> &block, MutatorState *state) {
    for (const auto &mapping : plc_variable_mappings) {
        if (mapping.var_type == "byte_inputs") {
            if (random() % 100 < state->mutation_rate()) {
                switch (random() % 3) {
                    case 0:
                        block.input[mapping.array_index] ^= (1 << (random() % 8));
                        break;  // 位翻转
                    case 1:
                        block.input[mapping.array_index] += (random() % 5) - 2;
                        break;  // 小量增减
                    case 2:
                        block.input[mapping.array_index] = random() & 0xFF;
                        break;  // 随机值
                }
            }
        }
    }
}
\end{lstlisting}

对于整数类型数据，主要采用位翻转、中等范围增减、随机值、取负的变异策略。

\begin{lstlisting}
// IntBlock专用变异策略
void mutate_int_block(BasicInputBlock<IEC_INT, 1> &block, MutatorState *state) {
    for (const auto &mapping : plc_variable_mappings) {
        if (mapping.var_type == "byte_inputs") {
            switch (random() % 4) {
                case 0:
                    block.input[mapping.array_index] ^= (1 << (random() % 16));
                    break;  // 位翻转
                case 1:
                    block.input[mapping.array_index] += (random() % 100) - 50;
                    break;  // 中等范围增减
                case 2:
                    block.input[mapping.array_index] = random() & 0xFFFF;
                    break;  // 随机值
                case 3:
                    block.input[mapping.array_index] = -block.input[mapping.array_index];
                    break;  // 取负
            }
        }
    }
}
\end{lstlisting}

对于32位整数类型数据，设计了更加复杂的变异。

\begin{lstlisting}
void mutate_dint_block(BasicInputBlock<IEC_DINT, 1> &block, MutatorState *state) {
    for (const auto &mapping : plc_variable_mappings) {
        if (mapping.var_type == "dint_inputs") {
            if (random() % 100 < state->mutation_rate()) {
                // 针对双整型
                switch (random() % 5) {
                    case 0:
                        block.input[mapping.array_index] ^= (1 << (random() % 32));
                        break;
                    case 1:
                        block.input[mapping.array_index] += (random() % 1000) - 500;
                        break;
                    case 2:
                        block.input[mapping.array_index] = random();
                        break;
                    case 3:
                        block.input[mapping.array_index] = -block.input[mapping.array_index];
                        break;
                    case 4:
                        reverse_bytes(block.input[mapping.array_index]);
                        break;  // 字节序翻转
                }
            }
        }
    }
}
\end{lstlisting}

针对长整数（64位整数）类型的变异方案如下所示。

\begin{lstlisting}
// LIntBlock专用变异策略（64位）
void mutate_lint_block(BasicInputBlock<IEC_LINT, 1> &block, MutatorState *state) {
    for (const auto &mapping : plc_variable_mappings) {
        if (mapping.var_type == "lint_inputs") {
            if (random() % 100 < state->mutation_rate()) {
                switch (random() % 6) {
                    case 0:
                        block.input[mapping.array_index] ^= (1LL << (random() % 64));
                        break;
                    case 1:
                        block.input[mapping.array_index] += (random() % 10000) - 5000;
                        break;
                    case 2:
                        block.input[mapping.array_index] = random();
                        break;
                    case 3:
                        block.input[mapping.array_index] = -block.input[mapping.array_index];
                        break;
                    case 4:
                        reverse_bytes(block.input[mapping.array_index]);
                        break;
                    case 5:
                        block.input[mapping.array_index] = ~block.input[mapping.array_index];
                        break;  // 按位取反
                }
            }
        }
    }
}
\end{lstlisting}

针对内存块类型的变异方案如下所示。

\begin{lstlisting}

// 内存块专用变异策略（根据实际情况调整）
void mutate_int_mem_block(BasicInputBlock<IEC_UINT, 1> &block, MutatorState *state) {
    for (const auto &mapping : plc_variable_mappings) {
        if (mapping.var_type == "int_mem_inputs") {
            if (random() % 100 < state->mutation_rate()) {
                switch (random() % 4) {
                    case 0:
                        block.input[mapping.array_index] = 0;
                        break;
                    case 1:
                        block.input[mapping.array_index] = 0xFFFF;
                        break;
                    case 2:
                        block.input[mapping.array_index] = block.input[mapping.array_index] + 1;
                        break;
                    case 3:
                        block.input[mapping.array_index] = block.input[mapping.array_index] - 1;
                        break;
                }
            }
        }
    }
}

void mutate_dint_mem_block(BasicInputBlock<IEC_UDINT, 1> &block, MutatorState *state) {
    // 类似int_mem_block但针对32位
    for (const auto &mapping : plc_variable_mappings) {
        if (mapping.var_type == "dint_mem_inputs") {
            if (random() % 100 < state->mutation_rate()) {
                switch (random() % 5) {
                    case 0:
                        block.input[mapping.array_index] = 0;
                        break;
                    case 1:
                        block.input[mapping.array_index] = 0xFFFFFFFF;
                        break;
                    case 2:
                        block.input[mapping.array_index] = block.input[mapping.array_index] + 1;
                        break;
                    case 3:
                        block.input[mapping.array_index] = block.input[mapping.array_index] - 1;
                        break;
                    case 4:
                        reverse_bytes(block.input[mapping.array_index]);
                        break;
                }
            }
        }
    }
}
\end{lstlisting}


\paragraph{程序执行}

在系统实现过程中，为确保可编程逻辑控制器（PLC）进程在每个扫描周期内保持稳定的执行性能，本研究基于OpenPLC架构设计并实施了多重实时性优化措施。首先，通过CPU隔离技术将OpenPLC进程绑定至特定计算核心，有效避免了其他进程的资源干扰；随后，采用Linux系统的\texttt{SCHED\_FIFO}实时调度策略，并赋予最高优先级，确保进程就绪时能够立即抢占当前核心上的其他任务；此外，基于该调度策略无时间片限制的特性，进程将持续运行，直至主动放弃CPU或被更高优先级进程抢占。由于OpenPLC已被设置为最高优先级，其执行流程几乎不会被中断，从而为扫描周期的稳定性提供了系统级保障。

经上述优化配置后，在非模糊测试环境下，PLC模拟进程能够维持微秒级的扫描周期精度。然而，当引入模糊测试活动时，系统的实时性将面临严峻挑战。模糊测试工具（如AFL）采用的多进程并发模型，会与OpenPLC运行时进程在CPU时间片、缓存及内存带宽等资源上产生激烈竞争，进而引发不可预测的调度延迟；同时，频繁的进程创建与销毁操作、系统调用及中断处理通过系统总线影响所有CPU核心，这种跨核心的干扰导致OpenPLC扫描周期出现百微秒级的时序抖动，严重影响控制系统的实时性要求。该优化措施与实际负载之间的矛盾，揭示了软硬件协同设计中资源竞争问题的复杂性，也为后续优化方案的设计提供了重要依据。

为解决上述问题，本研究提出了一种基于资源隔离的优化方案，旨在实现OpenPLC的高效模糊测试，同时最大限度地保持其运行时的稳定性。该方案的核心设计理念是\textbf{空间分离}与\textbf{干扰最小化}，即通过硬件与软件配置，在物理和逻辑层面将模糊测试活动与PLC执行环境进行隔离。

为解决上述实时性干扰问题，本研究提出了一种基于资源隔离的优化方案。该方案以“空间分离”和“干扰最小化”为核心设计原则，通过硬件资源与软件调度的协同配置，在物理层面和逻辑层面实现模糊测试活动与PLC运行环境的有效隔离。其核心创新在于对AFL++模糊测试框架及其子进程实施精细化的资源分配与控制，从而在保障测试效率的同时，最大限度地维持PLC运行的稳定性。

这种空间隔离策略带来了双重效益：一方面，通过将测试负载分散到多个计算核心，有效避免了所有测试实例集中于单一核心所引发的资源竞争问题，充分发挥了多核处理器的并行计算潜力；另一方面，由于PLC测试实例与模糊测试主控进程实现了物理隔离，显著降低了调度延迟和内存带宽竞争对PLC扫描周期的干扰。实验表明，该方案在维持模糊测试吞吐量的同时，能够将PLC扫描周期的时序抖动控制在微秒级范围内，为工业控制系统的模糊测试提供了可靠的实时性保障。

\paragraph{程序崩溃时的检测与反馈}

在动态分析框架中，模糊测试引擎对程序异常状态的感知能力是保障测试流程有效性的关键前提。传统模糊测试方法通常以程序崩溃作为漏洞触发的判定标准，然而这种方法在PLC竞态问题分析中存在显著局限。由于竞态条件往往表现为时序异常、状态不一致等非崩溃型故障，单纯依赖程序崩溃检测将导致大量潜在漏洞被遗漏。

为此，本研究引入了动态运行状态异常检测机制，通过轻量化监控模块实时追踪程序执行轨迹。当检测到异常运行模式时，系统会立即将异常类型、发生上下文等诊断信息反馈至模糊测试框架，并同步保存触发异常的输入数据序列。这种基于细粒度运行时监控的方法，不仅解决了竞态问题检测中缺乏明确崩溃信号的技术难题，还能为后续的根因分析提供完整的现场快照。具体而言，该模块通过前文阐述的插桩技术实现指令级监控，结合自定义的异常规则库，实现对数据竞争、死锁等典型竞态问题的精准捕获，从而建立起适应PLC软件特性的模糊测试反馈闭环。
