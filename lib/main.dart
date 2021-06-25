import 'dart:io';

import 'package:address_book/BLoCLayer/Contact/contact_bloc.dart';
import 'package:address_book/UILayer/contact_detail.dart';
import 'package:address_book/UILayer/group_view.dart';
import 'package:address_book/UILayer/loading_screen.dart';
import 'package:address_book/UILayer/search_bar.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BLoCLayer/wrapper_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = WrapperBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ContactBloc>(
          create: (BuildContext context) => ContactBloc(),
        )
      ],
      child: AddressBookApp(),
    ),
  );
}

class AddressBookApp extends StatefulWidget {
  @override
  _AddressBookAppState createState() => _AddressBookAppState();
}

class _AddressBookAppState extends State<AddressBookApp> {
  GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            key: _scaffoldMessengerKey,
            appBar: AppBar(
              title: Text("Address Book"),
            ),
            body: BlocConsumer<ContactBloc, ContactState>(
              builder: (context, state) {
                if (state is ContactLoadingState) {
                  // Show loading screen in intermitent state
                  return LoadingScreen();
                } else if (state is ContactInitialState) {
                  // Fire the initial event
                  BlocProvider.of<ContactBloc>(context)
                      .add(ContactInitialLoadEvent());

                  // Retunr Loading screen till the new state comes back
                  return LoadingScreen();
                } else if (state is ContactLoadedState) {
                  // Return the GroupView with the sate data
                  return renderGroupView(state.contactsMap);
                } else if (state is ContactSearchResultsDisplayedState) {
                  // Return the GroupView with the new sate data
                  return renderGroupView(state.contactsMap);
                } else if (state is ContactDetailDisplayedState) {
                  // Return the GroupView with the new sate data
                  return renderGroupView(state.contactsMap);
                } else {
                  // TODO: Handle this edge case. Need to remove the loading screen and replace iwth some unhandled screen
                  return LoadingScreen();
                }
              },
              listener: (context, state) {
                if (state is ContactDetailDisplayedState) {
                  SchedulerBinding.instance?.addPostFrameCallback((_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactDetail(
                                contactName: state.contactName,
                              )),
                    );
                  });
                }
              },
            )));
  }

  Widget renderGroupView(Map<String, List<String>>? data) {
    return GroupView(
      contactData: data,
      header: SearchBar(),
      footer: Container(
        height: 50,
        color: Colors.blue[50],
        child: Center(child: Text("Footer of GroupView")),
      ),
    );
  }
}
