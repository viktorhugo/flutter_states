import 'package:bloc/bloc.dart';
import 'package:flutter_states/models/user.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    
    on<ActivateUser>((event, emit) {
      print('Activate user called');
      emit(UserSetState(newUser: event.user));
    });

    on<SetUserAge>((event, emit) {
      print('Set User Age  called');
      if (!state.existUser) return;
      emit(UserSetState(newUser: state.user!.copyWith(age: event.age )));
    });

    on<AddUserProfession>((event, emit) {
      print('Add User Profession  called');
      if (!state.existUser) return;
      emit(UserSetState(newUser: state.user!.copyWith(professions: [...state.user!.professions, event.profession] )));
    });

    on<DeleteUser>((event, emit) {
      print('Delete User  called');
      emit(const UserInitialState());
    });

  }
}
