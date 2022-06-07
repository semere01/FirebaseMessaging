import 'package:auto_route/annotations.dart';
import 'package:messaging_bloc/auth/screens/sign_up_page.dart';
import 'package:messaging_bloc/auth/screens/sign_in_page.dart';
import 'package:messaging_bloc/chats/chats.dart';
import 'package:messaging_bloc/messaging/course.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SignInPage),
    AutoRoute(page: SignUpPage, initial: true),
    AutoRoute(page: ChatsListPage),
    AutoRoute(page: MessagesMainPage),
    AutoRoute(page: MessagesListPage),
    AutoRoute(page: MessagesNewPage),
  ],
)
class $AppRouter {}