import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../auth.dart';

abstract class AuthEvent extends Equatable {
  final String username;
  final String password;
  const AuthEvent(this.username, this.password);
  @override
  List<String> get props => [username];
}

class AuthCreate extends AuthEvent {
  final String confirmPassword;
  const AuthCreate(super.username, super.password, this.confirmPassword);

  @override
  String toString() => 'User Created {username: $username}';
}

class AuthPageLoad extends AuthEvent {
  const AuthPageLoad(super.username, super.password);

  @override
  String toString() => 'Test Event Requested {username: $username}';
}

class AuthLogin extends AuthEvent {
  const AuthLogin(super.username, super.password);

  @override
  String toString() => 'User Auth Requested {username: $username}';
}
