# Setting state

- `setState()` method
- within component, to access current state: `this.state`, init by the constructor
- How will react know when an event happens in component: 
    - Add `bind(this)` to the event function 
        - This offers context(`this`) to be the instance to work on
- When we exec `this.setState()` react wil try to re-render the component

> Do NOT modify state directly. rather work on a copy and make it the new state
> WHY: unintended consequences in some _Lifecycle methods_ within descendent components


# Async Data Initialization

- use lifecycle method hook: `componentDidMount()` to ensure whether the component got mounted successfully and is ready to receive `setState()`
- When component gets mounted react exec `componentDidMount()` which can be used to set data async


# Event Handling

- general JS stuff
- `handleSubmit(e) { e.preventDefault(); }` -> Prevents sending a GET/POST request (i.e. no refresh)

# Stateless components

- for components which just implement `render()` can be written as functions

## States vs Props

- props are *Immutable*. whereas states are mutable
- When to use states: Anything that can change due to an event anywhere in component hierarchy qualifies being part of state
