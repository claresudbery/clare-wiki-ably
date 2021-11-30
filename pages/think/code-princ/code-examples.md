---
layout: page
location: pages/think/code-princ/leaf
permalink: /pages/think/code-princ/Code-Examples
---

## Please ignore

If you happen to just stumble across this page, it won't make any sense. I was just after a quick location for some formatted code snippets, which are examples of various things I'm not even going to bother to try and explain here.

## Example #1

```javascript
  const firstIndex = Math.ceil(str.length / 2 - 1);
  const secondIndex = str.length / 2;

  if (str.length % 2 === 0) {
    return str.slice(firstIndex, secondIndex + 1);
  } else {
    return str.slice(firstIndex, firstIndex + 1);
  }
```

## Example #2

```csharp
const withdraw = amount => {
  

  
  let hundreds = 0;
  let fifties = 0;
  let twenties = 0;
  
  let remainder = 0;

  // deals with cases where the remainder after dividing by 100 is 10 or 30 i.e not divisible by 50 and 20 denominations

  if (amount % 100 === 30 || amount % 100 === 10) {
    hundreds = Math.floor(amount / 100 - 1);
    remainder = amount - hundreds * 100;

    fifties = Math.floor(remainder / 50 - 1);

    remainder = remainder - fifties * 50;

    twenties = remainder / 20;
  } else {
    // deals with cases where the remainder after dividing by 100 is divisible by 50 and 20 denominations
    hundreds = Math.floor(amount / 100);

    remainder = amount % 100;

    if ((remainder % 50) % 20 === 0) {
      fifties = Math.floor(remainder / 50);
      twenties = (remainder % 50) / 20;
    } else {
      twenties = remainder / 20;
    }
  }

  return [hundreds, fifties, twenties];
};

```

## Example #3

```ruby
def similar_license_plates(plate1: str, plate2: str) -> bool:
    # put the similar characters into arrays so that they can be checked for the corresponding characters in the plates
    ohs=["0", "O", "Q"]
    ones=["1", "I", "T"]
    twos=["2", "Z"]
    eights=["8", "B"]
    esses = ["5", "S"]
    # first strip the strings of spaces by replacing space with ""
    plate1=plate1.replace(" ","")
    plate2=plate2.replace(" ","")
    # get the length of the plates for the range calc later
    plate1len = len(plate1)
    plate2len = len(plate2)

    # print(plate1, plate2) sanity check
    # find the shortest plate length - should be the same but just in case they're not
    # then if they are differing lengths after stripping for whitespace then False will be returned
    
    if plate2len!=plate1len:
        return False
    else:
        rangelen=plate2len

    for item in range(0, rangelen):
        if plate1[item] == plate2[item]:
#             print(plate1[item])
            continue
        if plate1[item]!= plate2[item]:
            if plate1[item] in ohs:
                if plate2[item] in ohs:
#                     print("ohs")
                    continue
                else:
                    return False
            if plate1[item] in ones:
                if plate2[item] in ones:
#                     print("ones")
                    continue
                else:
                    return False

            if plate1[item] in twos:
                if plate2[item] in twos:
#                     print("twos")
                    continue
                else:
                    return False

            if plate1[item] in eights:
                if plate2[item] in eights:
#                     print("eights")
                    continue
                else:
                    return False
            if plate1[item] in esses:
                if plate2[item] in esses:
#                     print("esses")
                    continue
                else:
                    return False
            else:
                return False

    return True

```

## Example #4

```csharp
const withdraw = amount => {
  let hundreds = 0
  let fifties = 0
  let twenties = 0

  while (amount >= 100) {
    if (amount < 231 && amount % 20 !== 0){
      amount -= 50
      fifties +=1
    }
    else{
    amount -= 100
    hundreds += 1
    }
  }

  if (amount % 20 === 0){
    twenties += amount / 20
    amount = 0
  }

  while (amount >= 50) {
    amount -= 50
    fifties += 1
  }

  while (amount >= 20) {
    amount -= 20
    twenties += 1
  }

  return [hundreds, fifties, twenties]
}

```

## Example #5

```javascript

  function removeSpaces(plate){
    cleanedPlate = ""
    for (let letter of plate)
     if (letter !== " ") cleanedPlate += letter
    return cleanedPlate
  }
```

## Example #6

```python  
# The maketrans() method returns a mapping table that can be used with the translate() 
# method to replace specified characters. Maketrans has 3 parameter values: x, y and z. 
# In the x parameter we mention the characters that we want to change with the ones 
# mentioned in y. So O will become 0 and Q will also become 0 and so on. The characters 
# are the visually equivalent ones so if we change all the characters from plate1 to the 
# specified characters and do the same for the characters in plate2, we can check if they 
# are the same and return true or false. The z parameter in maketrans is optional and is 
# describing which character we want removed from the string which is the extra spaces so 
# that 'A A A' -> 'AAA'.
    tr = str.maketrans('OQITZSB', '0011258', ' ')
    return plate1.translate(tr) == plate2.translate(tr)
```

## Example #7

```csharp
    var return_str = some_operation / 2; 
    return return_str;
```

## Example #8

![code example 8](/resources/images/code-example-8.png)

## Example #9

```
```
