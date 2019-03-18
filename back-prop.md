## Backprop

All my backprops go to andrew ng and his course for some great material.


Given a neural Network:

```
Layer [1] Dense: 3 Neurons (input)
Layer [2] Dense: 4 Neurons (input)
Layer [3] Dense: 4 Neurons (input)
Layer [4] Dense: 4 Neurons (input)
```


#### Forward prop

```
a1 = x
z2 = THETA1 a1
a2 = g(z2)
z3 = THETA2 a2
a3 = g(z3)
z4 = THETA3 a3
a4 = h(x) = g(z4)
```


#### Forward prop

```
del4 = a4 - y_true
del3 = THETA3 del4 * g'(z3) =  THETA3 del4 * a3 * (1-a3)
del2 = THETA2 del3 * g'(z2) =  THETA2 del3 * a2 * (1-a2)
```

