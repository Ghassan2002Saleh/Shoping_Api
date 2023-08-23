import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  XFile? imageFile;
  List<XFile> images = [];
  List<XFile> docsImages = [];
  final ImagePicker _imagePicker = ImagePicker();
  var url;
  List<String> imagesUrls = [];
  List<String> docsImagesUrls = [];

  Future<void> getImageFromGallary() async {
    imageFile = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    if (imageFile != null && imageFile!.path.isNotEmpty) {
      url = File(imageFile!.path);
    }
    update();
  }

  Future<void> getImageFromCamera() async {
    imageFile = await _imagePicker.pickImage(source: ImageSource.camera);
    url = File(imageFile!.path);
    update();
  }

  Future<void> getMultiImage({required bool isAqar}) async {
    if (isAqar) {
      images.clear();
      images = await _imagePicker.pickMultiImage(imageQuality: 85);
    } else {
      docsImages.clear();
      docsImages = await _imagePicker.pickMultiImage(imageQuality: 85);
    }
    update();
  }
}
