part of 'shared.dart';

Future<File> getImage() async {
  var image = await ImagePicker().getImage(source: ImageSource.gallery);
  return File(image.path);
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
  StorageUploadTask task = ref.putFile(image);
  StorageTaskSnapshot snapshot = await task.onComplete;

  return await snapshot.ref.getDownloadURL();
}

Widget generateDashedDivider(double width) {
    int n = width ~/ 5;
    return Row(
      children: List.generate(
          n,
          (index) => (index % 2 == 0)
              ? Container(
                  height: 2,
                  width: width / n,
                  color: Color(0xFFE4E4E4),
                )
              : SizedBox(
                  width: width / n,
                )),
    );
  }
// Future<String> uploadImage(File image) async {
//   String fileName = basename(image.path);

//   StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
//   StorageUploadTask task = ref.putFile(image);
//   StorageTaskSnapshot snapshot = await task.onComplete;

//   return await snapshot.ref.getDownloadURL();
// }
