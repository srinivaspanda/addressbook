import 'package:address_book/BLoCLayer/Contact/contact_bloc.dart';
import 'package:address_book/DataLayer/contacts.dart';
import 'package:address_book/UILayer/contact_name_cell.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';

class GroupView extends StatelessWidget {
  final Map<String, List<String>>? contactData;
  final Widget? header;
  final Widget? footer;
  const GroupView({Key? key, this.contactData, this.header, this.footer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Contact Data: $contactData');
    return Column(
      children: [
        this.header ?? new Container(width: 0, height: 0),
        Expanded(
          child: CustomScrollView(
            slivers: getSlivers(context),
          ),
        ),
        this.footer ?? new Container(width: 0, height: 0),
      ],
    );
  }

  // void onContactSelected(BuildContext context, String contactName) {
    
    
  
  // }

  List<Widget> getSlivers(BuildContext context) {
    // get the list of initials
    var initials = contactData?.keys.toList();
    initials?.sort();

    // blank slivers list
    List<Widget> slivers = [];

    // loop through the initials
    initials?.forEach((initial) {
      // Create and add the Sliver Header to display initial of contact names
      slivers.add(sliverHeader(initial));

      // Get the list of names for a given initial
      final names = contactData?[initial] ?? [];

      // Create and add Sliver List to display all names for the initial
      slivers.add(SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return ContactNameCell(
            names[index],
          );
        }, childCount: names.length),
      ));
    });

    // return the result
    return slivers;
  }
}

SliverPersistentHeader sliverHeader(String headerText) {
  return SliverPersistentHeader(
    pinned: true,
    delegate: _SliverAppBarDelegate(
      minHeight: 30.0,
      maxHeight: 60.0,
      child: Container(
        child: Text(
          headerText,
          style: TextStyle(fontSize: 20),
        ),
        decoration: BoxDecoration(
            color: Colors.lightBlue[100],
            border: Border(top: BorderSide(color: Colors.grey, width: 1.0))),
      ),
    ),
  );
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
