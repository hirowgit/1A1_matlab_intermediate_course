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
inData=np.array([1, 2, 3])
NofD=len(inData)
flagD=np.full(NofD,True)
print(flagD)
```
または / or

** [python:prog-skill 1a-option] 
``` 
inData=np.array([1, 2, 3])
flagD=np.full(len(inData),True)
```
  
### skill 2
flagの使い方/How to set a flag list

  
### skill 3
flagの使い方/How to set a flag list

### target



