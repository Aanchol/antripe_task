import 'package:equatable/equatable.dart';
import '../../../../core/utils/state_status.dart';
import '../../data/models/home_contact_list_model.dart';

class HomeState extends Equatable {
  final StateStatus stateStatus;
  final HomeContactListModel? contactListModel;
  final int selectedTab;
  final int selectedCategory;
  final List<ContactsListData> filteredContacts;
  final bool isSearchMode;
  final String searchQuery;

  const HomeState({
    this.stateStatus = StateStatus.initial,
    this.contactListModel,
    this.selectedTab =0,
    this.selectedCategory =0,
    this.filteredContacts =const <ContactsListData>[],
    this.isSearchMode = false,
    this.searchQuery = '',
  });

  HomeState copyWith({
    StateStatus? stateStatus,
    HomeContactListModel? contactListModel,
    int? selectedTab,
    int? selectedCategory,
    List<ContactsListData>? filteredContacts,
    bool? isSearchMode,
    String? searchQuery,
  }) {
    return HomeState(
      stateStatus: stateStatus ?? this.stateStatus,
      contactListModel: contactListModel ?? this.contactListModel,
      selectedTab: selectedTab ?? this.selectedTab,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      filteredContacts: filteredContacts ?? this.filteredContacts,
      isSearchMode: isSearchMode ?? this.isSearchMode,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [
    stateStatus,
    contactListModel,
    selectedTab,
    selectedCategory,
    filteredContacts,
    isSearchMode,
    searchQuery
  ];
}