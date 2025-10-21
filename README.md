# RV32I Multi Cycle CPU 설계
<img width="1000" src="https://github.com/user-attachments/assets/d408e213-c119-4e09-b13c-cb2e9f82d963" />


<br>

---
## 📑 목차
- [1. 개요](#1-개요)
- [2. 역할](#2-역할)
- [3. 시스템 구성도 ](#3-시스템-구성도)
- [4. Logic Synthesis](#4-Logic-Synthesis)
- [5. 검증 결과](#5-검증-결과)
  - [5-1. COS 입력에 대한 검증 결과](#5-1-cos-입력에-대한-검증-결과)
  - [5-2. Random 입력에 대한 검증 결과](#5-2-random-입력에-대한-검증-결과)
- [6. Trouble Shooting](#6-trouble-shooting)

---
<br>
<br>

## 1. 개요

- RSIC V 기반 32bit CPU 설계 개인 프로젝트입니다.
- **기본적인 명령어 37개를 구현**하고, 각 type에 맞는 동작을 구현 및 검증하는 데에 중점을 뒀습니다
- 모든 설계 및 검증은 **GVim과 Synopsys사의 VCS Verdi, Vivado를 사용**했습니다
---
<br>


## 2. 역할
>---
>#### 김한벗
>- 전체 Data Path 설계 및 검증
>- 전체 Control Unit 설계 및 검증
>- Half, Byte 단위의 load, store를 위한 로직 설계 및 검증
>- Multi Cycle CPU와 Single Cycle CPU의 연산 속도 및 area 비교(**Synopsys Design Compiler 사용**)
>---
<br>


## 3. 시스템 구성도
<br>

#### 3-1. Data Path Hardware

<img width="1000" src="https://github.com/user-attachments/assets/9bf3a352-815f-46a9-83ce-4db929de57b9" />


- Instruction Memory(ROM)
    - 명령어 집합이 저장된 메모리. PC register로부터 주소를 전달받아 명령어를 출력

- Register File
    - CPU 내부 저장장치. 주소를 입력받아 읽기, 쓰기 동작을 수행

- ALU
    - Register file에서 읽은 값 또는 imm(즉시값)을 이용하여 덧셈, 뺄셈, 곱셈, shift 등의 연산을 수행
- Imm Extend
    - Instruction code에 따라 해당하는 imm(즉시값)을 출력

- Store Concat
    - Half, Byte 단위의 store 연산을 위해 설계한 모듈
    - Half, byte 범위 외 데이터 무결성 보장을 위해 RAM에서 데이터를 받아 연산하도록 설계

- Load Ext
    - Half, Byte 단위의 Load 연산을 위해 설계한 모듈
    - Instruction code에 따라 half, byte 데이터의 sign bit extend, zero extend를 결정
<br>



#### 3-2. Control Unit FSM

<img width="1000" src="https://github.com/user-attachments/assets/b56f08fb-42ab-4f06-8b6d-59d4edda2309" />




<br>




## 4. Logic Synthesis

<br>

>---
><img width="1000" src="https://github.com/user-attachments/assets/c2ab0fd5-2c80-407c-9f7d-76f46da239b4" />
>
>##### Clock Latency
> - Clock latency는 90으로 나왔습니다.
>---
<br>
<br>

>---
>#### 5-1. COS 입력에 대한 검증 결과
><img width="800" src="https://github.com/user-attachments/assets/9fb02833-7c49-486d-9d84-97e9c67ca5a6" />
>
>##### Module0 verification with Matlab golden reference
>- RTL로 설계한 module0 output과 Matlab golden reference의 module0 output 동일성 검사 결과입니다.
>---
><br>
>
><img width="800" src="https://github.com/user-attachments/assets/b620ed31-2e85-4d87-9b12-dea93743260a" />
>
>##### Module1 verification with Matlab golden reference
>- RTL로 설계한 module1 output과 Matlab golden reference의 module1 output 동일성 검사 결과입니다.
>---
><br>
>
><img width="800" src="https://github.com/user-attachments/assets/06ce61c6-7110-4f65-a289-d54d036f85f0" />
>
>##### Module2 verification with Matlab golden reference
>- RTL로 설계한 module2 output과 Matlab golden reference의 module2 output 동일성 검사 결과입니다.
>---
><br>
>
><img width="800" src="https://github.com/user-attachments/assets/99e765b4-157a-4ef6-a955-797627ce5295" />
>
>##### Module2 verification with Matlab golden reference
>- RTL로 설계한 module2 output과 Matlab golden reference의 module2 output 동일성 검사 결과입니다.
>- Butterfly 연산으로 인해 data의 순서가 bit reversal 되어 있어, 하드웨어적으로 reorder 시킨 결과물과 비교한 사진입니다.
>- Fixed point라 큰 출력값이 나왔으나, 동일한 경향성을 보이는 것을 그래프를 통해 확인 가능합니다
>---
<br>

>---
>#### 5-2. Random 입력에 대한 검증 결과
><img width="800" src="https://github.com/user-attachments/assets/7c36fe81-91f0-413b-a93b-cb31f24f4fe9" />
>
>##### Module0 verification with Matlab golden reference
>- RTL로 설계한 module0 output과 Matlab golden reference의 module0 output 동일성 검사 결과입니다.
>---
><br>
>
><img width="800" src="https://github.com/user-attachments/assets/e2a1094c-6c54-4eae-971a-af642a9677ae" />
>
>##### Module1 verification with Matlab golden reference
>- RTL로 설계한 module1 output과 Matlab golden reference의 module1 output 동일성 검사 결과입니다.
>---
><br>
><img width="800" src="https://github.com/user-attachments/assets/f31289d0-1c7e-487d-a59f-cecc0fed17cb" />
>
>##### Module2 verification with Matlab golden reference
>- RTL로 설계한 module2 output과 Matlab golden reference의 module2 output 동일성 검사 결과입니다.
>---
><br>
><img width="800" src="https://github.com/user-attachments/assets/77157ebc-e6d8-4b06-890b-10b0a7a4823e" />
>
>##### Module2 verification with Matlab golden reference
>- RTL로 설계한 module2 output과 Matlab golden reference의 module2 output 동일성 검사 결과입니다.
>- Butterfly 연산으로 인해 data의 순서가 bit reversal 되어 있어, 하드웨어적으로 reorder 시킨 결과물과 비교한 사진입니다.
>- Fixed point라 큰 출력값이 나왔으나, 동일한 경향성을 보이는 것을 그래프를 통해 확인 가능합니다
>---
<br>



## 5. 검증 결과
>---
>#### Logic Synthesis(Design compiler)
><img width="400" src="https://github.com/user-attachments/assets/e3b2258e-c9e7-4807-9aa3-f66b7c3df768" />
><img width="600" src="https://github.com/user-attachments/assets/db12c202-b6b1-4d09-98ef-1268618fbfe9" />
>
>- Logic synthesis 결과 Area는 191,509가 나왔습니다.
>- 추가로 max_timing report에서는 47.25ps의 positive slack으로 design constraint를 만족했습니다.
>---
><br>
>
>#### VIVADO Bitstream
>
><img width="800" src="https://github.com/user-attachments/assets/1af10955-07b3-478c-9e0c-33b516f8c5ab" />
>
>- Zynq UltraScale+ FPGA 기준으로 LUT 15%, DSP 28% 사용했습니다.
><br>
><img width="800" src="https://github.com/user-attachments/assets/7128f028-e3ef-4bf5-a953-cac9aaeb5377" />
><img width="600" src="https://github.com/user-attachments/assets/20641c7e-9d19-497d-a65e-df62828b7259" />
>
>- 100MHz clk 기준으로 2.345ns의 positive slack을 기록하며 Timing constraint도 만족한 것을 확인 가능합니다.
>---
>
<br>


## 6. Trouble Shooting


>---
>## CBFP Error
>#### 문제 인식
>
><img width="800" src="https://github.com/user-attachments/assets/a4b8acdf-4138-4943-82be-3a6568c6f2e4" />
>
>##### Module0 Output Error(왼쪽이 golden reference)
>- 위 사진과 같이 값이 64의 배수 단위로 오류가 발생했습니다. (64개, 128개 단위로 오류 부분 발생)
>- 또한 사진에서 확인할 수 있듯, 실수 또는 허수 부분에만 오류가 발생하는 것을 확인 가능합니다.
>---
><br>
>
>#### 원인 분석
><img width="400" src="https://github.com/user-attachments/assets/1a8069a7-8602-4657-95d6-b2d756ae7c29" />
>
>- 다른 오류 구간에서도 마찬가지로 실수 또는 허수 한 부분에서만 오류가 발생했습니다.
>- 추가로 오류가 발생한 값은 모두 2배 차이가 난다는 사실을 확인 할 수 있었습니다.
>- Module0에서 64개 데이터를 한 블록으로 묶어서 shift 연산을 하는 CBFP 모듈에 문제가 있다고 판단했습니다.
>---
><br>
>
>#### 해결 방법
><img width="350" src="https://github.com/user-attachments/assets/de6f1e9e-2906-48d2-bb3c-19517887f52f" />
>
>- Shift 연산 로직에서 최종 shift amount를 정하지 않고 실수와 허수 따로 shift 연산을 적용한 문제를 발견하여 오류를 해결했습니다.
>---
><br>
>
>## Logic Synthesis Error
>#### 문제 인식
><img width="400" src="https://github.com/user-attachments/assets/3d2b9c09-6058-4368-b980-7e5b0ad2acee" />
>
>##### Top module report
><img width="400" src="https://github.com/user-attachments/assets/a8542b43-05a6-40c5-8a0f-d0f829ddc58d" />
>
>##### Module0 report
><br>
>
>- Top module area가 9030으로 나오는 문제가 발생했습니다.
>- Sub-module인 module0의 합성 결과가 40272가 나왔기 때문에 명백한 오류라고 판단했습니다.
>- Top module의 data input 문제로 이후 module에 dead cell이 발생했을 것이라고 예상했습니다.
>---
><br>
>
>#### 원인 분석
><img width="400" src="https://github.com/user-attachments/assets/687349bf-433c-4ec6-aec1-de6d5f55b7f2" />
>
>##### Module0 input단 shift register(수정 전)
><img width="400" src="https://github.com/user-attachments/assets/82babf17-d96f-4c35-b268-31d90d7615c8" />
>
>##### Module0 input단 shift register(수정 후)
><br>
>
>- module0의 input에 연결된 shift register 구조가 2-dimension-array 구조라 합성이 되지 않을 수 있다는 의견에 1차원 배열 구조로 수정했으나 변경되지 않았습니다.
>- 그래서 module0의 step0는 area가 golden reference와 비슷하게 나오고, step1, step2부터 이상이 발생했다는 점에 초점을 맞췄습니다.
>---
><br>
>
>#### 해결 방법
><img width="600" src="https://github.com/user-attachments/assets/b257a88f-decb-41e6-ad05-aaf9fbe29b2a" />
>
>##### module0 step1 error code
><img width="600" src="https://github.com/user-attachments/assets/272b5e2c-255f-40ef-b226-9510c82cc245" />
>
>##### module0 step1 revised code
><br>
>
>- Module0의 step1 RTL의 twiddle factor 부분이 logic으로 assign 된 것을 확인했습니다.
>- 위와 같은 선언 및 초기화는 정적 상수 초기화로 취급되지 않아 합성 시 무시됩니다.
>- 정적 상수 초기화로 취급되는 parameter로 초기화하여 문제를 해결했습니다.
>---
<br>

## 8. 개발 일정 및 진행 상황
>---
> **7/25 진행사항**
> - step0_0 simulation, verification
> - bfly0_1 design
> - twf_m0 rom, multiplyer design(verification X)
> - CBFP design(verification X)
> ---
> **7/26 진행사항**
> - step0_1 disign complete, (rough verification)
> ---
> **7/27 진행사항 및 유의사항**
> - step간 merge시에 butterfly output이 그 step이 내보내는 butterfly control signal(다음 단의 din_valid)보다 한 클럭 delay 되어있음에 유의  
>   즉, butterfly control signal을 1clk delay 시켜서 사용해야 함
> - butterfly_2 design complete(rough verification)
> - cbfp revision(error 아직 있음)
> ---
> **7/28 진행사항**
> - step0, step1 오류 확인 및 수정
> - butterfly_2 design complete, cbfp re-design(block unit operation is not applied)
> - cbfp revision
> ---
> **7/29 진행사항**
> - step0, step1 오류 확인 및 수정완료(main brench 내 모든 module 최신화->shift reg 변경이 그 사유)
> - cbfp design complete, merge with former module
> - step0~step2 merge complete(timing problem is not yet solved)
> - step1_0 design(verification error detected)
> - **necessray verification** -> module0 top(with golden)
> ---
