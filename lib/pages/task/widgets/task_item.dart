import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/colors/app_colors.dart';
import '../../../model/task.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    Key? key,
    required this.element,
    this.onTap,
    required this.id,
  }) : super(key: key);
  final Task element;
  final String id;
  final void Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () => onTap!(element.id),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  element.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight:
                        id == element.id ? FontWeight.w700 : FontWeight.w400,
                  ),
                ),
                Text(
                  DateFormat("d/M, ").add_Hm().format(element.dateTime),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight:
                        id == element.id ? FontWeight.w700 : FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
