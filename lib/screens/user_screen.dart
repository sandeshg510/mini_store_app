import 'package:flutter/material.dart';
import 'package:mini_store/models/users_model.dart';
import 'package:mini_store/widgets/users_widget.dart';
import 'package:provider/provider.dart';

import '../Services/api_handler.dart';
import '../consts/global_colors.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: SafeArea(
        child: FutureBuilder<List<UsersModel>>(
            future: APIHandler.getAllUsers(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.only(top: 90.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: lightIconsColor,
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('An error occured : ${snapshot.error}'));
              } else if (snapshot.data == null) {
                return const Center(
                    child: Text('No products has been added yet!'));
              }

              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (ctx, index) {
                    return ChangeNotifierProvider.value(
                        value: snapshot.data![index],
                        child: const UsersWidget());
                  });
            })),
      ),
    );
  }
}
