- `React.Component` and `React.createClass` are pretty similar things with minor functional differences
- `React.createClass()` returns a component

### State changes:
- `createClass`: make changes inside `getInitialState()`
- `Component`: use constructor
    ```js
    constructor() {
        super();
        this.state = {issues: issues}
    }
    ```

### Binding

- `createClass`: auto-binding: called function can directly use `this` 

    ```js
    <div onclick={this,clickHandler()}>...</div>
    ```

- `Component`: explicitly specify `.bind(this)`

    ```js
    <div onclick={this,clickHandler.bind(this)}>...</div>
    ```