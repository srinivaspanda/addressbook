class Contacts {
  /// Fetch all contacts from data base. Hard coded for now.
  /// If we have a very large data then we may need to implement some kind of pagination to fetch from database.
  List<String> getAllContacts() {
    final List<String> contacts = [
      'Marco Franco',
      'Raul Alday',
      'Jessica Alba',
      'Roger Waters',
      'Darth Vader',
      'Homer Simpson',
      'Bill Gates',
      'Elon Musk',
      'Enrique Peña',
      'Angeles Rodriguez',
      'Monica Alvarado',
      'Estrella Fugaz',
      'Juana Lopez',
    ];
    // return the list of all contact names
    return contacts;
  }

  /// Get the Map of Initial and corresponding names for that initial.
  Map<String, List<String>> getMapOfContacts({List<String>? filteredList}) {
    // Get all contacts
    final allContacts = filteredList ?? this.getAllContacts();
    // Declare the Map variable to store string as key and list of Strings as values
    var mapContacts = <String, List<String>>{};
    // loop through the list of all contacts and store all initials and list of names in Map
    allContacts.forEach((name) {
      var initial = name.isNotEmpty ? name[0] : '';
      mapContacts[initial] ??= [];
      mapContacts[initial]?.add(name);
    });
    // return the result map
    return mapContacts;
  }

  /// This would give us all available initials from our contact list
  List<String> getAllInitials() {
    // Get the Map of all keys and respective names
    final mapContacts = getMapOfContacts();
    // Extract all keys from the Map
    final allKeys = mapContacts.keys.toList();
    // Sort the list of initials alphabetically
    allKeys.sort();
    // return the result
    return allKeys;
  }

  /// Get the names of any given initial
  List<String>? getNamesForInitial(String initial) {
    // Get the Map of all keys and respective names
    final mapContacts = getMapOfContacts();
    // Return the List of names for given initial
    return mapContacts[initial];
  }
}
