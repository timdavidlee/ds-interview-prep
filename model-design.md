# Model Design

## What are the different type of **activation** functions?

- Linear
    - Pros: not a binary activation. Also if more than 1 neuron fires, we can take the max of that ?(sp)
    - Cons: constant gradient, which means that will always converge at the same speed irregardless of what X is. Also as a result, errors in predictions will not depend on differences in X
- Sigmoid:
    - Pros: stable, and consistent activation function. It rests between 0 and 1, and is almost linear in the middle
    - Cons: near the extreme edges, the gradient is very small and respond less to changes.
- ReLu
    - Pros: essentially takes positive values, and is zero otherwise. It's fast to calculate, and the gradient is constnant. Doesn't have vanishing gradient problems
    - Cons: should only be used in the hidden layers of the model. The fact that it is zero for values less than 0 means that there could be some dead neurons along the way
- Elu
    - Pro: Similar to ReLu, but can produce negative results
    - Pro: There's no non-linearity in the transition
    - Con: like reLU the activation can blow up
- Leaky Relu
    - instead of being zero when  z < 0, its a small number determined by alpha. This prevents dead neurons.
    - Since it has linearity it can't be used for complex classification.
- Tanh
    - Nice alternative to sigmoid. The value goes betwee -1 and 1, which is nice depending on the features available. Has a stronger gradient than sigmoid, derivatives are stronger
    - Con: has a vanishing gradient problem

## What are different types of losses? [Great Site](https://heartbeat.fritz.ai/5-regression-loss-functions-all-machine-learners-should-know-4fb140e9d4b0)

- Regression:
    - **MSE:** the first one you usually learn. This quantity has a nice gradient that allows for faster convergence, but often exaggerates error in the presence of outliers, since its a squared magnitude
    - **MAE:** this doesn't exaggerate the outliers in the error, but also due to its shape, has a constant gradient. This means the gradient is large even for small loss values. This also means the learning will jump around alot
    - **Huber:** this loss is somewhere between MSE and MAE. Essentially at large extremes it behaves like MAE, but for the smaller numbers (at some cut off) it behaves more like MSE, with the smooth curve. This can be controlled with a constant
    - **Log-Cosh:** (I personally use this a lot for my networks). This is double-diff'd which is nice for some frameworks like XGBoost. This is closerer to MSE, but not as easily affected by outliers

- Classification:
    - **Cross-Entroy** this is heavilty used in classification settings, but also becomes a quantity that is difficult to measure intuitively. This is a loss, which is a quantity related to optimization, but not a good metric for understanding. That would be something like accuracy
    - **Hinge**: this is typically for SVM (support vector machines). If a point lies outside the margin, it does not contribute to the loss. If x=1 the point is ON the line and does not contribute to the loss. Anything else, will contribute to the loss. THis is the hingle effect

## What are different types of regularization?

#### History
regularization traditionally in the linear regression context was a method to control exploding coefficients. This was often due to collinearity. Regularization is also important to prevent overfitting of an answer.

#### L1 Regularization

L1 also refers to the L1 norm in this context. In linear regression L1 regularization is referred to as Lasso. L1 loss is useful to force some input signals to zero. This is traditionally used for feature selection, as coefficients can be zero'd out.

#### L2 Regularization

L2 loss refers to L2 norm, is squared, and while values can approach zero, they never actually reach zero. Ridge or (L2 regularization) hands collinearity very well. The additional term added makes the matrix invertable

#### Regularization: Data Augmentation

Usually addressed in the deep learning realm, add some distortion shapes to prevent the network from "memorizing" the answers


#### Regularization: Early stopping 


#### Regularization: Injecting Noise at the Output Targets


## What is the curse of dimensionality?

The curse of dimensionality is that for very complex models, they usually have a large number of features, and the data is very sparse (not a large population per permutation). As a result, there is not enough data to properly model all the factors. As a result, machine learning model performance tends to suffer as complexity and feature space increases.

## How would you compare Logistic Regression vs. SVM?

Logistic Regression

- Looks at all points to determine the decision boundary
- How far am I from the decision boundary?
- Considers all data

Support Vector Machines

- Works best when sets are separable.
- Only looks at the points that are closets to teh decision boundary
- Which side is it on ?
- Focused on Prediction
- Focused on ambiguity how many mysterious people did i get right?
- Examines points equally

For non-linear situations, you can use a kernel trick to transfor the SVM into a shape that you want, but increasing the dimensionality (its a plane somewhere in tehre)

---

## Types of Layers

#### BatchNorm

Batch norm accelerates convergence by reducing internal covariate shift inside each batch. Essentially normalizes each batch to mean 0 and std 1. Subtracts the mean and divides by standard deviation of the batch. 

- This is limited and heavily affected by the batch size. 
- This also puts a **lower limit on the batch size**

#### Weight Normalization

Instead of normalizing the batch, this normalizes the weights of the layer. This decouples the weight vector from its direction. Then optimizes both with gradient descent.

**Pros**:
- often much faster than batch norm. 
- Adds gentler noise to the activations

#### LayerNorm

Layer Normalizes inputs across features (within one example). The independence between inputs means that each input has a different normalization operation.

- works well for recurrent neural networks
- allows for arbitrary mini-batch sizes

#### Pooling

Typically used for a downsampling operation. This reduces the number of parameters, and also fights against overfitting. There's many different types, such as mean pooling, or max pooling.

#### Dropout

Dropout random creates "dead" neurons, avoiding overfitting. This also avoids learning any coincidental patterns or signals that aren't significant

---

#### What's the difference between non-negative matrix factorization and singular value decomposition?

1. **Main Difference**: SVD factors contains both positive and negative entries while NMF factors are strictly positive.

2. **Text Applications** NMF usually used in text applications, where we only want positive interactions. (There can't be negative counts). 

3. SVD yields unique factors whereas NMF facotrs are non-unique.


# NMF with Gradient Descent

NMF is biconvex. **A-WH**. Fix W and update H. Fix H and update W, keep doing this until the error doesn't decrease anymore. This is alternating least squares. This can lead to non-negative values, but this can be adjusted by truncating all negative values to 0.

This can be done with gradient descent:

```
1. W <- random(n, k)
2. H <- random(k, m)
3. Repeat
    3.1 H <- H - e_h * grad_h
    3.1 H <- W - e_w * grad_w

Until convergence
```