import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchContactList extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class ChangeCategoryEvent extends HomeEvent {
  final int index;
  const ChangeCategoryEvent(this.index);
  @override
  List<Object?> get props => [index];
}

class SearchContactEvent extends HomeEvent {
  final String query;
  const SearchContactEvent(this.query);
  @override
  List<Object?> get props => [query];
}

class ToggleSearchModeEvent extends HomeEvent {
  final bool isSearchMode;
  const ToggleSearchModeEvent(this.isSearchMode);
  @override
  List<Object?> get props => [isSearchMode];
}

class ChangeTabEvent extends HomeEvent {
  final int index;
  const ChangeTabEvent(this.index);
  @override
  List<Object?> get props => [index];
}