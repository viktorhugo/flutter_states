part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existUser;
  final User? user;

  const UserState({
    this.existUser = false, 
    this.user
  });
}

final class UserInitialState extends UserState {
  const UserInitialState(): super( existUser: false, user: null);
}

final class UserSetState extends UserState {

  final User newUser;

  const UserSetState({
    required this.newUser
  }): super(existUser: true, user: newUser);
  
}

