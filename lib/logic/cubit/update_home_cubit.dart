import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'update_home_state.dart';

class UpdateHomeCubit extends Cubit<UpdateHomeState> {
  UpdateHomeCubit() : super(UpdateHomeInitial());

  // Trigger loading state when starting the update
  void startLoading() {
    emit(UpdateHomeLoading());
  }

  // Trigger when home needs to be updated (i.e., playlist is added)
  void updateHome() {
    emit(UpdateHomeLoaded());
  }
}
