# Principles for structuring state

1. **Group related state**: 2/more state var update at same time -> merge them
2. **Avoid contradictions in state**: minimize state variables that contradict with each other
3. **Avoid redundant state**: if possible to do calc with *existing state var* or using *props* and avoid putting that info into components' state
4. **Avoid duplication in state**: avoid duplicated data as state var or nested objects as they make it harder to sync
5. **Avoid deeply nested state**: preferred *flat structure*, makes it easier to sync



### Avoid redundant state

- in case we have state variables for keeping track of amount of items in array, etc
- we can replace that with a local variable and use `arr.length`
- redundant variables make it harder to sync and difficult to debug

