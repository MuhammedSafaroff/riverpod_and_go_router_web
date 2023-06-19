import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_and_go_router_web/common/colors/app_colors.dart';

import '../../model/task.dart';
import '../../service/network_service.dart';
import 'widgets/task_item.dart';
import 'dart:html' as html;

final providerTaskId = StateProvider.autoDispose((_) => "1");

class TasksPage extends HookConsumerWidget {
  const TasksPage({Key? key, this.pathId}) : super(key: key);
  final String? pathId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(networkServiceProvider);
    Future.delayed(const Duration(milliseconds: 300), () {
      ref.read(providerTaskId.notifier).state = pathId ?? "1";
    });
    return data.when(
      data: (data) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Consumer(builder: (_, WidgetRef ref, __) {
                    final id = ref.watch(providerTaskId);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tasks",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 24),
                          child: Divider(
                            color: AppColors.lightBlue,
                          ),
                        ),
                        for (var element in data)
                          TaskItem(
                            element: element,
                            id: id,
                            onTap: (p0) {
                              html.window.history
                                  .pushState({}, "", "#/tasks/$p0");
                              ref.read(providerTaskId.notifier).state = p0;
                            },
                          ),
                      ],
                    );
                  }),
                ),
              ),
              const VerticalDivider(),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Consumer(builder: (_, WidgetRef ref, __) {
                    final id = ref.watch(providerTaskId);
                    Task item = data.firstWhere(
                      (element) => element.id == id,
                      orElse: () => Task(
                        id: "",
                        title: "No data",
                        dateTime: DateTime.now(),
                        body: "404",
                      ),
                    );
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 30),
                          child: Divider(
                            color: AppColors.lightBlue,
                          ),
                        ),
                        Text(
                          DateFormat("d/M, ").add_Hm().format(item.dateTime),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item.body,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return Expanded(
          child: Center(
            child: Text(error.toString()),
          ),
        );
      },
      loading: () {
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
