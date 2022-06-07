import 'package:meta/meta.dart';

import '../chats.dart';

class ChatsRepository {
  final ChatsDataProvider dataProvider;

  ChatsRepository({required this.dataProvider}) : assert(dataProvider != null);

  Future<Iterable> getMessagesFromUser(String foreignUserId) async {
    return await dataProvider.getMessagesFromUser(foreignUserId);
  }

  Future<Iterable> getAllChats() async {
    return await dataProvider.getAllChats();
  }

  Future<void> addNewUser(String foreignUserId) async{
    return await dataProvider.addUser(foreignUserId);
  }
}
