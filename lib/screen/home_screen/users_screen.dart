import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopingapi/api/controllers/users_api_controller.dart';
import 'package:shopingapi/constant/colors_app.dart';
import 'package:shopingapi/model/user.dart';
import 'package:shopingapi/pref/shared_pref_controller.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true,
        backgroundColor: AppColors.KPrimaryColor,
        actions: [
          IconButton(
              onPressed: () async {
                await SharedPrefController().clear();
                Get.offAllNamed('/splash_screen');
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      body: FutureBuilder<List<User>>(
        future: UserApiController().read(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    title: Text(snapshot.data![i].firstName),
                    leading: const Icon(Icons.person),
                    // leading: CircleAvatar(
                    //     radius: 30,
                    //     backgroundImage: NetworkImage(snapshot.data![i].image)),
                    subtitle: Text(snapshot.data![i].email),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                'No Data',
              ),
            );
          }
        },
      ),
    );
  }
}
