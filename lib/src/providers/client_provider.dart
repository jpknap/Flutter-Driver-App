import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drivering/src/models/client.dart';

class ClientProvider {
  CollectionReference _ref = FirebaseFirestore.instance.collection('Clients');

  ClientProvider();

  Future<void> create(Client client) async {
    dynamic errorMessage;
    try {
      return await _ref.doc(client.id).set(client.toJson());
    } catch (error) {
      errorMessage = error;
    }
    if (errorMessage != null) {
      return Future.error(errorMessage);
    }
  }

  Future<Client?> getById(String id) async {
    DocumentSnapshot document = await _ref.doc(id).get();

    if (document.exists) {
      Client client = Client.fromJson(document.data() as Map<String, dynamic>);
      return client;
    }
    return null;
  }
}
