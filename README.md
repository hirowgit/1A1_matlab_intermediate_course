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

A number sequence available for an index of the matrix is highly important.
It is called ``matrix Indexing.''

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



