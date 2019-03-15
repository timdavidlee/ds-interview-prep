### Discussions on Model Design

1. What are the different type of **activation** functions?

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

2. What are different types of losses? [Great Site](https://heartbeat.fritz.ai/5-regression-loss-functions-all-machine-learners-should-know-4fb140e9d4b0)

- Regression:
    - **MSE:** the first one you usually learn. This quantity has a nice gradient that allows for faster convergence, but often exaggerates error in the presence of outliers, since its a squared magnitude
    - **MAE:** this doesn't exaggerate the outliers in the error, but also due to its shape, has a constant gradient. This means the gradient is large even for small loss values. This also means the learning will jump around alot
    - **Huber:** this loss is somewhere between MSE and MAE. Essentially at large extremes it behaves like MAE, but for the smaller numbers (at some cut off) it behaves more like MSE, with the smooth curve. This can be controlled with a constant
    - **Log-Cosh:** (I personally use this a lot for my networks). This is double-diff'd which is nice for some frameworks like XGBoost. This is closerer to MSE, but not as easily affected by outliers

- Classification:
    - **

3. What are different types of regularization?

**History:** regularization traditionally in the linear regression context was a method to control exploding coefficients. This was often due to collinearity. Regularization is also important to prevent overfitting of an answer.

**L1 Regularization:** L1 also refers to the L1 norm in this context. In linear regression L1 regularization is referred to as Lasso. L1 loss is useful to force some input signals to zero. This is traditionally used for feature selection, as coefficients can be zero'd out.

**L2 Regularization** L2 loss refers to L2 norm, is squared, and while values can approach zero, they never actually reach zero. Ridge or (L2 regularization) hands collinearity very well. The additional term added makes the matrix invertable

