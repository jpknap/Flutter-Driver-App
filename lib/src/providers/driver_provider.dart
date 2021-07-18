import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drivering/src/models/driver.dart';

class DriverProvider {
  CollectionReference _ref = FirebaseFirestore.instance.collection('Drivers');

  DriverProvider();

  Future<void> create(Driver driver) async {
    dynamic errorMessage;
    try {
      return await _ref.doc(driver.id).set(driver.toJson());
    } catch (error) {
      errorMessage = error;
    }
    if (errorMessage != null) {
      return Future.error(errorMessage);
    }
  }

  Future<Driver?> getById(String id) async {
    DocumentSnapshot document = await _ref.doc(id).get();

    if (document.exists) {
      Driver driver = Driver.fromJson(document.data() as Map<String, dynamic>);
      return driver;
    }
    return null;
  }
}
