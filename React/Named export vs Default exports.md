# Primary difference

> You can have only one default export in a module, whereas you can have as many named exports as you like.

# Default export

```js
export default App
```

```js
import 'app' from './App';

import 'a' from './App';
```

# Named export

```js
// In components.js file
export const TestComponent = () {};
export const TestComponent2 = () {};
```

```js
// multiple imports
import { TestComponent, TestComponent2 } from './components';

// single import
import { TestComponent } from './components';

// rename import
import { TestComponent as NewComponent } from './components';

// import all named exports
import * as MainComponent from './components';
// use as MainComponent.TestComponent
```