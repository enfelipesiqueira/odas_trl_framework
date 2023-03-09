import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:odas_trl_framework/models/project_model.dart';
import 'package:odas_trl_framework/services/firestore_path.dart';
import 'package:odas_trl_framework/services/firestore_service.dart';


String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

/*
This is the main class access/call for any UI widgets that require to perform
any CRUD activities operation in FirebaseFirestore database.
This class work hand-in-hand with FirestoreService and FirestorePath.

Notes:
For cases where you need to have a special method such as bulk update specifically
on a field, then is ok to use custom code and write it here. For example,
setAllTodoComplete is require to change all todos item to have the complete status
changed to true.

 */
class FirestoreDatabase {
  FirestoreDatabase({required this.uid}) : assert(uid != null);
  final String uid;

  final _firestoreService = FirestoreService.instance;

  //Method to create/update projectModel
  Future<void> setProject(ProjectModel project) async => await _firestoreService.set(
        path: FirestorePath.project(uid, project.id),
        data: project.toMap(),
      );

  //Method to delete projectModel entry
  Future<void> deleteTodo(ProjectModel project) async {
    await _firestoreService.deleteData(path: FirestorePath.project(uid, project.id));
  }

  //Method to retrieve todoModel object based on the given projectId
  Stream<ProjectModel> projectStream({required String projectId}) =>
      _firestoreService.documentStream(
        path: FirestorePath.project(uid, projectId),
        builder: (data, documentId) => ProjectModel.fromMap(data, documentId),
      );

  //Method to retrieve all projects item from the same user based on uid
  Stream<List<ProjectModel>> projectsStream() => _firestoreService.collectionStream(
        path: FirestorePath.projects(uid),
        builder: (data, documentId) => ProjectModel.fromMap(data, documentId),
      );

/*
  //Method to mark all projectModel to be complete
  Future<void> setAllTodoComplete() async {
    final batchUpdate = FirebaseFirestore.instance.batch();

    final querySnapshot = await FirebaseFirestore.instance
        .collection(FirestorePath.todos(uid))
        .get();

    for (DocumentSnapshot ds in querySnapshot.docs) {
      batchUpdate.update(ds.reference, {'complete': true});
    }
    await batchUpdate.commit();
  }

  Future<void> deleteAllTodoWithComplete() async {
    final batchDelete = FirebaseFirestore.instance.batch();

    final querySnapshot = await FirebaseFirestore.instance
        .collection(FirestorePath.todos(uid))
        .where('complete', isEqualTo: true)
        .get();

    for (DocumentSnapshot ds in querySnapshot.docs) {
      batchDelete.delete(ds.reference);
    }
    await batchDelete.commit();
  }*/
}
