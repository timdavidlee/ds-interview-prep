## Decision Tree from Scratch

```python
class Dtree():
    def __init__(self,x,y, filter_indices = None, print_offset=' ', max_depth=None):
        self.print_offset = print_offset
            
        if filter_indices is None:
            self.indices = list(x.index)
        else:
            self.indices = filter_indices
            
        self.x = x
        self.y = y
        # self.feature_idx =1
        self.stored_score = float('inf')
        self.stored_split_feature = 0
        self.stored_split_value = 0
        self.feature_list = x.columns
        self.left_idx = None
        self.right_idx = None

    def spawn(self):
        self.split_data()
        if (len(self.left_idx) > 50) & (len(self.right_idx) > 50 ) :
            print(self.print_offset + 'left: ' + str(len(self.left_idx)))
            self.left_tree = Dtree(self.x, self.y, self.left_idx, self.print_offset + ' left -> ')
            self.left_tree.spawn()
            print(self.print_offset + 'right: ' + str(len(self.right_idx)))
            self.right_tree= Dtree(self.x, self.y, self.right_idx, self.print_offset + ' right-> ')
            self.right_tree.spawn()
    
    def split_data(self):
        self.check_all_features()
        feat_name = self.feature_list[self.stored_split_feature]
        x_col = self.x[[feat_name]]
        x_col = x_col.iloc[self.indices,:]
        self.left_idx  = list(x_col[x_col[feat_name] < self.stored_split_value].index)
        self.right_idx  = list(x_col[x_col[feat_name] >= self.stored_split_value].index)
        
    
    
    def check_all_features(self):
        for i in range(len(self.feature_list)-1):
            self.find_split_in_single_feature(i)  
            
        print(self.stored_score, self.feature_list[self.stored_split_feature], self.stored_split_value)
    
    
    def find_split_in_single_feature(self, feature_idx):
        X_train = self.x
        y_train = self.y

        x,y = X_train.iloc[self.indices, feature_idx], y_train.values[self.indices]
        
        for split_index in x.index:

            # note that at this point,
            # LHS and RHS are booleans (1's and 0s)
            lhs_x = x<=x[split_index]
            rhs_x = x>x[split_index]

            # if there are no points, move on
            if rhs_x.sum()==0:
                continue
            else:

                # claculate the standard deviation of the different sides
                # could be binary, or it could be continuous
                lhs_y_std = y[lhs_x].std()
                rhs_x_std = y[rhs_x].std()

                # then calculate the current score
                # this is done by multiplying the total count of points
                # on right or left
                # then multiplying times std deviation for a purity score
                # this quantity should be minimized
                curr_score = lhs_y_std*lhs_x.sum() + rhs_x_std*rhs_x.sum()
                if curr_score<self.stored_score: 
                    self.stored_split_feature = feature_idx
                    self.stored_score = curr_score
                    self.stored_split_value = x[split_index]
```