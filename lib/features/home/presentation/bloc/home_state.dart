import 'package:equatable/equatable.dart';
import '../../../../core/utils/state_status.dart';
import '../../data/models/home_contact_list_model.dart';

class HomeState extends Equatable {
  final StateStatus stateStatus;
  final HomeContactListModel? contactListModel;
  final int selectedTab;
  final int selectedCategory;
  final List<ContactsListData> filteredContacts;

  const HomeState({
    this.stateStatus = StateStatus.initial,
    this.contactListModel,
    this.selectedTab =0,
    this.selectedCategory =0,
    this.filteredContacts =const <ContactsListData>[],
  });

  HomeState copyWith({
    StateStatus? stateStatus,
    HomeContactListModel? contactListModel,
    int? selectedTab,
    int? selectedCategory, List<ContactsListData>? filteredContacts,
  }) {
    return HomeState(
      stateStatus: stateStatus ?? this.stateStatus,
      contactListModel: contactListModel ?? this.contactListModel,
      selectedTab: selectedTab ?? this.selectedTab,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      filteredContacts: filteredContacts ?? this.filteredContacts,
    );
  }

  @override
  List<Object?> get props => [
    stateStatus,
    contactListModel,
    selectedTab,
    selectedCategory,
    filteredContacts
  ];
}
