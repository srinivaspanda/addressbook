part of 'contact_bloc.dart';

@immutable
abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class ContactInitialState extends ContactState {}

class ContactLoadingState extends ContactState {}

class ContactLoadedState extends ContactState {
  final Map<String, List<String>>? contactsMap;
  ContactLoadedState({this.contactsMap});

  @override
  List<Object> get props => [contactsMap ?? {}];
}

class ContactSearchResultsDisplayedState extends ContactState {
  final Map<String, List<String>>? contactsMap;
  ContactSearchResultsDisplayedState({this.contactsMap});

  @override
  List<Object> get props => [contactsMap ?? {}];
}

class ContactDetailDisplayedState extends ContactState {
  final Map<String, List<String>>? contactsMap;
  final String? contactName;
  ContactDetailDisplayedState({this.contactName, this.contactsMap});

  @override
  List<Object> get props => [contactName ?? "", contactsMap ?? {}];
}
