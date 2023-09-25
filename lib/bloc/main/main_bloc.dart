import 'package:bloc/bloc.dart';
import 'package:dictionary/models/post_model.dart';
import 'package:dictionary/services/db_service.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainInitial([])) {
    on<GetAllDataEvent>(_fetchAllPost);
  }
  void _fetchAllPost(GetAllDataEvent event, Emitter emit) async {
    emit(MainLoading(state.items));
    try {
      final list = await DbService.readAllPost();
      emit(FetchDataSuccess(list, "Successfully fetched!"));
    } catch (e) {
      emit(MainFailure(state.items, "Something error, try again later"));
    }
  }
}
