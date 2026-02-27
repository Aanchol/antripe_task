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
    on<SearchContactEvent>(_onSearchContactEvent);
  }

  Future<void> _onFetchContactList(
      FetchContactList event,
      Emitter<HomeState> emit,
      ) async {
    emit(state.copyWith(stateStatus: StateStatus.loading));
    final contactResponse =await homeRepository.fetchHomeContactList();
    //print(contactResponse.contactData?.categories);
    emit(state.copyWith(stateStatus: StateStatus.success, contactListModel: contactResponse));

  }

  void _onChangeCategoryEvent(
      ChangeCategoryEvent event,
      Emitter<HomeState> emit,
      ) {
    emit(state.copyWith(selectedCategory: event.index));

  }

  void _onSearchContactEvent(
      SearchContactEvent event,
      Emitter<HomeState> emit,
      )  {
    final allContacts = state.contactListModel?.contactData?.contacts ?? [];

    final filteredContacts = allContacts.where((c) {
      final matchesCategory = event.categoryIndex == -1
          ? true
          : c.categoryId == event.categoryIndex.toString();
      final matchesSearch = c.name?.toLowerCase().contains(event.query.toLowerCase()) == true ||
          c.phone?.contains(event.query) == true;
      return matchesCategory && matchesSearch;
    }).toList();

    emit(state.copyWith(filteredContacts: filteredContacts));

  }
}
