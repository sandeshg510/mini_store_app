import 'package:flutter/material.dart';
import 'package:mini_store/models/new_products_model.dart';
import 'feeds_widget.dart';

class FeedsGridWidget extends StatelessWidget {
  const FeedsGridWidget({super.key, required this.productList});
  final List<NewProductsModel> productList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            crossAxisCount: 2,
            childAspectRatio: 0.6),
        itemBuilder: (ctx, index) {
          return FeedWidget(
            title: productList[index].title.toString(),
            imageUrl: productList[index].image!,
            price: productList[index].price.toString(),
            Id: productList[index].id.toString(),
          );
        });
  }
}
