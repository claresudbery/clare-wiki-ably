---
layout: page
location: "pages/coding/webdev/js/leaf"
permalink: /pages/coding/webdev/js/React
---

## GitHub Repos 

Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, please don't ask me to share the code, because I can't. They're listed here purely for my reference.

- [getting-started-with-tdd-in-react](https://github.com/claresudbery/getting-started-with-tdd-in-react)
- [MenopauseTracker-javascript](https://github.com/claresudbery/MenopauseTracker-javascript)
- [react-big-calendar](http://intljusticemission.github.io/react-big-calendar/examples/index.html)
    - I found this on my hard disk after I cloned it from elsewhere. When I tried to create a new repo for it I just got a ton of security warnings because all the dependencies were out of date, so I got rid of my copy. This version is the source version, at intljusticemission.
    - It was used by another project - MenopauseTracker, I think.
- [Samba (PRIVATE)](https://github.com/claresudbery/samba)
    - See sub-folders son**, sig** and vis**
- CBF PRIVATE: 
    - [cbf/react-starter-files](https://github.com/cbfacademy/react-starter-files) 
    - [cbf/cbf-sample-solutions/software engineering/C_react/2022-10-sample-solutions](https://github.com/claresudbery/cbf-sample-solutions/tree/master/software%20engineering/C_react/2022-10-sample-solutions)
    - [cbf/react-starter-files-solutions](https://github.com/cbfacademy/react-starter-files-solutions)


## Docs and Blog Posts

- [ReactiveX](/pages/coding/tools/ReactiveX)
- [Difference between a framework and a library](https://www.freecodecamp.org/news/the-difference-between-a-framework-and-a-library-bd133054023f/) (spoiler: it's all about inversion of control)

## Automatically responding to code changes with Live Server

- On command line: `npm install -g live-server`
- Then: `live-server`
    - This will automatically launch the default browser. When you make a change to any file, the browser will reload the page - unless it was a CSS file in which case the changes are applied without a reload.
- [More here](https://www.npmjs.com/package/live-server)

## Reagent

- Reagent is a library – a Clojurescript wrapper around react js. See [Clojure notes](/pages/coding/lang/func/Clojure#reagent)

## create-react-app

### create-react-app - Intro

- As recommended [here](/pages/coding/webdev/Different-Webapp-Stacks)
- Create React App is an officially supported way to create single-page React applications. It offers a modern build setup with no configuration.
- [create-react-app - getting-started](https://create-react-app.dev/docs/getting-started/)
- My [sample repo](https://github.com/claresudbery/create-react-app-playground-win)

### create-react-app - Troubleshooting getting started

#### Troubleshooting node version

- I had node v 13 which didn't work (`The engine "node" is incompatible with this module. Expected version "^10 or ^12 or >=14". Got "13.10.1"`) so I upgraded node
    - On Windows, I just [used the Windows installer](https://nodejs.org/en/download/current/) but it took a bit of doing to get it right on both Windows and my Mac.
    - See [troubleshooting notes on my node page](/pages/coding/webdev/js/Node-JS#upgrading-node---troubleshooting).

#### Troubleshooting getting started with a project not created on your machine

- If you're getting errors about `create-script` not existing, this probably means you don't have a `node_modules` folder yet.
- This means you haven't installed your packages yet.
- If your project is using `yarn` (there'll be a `yarn.lock` file in the root folder), you need to run the `yarn` command.
- If your project is using `npm` (there won't be a `yarn.lock` file in the root folder, but there will be `packages-lock.json`), you need to run the `npm install` command.

#### Troubleshooting yarn vs npm

- I was experimenting with developing the same [project](https://github.com/claresudbery/create-react-app-playground) on two [different](https://github.com/claresudbery/create-react-app-playground-win) machines (a Windows machine and a Macbook, as it happens, but that wasn't actually relevant to this problem) and I came up against a conflict between `npm` and `yarn`.
    - On my macbook I had `yarn` installed. This was apparently detected by `create-react-app` and the project was built to work with `yarn`. When I pulled the code onto my Windows machine - where I *didn't* have `yarn` installed - I couldn't run the code because `yarn start` didn't work (it was configured to run using `npm start` instead).
    - The solution was to install `yarn` on my Windows machine (where I was running the project in GitBash) using `npm install -g yarn`, and then migrate the project from `npm` to `yarn`. Full instructions [here](/pages/coding/webdev/js/Node-JS#migrating-from-npm-to-yarn).
        - You can see the resulting commit [here](https://github.com/claresudbery/create-react-app-playground-win/commit/356597f7e6ec58a75e96cb20c398b09e3edcb1ee).
    - See [package management notes on my node page for further info on yarn and npm](/pages/coding/webdev/js/Node-JS#package-management---npm-vs-yarn).

### create-react-app - Scratchpad

```
create-react-app-playground
npx create-react-app create-react-app-playground --template typescript
```

## JSX and Babel

- Stands for JavaScript eXtensible markup language. So a bit like XML.
- Allows you to write lines of code like this: `const element = <h1>Hello, world!</h1>;`
- Lines like the above are transpiled into Javascript `React.createElement()` calls via the `Babeljs.io` library
- You can use the [Babel repl](https://babeljs.io/repl) to test the compiler in the browser.
- You can embed JavaScript in JSX using `{}` like this: `const element = <h1>{name}'s React Page</h1>;`

## React Developer Tools

- Chrome extension, v useful. Can be [found here](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi/related?hl=en).

## React forms

- [useful demo here](https://www.w3schools.com/react/react_forms.asp)
- [Passing data and events between React components](https://www.freecodecamp.org/news/pass-data-between-components-in-react)
- (Clare only) [Example forms here, in the jsx-components/bonus-greeting folder](https://github.com/claresudbery/cbf-sample-solutions/tree/57d26b435fddbd7ee56fdf4eeac1569c5effb555/software%20engineering/C_react/2022-10-sample-solutions/jsx-components/bonus-greeting). There are four different versions. You can switch between them by changing which component is referenced in `src/App.js`.

## Hooks and functional components

### useState hook

- `useState` is the method used to change state in functional components
- Typically it looks like this: `const [count, setCount] = useState(0);`
    - This example uses [array destructuring](/pages/coding/webdev/js/javascript-language.md#destructuring-arrays-and-objects) to set the variable `count` with a default of 0 and a method of `setCount` for updating the variable.
- [This code](https://github.com/claresudbery/cbf-sample-solutions/tree/57d26b435fddbd7ee56fdf4eeac1569c5effb555/software%20engineering/C_react/2022-10-sample-solutions/jsx-components/bonus-greeting) contains an example

### useEffect hook

- The `useEffect() `hook tells your component to do something after every render.

```javascript
useEffect(() => {
    document.title = `${count} Clicks Counted`
});
```

- The code in `useEffect` above would be called every time a component is rendered. 
- This would means that the `title` tag of the site will change on each render if the variable `count` has changed
- `useEffect` is equivalent to the class component methods of `componentDidMount()`, `componentDidUpdate()` and `componentWillUnMount()` all in one
- `useEffect()` takes two arguments. The first is the function to call, and the second argument is an array which can be used to define how many times the first argument should be called

## Class components

### Lifecycle

- Lifecycle Methods (in order of execution):
    - Mounting (Birth)
        - constuctor()
        - static getDerivedStateFromProps()
        - render()
        - componentDidMount()
    - Updating (Growth)
        - static getDerivedStateFromProps()
        - shouldComponentUpdate()
        - render()
        - getSnapshotBeforeUpdate()
        - componentDidUpdate()
    - Unmounting (Death)
        - componentWillUnmount()
- Special methods allow you to call code that can help setup or clear up resources when a component mounts or unmounts.
- The order of execution of the components are important for when they are called.
- [Lifecycle cheatsheet](https://projects.wojtekmaj.pl/react-lifecycle-methods-diagram/ )

### State

- React has another special built-in object called `state`, which allows components to create and manage their own data
- Unlike `props`, components cannot pass data with `state`, but they can create and manage it internally
    - Components can receive data via `props` and then store it in their own internal `state` via the constructor
    - If you want to set state using props, pass props as the second argument of the `setState()` method e.g. `this.setState((state,props) => ({lastname: props.lastname}));`
- `state` is set in the constructor of a component which is called only once when the component is created: `this.state = { firstname: "Donna", lastname: "Summer" }`
- `state` should not be modified directly but can be modified with a special method called `setState()`: `this.setState({lastname: "Winter"});`
    - Changing the state of a React component will trigger a re-rendering of the component (not the whole DOM)
    - It's important to note that changing state directly is possible, but bad practice
    - Changing state directly will not cause the component to re-render,  so, don't do this when you want to update state: `this.state.lastname = "Winter";`
- With React Hooks, state can be changed in functional and class components
    - Without React Hooks, state can only be used in class components
    - `useState` is the method used to change state in functional 
        - [This form code (available to Clare only)](https://github.com/claresudbery/cbf-sample-solutions/tree/57d26b435fddbd7ee56fdf4eeac1569c5effb555/software%20engineering/C_react/2022-10-sample-solutions/jsx-components/bonus-greeting) contains an example

## Routing - react-router-dom

- Can use popular standard routing library `react-router-dom`
    - `npm install react-router-dom`
- Types of router: 
    - HashRouter
        - Uses hash portion of url (the window.location.hash) to keep UI in sync with url
        - eg `<a href="#/bookcase/first">` 
    - MemoryRouter
        - keeps history of url in memory - doesn't read or write to address bar
    - BrowserRouter
        - Uses the HTML5 history API (`pushState`, `replaceState` and the `popstate` event) to keep your UI in sync with the URL
        - Example [here in bookcase app (available to Clare only)](https://github.com/claresudbery/cbf-sample-solutions/tree/master/software%20engineering/C_react/2022-10-sample-solutions)
- The `Link` element:
    - The <Link/> component is used to navigate to the different parts of an application by way of hyperlinks. 
    - It's similar to HTML’s anchor element (`<a href="/">link</a>`) but the main difference is that using the Link component does not reload the page, it renders the elements based on the matching Router
    - Link syntax: `<Link to="/items">Items</Link>`


## Fragments

- By default, React components can only return one base DOM element
- This will throw a syntax error: 

```
render(){
	return(
		<div>First</div>
		<div>Second</div> 
    );
}
```

- Until I discovered fragments I got round this by adding unnecessary parent `div` elements to wrap everything
- Fragment provides a base element that can be used to group a list of children without adding extra nodes to the DOM, reducing bloat
- Like this:

```
render(){
	return(
	  <React.Fragment>
				<div>First</div>
				<div>Second</div>
	  </React.Fragment>
    );
}
```

- Fragments declared with the explicit `<React.Fragment>` syntax may have keys. Key is the only attribute that can be passed to a Fragment
- Keys are required when a child element in a list requires unique "keys". Without the key attribute React will raise a key warning.
- The new short syntax will allow you to use what looks like empty tags <></> instead of `<React.Fragment>`
- No attributes can be passed using the short syntax
- Like this:

```
render(){
	return(
	  <>
				<div>First</div>
				<div>Second</div>
	  </>
    );
}
```

## Controlled components

- These are how React handles HTML forms
    - They allow you to use React state to track values being typed into form elements
- Here is an example from the `bonus-greeting` app in [here (available to Clare only)](https://github.com/claresudbery/cbf-sample-solutions/tree/master/software%20engineering/C_react/2022-10-sample-solutions):
    - The `final_name` is not a requirement for this approach, it just allowed me to have a separate value for when the user hit Submit, that wouldn't bep opulated until they'd finished typing.
    - The controlled component in the example below is the name component. The code has been expanded for readability but basically this snippet is the controlled component: `<label>Enter your name: <input type="text" value={name} onChange={(e) => setName(e.target.value)}/></label>`

```
function GreetingForm1() {
  const [name, setName] = useState("");

  const [final_name, setFinalName] = useState("");

  const handleSubmit = (event) => {
    event.preventDefault();
    setFinalName(name);
  }

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <label>Enter your name:
          <input 
            type="text" 
            value={name}
            onChange={(e) => setName(e.target.value)}
          />
        </label>
        <input type="submit" />
      </form> 
      
      <Greeting name={final_name} bio={final_bio} />
    </div>
  );
}
```




