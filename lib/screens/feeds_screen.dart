import 'dart:developer';
import 'package:flutter/material.dart';
import '../Services/api_handler.dart';
import '../consts/global_colors.dart';
import '../models/new_products_model.dart';
import '../widgets/feeds_widget.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  List<NewProductsModel> productList = [];
  final ScrollController _scrollController = ScrollController();
  int limit = 10;
  bool _isLimit = false;

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {});
        limit += 5;
        log('limit $limit');

        await getProducts();
      }
      if (limit == 10) {
        _isLimit = true;
        setState(() {});
        return;
      }
      if (limit >= 20) {
        _isLimit = false;
        setState(() {});
        return;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> getProducts() async {
    productList = await APIHandler.getAllProducts(limit: limit.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All products'),
      ),
      body: productList.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: lightIconsColor,
              ),
            )
          : SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  GridView.builder(
                      itemCount: productList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                      }),
                  if (_isLimit)
                    Center(
                      child: CircularProgressIndicator(
                        color: lightIconsColor,
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}
