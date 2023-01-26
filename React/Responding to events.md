# Adding event handlers

- naming convention: `handleClick(){...}`
- passing the function: 

	```html
	<button onClick={handleClick}>
	Some button
	</button>
	```

- if we pass like this: `onClick={handleClick()}` it'll get executed while rendering
- another way to handle events:

	```js
<button onClick={() => {...}}>
	```


> Always pass the event handler as a function

> Event handlers need NOT be pure => best place for side effects

### Passing event handlers as props

- In some cases we need to pass event handlers as props: when 2 or more components use a component but the functionality varies
- styling remains same but behaviour varies

```js
function Button({ onClick, children }) {
  return (
	// use prop onClick func
    <button onClick={onClick}>
      {children}
    </button>
  );
}

// onClick -> must show movie name
function PlayButton({ movieName }) {
  // custom function to get current movieName
  // pass this as prop to Button
  function handlePlayClick() {
    alert(`Playing ${movieName}!`);
  }

  return (
    <Button onClick={handlePlayClick}>
      Play "{movieName}"
    </Button>
  );
}

// onClick -> always same text to display as alert
function UploadButton() {
  return (
    <Button onClick={() => alert('Uploading!')}>
      Upload Image
    </Button>
  );
}

export default function Toolbar() {
  return (
    <div>
      <PlayButton movieName="Kiki's Delivery Service" />
      <UploadButton />
    </div>
  );
}

```


# Event propagation

```js
export default function Toolbar() {
  return (
    <div className="Toolbar" onClick={() => {
      alert('You clicked on the toolbar!');
    }}>
      <button onClick={() => alert('Playing!')}>
        Play Movie
      </button>
      <button onClick={() => alert('Uploading!')}>
        Upload Image
      </button>
    </div>
  );
}
```

> all events in React propagate except `onScroll` , which only works on JSX tag you attach it to


### Stopping event propagation

- use `e.stopPropagation()`

```js
function Button({ onClick, children }) {
  return (
    <button onClick={e => {
      e.stopPropagation();
      onClick();
    }}>
      {children}
    </button>
  );
}

export default function Toolbar() {
  return (
    <div className="Toolbar" onClick={() => {
      alert('You clicked on the toolbar!');
    }}>
      <Button onClick={() => alert('Playing!')}>
        Play Movie
      </Button>
      <Button onClick={() => alert('Uploading!')}>
        Upload Image
      </Button>
    </div>
  );
}
```

### Capture phase events

- rare case: for analytics
- catching all events of child elements even if they stopped propagation

- each event propagates in 3 phases:
	- travels down calling `onClickCapture`
	- runs clicked elements `onClick` event handler
	- travels upwards and exec parent elem `onClick` event handler


### Passing handlers as alternative to propagation

- allows the child component to handle the event while the parent component does additional behaviour
	- adv: completely controlled process and easier to debug


