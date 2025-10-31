Asked of GPT-5: 

*"Can you give me a summary of the differences between typescript and C sharp, with some examples?"*

- See also  [`misc_typescript_stuff.ts`](https://github.com/claresudbery/ai-general/blob/main/slack-thread-archiver/src/misc_typescript_stuff.ts) and misc AI projects note in Clare's Career Obsidian (Clare only)
# TypeScript vs C#: Key Differences and Examples

## Big Picture

- **Ecosystem**
    - **TypeScript**: Superset of JavaScript. [[#Compiling vs Transpiling|Transpiles]] to JS. Runs anywhere JS runs (browser, Node.js, serverless).
    - **C#**: Compiled to IL and JITed on .NET runtime (Core/Framework). Runs on servers, desktop, mobile (Xamarin/MAUI), cloud, and with Blazor in browsers via WebAssembly.
- **Type System**
    - **TypeScript**: Structural typing, type erasure at runtime, gradual/optional typing.
    - **C#**: Nominal typing, reified generics, strong compile-time guarantees with full runtime type info.
- **Runtime Model**
    - **TypeScript**: No runtime types by default (types removed). Uses JS semantics; single-threaded event loop.
    - **C#**: Rich runtime (GC, reflection, threading, async scheduler, value types, attributes).
## Compiling vs Transpiling

*"What is the difference between compiling and transpiling?"*

- **Compiling**    
    - Converts source code to a lower-level target (machine code, bytecode).
    - Often changes abstraction level and may optimize heavily.
    - Examples:
        - C/C++ → machine code (native binary).
        - C# → IL (bytecode) for the .NET runtime (then JIT/AOT to native).
        - Rust/Go → native binaries.
- **Transpiling**    
    - Converts source code to another source language at a similar abstraction level.
    - Typically preserves program structure more directly.
    - Examples:
        - TypeScript → JavaScript (`tsc`).
        - ES2020 JS → ES5 JS (Babel).
        - SASS/LESS → CSS.

### Practical differences

- **Level of output**
    - Compile: bytecode/native or significantly different representation.
    - Transpile: source-to-source (human-readable, similar runtime).
- **Runtime requirements**
    - Compile: needs a runtime/VM or none (native).
    - Transpile: runs wherever the target source runs (e.g., browsers for JS).
- **Tooling you use**
    - Compile: `dotnet build`, `rustc`, `go build`.
    - Transpile: `tsc`, `babel`, `sass`.

### Where your project fits

- TypeScript [in this repo](https://github.com/claresudbery/ai-general/tree/main/slack-thread-archiver) uses `tsc`, which transpiles TS to JS in `dist/`.
- The browser executes the resulting JavaScript, not TypeScript.

### Summary

- Compiling: source → lower-level (bytecode/native).
- Transpiling: source → source (similar level), e.g., TypeScript → JavaScript.
## Language and Type Features

- **Typing Style**
    - **TS**: Structural ([[#Duck typing|duck typing]]) — types compatible by shape.
    - **C#**: Nominal — types are their declared identities.
- **Generics**
    - **TS**: Erased at runtime; no runtime info on `T`.
    - **C#**: Reified; constraints enforced at runtime; reflection works on `T`.
    - [[#Generics with Constraints|See examples of this below]]
    - Also see [[#When to use generics]]
- ❓ **Nullability**
    - **TS**: `strictNullChecks` opt-in; `null`/`undefined` common in JS interop.
    - **C#**: Nullable reference types (`string?`) with flow analysis; value types use `Nullable<T>`.
- **Inheritance and Interfaces**
    - Both support classes and interfaces.
    - **C#** adds abstract classes, sealed, virtual/override, records, and value types (`struct`).
    - [[#Class and Interface|See examples of this below]]
- **Functions and Overloads**
    - **TS**: Overload signatures collapse to one JS function; checks are compile-time only.
    - **C#**: True overloads resolved at compile-time with different signatures.
    - [[#Function Overloads|See examples of this below]]
- **Enums**
    - **TS**: Compiles to JS objects (string/number enums), or `const enum` inlined.
    - **C#**: True enums backed by integral types.
    - [[#Enums|See examples of this below]]
- ❓ **Pattern Matching vs Unions**
    - **TS**: Discriminated unions + control-flow narrowing.
    - **C#**: Pattern matching on types and values (`switch` expressions, `is` patterns).
    - [[#Discriminated Unions vs Pattern Matching|See examples of this below]]
- **Attributes/Decorators**
    - **TS**: Experimental decorators (metadata requires transform/runtime).
    - **C#**: Attributes baked into metadata, first-class.
- **Operator Overloading**
    - **TS**: Not supported.
    - **C#**: Supported.
- ❓ **Concurrency**
    - **TS**: `async/await` over Promises; single-threaded; Workers for parallelism.
    - **C#**: `async/await` over Tasks; threads, thread pool, `IAsyncEnumerable`, rich synchronization.
    - [[#Async/Await|See examples of this below]]
- ‼️ **Collections and LINQ**
    - **TS**: JS arrays/maps/sets; libraries for query ops (e.g., lodash/fp).
    - **C#**: `IEnumerable<T>`, `IQueryable<T>`, LINQ, immutable collections.
- ❓ **Modules/Namespaces**
    - **TS**: ES modules (`import/export`).
    - **C#**: Namespaces and assemblies; `using` for imports.
## Duck typing

- [[#Duck typing Intro|Intro]]
- [[#Duck typing examples|Examples]]
- [[#Duck typing Key contrasts|Key contrasts]]
- [[#Duck typing Summary|Summary]]
### Duck typing: Intro

- **Definition**    
    - A typing style where an object’s suitability is determined by the presence of certain methods/properties, not by its explicit type. “If it walks like a duck and quacks like a duck, it’s a duck.”
- **Core idea**    
    - Compatibility by behavior/shape rather than by declared type/identity.
    - Common in dynamic languages (Python, Ruby) and in structural type systems (TypeScript).

### Duck typing examples

- **Python (dynamic duck typing)**
```python

def quack(o):  
    o.quack()  # works if o has a quack() method, regardless of its class  
  
class Duck:  
    def quack(self): print("quack")  
  
class Person:  
    def quack(self): print("I can quack too")  
  
quack(Duck())    # quack  
quack(Person())  # I can quack too
```

- **TypeScript (structural typing ≈ duck typing)**
```ts

type Quacker = { quack: () => void };  
  
function speak(q: Quacker) { q.quack(); }  
  
const duck = { quack: () => console.log("quack"), feet: 2 };  
const person = { quack: () => console.log("I can quack"), name: "Pat" };  
  
speak(duck);   // OK  
speak(person); // OK
```

- **C# (nominal typing, not duck typed by default)**
```csharp

public interface IQuacker { void Quack(); }  
public void Speak(IQuacker q) => q.Quack();  
  
class Duck : IQuacker { public void Quack() { Console.WriteLine("quack"); } }  
class Person { public void Quack() { Console.WriteLine("I can quack"); } }  
  
Speak(new Duck());   // OK  
// Speak(new Person()); // Error: Person doesn't implement IQuacker
```
### Duck typing: Key contrasts

- **Duck/structural typing**    
    - Based on shape/available members.
    - TypeScript uses this by default.
- **Nominal typing**    
    - Based on explicit declarations (names/implements/extends).
    - C# uses this model.

### Duck typing: Summary

- Duck typing = behavior-based compatibility.
- TypeScript’s structural types make it duck-typing-like.
- C# requires declared compatibility (e.g., implements an interface).

## Small Side-by-Side Examples

See also  [`misc_typescript_stuff.ts`](https://github.com/claresudbery/ai-general/blob/main/slack-thread-archiver/src/misc_typescript_stuff.ts)

### Class and Interface

- Note that in modern TypeScript, the common convention is to avoid the I prefix for interfaces. Prefer descriptive names like `Person`, `User`, `Config`, etc.
	- **Why not use I-?** It’s a legacy pattern from C#/early TS. TypeScript’s structural typing makes the distinction less important, and the prefix adds noise.
	- **Ecosystem guidance:** TS docs and popular style guides (including Angular’s) generally discourage `I` prefixes.
	- **When it might be used:** Teams with strong .NET conventions, or where interfaces and classes intentionally share names (some prefer `Person` for the interface and `PersonImpl` for the class instead).
- Note also that objects do not have to formally implement an interface in order to be used where that interface is expected
	- But if an object is declared to implement an interface and then does not have the required fields, there will be a transpiler error.

```ts

// TypeScript  
interface Person {  
  name: string;  
  age?: number;  
}  
  
class Employee implements Person {  
  // Note that just having constructor params effectively declares properties
  // ...but only when using the "public" keyword
  constructor(public name: string, public id: number, public age?: number) {}  
}
  
class Friend implements Person {  
  constructor(public name: string, public id: number) {}  // Error - no age
}
  
class BestFriend {  
  constructor(public name: string, public id: number) {}  
}  

function printPerson(p: Person) {
	console.log(p.name);
	console.log(p.nickname);
}

printPerson(new Employee("Patty", 123, "Pattykins")); // OK
printPerson(new BestFriend("Patty", 123)); // Error - no age
```
```csharp
// C#  
public interface IPerson  
{  
    string Name { get; }  
    int? Age { get; }  
}  
  
public class Employee : IPerson  
{  
    public string Name { get; }  
    public int? Age { get; }  
    public int Id { get; }  
  
    public Employee(string name, int id, int? age = null)  
    {  
        Name = name; Id = id; Age = age;  
    }  
}
```
### When to use generics

- In the example below: Use `peopleThings2(p: Person)` when you only need `Person` properties and your return type doesn’t depend on the specific subtype. Use `peopleThings(p: T)` when you want to preserve the caller’s specific type and relate it to other type parameters or return values.
- When a generic is worth it:
	- **Preserve subtype information**: If you return `p` (or something derived from it), a generic keeps the precise type.
	- **Relate multiple type params**: When argument and return types depend on each other.
	- **Type inference convenience**: Call-site inference gives precise types without explicit annotations.
	- **Reusable utilities**: Libraries often need functions that adapt to the caller’s types rather than erasing them to Person.
- See also  [`misc_typescript_stuff.ts`](https://github.com/claresudbery/ai-general/blob/main/slack-thread-archiver/src/misc_typescript_stuff.ts)

```ts
// Generic functions with constraints and dynamic types:
// The param to this function has to be something that correlates to the Person interface
// (doesn't have to explicitly implement it)
function peopleThings<T extends Person>(p: T) {
  return "Name: " + p.name + ", Nickname: " + p.nickname;
}  

function usePeopleThings() {
  var friendText = peopleThings(new Friend("Friend", 123, "Friendly"));
  return friendText + peopleThings(new Employee("Patty", 123, "Pattykins"));
}  

// The above example doesn't actually need generics.
// It returns a string and reads only name/nickname.
// A plain parameter type is simpler and equally safe
function peopleThings2(p: Person) {
  return "Name: " + p.name + ", Nickname: " + p.nickname;
}

function usePeopleThings2() {
  var friendText = peopleThings2(new Friend("Friend", 123, "Friendly"));
  return friendText + peopleThings2(new Employee("Patty", 123, "Pattykins"));
}
```
### Generics with Constraints

See also  [`misc_typescript_stuff.ts`](https://github.com/claresudbery/ai-general/blob/main/slack-thread-archiver/src/misc_typescript_stuff.ts)
```ts

// TypeScript (structural, erased at runtime)  
function first<T extends { length: number }>(x: T): number {  
  return x.length;  
}

// The param to this function has to be something that 
// correlates to the Person interface
// (doesn't have to explicitly implement it)
function peopleThings<T extends Person>(p: T) {
  return "Name: " + p.name + ", Nickname: " + p.nickname;
}

function hasName(x: unknown): x is { name: string } {
  return typeof x === 'object' 
	  && x !== null 
	  && 'name' in x 
	  && typeof (x as any).name === 'string';
}
// Unconstrained generic functions
// This avoids `extends` by refining at runtime with a user-defined type guard.
function describe<T>(p: T): string {
	if (hasName(p)) {
		return `Name: ${p.name}`;
	}
	return 'No name';
}
```
```csharp

// C# (reified, nominal, compile/runtime constraints)  
int First<T>(T x) where T : ICollection  
{  
    return x.Count;  
}
```
### Function Overloads
```ts

// TypeScript: overload signatures + single implementation  
function len(x: string): number;  
function len(x: any[]): number;  
function len(x: string | any[]) { return x.length; }
```
```csharp

// C#: true overloads  
int Len(string s) => s.Length;  
int Len<T>(IList<T> list) => list.Count;

```
### Async/Await
```ts

// TypeScript  
async function getData(): Promise<string> {  
  const res = await fetch("/api");  
  return res.text();  
}
```
```csharp

// C#  
public async Task<string> GetDataAsync(HttpClient client)  
{  
    var res = await client.GetAsync("/api");  
    return await res.Content.ReadAsStringAsync();  
}
```
### Discriminated Unions vs Pattern Matching
```ts

// TypeScript  
type Shape = { kind: "circle"; r: number } | { kind: "rect"; w: number; h: number };  
  
function area(s: Shape): number {  
  switch (s.kind) {  
    case "circle": return Math.PI * s.r * s.r;  
    case "rect": return s.w * s.h;  
  }  
}
```
```csharp

// C# (pattern matching)  
public abstract record Shape;  
public record Circle(double R) : Shape;  
public record Rect(double W, double H) : Shape;  
  
double Area(Shape s) => s switch  
{  
    Circle c => Math.PI * c.R * c.R,  
    Rect r => r.W * r.H,  
    _ => throw new ArgumentOutOfRangeException()  
};
```
### Enums
```ts

// TypeScript  
enum Status { Ok = 200, NotFound = 404 }  
const s: Status = Status.Ok;
```

```csharp

// C#  
public enum Status { Ok = 200, NotFound = 404 }  
var s = Status.Ok;
```
## Tooling and Build

- **TypeScript**
    - `tsc`, `tsconfig.json`, npm ecosystem, bundlers (Vite/Webpack), Jest/Vitest.
    - Types erased; runtime is JS.
- **C#**
    - `dotnet` CLI, project/solution files, NuGet packages, MSTest/xUnit/NUnit.
    - Strong reflection/metadata, AOT options (NativeAOT), JIT optimizations.

## When to Choose Which

- **TypeScript**
    - Web front-end, Node.js tooling, quick iteration, JS interop first-class.
- **C#**
    - Backend services, desktop, game dev (Unity with C#), high-performance server code, strong runtime features, LINQ.

# Summary

- TypeScript is a structurally typed superset of JavaScript with erased types and JS runtime behavior.
- C# is a nominally typed, compiled language with reified generics, rich runtime features, and broad application beyond the browser.
- They share modern language conveniences (classes, async/await, generics), but differ in typing philosophy, runtime, and ecosystem focus.