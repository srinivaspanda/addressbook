part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

// Initial Load Event of the app
class ContactInitialLoadEvent extends ContactEvent {}

// This event is streamed when user starts typing in the search field
class ContactSearchEvent extends ContactEvent {
  final String? searchText;

  ContactSearchEvent({this.searchText});

  @override
  List<Object> get props => [searchText ?? ''];
}

// This event is streamed when user selects any contact in the GroupView list to show the detail view
class ContactSelectedEvent extends ContactEvent {
  final String? contactName;


  ContactSelectedEvent({this.contactName});

  @override
  List<Object> get props => [contactName ?? ''];
}
