import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseMethods{
  Future addPartyDetails(
    Map<String, dynamic>partyinfoMap, String id)async{
    return await FirebaseFirestore.instance
        .collection('Book') //collection name
        .doc(id)
        .set(partyinfoMap);//upload user Map data
  }
  Future<Stream<QuerySnapshot>> getPartyDetails()async{
    return await FirebaseFirestore.instance.collection('Book').snapshots();
  }

  Future saveupdategavePartyDetails(String id, Map<String, dynamic>updategaveInfo)async{
    return await FirebaseFirestore.instance.collection('Book').doc(id).update(updategaveInfo);
  }
  // gave amount save

  Future saveupdategotPartyDetails(String id, Map<String, dynamic>updategotInfo)async{
    return await FirebaseFirestore.instance.collection('Book').doc(id).update(updategotInfo);
  }
// got amount save

Future DeletePartyDetails(String id)async{
    return await FirebaseFirestore.instance.collection('Book').doc(id).delete();
}

}


