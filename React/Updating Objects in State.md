> Changing state directly is not advised rather we should create a new object and set state to use that new object

- for example if we have a state as:

```js
const [position, setPosition] = useState({
	x: 0,
	y: 0
})
```

- technically we can change the state by doing: `position.x = 999;` but this is not advisable
- rather this should be the standard way

```js
const newPos = position;
newPos.x = 999;
setPosition(newPos);
```

> Treat state as READ-ONLY
> Mutation becomes a problem when we change existing objects that are already in state


# Immer

```js
updatePerson(draft => {
	draft.artwork.city = "Chennai";
});
```

- Immer allows free mutation of state as it produces a completely new object that contains the edits made in the function
- here `draft` is considered as [Proxy](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy) : records whatever we do with it

- using immer:

```js
const [person, updatePerson] = useImmer({
	name: "Bobby",
	artwork: {
		title: "Bobby in paris",
		city: "paris",
		image: "...."
	}
});
```


# Why is mutation of state not recommended in React

-   **Debugging:** If you use `console.log` and don’t mutate state, your past logs won’t get clobbered by the more recent state changes. So you can clearly see how state has changed between renders.
-   **Optimizations:** Common React [optimization strategies](https://beta.reactjs.org/reference/react/memo) rely on skipping work if previous props or state are the same as the next ones. If you never mutate state, it is very fast to check whether there were any changes. If `prevObj === obj`, you can be sure that nothing could have changed inside of it.
-   **New Features:** The new React features we’re building rely on state being [treated like a snapshot.](https://beta.reactjs.org/learn/state-as-a-snapshot) If you’re mutating past versions of state, that may prevent you from using the new features.
-   **Requirement Changes:** Some application features, like implementing Undo/Redo, showing a history of changes, or letting the user reset a form to earlier values, are easier to do when nothing is mutated. This is because you can keep past copies of state in memory, and reuse them when appropriate. If you start with a mutative approach, features like this can be difficult to add later on.
-   **Simpler Implementation:** Because React does not rely on mutation, it does not need to do anything special with your objects. It does not need to hijack their properties, always wrap them into Proxies, or do other work at initialization as many “reactive” solutions do. This is also why React lets you put any object into state—no matter how large—without additional performance or correctness pitfalls.


# Challenge

```js
function handleMove(dx, dy) {
    // shape.position.x += dx;
    // shape.position.y += dy;
    setShape({
	    ...shape,
	    position: {
		    x: shape.position.x + dx,
		    y: shape.position.y + dy
	    }
    })
  }
```


```js
// using immer
// const [shape, setShape] = useImmer({
//	color: 'orange',
//    position: initialPosition
// });

function handleMove(dx, dy) {
    // shape.position.x += dx;
    // shape.position.y += dy;
    setShape(draft => {
      draft.position.x += dx,
      draft.position.y += dy
    })
  }
```


---