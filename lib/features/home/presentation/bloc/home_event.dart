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
  final int categoryIndex;

  const SearchContactEvent({
    required this.query,
    required this.categoryIndex,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [query,categoryIndex];
}
