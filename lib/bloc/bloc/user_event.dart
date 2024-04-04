part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final User user;

  ActivateUser({
    required this.user
  });
}

class SetUserAge extends UserEvent {
  final int age;

  SetUserAge({
    required this.age
  });
}

class AddUserProfession extends UserEvent {
  final String profession;

  AddUserProfession({
    required this.profession
  });
}

class DeleteUser extends UserEvent {}


