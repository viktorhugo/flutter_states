import 'package:bloc/bloc.dart';
import 'package:flutter_states/models/user.dart';
import 'package:meta/meta.dart';

part 'user_cubit_state.dart';

class UserCubit extends Cubit<UserCubitState> {
  
  UserCubit() : super(UserCubitInitial());

  void setUser({required User user}) {

    emit(ActiveUser(user: user));
  }
}
