import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/task.dart';

final networkServiceProvider = FutureProvider<List<Task>>((ref) {
  return NetworkService().getTasks();
});

class NetworkService {
  NetworkService();
  String body1 =
      "1. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  String body2 =
      "2. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  String body3 =
      "3. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  String body4 =
      "4. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  String body5 =
      "5. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  String body6 =
      "6. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  String body7 =
      "7. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  Future<List<Task>> getTasks() async {
    final now = DateTime.now();
    await Future.delayed(const Duration(seconds: 2));

    return [
      Task(
        id: '1',
        title: 'Read emails from mailbox',
        dateTime: now.add(const Duration(days: 1)),
        body: body1,
      ),
      Task(
        id: '2',
        title: 'Check latest news on Flutter',
        dateTime: now.add(const Duration(days: 2)),
        body: body2,
      ),
      Task(
        id: '3',
        title: 'Have a call with Flutter team',
        dateTime: now.add(const Duration(days: 3)),
        body: body3,
      ),
      Task(
        id: '4',
        title: 'Work on application performance',
        dateTime: now.add(const Duration(days: 4)),
        body: body4,
      ),
      Task(
        id: '5',
        title: 'Plan work for next week',
        dateTime: now.add(const Duration(days: 5)),
        body: body5,
      ),
      Task(
        id: '6',
        title: 'Order lunch',
        dateTime: now.add(const Duration(days: 6)),
        body: body6,
      ),
      Task(
        id: '7',
        title: 'Create an invoice for last month',
        dateTime: now.add(const Duration(days: 7)),
        body: body7,
      ),
    ];
  }
}
