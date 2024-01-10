import 'package:flutter/material.dart';
import 'package:mini_store/widgets/users_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('All Users')),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return const UsersWidget();
          },
          itemCount: 10,
        ));
  }
}
