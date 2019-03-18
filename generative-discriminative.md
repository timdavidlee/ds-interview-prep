

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
- 


