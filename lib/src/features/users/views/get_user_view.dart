import 'package:flutter/material.dart';

class GetUserView extends StatelessWidget {
  final String user;
  const GetUserView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Card(
          elevation: 5,
          child: ListTile(
            leading: Icon(Icons.icecream),
            title: Text('I like icecream'),
            subtitle: Text('Icream is good for health'),
            trailing: Icon(Icons.food_bank),
          ),
        ),
      ),
    );
  }
}
