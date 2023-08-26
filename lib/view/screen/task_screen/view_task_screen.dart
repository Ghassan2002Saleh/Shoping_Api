import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopingapi/api/controllers/task_api_controller.dart';
import 'package:shopingapi/constant/colors_app.dart';
import 'package:shopingapi/util/helper.dart';
import 'package:shopingapi/widgets/custom_dialog_edit_note.dart';
import 'package:shopingapi/widgets/item_task.dart';

class ViewTaskScreen extends StatefulWidget {
  const ViewTaskScreen({super.key});

  @override
  State<ViewTaskScreen> createState() => _ViewTaskScreenState();
}

class _ViewTaskScreenState extends State<ViewTaskScreen> with Helper {
  String textEdit = '';
  String text = '';
  // final TasksGetxController _getxController = Get.put(TasksGetxController());
  TextEditingController textEditcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: FloatingActionButton(
            backgroundColor: AppColors.KPrimaryColor,
            onPressed: () {
              myDiloag(context,
                  title: 'Add Task',
                  widget: CustomInputField(
                    onchange: (value) {
                      text = value;
                    },
                    hintText: 'write Task',
                    textInputType: TextInputType.text,
                  ), onConfirm: () async {
                if (text.isNotEmpty) {
                  await TaskApiController().createTask(context, title: text);
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  setState(() {});
                } else {
                  ShowSnackBar(context, title: 'ادخل النص', isError: true);
                }
              }, onCancel: () {
                Navigator.pop(context);
              });
            },
            child: const Icon(
              Icons.add,
              color: AppColors.whiteColor,
            ),
          ),
        ),
        body: FutureBuilder(
          future: TaskApiController().readTask(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  return ItemTasks(
                    onTapDelete: () {
                      myDiloag(
                        context,
                        title: 'Are you sure to delete ?',
                        onConfirm: () async {
                          await _deleteTask(index: snapshot.data![i].id);
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                          setState(() {});
                        },
                        onCancel: () {
                          Navigator.pop(context);
                        },
                      );
                    },
                    onTapTask: () {
                      myDiloag(context,
                          title: 'Are you sure to edit ?',
                          widget: CustomInputField(
                              controller: textEditcontroller,
                              onchange: (value) {
                                textEdit = value;
                              },
                              hintText: 'Edit Task',
                              textInputType: TextInputType.text),
                          onConfirm: () async {
                        if (textEdit.isNotEmpty) {
                          await TaskApiController().updateTask(context,
                              id: snapshot.data![i].id, title: textEdit);
                          textEditcontroller.clear();
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                          setState(() {});
                        } else {
                          ShowSnackBar(context, title: 'ادخل النص');
                        }
                      }, onCancel: () {
                        Navigator.pop(context);
                      });
                    },
                    supTitle: snapshot.data![i].createdAt,
                    title: snapshot.data![i].title,
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
        ));
  }

  Future<void> _deleteTask({required int index}) async {
    await TaskApiController().deleteTask(context, id: index);
  }
}
