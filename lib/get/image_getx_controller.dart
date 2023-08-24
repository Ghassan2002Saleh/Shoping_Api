import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopingapi/api/controllers/images_api_controller.dart';
import 'package:shopingapi/model/image.dart';

class ImagesGetxController extends GetxController {
  RxList<StudenImage> images = <StudenImage>[].obs;
  final ImagesApiContrroller _apiContrroller = ImagesApiContrroller();
  RxBool loading = false.obs;

  @override
  void onInit() {
    readImages();
    super.onInit();
  }

  void readImages() async {
    loading.value = true;
    images.value = await _apiContrroller.readImage();
    loading.value = false;
  }

  Future<void> deleteImage(BuildContext context, {required int index}) async {
    loading.value = true;
    var apiResponse =
        await _apiContrroller.deleteImage(context, id: images[index].id);
    if (apiResponse) images.removeAt(index);
    loading.value = false;
  }
}
