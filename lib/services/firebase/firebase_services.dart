import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/services/firebase/firebase_constants.dart';

class FirebaseServices {
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  static Stream<QuerySnapshot<Object>> fetchStyles() {
    return fireStore
        .collection(
          FireBaseConstants.cardStyles,
        )
        .snapshots();
  }
}
