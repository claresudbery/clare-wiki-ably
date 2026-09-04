---
layout: page
location: pages/coding/webdev/js/leaf
permalink: /pages/coding/webdev/js/Javascript-Language
---
## Require
  - Define – first param is the things being included – ie dependencies
  - Require.config – sets up the names of things which are then used in
    a define statement

## Destructuring arrays and objects
- "Destructuring is the act of unpacking elements in an array or object."

### Destructuring arrays
- To destructure an array in JavaScript, we use the square brackets [] to store the variable names which will have values assigned to them from the array which currently stores the associated elements."
    - `const [var1, var2] = arrayName;`
- The following two pieces of code are equivalent:

```javascript
const [count, setCount] = useState("");
```

```javascript
const countStateVariable = useState(""); 
const count = countStateVariable[0]; 
const setCount = countStateVariable[1]; 
```

### Destructuring objects
- You can do a similar thing with objects, but in the simplest version you have to use the same property names as the original object:

```js
const freeCodeCamp = {
  frontend: "React",
  backend: "Node",
  database: "MongoDB",
};
const { frontend, backend } = freeCodeCamp;
```

#### Nested destructuring
- You can also do it in a way where you only create variables of the leaves of a treelike object structure.
  - This can be confusing, because it makes it looks as though the intermediate nodes will also end up being variable names, but this is not actually the case:

```js
const clareTest = {
  clare: {
    id: 1,
    saleInfo: {
      retailPrice: {amount: 4.5}
    }, 
    volumeInfo: {
      title: "clare title",
      imageLinks: {
        thumbnail: "http://my-image-url"
      }
    }
  }
};

const {
  clare: { 
    id, 
    saleInfo: {retailPrice}, 
    volumeInfo: {
      title, 
      imageLinks: {thumbnail}
    }
  }
} = clareTest;

const validThing = {
  newId: id,
  newPrice: retailPrice.amount,
  newTitle: title,
  newThumbnail: thumbnail
};

const invalidThing = {
  newClare: clare, // syntax error - 'clare' is not defined
  newId: clare.id, // syntax error - 'clare' is not defined
  newVolumeInfo: volumeInfo, // syntax error - 'volumeInfo' is not defined
  newPrice: saleInfo.retailPrice, // syntax error - 'saleInfo' is not defined
  newThumbnail: imageLinks.thumbnail // syntax error - 'imageLinks' is not defined
};
```

- Note that because the thumbnail value is a url, you can define its variable as an `{object}` and then use its value directly in any `jsx` code (React). 
- The same syntax used above can be used in parameter lists to convert object arguments into direct parameters
  - (This is used a lot in React components in place of `props` arguments)
  - Like this:

```js
const clareTest = {
  clare: {
    id: 1,
    saleInfo: {
      retailPrice: {amount: 4.5}
    }
  }
};

const demoFunction = ({clare: {id, saleInfo: {retailPrice}}}) => {    
  const validThing = {
    newId: id,
    newPrice: retailPrice.amount
  };
}

demoFunction(clareTest);
```

- [More here](https://www.freecodecamp.org/news/destructuring-patterns-javascript-arrays-and-objects/#:~:text=To%20destructure%20an%20array%20in,the%20array%20storing%20the%20element)

## Javascript String Interpolation
```
const name = "Clare";
const title = "This is ${name}'s page.";
```

## Javascript RegEx
This will do case-insensitive matching use regex:

```
const name = "ClArE";
if (name.match(/Clare/i)) {
  const title = "You are now entering Clare's secret page.";
}
```

## Javascript case-insensitive RegEx and string interpolation
You can't do normal Javascript string interpolation in regex unless you use the RegExp object. The below is equivalent to `name.match(/Clare/i)`, but now we're using `MY_NAME` in place of the hard coded "Clare". 

```
const MY_NAME = "Clare";
const name = "ClArE";
if (name.match(new RegExp(MY_NAME, "i"))){
  const title = "You are now entering Clare's secret page.";
}
```

## The spread function / spread syntax / spread operator
- When you see `...` next to parameter names in function definitions, this is called `spread syntax`
- It's to do with passing iterable objects such as arrays into functions
- It allows an iterable, such as an array or string, to be expanded in places where zero or more arguments (for function calls) or elements (for array literals) are expected.
- So basically you can pass a collection of things into a function
	- Then if you prefix the collection with `...`, the collection will be pulled apart into its component parts when it gets passed through to the function
	- eg if it's an object that contains name, title, description and is passed through to a function that expects an object with title, name, description (ie order is different), then the spread operator allows it to deconstruct those elements and rearrange them in the order the function expects
	- I came across an example at Autotrader that allowed me to make a bit more sense of both [[#Destructuring arrays and objects|destructuring]] and spread operators
		- See [this commit](https://github.atcloud.io/Clare-Sudbery/react-exercises/commit/dc5cc8d79e65651b748e889b2f121abe3daaab23) and [this commit](https://github.atcloud.io/Clare-Sudbery/react-exercises/commit/ea0b3f54838231ab38182fd86b2536a25db93a77) (where I use the spread operator)
		- And [this commit](https://github.atcloud.io/Clare-Sudbery/react-exercises/commit/225a3fd7229a7d555e9487229dc045d01dec1fdd) (where I switch from spread operator to [[#Destructuring arrays and objects|destructuring]])
		- ...but they won't be accessible to anyone outside Autotrader!
- Here is a definition for a `Recipe` interface, a `RecipeCardProps` interface and a `RecipeCard` component that expects them to be passed through in props. Note that it uses destructuring to extract the recipe object from the props, and that gives it access to the `vegetarian` property: 
```
interface Recipe {  
    title: string;  
    favourite: boolean; 
}  
  
interface RecipeCardProps {  
    recipe: Recipe  
}  
  
function RecipeCard({recipe}: RecipeCardProps) {
	const [favouriteState, setFavouriteState] = useState(recipe.favourite);
```
- Here is the calling code, that passes an object that has the same fields on it, but in a different order:
```
const initialRecipes = [  
  {  
    favourite: true,  
    title: 'Tomato Pasta',  
  }
];

function App() {  
  return (  
      <main className="app">  
          <AppHeader />          
          <RecipeCard recipe={initialRecipes[0]}></RecipeCard>
```
- This code uses the same `Recipe` interface as above, but doesn't bother with the `RecipeCardProps` interface, or the destructuring in the component signature:
```
interface Recipe {  
    title: string;  
    favourite: boolean; 
}   
  
function RecipeCard(recipe: Recipe) {
	const [favouriteState, setFavouriteState] = useState(recipe.favourite);
```
- Here is the calling code, that passes an object that has the same fields on it, but in a different order. To get this to work without destructuring in the component signature, we use the spread operator in the calling code:
```
const initialRecipes = [  
  {  
    favourite: true,  
    title: 'Tomato Pasta',  
  }
];

function App() {  
  return (  
      <main className="app">  
          <AppHeader />          
          <RecipeCard {...initialRecipes[0]}/>
```

- You can also do stuff like this (but I lost track of what this actually does! Something like creating a deep copy of the original object, but with the new name value?) (note that `setProfile` is a React function that will update an underlying `profile` state):
```
const profileData = {
	name: "Harry Styles",
	location: "Manchester"
};

setProfile({...profile, name: "Zane Malik"});
```
- [More explanation here](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax).

## Promises
- See [here](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise)