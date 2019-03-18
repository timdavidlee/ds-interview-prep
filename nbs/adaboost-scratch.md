 
 # Adaboost

Now we will apply AdaBoost to classify a toy dataset. The dataset consists of 4 points: (x1 = (0,−1),y1 = −1),(x2 = (1,0),y2 = 1),(x3 = (−1,0),y3 = 1) and (x4 = (0,1),y4 = −1). You may want to use python or R as a calculator rather than doing the computations by hand but you don’t have to submit your code.

(4 points) For M = 4 (use 4 trees), show how Adaboost works for this dataset, using simple decision stumps (depth-1 decision trees that simply split on a single variable once) as weak classifiers. For each timestep fill the following table:

```
Procedure ADABOOST
    Maintain a weight of each point in a trainingset
    Initialize Weights 1/N (average)
    for iter=1 to M
        apply base learner to weighted examples
        Increase weights of misclassified examples
    end for
    Combine Models by weighted voting
End Proc
```


## Helper functions

```python
def get_pred(X, f, c, compare='>'):
    """
    Takes in the following:
    X - array input
    f - the feature
    c - the cut off value
    """
    if compare == '>':
        y_new = np.zeros(y.shape)
        y_new[X[:,f] > c]=1
        y_new[X[:,f] <= c]=-1
        return(y_new)
    elif compare == '<':
        y_new = np.zeros(y.shape)
        y_new[X[:,f] < c]=1
        y_new[X[:,f] >= c]=-1
        return(y_new)
```

```python
def get_fit(y_true, X, weights=None, verbose=False):
    best_f = None
    best_v = None
    best_loss = 10000
    best_compare = None


    # initialize the weights if nohting is passed.
    # this will start out as the average
    if weights is None:
        weights = np.ones(len(y_true))/len(y_true)
        if verbose:
            print('default weights:', weights)
        
    for f in [0,1]:
        
        # for all features
        for c in [-1, 0, 1]:
            
            # for all cut off values
            for compare in ['>', '<']:
                
                # get a prediction
                y_new = get_pred(X, f, c, compare)
                
                # get the loss
                # this is important, because teh weighted loss will increase
                # as weak classifiers keep getting this datapoint wrong
                # as teh weights keep changing this calculation will choose a different
                # configuration
                loss = np.sum(weights[y_true!=y_new]) / np.sum(weights)
                
                # compare losses
                if loss < best_loss:
                    best_loss = loss
                    best_f = f
                    best_v = c
                    best_compare = compare
                
                if verbose:
                    print('feat',f,'val:', compare, c, 'l:', loss, y_new)
 
    return best_f, best_v, best_compare

```

## Iterating over One loop

```python
import numpy as np
import pandas as pd

M = 4
X = np.array([[0,-1],[1,0],[-1,0],[0,1]])
y = np.array([-1, 1, 1, -1])

# initialize weights as an average
w = np.ones(len(y))/len(y)

# get zeros
alpha = np.zeros(M)

# initialize storage for predictions
preds = []
for_table = []

# look through for M interations
for m in range(M):
    best_f, best_v, compare = get_fit(y, X, w)
    pred = get_pred(X, best_f, best_v, compare)
    preds.append(pred)
    err = np.sum(w[y!=pred])/np.sum(w)
    
    # storing alpha,
    alpha[m] = np.log((1-err)/err)
    #print(w, err, alpha[m], pred)


    row = []
    row.extend(w)
    row.append(err)
    row.append(alpha[m])
    row.extend(pred)
    for_table.append(row)

    # the incorrect weights are upgradedd by alpha
    # the other ones remain the same
    w[y!=pred] = w[y!=pred]*np.exp(alpha[m])
    

df = pd.DataFrame(for_table)
df.columns = ['w1','w2','w3','w4', 'err','alpha', 'Gm_x1','Gm_x2','Gm_x3','Gm_x4']
df.head(5)

```