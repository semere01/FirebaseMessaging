import 'package:meta/meta.dart';

import '../course.dart';

class MessagesRepository {
  final MessagesDataProvider dataProvider;

  MessagesRepository({required this.dataProvider});

  Future<List<Message>> getMessagesFromUser(String foreignUserId) async {
    print("SSSSSSSSSSSSSSSSSSSSSSSS");
    var x = await dataProvider.getMessagesFromUser(foreignUserId);
    print("x: $x");
    return x;
  }

  Future<void> sendMessage(String foreignUserId, String content) async {
    await dataProvider.sendMessageToUser(foreignUserId, content);
  }
}
