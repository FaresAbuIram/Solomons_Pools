import 'package:mongo_dart/mongo_dart.dart' as mongo;

void main(List<String> arguments) async {
  var db = await mongo.Db.create(
      "mongodb+srv://solomons_pools:t0XEJRZIM9a5vZDL@cluster0.aob8x.mongodb.net/solomons_pools?readPreference=secondary&replicaSet=your_replSet_name&ssl=true");
  await db.open();
  final col1 = db.collection('events');
  final data1 = await col1.find().toList();
  final col2 = db.collection('places');
  final data2 = await col2.find().toList();
  print(data1);
  print(data2);
}
