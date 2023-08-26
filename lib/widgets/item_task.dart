import 'package:flutter/material.dart';
import 'package:shopingapi/constant/colors_app.dart';

class ItemTasks extends StatelessWidget {
  const ItemTasks({
    super.key,
    required this.onTapTask,
    required this.onTapDelete,
    required this.title,
    required this.supTitle,
  });

  final Function() onTapTask, onTapDelete;
  final String title, supTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: onTapTask,
        child: Container(
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10),
          decoration: BoxDecoration(
              color: AppColors.KSupColor,
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(title,
                    style: const TextStyle(color: Colors.black, fontSize: 18)),
                subtitle: Text(
                  supTitle,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 14),
                ),
                trailing: IconButton(
                  onPressed: onTapDelete,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                    size: 24,
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 16),
              //   child: Text("2002/01/1",
              //       style: TextStyle(color: Colors.black.withOpacity(0.5))),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
