import 'package:flutter_test/flutter_test.dart';
import 'package:app/repositories/users.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

// FakeFirebaseFirestore:
// Note that for this to work, you need to edit pubspec.yaml to look like this:
// (the indentation is important)
// dev_dependencies:
//   flutter_test:
//     sdk: flutter
//   fake_cloud_firestore: 
// You also need to make sure your repository does not give a default value to its firebaseFirestoreInstance
//  - (otherwise you'll get errors saying you need to call Firebase.initializeApp)
//  - See firebaseFirestoreInstance in UsersRepository for an example
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() {
  test('Fake firebase example',
      () async {
    // ARRANGE
    const userID = '4dbea213-afeb-45d7-b44a-30d3cpeanut1';
    
    final FakeFirebaseFirestore fakeFirebaseFirestore = FakeFirebaseFirestore();
    
    const Map<String, dynamic> userData = {
      'id': userID,
      'email': 'user email',
      'name': 'user name', 
      'role': null};
    await fakeFirebaseFirestore
        .collection('users')
        .doc(userID)
        .set(userData);

    final usersRepository = UsersRepository(firebaseFirestoreInstance: fakeFirebaseFirestore);

    // ACT
    final user = await usersRepository.getUser(
      userID,
    );

    // ASSERT
    expect(user.name, equals(null));
  });
}
