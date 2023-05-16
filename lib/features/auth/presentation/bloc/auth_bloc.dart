import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_app_test/core/enum/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<Login>(_login);
  }

  void _login(Login event, Emitter<AuthState> emit) {
    log("Emitter _login");
  }
}
