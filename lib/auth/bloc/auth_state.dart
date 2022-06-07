import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../auth.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => ["AuthState"];
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => ["AuthInitial"];

}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => ["AuthLoading"];

}

class AuthSuccess extends AuthState {
  final String username;

  const AuthSuccess(this.username);
  @override
  List<Object> get props => ["AuthSuccess"];
}

class AuthFailure extends AuthState {
  String? errorMessage;
  AuthFailure({this.errorMessage});
  @override
  List<Object> get props => ["AuthFailure"];
}
