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

## The spread function / spread syntax

- When you see `...` next to parameter names in function definitions, this is called `spread syntax`
- It's to do with passing iterable objects such as arrays into functions
- It allows an iterable, such as an array or string, to be expanded in places where zero or more arguments (for function calls) or elements (for array literals) are expected.
- [More explanation here](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax).