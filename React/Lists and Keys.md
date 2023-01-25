```jsx
function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>    <li>{number}</li>  );  return (
    <ul>{listItems}</ul>  );
}

const numbers = [1, 2, 3, 4, 5];
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<NumberList numbers={numbers} />);
```

- above code generates a warning: Key is required
- Key -> special attrib you need to include when creating lists of elements 

```jsx
function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
    <li key={number.toString()}>      {number}
    </li>
  );
  return (
    <ul>{listItems}</ul>
  );
}
```

- more complex ex:

```jsx
const todoItems = todos.map((todo) =>
  <li key={todo.id}>    {todo.text}
  </li>
);
```

- in case of no "stable" ID for key then we can use Index position in list/arr:

```jsx
const todoItems = todos.map((todo, index) =>
  // Only do this if items have no stable IDs  
  <li key={index}>
      {todo.text}
  </li>
);
```


### Correct usage

```jsx
function ListItem(props) {
  // Correct! There is no need to specify the key here:  
  return <li>{props.value}</li>;
}

function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
    // Correct! Key should be specified inside the array.
    <ListItem key={number.toString()} value={number} />  );
  return (
    <ul>
      {listItems}
    </ul>
  );
}
```

> Keys dont get passed to components. It serves as hint to React. 
> If we want to pass keys to components we need to assign it to diff prop and access it as: `this.props.<name>`


