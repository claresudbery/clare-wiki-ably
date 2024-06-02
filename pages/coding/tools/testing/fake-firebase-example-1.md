```
import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mocktail/mocktail.dart';

class MockDocumentReference extends Mock implements DocumentReference {}
class MockFirestore extends Mock implements FirebaseFirestore {}
class MockCollectionReference extends Mock implements CollectionReference {}
class MockQuerySnapshot extends Mock implements QuerySnapshot {}
class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}
class MockQuery extends Mock implements Query {}

void main() {

  test('Fake firebase example',
      () async {
    // ARRANGE
    const userID = '4dbea213-afeb-45d7-b44a-30d3cpeanut1';

    final firestore = MockFirestore();
    final collection = MockCollectionReference();
    final document = MockDocumentReference();
    when(firestore.collection('users') as Function())
        .thenReturn(collection);
    when(collection.doc(userID) as Function()).thenReturn(document);

    final usersRepository = UsersRepository(firebaseFirestoreInstance: firestore);

    // ACT
    final user = await usersRepository.getUser(
      userID,
    );

    // ASSERT
    expect(user.name, equals(null));
  });
}

```