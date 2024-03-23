---
layout: page
location: pages/coding/tools/testing/leaf
permalink: /pages/coding/tools/testing/JUnit
---

# MethodSource

- Used if, rather than listing the parameters for a parameterised test, you want those parameters to be provided by a reusable method
- Example:

```java
@ParameterizedTest
@MethodSource("provideStringsForIsBlank")
void isBlank_ShouldReturnTrueForNullOrBlankStrings(String input, boolean expected) {
    assertEquals(expected, Strings.isBlank(input));
}
```

- The name we supply to @MethodSource needs to match an existing method.
- `provideStringsForIsBlank` needs to be a static method that returns a Stream of Arguments:

```java
private static Stream<Arguments> provideStringsForIsBlank() {
    return Stream.of(
      Arguments.of(null, true),
      Arguments.of("", true),
      Arguments.of("  ", true),
      Arguments.of("not blank", false)
    );
}
```

- In the above example, the parameterised test will get four pairs of parameters
    - Each pair consists of a string and a bool, as expected by the test method
    - Those four pairs are set up within the hard-coded stream returned by `provideStringsForIsBlank`
- [More here](https://www.baeldung.com/parameterized-tests-junit-5#6-method)