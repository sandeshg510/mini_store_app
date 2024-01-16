import 'package:flutter/material.dart';
import 'package:mini_store/models/categories_model.dart';
import 'package:mini_store/widgets/category_widget.dart';
import 'package:provider/provider.dart';
import '../Services/api_handler.dart';
import '../consts/global_colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: SafeArea(
          child: FutureBuilder<List<CategoriesModel>>(
              future: APIHandler.getAllcategories(),
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
                return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                            crossAxisCount: 2,
                            childAspectRatio: 1.2),
                    itemBuilder: (ctx, index) {
                      return ChangeNotifierProvider.value(
                          value: snapshot.data![index],
                          child: const CategoryWidget());
                    });
              }))),
    );
  }
}
