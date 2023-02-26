import 'dart:developer';

import 'package:app_delivery/app/pages/auth/register/register_state.dart';
import 'package:app_delivery/app/repositories/auth/auth_repository.dart';
import 'package:bloc/bloc.dart';

import '../../home/home_state.dart';

class RegisterController extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterController(this._authRepository) : super(RegisterState.initial());

  Future<void> register(String name, String email, String password) async {
    try {
      emit(state.copyWith(status: RegisterStatus.register));
      await _authRepository.register(
        name,
        email,
        password,
      );
      emit(state.copyWith(status: RegisterStatus.success));
    } catch (e, s) {
      log('Erro ao registrar usuário', error: e, stackTrace: s);
      emit(state.copyWith(status: RegisterStatus.error));
    }
  }
}
