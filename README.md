# 1A1_matlab_intermediate_course

# Basics of a New Trend of Structured Programming with High Productivity and Efficiency
In 1970, usage of "goto" sentences was highly concerned.
https://monoist.itmedia.co.jp/mn/articles/1009/17/news118.html
In 2020, matrix operation is highly recommended instead of usage of "for" sentences.

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

ここでのポイントは，索引(index)の指定の仕方です．

The point here is how to specify the index.

MATLABの場合，リスト（[1,2,3, ...]）と１次元配列（1xNまたはNx1）は同一のものです（行列と異なるリスト型は用意されてない）．

Pythonの場合，リストと１次元配列は異なるので，索引指定に注意が必要です．

In MATLAB, lists ([1,2,3, ...]) and one-dimensional arrays (1xN or Nx1) are identical (there is no list-type data format different from matrices).

In the case of Python, a list and a one-dimensional array are different things, so care must be taken when specifying the index.

両方の場合において，要素直接指定はできますが，その結果が異異なります．

In both cases, direct element specification is possible, but with different results.

In MATLAB, 
```
inData(1) →　10
inData([1])　→　10 
% 配列の要素が一つなら，要素単体として扱う
% If there is only one element in the array, treat it as a single element.
```

In Python, 
```
inData[1] →　10
inData[[1]]　→　array([10]) 
# 配列の要素が一つでも，配列として扱う
# Even if there is only one element in the array, treat it as an array.
```

行列（配列）演算では，基本的に同様な取り扱いができます．

Matrix (array) operations can basically be handled in the same way in MATLAB and Python.

例えば，定数と行列の和（+）は，MATLABの流儀に従って，定数倍と同様に計算結果を返す．

For example, the sum of a constant and a matrix (+) returns the same result as a constant multiplication, following MATLAB convention.

a+[b,c,d,...]をa*[1,1,1,...]+[b,c,d,...]
として，[a+b,a+c,a+d,...]を返す．

Since a+[b,c,d,...] is recognized as a*[1,1,1,...]+[b,c,d,...]
, it returns [a+b,a+c,a+d,...].

In MATLAB, 
```
inData(1)+inData(2)　→　30 
inData([1])+inData([2]) →　30
inData([1,2])+inData([2,3])　→　30    50

inData(1)+inData([2,3])　→　30    40　
inData([1])+inData([2,3])　→　30    40
inData([1])*inData([2,3])　→　200   300

```

In Python, 
```
inData[1]+inData[2]　→　30 
inData[[1]]+inData[[2]] →　array([30])
inData[[1,2]]+inData[[2,3]] →　array([30, 50])

inData[1]+inData[[2,3]]　→　array([30, 40])
inData[[1]]+inData[[2,3]]　→　array([30, 40])
inData[[1]]*inData[[2,3]]　→　array([200, 300])
```


** [matlab:prog-skill 3a] ○
```
inData=10*(1:NofD);
inData(1)
% ans =    10

inData([1])
% ans =    10

inData([1,2,5])
% ans =    10    20    50

inData(rdat_s)
% ans =    100    90    40    60    50   100    80    90    80    50
```
 

 Pythonでは / In python
 
** [python:prog-skill 3a] ○
``` 
inData = np.linspace(0, 10, NofD, endpoint=True, dtype=int)
print(inData)
# [ 0  1  2  3  4  5  6  7  8 10]

inData = np.linspace(0, 10, NofD, endpoint=False, dtype=int)
print(inData)
# [0 1 2 3 4 5 6 7 8 9]

# array range →a_range→ arange
inData = np.arange(0, 100, 10, dtype=int)
print(inData)
# [ 0 10 20 30 40 50 60 70 80 90]

print(inData[1])
# 10

print(inData[[1]])
# [10]

print(inData[[1,2,3]])
# [10 20 30]

print(inData[rdat_s])
# [40 50 60 90 20 90 50 80 60 30]
```

Pythonでは，生成するデータの形はリストか配列（行列）を意識して定義します（関数によって，(1,2)のように指定したり，size=3やsize=(1,3)のように指定する）．

In Python, the shape of the data should be generated clearly according the specific intention of whether a list or array (matrix) (depending on the function, it can be specified as (1,2), or as size=3 or size=(1,3) ).

```
r_a1 = np.random.rand()   
print(r_a1)
r_a2 = np.random.rand(3) 
print(r_a2)
r_a3 = np.random.rand(1, 4)   
print(r_a3)
print(' ')
r_b1 = np.random.randint(1, 5, size=3)
print(r_b1)
r_b2 = np.random.randint(1, 5, size=(1,3))
print(r_b2)
r_b3 = np.random.randint(1, 5, size=(2,3))
print(r_b3)
r_b4 = np.random.randint(1, 5, size=(1,2,3))
print(r_b4)

```
** [result]
```
0.5839855423349606
[0.0797405  0.82345808 0.71464285]
[[0.77374123 0.78811937 0.41242111 0.58940351]]
 
[2 4 1]
[[2 4 1]]
[[2 1 1]
 [2 4 4]]
[[[1 3 1]
  [3 3 4]]]
```


```
c1=np.zeros(6, dtype=int)   
print(c1)
c2=c1.reshape(2,3)   
print(c2)
c2=c1.reshape(1,6)   
print(c2)
```

** [result]
```
[0 0 0 0 0 0]
[[0 0 0]
 [0 0 0]]
[[0 0 0 0 0 0]]
```


### skill 4
索引における切り取り（スライシング）/indexing a subset of data in the matrix, called "slicing"

スライシングでは，一定の範囲をa:b（aが開始位置，bが終了位置）のように指定することができます．

In slicing, a range can be specified as a:b (where a is the start position and b is the end position).

ここでの注意は，MATLABで最終要素の指定は"end"を一貫して用いるのに対し，Pythonで"-1"を用いる場合と"a:"の省略形を使う２種類を使い分ける必要があることです．

Note: in MATLAB, "end" is consistently used to specify the final element, whereas in Python, it is necessary to use two types of "-1" and the abbreviation of "a:" separately depending on the requirement.

** [matlab:prog-skill 4a] ○
```
inData=1:NofD;
inData(3:end)
% ans =     3     4     5     6     7     8     9    10

inData(end)
% ans =    10

inData(3:end-1)
% ans =    3     4     5     6     7     8     9

inData(end-3:end-1)
% ans =    7     8     9

```
 
 Pythonでは / In python
 
** [python:prog-skill 4a] ○
``` 
inData = np.arange(0, 10, 1, dtype=int)
print(inData)
# [0 1 2 3 4 5 6 7 8 9]

inData[3:]
# array([3, 4, 5, 6, 7, 8, 9])

inData[-1]
# 9

inData[3:-1]
# array([3, 4, 5, 6, 7, 8])

inData[-3:-1]
# array([7, 8])
```

つまり，MATLAB流儀の感覚で，-1を最後の要素だと思って，inData[3:-1]と指定すると，この場合は，inData(3:end-1)を求めていることになり，最後の要素が漏れてしまうということです．

In other words, in the sense of MATLAB style, if you think that -1 is the last element, and specify inData[3:-1], it is dealt with inData(3:end-1). It returns without the last element as a missing of it in the result.


## Target problem: Number (1A) 

[課題1A-1 / Assignment 1A-1]

1から10までの数字を，ランダムに並べ替えたリスト（１次元配列）を生成するプログラムをつくれ．
但し，各索引位置における個々の数字の出現確率は等しいものとして設計すること．
（等価問題：一様乱数を使って，1から10までの数字を，1回だけつかって配列位置に置く）

Make a program that generates a randomly rearranged list (one-dimensional array) of numbers from 1 to 10.
However, it should be designed assuming that the appearance probability of individual numbers at each index position is equal.
(Equivalent problem: by using uniform random numbers, put the numbers 1 to 10 in the array position only once)

[課題1A-2 / Assignment 1A-2]

課題1A-1のプログラムにおいて，「1から5000までの数字」を，ランダムに並べ替えたリストを生成するプログラムに拡張し，その上で，正しく数字が1回ずつ使われているか確認するコードを追加すること．

Extend the program for Assignment 1A-1 to a program that generates a randomly rearranged list of ``numbers from 1 to 5000'', and then add codes to check whether each number is used correctly once.

[課題1A-3 / Assignment 1A-3]

課題1A-2のプログラムにおいて，「1から200までの数字」の出現頻度が等価であることを検証するプログラムをつくれ．
（ヒント：ランダムに並べ替えたリストを最大値の20倍の個数ほど生成し，統計分析（平均と分散を求めて可視化）する）

Add codes that verifies that the appearance frequencies of ``numbers from 1 to 5000'' are equivalent in the program of Assignment 1A-2.

(Hint: Generate 20 times the maximum number of randomly sorted lists and perform statistical analysis (visualize by calculating the mean and variance))


## Topic: @@@ (@@) 

> skill 1
find

> skill 2
cellfun

> skill 3
正規表現

### skill @
++++

** [matlab:prog-skill *a] ○
```
  
```
または / or

** [matlab:prog-skill *a+] △
``` 
  
```

 Pythonでは / In python
 
** [python:prog-skill 3a] ○
``` 

```



## Target problem: Numerical Operation in List (1B) 

[課題1B-1 / Assignment 1B-1]

1から10までの数字で構成されたランダム数列が，行として与えられ，その200行で構成される行列を以下のcsvファイルから読み込み，各列（index番号）で1から10までの数字が等確率で出現しているかを評価するプログラムをつくれ
 allData200.csv

A number sequence consisting of numbers from 1 to 10 randomly aligned is given as a row in the matrix consisting of 200 rows.
Read it from the following csv file, and make a program to evaluate the occurance proberbility of each column (index number position) expecting to have numbers from 1 to 10, as a question whether it shows the same occurance proberbility or not.
 allData200.csv

[課題1B-2 / Assignment 1B-2]

[In MATLAB]
find関数, sort関数, slicing索引抽出機能を用いて，課題1B-1のプログラムをつくれ．

但し，for文を一切使わないこと．

[In Python]
np.where関数, np.sort関数, slicing索引抽出機能を用いて，課題1B-1のプログラムをつくれ．

但し，リスト内包表記の中のfor構文以外は，for文を使わないこと．

[In MATLAB]
Make a program for Assignment 1B-1 using the "find" function, "sort" function, and slicing index extraction method.

However, do not use the "for" statement.

[In Python]
Make a program for Assignment 1B-1 using the "np.where" function, "np.sort" function, and slicing index extraction method.

However, do not use the "for" statement except for the "for" statement inside the list comprehension.

(Note: set the statement in the first place "import numpy as np")

[課題1B-3 / Assignment 1B-3]

プログラミング初級者が作成する以下のようなコードで，課題1B-1を解決するコードを作成し，課題1B-2で作成したコードと比較して，計算量を分析せよ．

Make a code that solves Assignment 1B-1 with the following code structure typically created by novice programmers, and compare it with the code created in Assignment 1B-2 to analyze the amount of computation.

```
for i=1:N
 for j=1:N
  if ** then
    a=**
    
   end
 end
end
```

 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Topic: @@@ (@@) 
### skill @
++++

** [matlab:prog-skill *a] ○
```
  
```
または / or

** [matlab:prog-skill *a+] △
``` 
  
```

 Pythonでは / In python
 
** [python:prog-skill 3a] ○
``` 

```



## Target problem: @@@ (@@) 

[課題@@-1 / Assignment @@-1]

...を生成するプログラムをつくれ．
 

Make a program that ...


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
