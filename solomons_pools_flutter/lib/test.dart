import 'package:mongo_dart/mongo_dart.dart' as mongo;

void main(List<String> arguments) async {
  var db = await mongo.Db.create(
      "mongodb+srv://solomons_pools:t0XEJRZIM9a5vZDL@cluster0.aob8x.mongodb.net/solomons_pools?readPreference=secondary&replicaSet=your_replSet_name&ssl=true");
  await db.open();
  final col = db.collection('events');
  final data = await col.find().toList();
  print(data);
}
