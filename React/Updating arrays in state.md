- avoid mutation of arrays in state
- rather create a copy, modify it and setState

| operation | avoid (cayses mutation) | preferred                     |
| --------- | ----------------------- | ------------------------- |
| adding    | push and unshift        | concat, `[...arr]`        |
| removing  | pop, shift, splice      | filter, slice             |
| replacing | splice, `arr[i] = ...`  | map                       |
| sorting   | reverse, sort           | copy and do the operation |


> `useImmer` will allow both column operations

