import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todolist extends StatelessWidget {
  const Todolist({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
        child: Slidable(
            endActionPane: ActionPane(motion: StretchMotion(), children: [
              SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(15),
              ),
            ]),
            child: Container(
              padding: EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      decoration:
                          taskCompleted ? TextDecoration.lineThrough : null,
                      decorationColor: Colors.white,
                      decorationThickness: 2,
                    ),
                  )
                ],
              ),
            )));
  }
}
