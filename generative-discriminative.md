

**Generative**: Closest Match (Most similar too)

**Discriminative**: Based on the properties (features)


## Discriminative Models

 Usually model to determine the decision boundary between the classes. 


## Generative Models

Usually models the actual distribution of each class. 


### Both models end up with probabilities, but these probabilities represent very different quantities.

Generative models learn the joint probability distribution p(x,y). It predicts teh conditional probability with Bayes Theorem. Given the features, what is the probability of classification?

#### Generative Classifiers
- Assume some functional form of P(Y) , P(X|Y)
- Estimate parameters of P(X|Y), P(Y) directly from training data
- Use Bayes rule to calculate P(Y|X)



## Examples

Given

```
(x,y): (1,0), (1,0), (2,0), (2, 1)
```

### Generative

```
p(x,y)
      y=0   y=1
     -----------
x=1 | 1/2   0
x=2 | 1/4   1/4
```

### Discriminative

```
p(x|y)
      y=0   y=1
     -----------
x=1 | 1     0
x=2 | 1/2   1/2
```


### GDA vs. Logistic Regression

[stanford paper](https://ai.stanford.edu/~ang/papers/nips01-discriminativegenerative.pdf)

We just argued that if p(x|y) is multivariate gaussian (with shared eta), then p(y|x) necessarily follows a logistic function. The converse, however, is not true; i.e., p(y|x) being a logistic function does not imply p(x|y) is multivariate gaussian.

This shows that GDA makes stronger modeling assumptions about the data than does logistic regression. It turns out that when these modeling assumptions are correct, then GDA will find better fits to the data, and is a better model. Specifically, when p(x|y) is indeed gaussian (with shared etc), then GDA is asymptotically efficient.

Informally, this means that in the limit of very large training sets (large m), there is no algorithm that is strictly better than GDA (in terms of, say, how accurately they estimate p(y|x)). In particular, it can be shown that in this setting, GDA will be a better algorithm than logistic regression; and more generally, even for small training set sizes, we would generally expect GDA to better.

Logistic Regression

In contrast, by making significantly weaker assumptions, logistic regression is also more robust and less sensitive to incorrect modeling assumptions. There are many different sets of assumptions that would lead to p(y|x) taking the form of a logistic function. For example, if x|y = 0 ∼ Poisson(lambda_0), and x|y = 1 ∼ Poisson(lambda_1), then p(y|x) will be logistic. Logistic regression will also work well on Poisson data like this. But if we were to use GDA on such data—and fit Gaussian distributions to such non-Gaussian data—then the results will be less predictable, and GDA may (or may not) do well.

#### Summarize:

GDA:
- GDA makes stronger modeling assumptions
- is more data efficient (i.e., requires less training data to learn “well”) when the modeling assumptions are correct or at least approximately correct. 

Logistic regression 

- makes weaker assumptions
- is significantly more robust to deviations from modeling assumptions.
- Specifically, when the data is indeed non-Gaussian, then in the limit of large datasets, logistic regression will almost always do better than GDA. For this reason, in practice logistic regression is used more often than GDA. 

(Some related considerations about discriminative vs. generative models also apply for the Naive Bayes algorithm that we discuss next, but the Naive Bayes algorithm is still considered a very good, and is certainly also a very popular, classification algorithm.)

#### Naive Bayes

To model p(x|y), we will therefore make a very strong assumption. We will assume that the x_i’s are conditionally independent given y. This assumption is called the Naive Bayes (NB) assumption, and the resulting algorithm is called the Naive Bayes classifier.

- When the original, continuous-valued attributes are not well modeled by a multivariate normal distribution, discretizing the features and using Naive Bayes (instead of GDA) will often result in a better classifier.

```
p(y=1 | x) = p(x|y=1) p(y=1) 
             ---------------
                 p(x)

p(y=1 | x) =           p(x|y=1) p(y=1)
             ----------------------------------
             p(x|y=1) p(y=1) + p(x|y=0) p(y=0)


```










