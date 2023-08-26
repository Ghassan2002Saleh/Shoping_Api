// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shopingapi/api/controllers/task_api_controller.dart';
// import 'package:shopingapi/model/task.dart';

// class TasksGetxController extends GetxController {
//   RxList<Task> tasks = <Task>[].obs;
//   final TaskApiController _apiContrroller = TaskApiController();
//   RxBool loading = false.obs;

//   @override
//   void onInit() {
//     readTasks();
//     super.onInit();
//   }

//   void readTasks() async {
//     loading.value = true;
//     tasks.value = await _apiContrroller.readTask();
//     loading.value = false;
//   }

//   Future<void> deleteTasks(BuildContext context, {required int index}) async {
//     var apiResponse =
//         await _apiContrroller.deleteTask(context, id: tasks[index].id);
//     if (apiResponse) tasks.removeAt(index);
//   }
// }
