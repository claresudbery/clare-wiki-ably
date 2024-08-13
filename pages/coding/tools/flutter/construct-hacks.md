---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Construct-Hacks
---

## Contents of this page:

- [Testing real-time Firebase queries](#testing-real-time-firebase-queries)

## Testing real-time Firebase queries

- I added this function to `matchbox.dart`: 

```
  Future<String> getTestString() async {
    final userByUserID = await _usersRepository.getUser("ykVW6AHHOVCk8JJ1cxBcOW3a4u9x");
    final byUserID = "ByUserID: ${userByUserID.name ?? "null"}";

    final userByRingID = await _usersRepository.getUser("ykVW6AHHOVCk8JJ1cxBcOW3a4u9x", ringID: "eMrs12Ftfo9rEe6SZ9Xe");
    final byRingID = "ByRingID: ${userByRingID.name ?? "null"}";

    final userByMatchboxID = await _usersRepository.getUser("ykVW6AHHOVCk8JJ1cxBcOW3a4u9x", ringID: "eMrs12Ftfo9rEe6SZ9Xe", matchboxID: "tddoGflEjWRqKyJnWpUT");
    final byMatchboxID = "ByMatchboxID: ${userByMatchboxID.name ?? "null"}";

    final matchlessUserByMatchID = await _usersRepository.getUser("ZPRDlq3bcvB5pmJ2yn172x46d6WY", ringID: "eMrs12Ftfo9rEe6SZ9Xe", matchboxID: "1XQMVHM7u52wrgIwljZA");
    final byMatchlessMatchID = "ByMatchlessMatchID: ${matchlessUserByMatchID.name ?? "null"}";
    return "$byUserID, $byRingID, $byMatchboxID, $byMatchlessMatchID";
  }
```

- ...then I replaced this line: `final content = jsonEncode(_editorController.document.toDelta().toJson());` with this one: `final content = getTestString();`
- I also had to add the users repository via `import 'package:app/repositories/users.dart';` and `final _usersRepository = GetIt.I.get<IUsersRepository>();`
