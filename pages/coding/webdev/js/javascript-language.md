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
- To destructure an array in JavaScript, we use the square brackets [] to store the variable names which will have values assigned to them from the array which currently stores the associated elements."
    - `const [var1, var2, ...] = arrayName;`
- The following two pieces of code are equivalent:

```javascript
const [count, setCount] = useState(0);
```

```javascript
const countStateVariable = useState(0); 
const count = countStateVariable[0]; 
const setCount = countStateVariable[1]; 
```

- You can do a similar thing with objects, but in the simplest version you have to use the same property names as the original object:
    - `const freeCodeCamp = {
          frontend: "React",
          backend: "Node",
          database: "MongoDB",
          };
          const { frontend, backend } = freeCodeCamp;`
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