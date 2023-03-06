/*
This class defines all the possible read/write locations from the FirebaseFirestore database.
In future, any new path can be added here.
This class work together with FirestoreService and FirestoreDatabase.
 */

class FirestorePath {
  static String project(String uid, String projectId) => 'users/$uid/projects/$projectId';
  static String projects(String uid) => 'users/$uid/projects';
}
