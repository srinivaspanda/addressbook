import 'package:address_book/BLoCLayer/Contact/contact_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactNameCell extends StatelessWidget {
  final String name;
  // // final VoidCallback? onTapped;
  // final ValueSetter<String>? onTapped;

  ContactNameCell(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('Name in ContactNameCell: $name');
    String initial = name[0];
    return GestureDetector(
      onTap: () {
        // Fire the cell selected event
        BlocProvider.of<ContactBloc>(context)
            .add(ContactSelectedEvent(contactName: name));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.brown.shade800,
                child: Text(initial),
              ),
              SizedBox(
                width: 10,
              ),
              Text(name),
            ],
          ),
          height: 30,
        ),
      ),
    );
  }
}
