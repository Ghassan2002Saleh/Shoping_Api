import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopingapi/constant/colors_app.dart';
import 'package:shopingapi/get/image_getx_controller.dart';
import 'package:shopingapi/util/helper.dart';
import 'package:shopingapi/widgets/widget_loadidng.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> with Helper {
  final ImagesGetxController _getxController = Get.put(ImagesGetxController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: FloatingActionButton(
          backgroundColor: AppColors.KPrimaryColor,
          onPressed: () {
            Get.toNamed('/upload_image_screen');
          },
          child: const Icon(
            Icons.add,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: GetX<ImagesGetxController>(
        builder: (controller) {
          if (_getxController.loading.isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (_getxController.images.isNotEmpty) {
            return GridView.builder(
              itemCount: _getxController.images.length,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, i) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        _getxController.images[i].imageUrl,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          width: double.infinity,
                          color: Colors.white.withOpacity(0.93),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _getxController.images[i].image,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black),
                                ),
                              ),
                              IconButton(
                                  onPressed: () async =>
                                      await _deleteImage(index: i),
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'No Data',
                style: GoogleFonts.montserrat(fontSize: 16),
              ),
            );
          }
        },
      ),
    );
  }

  _deleteImage({required int index}) {
    _getxController.deleteImage(context, index: index);
    if (_getxController.loading.isTrue) {
      WidgetLoadding(context);
    }
  }
}
