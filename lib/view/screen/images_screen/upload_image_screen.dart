import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopingapi/constant/colors_app.dart';

class UplaoadImageScreen extends StatefulWidget {
  const UplaoadImageScreen({super.key});

  @override
  State<UplaoadImageScreen> createState() => _UplaoadImageScreenState();
}

class _UplaoadImageScreenState extends State<UplaoadImageScreen> {
  // final ImagePickerController _imagePickerController =
  //     Get.put(ImagePickerController());
  final ImagePicker _imagePicker = ImagePicker();
  var url;

  XFile? imageFile;
  final double _progressValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_rounded,
          color: AppColors.whiteColor,
        ),
        backgroundColor: AppColors.KPrimaryColor,
        title: const Text(
          'Upload Image',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async => await getImageFromGallary(),
              icon: const Icon(
                Icons.upload,
                color: AppColors.whiteColor,
              ))
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            minHeight: 10,
            backgroundColor: Colors.green.shade200,
            color: Colors.green.shade700,
            value: _progressValue,
          ),
          Expanded(
              child: imageFile != null
                  ? Image.file(
                      url,
                      fit: BoxFit.cover,
                    )
                  : IconButton(
                      onPressed: () async => await getImageFromGallary(),
                      icon: const Icon(Icons.camera_alt),
                      iconSize: 70,
                      color: Colors.grey,
                    )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt,
                color: AppColors.whiteColor,
              ),
              label: Text(
                'Upload'.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> getImageFromGallary() async {
    imageFile = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    if (imageFile != null && imageFile!.path.isNotEmpty) {
      setState(() {
        url = File(imageFile!.path);
      });
    }
  }
}
