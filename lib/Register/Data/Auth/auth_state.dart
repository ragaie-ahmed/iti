part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class RegisterSuccess extends AuthState {}
class RegisterLoading extends AuthState {}
class LoadingLogIn extends AuthState {}
class SuccessLogIn extends AuthState {}
class RegisterError extends AuthState {
  final String error;

  RegisterError({required this.error});
}
class ErrorLogIn extends AuthState {
  final String error;

  ErrorLogIn({required this.error});
}
