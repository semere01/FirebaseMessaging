// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../course.dart';
import 'messages_event.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final MessagesRepository messagesRepository;
  MessagesBloc({required this.messagesRepository}) : super(MessagesInitial()) {
    on<OpenUserMessagesEvent>(_handleMessagesFromUser);
    on<SendMessageEvent>(_handleSendMessageEvent);
  }

  void _handleMessagesFromUser(
      OpenUserMessagesEvent event, Emitter<MessagesState> emit) async {
    emit(MessagesLoading());
    try {
      List<Message> messages =
          await messagesRepository.getMessagesFromUser(event.foreignUserId);
      print("Messages: $messages");
      emit(MessagesLoaded(event.foreignUserId, messages));
    } catch (e) {
      emit(MessagesFailed(e.toString()));
    }
  }

  void _handleSendMessageEvent(
      SendMessageEvent event, Emitter<MessagesState> emit) async {
    emit(MessagesLoading());
    try {
      messagesRepository.sendMessage(event.foreignUserId, event.content);
    } catch (e) {
      emit(MessagesFailed(e.toString()));
    }
  }
}
