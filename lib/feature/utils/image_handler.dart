import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageHandler {
   File _file =File('');

  Future<void> pickAndCropImage({required ImageSource imageSource}) async {
    var imagepikcer = await ImagePicker().pickImage(source: imageSource);

    if (imagepikcer == null) return;
    File image = File(imagepikcer.path);
    _file = image;
  }

   File get getFile=>_file;
}
