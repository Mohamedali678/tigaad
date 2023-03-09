// import 'package:dhir_app/model/data_brain.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class Data {
//   List<DataBrain> getAllData = [
//     DataBrain(
//       "assets/images/favorite1.png",
//       "Spider Plant",
//       3,
//       "inside",
//     ),
//     // DataBrain("assets/images/favorite2.png", "Song of india", 4),
//     // DataBrain("assets/images/favorite3.png", "Grey star", 7),
//     // DataBrain("assets/images/favorite4.png", "Banana plant", 5),
//     // DataBrain("assets/images/favorite5.png", "Devil's Ivy", 9),
//     // DataBrain("assets/images/favorite6.png", "Sago palm", 7),
//   ];
// }

// void getImages() async {
//   final folderRef =
//       FirebaseStorage.instance.ref().child('gs://tigaad-9957b.appspot.com');
//   final result = await folderRef.listAll();
//   final images = result.items;
//   List<String> urls = [];
//   for (var image in images) {
//     final url = await image.getDownloadURL();
//     urls.add(url);
//   }
// }
