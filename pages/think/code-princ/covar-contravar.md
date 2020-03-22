---
layout: page
location: pages/think/code-princ/leaf
permalink: /pages/think/code-princ/Covariance-And-Contravariance
---

- With generic types, you can use the **in** and **out** keywords to
  define if a type is covariant or contravariant.
  - Like this: `interface IRepo \<**in** TContentType\>`

## Covariance
- The  **out** keyword marks a type parameter as covariant
- An object that is instantiated with a **more** derived type
  argument can be assigned to an object instantiated with a less
  derived type argument. 
- Like this: 

```csharp
interface IRepo <out TContentType>
```
```csharp
IEnumerable<string> strings = new List<string>();
IEnumerable<object> objects = strings;
```

- The second line of code above is possible because of covariance.

## Contravariance
- The  **in** keyword marks a type parameter as contravariant
- An object that is instantiated with a **less** derived type
  argument can be assigned to an object instantiated with a more
  derived type argument. 
- Like this: interface IRepo \<**in** TContentType\>
- Assume that I have this method: 
```
static void SetObject(object o){}
```
- I can now do this:
```
Action<object> actObject = SetObject;
Action<string> actString = actObject;
```
- The second line of code above is possible because of
  contravariance.

More here:
    <https://blogs.msdn.microsoft.com/csharpfaq/2010/02/16/covariance-and-contravariance-faq/>
