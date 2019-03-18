##Gradient Descent


**Batch**: Does this for the entire dataset
**Stochaistic**: Does this for the entire dataset
**Mini-batch**: Does this for the entire dataset

```
theta = theta - learning_rate * gradient_of_loss
```

## Momentum


Does this for each record

```
v_t = gamma v_prev + learning_rate * gradient_loss
theta = theta - v_t
```

## Adagrad

```
g_t = gradient_of_loss

theta = theta - learning_rate * g_t
                --------------
                sqrt(Gt + eta)

where Gt = the diagonal matrix of previous gradients
```

## RMS Prop

```
E[g_t^2] = 0.9E[g^2]_prev + 0.1 g^2

theta = theta - learning_rate * g_t
                --------------
                sqrt(E[g_t^2] + eta)

RMSprop seeks to have an adaptive learning rate, that will diminish
```

## Adam

- Storing an exponentially decaying average of past squared - gradients
- Storing an exponentially decaying average of past gradients

```

m_t = B1 m_t-1 + (1-B1)gt
v_t = B2 v_t-1 + (1-B2)gt^2

m_t* = mt
      --------
      1 - B1

v_t = vt
      --------
      1 - B2

theta = theta - learning_rate * m_t*
                --------------
                sqrt(vt*) + eta

```

