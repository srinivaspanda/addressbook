import 'package:address_book/BLoCLayer/Contact/contact_bloc.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => new _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController? searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    searchTextController?.addListener(onSearchTextChanged);
    super.initState();
  }

  void onSearchTextChanged() {
    final searchText = searchTextController?.text;
    print("Search text : $searchText");
    BlocProvider.of<ContactBloc>(context)
        .add(ContactSearchEvent(searchText: searchText));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      height: 60,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimSearchBar(
            width: MediaQuery.of(context).size.width,
            rtl: true,
            textController: searchTextController!,
            onSuffixTap: () {
              print("Search Tapped");
              setState(() {
                searchTextController!.clear();
              });
            }),
      ),
    );
  }
}
