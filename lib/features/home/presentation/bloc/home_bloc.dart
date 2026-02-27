import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/state_status.dart';
import '../../data/repositories/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeState()) {
    on<FetchContactList>(_onFetchContactList);
    on<ChangeCategoryEvent>(_onChangeCategoryEvent);
  }

  Future<void> _onFetchContactList(
      FetchContactList event,
      Emitter<HomeState> emit,
      ) async {
    emit(state.copyWith(stateStatus: StateStatus.loading));
    final contactResponse =await homeRepository.fetchHomeContactList();
    print(contactResponse.contactData?.categories);
    emit(state.copyWith(stateStatus: StateStatus.success, contactListModel: contactResponse));

  }

  void _onChangeCategoryEvent(
      ChangeCategoryEvent event,
      Emitter<HomeState> emit,
      ) async {
    emit(state.copyWith(selectedCategory: event.index));

  }
}
