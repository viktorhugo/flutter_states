import 'package:bloc/bloc.dart';
import 'package:flutter_states/models/user.dart';
import 'package:meta/meta.dart';

part 'user_cubit_state.dart';

class UserCubit extends Cubit<UserCubitState> {
  
  UserCubit() : super(UserCubitInitial());

  void setUser({required User user}) {
    emit(ActiveUser(user: user));
  }
  
  void setAge({required int age}) {
    final currentState = state;
    if  (currentState is ActiveUser) {
      emit( ActiveUser(user: currentState.user.copyWith(age: age)) );
    }
  }

  void setProfessions({ required List<String> listProfessions }) {
    final currentState = state;
    if  (currentState is ActiveUser) {
      emit( ActiveUser(
          user: currentState.user.copyWith(
            professions: [ 
              ...currentState.user.professions, 
              ...listProfessions
            ] 
          )
        ) 
      );
    }
  }

  void removeUser() { 
    emit(UserCubitInitial());
  }
}
