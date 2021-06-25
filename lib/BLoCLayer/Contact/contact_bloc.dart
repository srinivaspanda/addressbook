import 'dart:async';

import 'package:address_book/DataLayer/contacts.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitialState());

  final _contacts = Contacts();

  @override
  Stream<ContactState> mapEventToState(
    ContactEvent event,
  ) async* {
    if (event is ContactInitialLoadEvent) {
      // yield loading state till the results are out
      yield ContactLoadingState();

      // Call the data layer to get the map of all contacts
      var mapOfAllContacts = _contacts.getMapOfContacts();

      // Yield the map of all contacts
      yield ContactLoadedState(contactsMap: mapOfAllContacts);
    } else if (event is ContactSearchEvent) {
      // yield loading state till the results are out
      yield ContactLoadingState();

      // Get the Search Text
      final searchText = event.searchText;

      // Logic to fetch the search result from the search text goes here
      final searchResult = getSearchResultFromSearchText(searchText);

      // Yields the search result
      yield ContactSearchResultsDisplayedState(contactsMap: searchResult);
    } else if (event is ContactSelectedEvent) {
      // Call the data layer to get the map of all contacts
      var mapOfAllContacts = _contacts.getMapOfContacts();

      // yield loading state till the results are out
      yield ContactDetailDisplayedState(
          contactName: event.contactName, contactsMap: mapOfAllContacts);

      // // Then yield the loaded state
      // // Yield the map of all contacts
      // yield ContactLoadedState(contactsMap: mapOfAllContacts);
    }
  }

  // Private Utility method for business logic
  Map<String, List<String>> getSearchResultFromSearchText(String? searchText) {
    // get the list of all contacts from data layer
    final allResultList = _contacts.getAllContacts();

    // filter the result of list from the search query string
    final filteredResult = allResultList
        .where((element) =>
            element.toLowerCase().contains((searchText ?? '').toLowerCase()))
        .toList();

    // return the result
    return _contacts.getMapOfContacts(filteredList: filteredResult);
  }
}
