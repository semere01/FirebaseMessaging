// import 'dart:html';

import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../chats.dart';
import 'chats_event.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final ChatsRepository chatsRepository;
  ChatsBloc({required this.chatsRepository}) : super(ChatsInitial()) {
    on<ChatsPageLoadedEvent>(_handleRequestChatsEvent);
    on<AddUserEvent>(_handleAddUserEvent);
  }

  void _showLoading(Emitter emit) {
    emit(ChatsLoading());
  }

  Future<void> _handleRequestChatsEvent(
      ChatsPageLoadedEvent event, Emitter<ChatsState> emit) async {
    emit(ChatsLoading());
    try {
      Iterable chats = await chatsRepository.getAllChats();
      emit(ChatsLoaded(chats));
    } catch (e) {
      emit(ChatsFailed(e.toString()));
    }
  }

  Future<void> _handleAddUserEvent(
      AddUserEvent event, Emitter<ChatsState> emit) async {
    emit(AddUserLoading());
    try {
      await chatsRepository.addNewUser(event.foreignUserId);
      emit(UserAdded(event.foreignUserId));
    } catch (e) {
      emit(ChatsFailed(e.toString()));
    }
  }
}
