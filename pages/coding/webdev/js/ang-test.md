---
layout: page
location: pages/coding/webdev/js/leaf
permalink: /pages/coding/webdev/js/Angular-Testing
---

## Useful links

- Good testing practices:
    - https://timdeschryver.dev/blog/good-testing-practices-with-angular-testing-library
- Testing the router:
    - https://medium.com/burak-tasci/using-jasmine-framework-to-test-angular-router-b568a232efed
    - https://stackoverflow.com/questions/53823091/unable-to-test-routing-using-routertestingmodule
    - https://stackoverflow.com/questions/40720514/angular-2-unit-test-cannot-read-property-root-of-undefined
    - [chapter about testing routes](https://livebook.manning.com/book/testing-angular-applications/chapter-7/)
- General testing stuff: 
    - https://stackoverflow.com/questions/42777612/detecting-changes-to-service-stub-using-testbed
    - https://semaphoreci.com/community/tutorials/testing-services-in-angular-2
    - https://stackoverflow.com/questions/45839955/angular-unit-test-for-a-subscribe-function-in-a-component
    - [Testing library cheat sheet](https://testing-library.com/docs/react-testing-library/cheatsheet)
- Testing Dependencies:
    - https://indepth.dev/testing-and-faking-angular-dependencies/
    - [Difference between declarations, providers, and import in NgModule](https://www.javapedia.net/Angular-basics/2191#:~:text=Difference%20between%20declarations%2C%20providers%2C%20and%20import%20in%20NgModule.,available%20in%20the%20current%20module.&text=Selectors%20of%20directives%2C%20components%20or,and%20values%20known%20to%20DI.)
    - [More on declarations, providers, and import](https://stackoverflow.com/questions/39062930/what-is-the-difference-between-declarations-providers-and-import-in-ngmodule)

## Different ways of accessing html elements

- [Cheatsheet here](https://testing-library.com/docs/react-testing-library/cheatsheet) for methods like `getByText`
- [Some examples of clicking, typing and selecting](https://timdeschryver.dev/blog/good-testing-practices-with-angular-testing-library#filling-in-input-fields)
- Some examples of [testing input validation here](https://timdeschryver.dev/blog/good-testing-practices-with-angular-testing-library#invalid-controls)

```js
// getByText throws an error if it can't find what it's looking for, so you don't need an expect statement.
// If we don't want Angular Testing Library to throw an error we can use the queryBy and queryAllBy queries instead (see cheatsheet above). 
const component = await render(...);
component.getByText('Cancel');
//
// click a button
const component = await render(...);
const cancel = component.getByText('Cancel');
cancel.click();
//
expect(component.queryByText('Cancel')).toBeNull();
//
// modal dialog:
const dialog = await within(document.body).findByRole('dialog');
const cancel = within(dialog).getByText('Cancel');
cancel.click();
//
const component = await render(...);
const link = component.getByTestId("add-thingy-info");
expect(link.innerHTML).toContain("Add thingy information");
//
const component = await render(...);
component.click(component.getByText('Cancel'));
//
// type text into an input:
const component = await render(...);
const nmdsIdInput = component.container.querySelector('input[name=nmdsid]') as HTMLElement;
nmdsIdInput.nodeValue = '';
component.type(nmdsIdInput, 'new text');
//
// Clicking, typing and selecting
There's a lot of info on this in the article linked to above
//
// not sure this ever worked:
await within(document.body).getByText('Save and continue').click();
//
// checkbox (I'm not sure I ever got this working though)
const component = await render(...);
let options: DebugElement[] = component.fixture.debugElement.queryAll(By.css('input[type="radio"]'));
options[1].triggerEventHandler('change', { target: options[1].nativeElement });
// 
// also checkbox (I'm not sure I ever got this working either though)
const component = await render(...);
import { By } from '@angular/platform-browser';
let checkbox1 = component.fixture.debugElement.query(By.css("input")).nativeElement;
await checkbox1.click();
```

## Different ways of spying on dependencies

1. Take dependency direct from component
```js
const component = await render(MyComponent, {
      imports: [...]
    });
const spy = spyOn(component.fixture.componentInstance.establishmentService, 'doThing').and.callThrough();
...
expect(spy).toHaveBeenCalled();
```

2. Use TestBed as injector  

First way:
```js
import { getTestBed } from '@angular/core/testing';
const component = await render(MyComponent, {
      imports: [...],
      providers: [
        {
          provide: EstablishmentService,
          useClass: MockEstablishmentService
        }]
    });
const injector = getTestBed();
const establishmentService = injector.get(EstablishmentService) as EstablishmentService;
const spy = spyOn(establishmentService, 'doThing').and.returnValue(
        of(fakeResponse);
...
expect(spy).toHaveBeenCalled();
```

Second way:
```js
import { TestBed } from '@angular/core/testing';
const component = await render(MyComponent, {
      imports: [...],
      providers: [
        {
          provide: EstablishmentService,
          useClass: MockEstablishmentService
        }]
    });
const establishmentService = TestBed.get(EstablishmentService);
const spy = spyOn(establishmentService, 'doThing').and.returnValue(
        of(fakeResponse);
...
expect(spy).toHaveBeenCalled();
```

## Different ways of creating test fixtures

1. Use `TestBed.configureTestingModule`

```js
TestBed.configureTestingModule({
      imports: [RouterTestingModule.withRoutes([{ path: '', component: AppComponent }])],
      declarations: [AppComponent],
    }).compileComponents();

const fixture = TestBed.createComponent(AppComponent);
```

2. Use `render`
```js
const { fixture } = await render(ParentRequestsComponent, {
      imports: [
        ReactiveFormsModule,
        HttpClientTestingModule,
        SharedModule,
        RouterTestingModule],
      declarations: [ParentRequestComponent],
      providers: [
        {
          provide: WindowRef,
          useClass: WindowRef
        }],
      componentProperties: {
        parentRequests
      },
    });
```

## Imports, Declarations, Providers and Component Properties

```js
const { fixture } = await render(ParentRequestsComponent, {
      imports: [
        ReactiveFormsModule,
        HttpClientTestingModule,
        SharedModule,
        RouterTestingModule],
      declarations: [ParentRequestComponent],
      providers: [
        {
          provide: EstablishmentService,
          useClass: MockEstablishmentService
        }],
      componentProperties: {
        parentRequests
      },
    });
```

- [Difference between declarations, providers, and import in NgModule](https://www.javapedia.net/Angular-basics/2191#:~:text=Difference%20between%20declarations%2C%20providers%2C%20and%20import%20in%20NgModule.,available%20in%20the%20current%20module.&text=Selectors%20of%20directives%2C%20components%20or,and%20values%20known%20to%20DI.)
- [More on declarations, providers, and import](https://stackoverflow.com/questions/39062930/what-is-the-difference-between-declarations-providers-and-import-in-ngmodule)

### Imports

Allow your test component to access any imports it needs.

### Declarations

### Providers

Inject mocks and spy on them.

### Component Properties

Pass in data / objects needed as @Input properties on your component.
Mock outputs, eg submit buttons:
```js
it('form should display error messages and submit if valid', async () => {
  const submitSpy = jasmine.createSpy('submit')
  const component = await render(FeedbackComponent, {
    imports: [ReactiveFormsModule, MaterialModule],
    componentProperties: {
      shirtSizes: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
      submitForm: {
        // because the output is an `EventEmitter` we must mock `emit`
        // the component uses `output.emit` to interact with the parent component
        emit: submitSpy,
      } as any,
    },
  })
})
```