import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mini_store/Services/api_handler.dart';
import 'package:mini_store/models/new_products_model.dart';
import '../consts/global_colors.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.id});

  final String id;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  TextStyle titleStyle =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

  TextStyle midTitleStyle =
      const TextStyle(fontWeight: FontWeight.w500, fontSize: 18);

  NewProductsModel? newProductsModel;
  bool isError = false;
  String errorMsg = '';
  Future<void> getProductDetails() async {
    try {
      newProductsModel = await APIHandler.getProductbyId(Id: widget.id);
    } catch (error) {
      isError = true;
      errorMsg = error.toString();
      log('error : $error');
    }
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    getProductDetails();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: isError
            ? Center(
                child: Text(
                  'An error occured $errorMsg',
                  style: titleStyle,
                ),
              )
            : newProductsModel == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: lightIconsColor,
                    ),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BackButton(),
                          Text(
                            newProductsModel!.category.toString(),
                            style: midTitleStyle,
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Text(
                                    newProductsModel!.title.toString(),
                                    style: titleStyle,
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: RichText(
                                    text: TextSpan(
                                        text: '\$',
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.blue),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: newProductsModel!.price,
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: lightTextColor,
                                                  fontWeight: FontWeight.w600))
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.009,
                          ),
                          SizedBox(
                            height: size.height * 0.4,
                            width: double.infinity,
                            child: Swiper(
                              itemCount: 3,
                              itemBuilder: (ctx, index) {
                                return Image.network(
                                    newProductsModel!.image.toString(),
                                    width: double.infinity,
                                    fit: BoxFit.contain);
                              },
                              autoplay: false,
                              pagination: const SwiperPagination(
                                  alignment: Alignment.bottomCenter,
                                  builder: DotSwiperPaginationBuilder(
                                      color: Colors.orangeAccent,
                                      activeColor: Colors.deepOrange)),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Description',
                                  style: titleStyle,
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    newProductsModel!.description.toString(),
                                    style: const TextStyle(fontSize: 25),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
