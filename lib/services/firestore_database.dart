String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase {
  FirestoreDatabase({required this.uid}) : assert(uid != null);
  final String uid;
}
