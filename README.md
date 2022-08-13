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
実数を整数化する前提で，乱数からこれらの範囲を生成する場合，乱数を生成する関数の仕様を確認するのが重要です．一方，特定の言語やソフトウェア仕様に依存して，挙動が変わるプログラムは，将来的な問題を孕みます．プログラマの基本的姿勢は，拡張性を意識し，移植されて再利用されることを予測して，解決可能な問題は解消しておくことです．
この場合，発生可能なリスクは，\[0, 1\], \[0, 1), (0, 1)によって，発生する整数乱数が異なることです．第一に深刻な問題は，0が乱数から発生されて，配列番号としてエラーになることです．これはPythonでは起きませんが，MATLABでは起きます．一方，Nを配列番号として指定するとPythonではエラーが起き，MATLABでは起きません．一般的な，[0, ... ,N-1]型と[1, ... ,N]型配列の移植法は，±1をすることです．このためには，索引は，[0,N-1]または[1,N]いずれかの 配列として確実に生成しておく必要があります．
実数から生成する場合，rand()*Nとするのが一般的です．round()は四捨五入なので，数値によって挙動が変わることは問題です．したがって，切り落としのfloor()を使います．その際，結果に0またはNが含まれるかが具体的な問題となります．

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
flagの使い方/How to set a flag list



### target



