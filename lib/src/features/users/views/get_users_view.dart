import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/users_controller.dart';

class GetUsersView extends StatefulWidget {
  const GetUsersView({super.key});

  @override
  State<GetUsersView> createState() => _GetUsersViewState();
}

class _GetUsersViewState extends State<GetUsersView> {
  final controller = Modular.get<UsersController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (context, index) => Card(
            elevation: 6,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Text('${controller.users[index].id}'),
              title: Text(
                  '${controller.users[index].firstName} ${controller.users[index].lastName}'),
              subtitle: Text('${controller.users[index].email}'),
              trailing: const Icon(Icons.clear),
            ),
          ),
        ),
      ),
    );
  }
}
