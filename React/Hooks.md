> Hooks are common pattern in frameworks where values change or other events occur. 
> They are a way of injecting own code to run when state changes or at other stages in app's lifecycle


# `useEffect`

- effect hook is executed when state changes (or is initially set)
- syntax: 

```js
// Executed everytime state changes => exec when any state changes
useEffect(() => {
   // what should happen when state changes ...
});

// exec only for initial state setting => no stateObject dependency
useEffect(() => {
   // what should happen when state changes ...
}, []);

// exec whenever specified stateObject undergoes change
useEffect(() => {
   // what should happen when state changes ...
}, [someStatefulObject, ...]);
```

- `useEffect(() => {});` is dangerous because it can create an endless loop
    - to avoid it we introduce some dependency parameter(s)

### cleanup function

- `return () => {....}` is the way to implement cleanup actions
- use: optimize performance & prevent unwanted behaviours
- for eg: if we `addEventListener()` using `useEffect()` we need to remove them when the component unmounts so inside return clause we use: `removeEventListener()`
- other usecases:
    - reset some variables
    - cancelling fetch requests using `AbortController` or `axios.CancelToken`

# `useState`

- with functional components, `setState()` always sets whats passed to it and doesnt merge changes with exisiting state 

```js
const [state, setState] = useState({count: 0, theme: "red"});

/*
Why this doesnt work?
- {count: <someVal>} will overwrite {count: 0, theme: "red"}

function decrementCount() {
    setState((prevState) => {
        return {count: prevState.count-1};
    })
}
*/

function decrementCount() {
    setState((prevState) => {
        return {...prevState, count: prevState.count-1};
    })
}
```

# `useMemo`

- 