### Questions on Python Fluency

The intention of these questions are to test for python skills and competency. Many of these interview questions are easily handled if the appropriate method or object is used to in the solution.

For the easier problems, the goal is that the candidate should be able to answer this question within 10 or less minutes. Its more a factor of **how fast** the solution is arrived instead of correctness.

Sources: 
- Hackerrank
- Codewars
- Myself

```python
# 1. Find duplicates in a string with a function:
# ----------------------------------------------------
# dups("programming")
# g : 2
# r : 2
# m : 2
```

```python
# 2. count vowels and consonants in a string:
# ----------------------------------------------------
# countTypes('java')
# this has 2 vowels and 2 consonants
```



```python
# 3. count number of occurrences in a string
# ----------------------------------------------------
# occurrences('java'), also return and note the maximum
# a : 2
# v : 1
# j : 1
# the maximum is a @ 2 chars
```

```python 
# 4. give all permutations of a given string, 'ab', 'abc','abcd'
# ----------------------------------------------------
# 'ab' --> ['ab','ba']
# 'abc' --> ['abc','acb','bac','bca','cab','cba']
```

```python
# 5. Reverse all the words in a sentence:
# ----------------------------------------------------
# phrase = 'python is best programming language'
# ---> '"language programming best is python'
```

```python
# 6. Check to see if a word is a palindrome
# ----------------------------------------------------
# phrases = ['radar','madam','java']
# ---- > True, True, False
```

```python
# 7. Remove duplicates from a string:
# ----------------------------------------------------
# 'bananas' -- > 'bans'
```

```python
# 8. given the following phrases, identify which phrases are anagrams
# ----------------------------------------------------------------------
# anagrams = ['catba', 'batca', 'atcab', 'dog','god']
```


```python
# 9. create a function to check if the sentence is a pangram
# ----------------------------------------------------------------------
# (Pangrams are sentences constructed by using every letter of the alphabet at least once.)

# a = "We promptly judged antique ivory buckles for the next prize"
# "panagram"

# b = "We promptly judged antique ivory buckles for the prize"
# "not pangram"

c = 'How razorback jumping frogs can level six piqued gymnasts.'

d = 'Sixty zippers were quickly picked from the woven jute bag.'

e = 'The quick brown fox jumps over a lazy cat.'

f = 'Pack my box with five dozen liquor bottles'
```

```python
# 10 - longest string given bookends
# -------------------------------------------------------------------------

# Given a string and a non-empty substring sub, compute the largest substring which starts and ends with sub and return its length.
# strDist("catcowcat", "cat") → 9
# strDist("catcowcat", "cow") → 3
# strDist("cccatcowcatxx", "cat") → 9
```

```python
# 11 - remove duplicates from string
# # -------------------------------------------------------------------------
# 'bananas' --> 'bans'
```

```python
# 12 - calculate nth fibonacci number
# -------------------------------------------------------------------------
# fib(0) # => 0
# fib(1) # => 1
# fib(2) # => 1
# fib(3) # => 2
# fib(4) # => 3
```

```python
#13 - return sum, excluding duplicates:
#---------------------------------------

lone_sum(1, 2, 3) → 6
lone_sum(3, 2, 3) → 2
lone_sum(3, 3, 3) → 0
```

```python
#14 - is there 22 in the list?
#---------------------------------------
has22([1, 2, 2]) → True
has22([1, 2, 1, 2]) → False
has22([2, 1, 2]) → False
```

```python
#15 - print staircase size n:
#---------------------------------------
staircase(4)
   #
  ##
 ###
####
```

```python
#16 - transform a string into counts
#------------------------------------

lettercount(‘aaabbccccddeeffff’)
A3b2c4d2e2f4
```

```python
#17 - Ex: highlight different symbols in brackets and return string
# --------------------------------------------
Chemicals array: ['Amazon', 'Microsoft', 'Google'] 
Symbols: ['I', 'Am', 'cro', 'Na', 'le', 'abc'] 

# Output: 
[Am]azon, Mi[cro]soft, Goog[le]
```

```python
#18 - Count how many times an phrase shows up in a given text?
#---------------------------------------------------------------
ABCDCDC
CDC
Answer: 2

BLKSJFLKSJJFLOIJFJFL
JFL
Answer: 3
```

```python
#19 - Make a prime number list from 1-100. 
#---------------------------------------------------------------
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
```

```python
#21 - merge overlapping ranges 
#---------------------------------------------------------------
#[(1, 5), (2, 4), (3, 6)] --->  [(1, 6)]
#[(1, 3), (2, 4), (5, 6)] --->  [(1, 4), (5, 6)]
```

```python
#22 - similarly give smallest units of division with provided overlaps:
#---------------------------------------------------------------
#[(1, 3), (2, 4), (5, 6)] --->  [(1, 2),(2, 3),(3, 4),(5, 6)]
```

```python
#23 - whats the output of :
#---------------------------------------------------------------
def getThem(arg1, *arg2):
   print type(arg2), arg2
```