part of 'user_cubit_cubit.dart';

@immutable
sealed class UserCubitState {}

final class UserCubitInitial extends UserCubitState {
  final existUser = false;
}

final class ActiveUser extends UserCubitState {
  final existUser = true;
  final User user;

  ActiveUser({
    required this.user
  });
}