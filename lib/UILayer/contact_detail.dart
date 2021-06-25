import 'package:flutter/material.dart';

class ContactDetail extends StatelessWidget {
  final String? contactName;
  const ContactDetail({Key? key, this.contactName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Detail"),
      ),
      body: Center(
        child: Container(child: Text(contactName ?? "")),
      ),
    );
  }
}
