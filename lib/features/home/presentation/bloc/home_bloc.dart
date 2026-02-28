import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/state_status.dart';
import '../../data/models/home_contact_list_model.dart';
import '../../data/repositories/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository homeRepository;


  HomeBloc({required this.homeRepository}) : super(HomeState()) {
    on<FetchContactList>(_onFetchContactList);
    on<ChangeCategoryEvent>(_onChangeCategoryEvent);
    on<SearchContactEvent>(_onSearchContactEvent);
    on<ToggleSearchModeEvent>(_onToggleSearchMode);
    on<ChangeTabEvent>(_onChangeTabEvent);
  }


  List<ContactsListData> _applyFilter({
    required List<ContactsListData> allContacts,
    required List<Categories> categories,
    required int categoryIndex,
    required String query,
  }) {
    final selectedId = (categoryIndex >= 0 && categoryIndex < categories.length)
        ? categories[categoryIndex].id
        : 'all';

    return allContacts.where((c) {
      final matchesCategory =
          selectedId == 'all' || c.categoryId == selectedId;
      final q = query.toLowerCase();
      final matchesSearch = q.isEmpty ||
          (c.name?.toLowerCase().contains(q) == true) ||
          (c.phone?.contains(q) == true);
      return matchesCategory && matchesSearch;
    }).toList();
  }

  Future<void> _onFetchContactList(
      FetchContactList event,
      Emitter<HomeState> emit,
      ) async {
    emit(state.copyWith(stateStatus: StateStatus.loading));
    final contactResponse =await homeRepository.fetchHomeContactList();
    final allContacts = contactResponse.contactData?.contacts ?? [];
    final categories = contactResponse.contactData?.categories ?? [];
    //print(contactResponse.contactData?.categories);
    emit(state.copyWith(stateStatus: StateStatus.success, contactListModel: contactResponse,
      filteredContacts: _applyFilter(
        allContacts: allContacts,
        categories: categories,
        categoryIndex: state.selectedCategory,
        query: state.searchQuery,
      ),
    ));

  }

  void _onChangeCategoryEvent(
      ChangeCategoryEvent event,
      Emitter<HomeState> emit,
      ) {
    final allContacts =
        state.contactListModel?.contactData?.contacts ?? [];
    final categories =
        state.contactListModel?.contactData?.categories ?? [];

    emit(state.copyWith(
      selectedCategory: event.index,
      filteredContacts: _applyFilter(
        allContacts: allContacts,
        categories: categories,
        categoryIndex: event.index,
        query: state.searchQuery,
      ),
    ));
  }

  void _onSearchContactEvent(
      SearchContactEvent event,
      Emitter<HomeState> emit,
      ) {
    final allContacts =
        state.contactListModel?.contactData?.contacts ?? [];
    final categories =
        state.contactListModel?.contactData?.categories ?? [];
    // if (categories.isNotEmpty) {
    //   final selectedId = categories[state.selectedCategory].id;
    //   debugPrint('Selected category id: "$selectedId"');
    // }
    //
    // if (allContacts.isNotEmpty) {
    //   debugPrint('First contact name: "${allContacts.first.name}"');
    //   debugPrint('First contact phone: "${allContacts.first.phone}"');
    //   debugPrint('First contact categoryId: "${allContacts.first.categoryId}"');
    // }
    emit(state.copyWith(
      searchQuery: event.query,
      filteredContacts: _applyFilter(
        allContacts: allContacts,
        categories: categories,
        categoryIndex: state.selectedCategory, // preserve active category
        query: event.query,
      ),
    ));
  }

  void _onToggleSearchMode(
      ToggleSearchModeEvent event,
      Emitter<HomeState> emit,
      ) {
    // When closing search, clear query and re-filter
    if (!event.isSearchMode) {
      final allContacts =
          state.contactListModel?.contactData?.contacts ?? [];
      final categories =
          state.contactListModel?.contactData?.categories ?? [];

      emit(state.copyWith(
        isSearchMode: false,
        searchQuery: '',
        filteredContacts: _applyFilter(
          allContacts: allContacts,
          categories: categories,
          categoryIndex: state.selectedCategory,
          query: '',
        ),
      ));
    } else {
      emit(state.copyWith(isSearchMode: true));
    }
  }
  void _onChangeTabEvent(
      ChangeTabEvent event,
      Emitter<HomeState> emit,
      ) {
    emit(state.copyWith(selectedTab: event.index));
  }
}
