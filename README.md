# 1A1_matlab_intermediate_course

 
# MATLAB Install
See here:
https://github.com/hirowgit/1A0_matlab_basic_course

Note: GNU Octave is more compatible with the original.  
  
# ProgHwlab2022-1A 
## Topic: Number (1A) 
### skill 1
flagの使い方 / How to set a flag list

** [matlab:prog-skill 1a] ○
```
inData=[1, 2, 3];
NofD=length(inData);
flagD=true(1,NofD);
```
または / or

** [matlab:prog-skill 1a+] △
``` 
flagD=logical(ones(1,NofD));
flagD(:)=true;
```

** [matlab:prog-skill 1a++] △
``` 
flagD=boolean(ones(1,NofD));
flagD(:)=true;
```
 Pythonでは / In python
 
** [python:prog-skill 1a] 
``` 
import numpy as np
inData=np.array([1, 2, 3])
NofD=len(inData)
flagD=np.full(NofD,True)
print(flagD)
```
または / or

** [python:prog-skill 1a+] 
``` 
inData=np.array([1, 2, 3])
flagD=np.full(len(inData),True)
```
  
### skill 2
乱数列の作り方 / How to generate a random number sequence

行列（配列，リスト）の番号指定に使える数列を作ります．
つまり，行列内の特定の要素を選択することで，行列の索引として使えます．
A number sequence available for an index of the matrix is highly important.
It is called "matrix Indexing," which is a list for selecting a subset of elements from the matrix.

** [matlab:prog-skill 2a] ○
```
NofD=10;
rdat=rand(1,NofD);
rdat_s=floor(rdat*NofD)+1;
```

 Pythonでは / In python
 
** [python:prog-skill 2a] ○
``` 
NofD=10
rdat=np.floor(np.random.rand(NofD)*NofD)
rdat_s=np.asarray(rdat, dtype = int)
print(rdat_s)
```

または / or

** [python:prog-skill 2a] ◎
``` 
rdat_s=np.random.randint(NofD, size=NofD)
print(rdat_s)
```
配列の索引となるような整数列を実数から生成する場合の注意は，配列番号の範囲です．
MATLABは，配列は1から始まるため，0が索引に含まれるとエラーが起きます．
Pythonは，配列は0から始まり，行列サイズ(N=len(Data))は指定できないので，Nが索引に含まれるとエラーが起きます．

The range of array numbers should be noted when generating an integer string that serves as an array index from real numbers.
In MATLAB, array index starts from 1, so an error occurs if the index includes 0.
In Python, array index starts from 0, so an error occurs if the index includes N, as the matrix size (N=len(Data)).

実数を整数化する前提で，乱数からこれらの範囲を生成する場合，乱数を生成する関数の仕様を確認するのが重要です．一方，特定の言語やソフトウェア仕様に依存して，挙動が変わるプログラムは，将来的な問題を孕みます．プログラマの基本的姿勢は，拡張性を意識し，移植されて再利用されることを予測して，解決可能な問題は解消しておくことです．

When generating these ranges from random numbers in the way that real numbers are converted to integers, it is important to confirm the specifications of the function to generate random numbers. On the other hand, if the behavior in program is highly depending on conditions in specific languages or software specifications, it involves potential potproblems in the future. The basic attitude of programmers is to be aware of extensibility, anticipate being able to reuse, and solve potential problems as much as possible.

この場合，発生可能なリスクは，\[0, 1\], \[0, 1), (0, 1)によって，発生する整数乱数が異なることです．第一に深刻な問題は，0が乱数から発生されて，配列番号としてエラーになることです．これはPythonでは起きませんが，MATLABでは起きます．一方，Nを配列番号として指定するとPythonではエラーが起き，MATLABでは起きません．一般的な，[0, ... ,N-1]型と[1, ... ,N]型配列の移植法は，±1をすることです．このためには，索引は，[0,N-1]または[1,N]いずれかの 配列として確実に生成しておく必要があります．

In this case, the possible risk is that \[0, 1\], \[0, 1), (0, 1) generate different integer random numbers. As the first serious problem, if random numbers include 0, it will cause an error due to the inconsistency as an array number. This doesn't happen in Python, but it does in MATLAB. On the other hand, N as an array number causes an error in Python and not in MATLAB. A common technique to treat [0, ... ,N-1] and [1, ... ,N] arrays is to set ±1. According to the point, it is important that the indices are generated as either [0,N-1] or [1,N] arrays strictly.

実数から整数乱数を生成する場合，rand()*Nとするのが一般的です．round()は四捨五入なので，数値によって挙動が変わることは問題です．したがって，切り落とし関数のfloor()を使います．その際，結果に0またはNが含まれるかが具体的な問題となります．0.001などが切り落としで0になることが確実なので，[1,N]に対しては+1をすることにします（[0,N-1]に対しては，+1を外します）．そうなった場合に，もしrand()が1.000を出力する場合があれば，N+1, つまり配列の外側に出てしまうことになります．そのため，エラーが発生しないよう，配列のサイズは一つ大きくしておくなどの対処が必要です．

```
flag=true(1,NofD+1);
```

When generating integer random numbers from real numbers, it is common to use rand()*N. Since round() is rounding, it is a problem that the behavior changes depending on the number. Therefore, we use the cut-off function, floor(). At that time, a pontential risk is whether the result contains 0 or N. Since a small number as 0.001 will become 0 by truncating, adding of 1, as +1, forms [1,N] (remove +1 for [0,N-1] list). Furthermore, if rand() outputs 1.000, it will be out of N+1, that is, outside the array. Thus, it is necessary to take care for the issue, such as increasing the size of the array [1, N+1] to prevent an error.

```
flag=true(1,NofD+1);
```

According to the manual, it describe:
X = rand は、区間 (0,1) の一様分布から取り出された乱数スカラーを返します。
X = rand returns a random scalar drawn from the uniform distribution in the interval (0,1).
JPN: https://jp.mathworks.com/help/matlab/ref/rand.html
ENG: https://jp.mathworks.com/help/matlab/ref/rand.html?lang=en

According to the manual, it describe:
この関数はランダムな浮動小数点数を半開区間 [0.0, 1.0) 内に一様に生成します。
the basic function random(), which generates a random float uniformly in the semi-open range [0.0, 1.0).
JPN: https://docs.python.org/ja/3/library/random.html
ENG: https://docs.python.org/3/library/random.html


  
### skill 3
索引としての配列/indexing numbers to access data in the matrix


** [matlab:prog-skill 3a] ○
```
inData=10*(1:NofD);
inData([1,2,5])
inData(rdat_s)
```

 Pythonでは / In python
 
** [python:prog-skill 3a] ○
``` 
inData = np.linspace(0, 10, NofD, endpoint=True, dtype=int)
print(inData)
inData = np.linspace(0, 10, NofD, endpoint=False, dtype=int)
print(inData)
# array range →a_range→ arange
inData = np.arange(0, 15, 1, dtype=int)
print(inData)
print(inData[1])
print(inData[[1,2,3]])
print(inData[rdat_s])
```

```
[ 0  1  2  3  4  5  6  7  8 10]
[0 1 2 3 4 5 6 7 8 9]
[ 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14]
1
[1 2 3]
[4 5 6 9 2 9 5 8 6 3]
```

または / or

** [python:prog-skill 2a] ◎
``` 
rdat_s=np.random.randint(NofD, size=NofD)
print(rdat_s)
```

### target



