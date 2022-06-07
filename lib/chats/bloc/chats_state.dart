
import 'package:equatable/equatable.dart';

import '../chats.dart';

class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object> get props => ["ChatsState"];
}

class ChatsInitial extends ChatsState {
  @override
  List<Object> get props => ["ChatsInitial"];
}

class ChatsLoading extends ChatsState {
  @override
  List<Object> get props => ["ChatsLoading"];
}

class AddUserLoading extends ChatsState {
  @override
  List<Object> get props => ["AddUserLoading"];
}

class UserAdded extends ChatsState {
  String foreignUser;
  UserAdded(this.foreignUser);
  @override
  List<Object> get props => ["UserAdded"];
}

class ChatsLoaded extends ChatsState {
  Iterable chats;
  ChatsLoaded(this.chats);
  @override
  List<Object> get props => ["ChatsLoaded"];
}

class ChatsFailed extends ChatsState {
  String errorMessage;
  ChatsFailed(this.errorMessage);
  @override
  List<Object> get props => ["ChatsFailed"];
}
