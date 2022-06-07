import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messaging_bloc/auth/auth.dart';
import 'package:messaging_bloc/chats/data_provider/data_provider.dart';
import 'package:messaging_bloc/chats/repository/repository.dart';
import 'package:messaging_bloc/messaging/bloc/messages_bloc.dart';
import 'package:messaging_bloc/messaging/repository/repository.dart';
import 'package:messaging_bloc/nav/nav_handler.dart';
import 'package:messaging_bloc/routes/router.gr.dart';
import 'bloc_observer.dart';
import 'chats/bloc/chats_bloc.dart';
import 'chats/screens/chats_new.dart';
import 'course/course.dart';
import 'package:http/http.dart' as http;

import 'firebase_options.dart';
import 'messaging/data_provider/messages_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final AuthRepository authRepository = AuthRepository(
    dataProvider: AuthDataProvider(),
  );

  runApp(MessageApp());
}

class MessageApp extends StatelessWidget {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: ChatsNewPage());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) {
            return MessagesBloc(
              messagesRepository: MessagesRepository(
                dataProvider: MessagesDataProvider(),
              ),
            );
          }),
        ),
        BlocProvider(
          create: ((context) {
            return ChatsBloc(
              chatsRepository: ChatsRepository(
                dataProvider: ChatsDataProvider(),
              ),
            );
          }),
        ),
        BlocProvider(
          create: ((context) {
            return AuthBloc(
              authRepository: AuthRepository(
                dataProvider: AuthDataProvider(),
              ),
            );
          }),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            // listener: (context, state) {
            //   print("listener activate");
            // },
            listener: (_, __) {},
          ),
          // BlocListener<BlocB, MessagingBl>(
          //   listener: (context, state) {},
          // ),
          // BlocListener<BlocC, BlocCState>(
          //   listener: (context, state) {},
          // ),
        ],
        child: MaterialApp.router(
          routerDelegate: AutoRouterDelegate(
            _appRouter,
            navigatorObservers: () => [AutoRouteObserver()],
          ),
          routeInformationParser: _appRouter.defaultRouteParser(),
          theme: ThemeData(primaryColor: Colors.red),
        ),
      ),
    );
  }
}
