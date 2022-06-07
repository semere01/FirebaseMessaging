// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../auth/screens/sign_in_page.dart' as _i1;
import '../auth/screens/sign_up_page.dart' as _i2;
import '../chats/chats.dart' as _i3;
import '../messaging/course.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SignInRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SignInPage());
    },
    SignUpRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignUpPage());
    },
    ChatsListRoute.name: (routeData) {
      final args = routeData.argsAs<ChatsListRouteArgs>(
          orElse: () => const ChatsListRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.ChatsListPage(key: args.key));
    },
    MessagesMainRoute.name: (routeData) {
      final args = routeData.argsAs<MessagesMainRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.MessagesMainPage(
              key: args.key, messengerId: args.messengerId));
    },
    MessagesListRoute.name: (routeData) {
      final args = routeData.argsAs<MessagesListRouteArgs>(
          orElse: () => const MessagesListRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.MessagesListPage(key: args.key, messages: args.messages));
    },
    MessagesNewRoute.name: (routeData) {
      final args = routeData.argsAs<MessagesNewRouteArgs>(
          orElse: () => const MessagesNewRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.MessagesNewPage(key: args.key));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SignInRoute.name, path: '/sign-in-page'),
        _i5.RouteConfig(SignUpRoute.name, path: '/'),
        _i5.RouteConfig(ChatsListRoute.name, path: '/chats-list-page'),
        _i5.RouteConfig(MessagesMainRoute.name, path: '/messages-main-page'),
        _i5.RouteConfig(MessagesListRoute.name, path: '/messages-list-page'),
        _i5.RouteConfig(MessagesNewRoute.name, path: '/messages-new-page')
      ];
}

/// generated route for
/// [_i1.SignInPage]
class SignInRoute extends _i5.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in-page');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i2.SignUpPage]
class SignUpRoute extends _i5.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i3.ChatsListPage]
class ChatsListRoute extends _i5.PageRouteInfo<ChatsListRouteArgs> {
  ChatsListRoute({_i6.Key? key})
      : super(ChatsListRoute.name,
            path: '/chats-list-page', args: ChatsListRouteArgs(key: key));

  static const String name = 'ChatsListRoute';
}

class ChatsListRouteArgs {
  const ChatsListRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'ChatsListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.MessagesMainPage]
class MessagesMainRoute extends _i5.PageRouteInfo<MessagesMainRouteArgs> {
  MessagesMainRoute({_i6.Key? key, required String messengerId})
      : super(MessagesMainRoute.name,
            path: '/messages-main-page',
            args: MessagesMainRouteArgs(key: key, messengerId: messengerId));

  static const String name = 'MessagesMainRoute';
}

class MessagesMainRouteArgs {
  const MessagesMainRouteArgs({this.key, required this.messengerId});

  final _i6.Key? key;

  final String messengerId;

  @override
  String toString() {
    return 'MessagesMainRouteArgs{key: $key, messengerId: $messengerId}';
  }
}

/// generated route for
/// [_i4.MessagesListPage]
class MessagesListRoute extends _i5.PageRouteInfo<MessagesListRouteArgs> {
  MessagesListRoute({_i6.Key? key, Iterable<dynamic>? messages})
      : super(MessagesListRoute.name,
            path: '/messages-list-page',
            args: MessagesListRouteArgs(key: key, messages: messages));

  static const String name = 'MessagesListRoute';
}

class MessagesListRouteArgs {
  const MessagesListRouteArgs({this.key, this.messages});

  final _i6.Key? key;

  final Iterable<dynamic>? messages;

  @override
  String toString() {
    return 'MessagesListRouteArgs{key: $key, messages: $messages}';
  }
}

/// generated route for
/// [_i4.MessagesNewPage]
class MessagesNewRoute extends _i5.PageRouteInfo<MessagesNewRouteArgs> {
  MessagesNewRoute({_i6.Key? key})
      : super(MessagesNewRoute.name,
            path: '/messages-new-page', args: MessagesNewRouteArgs(key: key));

  static const String name = 'MessagesNewRoute';
}

class MessagesNewRouteArgs {
  const MessagesNewRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'MessagesNewRouteArgs{key: $key}';
  }
}
