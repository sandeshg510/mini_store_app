import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mini_store/Services/api_handler.dart';
import 'package:mini_store/consts/global_colors.dart';
import 'package:mini_store/models/new_products_model.dart';
import 'package:mini_store/screens/categories_screen.dart';
import 'package:mini_store/screens/feeds_screen.dart';
import 'package:mini_store/screens/user_screen.dart';
import 'package:mini_store/widgets/feeds_grid.dart';
import 'package:mini_store/widgets/sale_widget.dart';
import 'package:page_transition/page_transition.dart';
import '../widgets/appbar_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  // List<ProductsModel> productList = [];
  // List<NewProductsModel> productList = [];

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   getProducts();
  //   super.didChangeDependencies();
  // }
  //
  // Future<void> getProducts() async {
  //   productList = await APIHandler.getAllProducts();
  //
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppBarIcons(
              function: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const CategoriesScreen(),
                        type: PageTransitionType.fade));
              },
              icon: IconlyBold.category,
            ),
          ),
          title: const Text('Home'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppBarIcons(
                function: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const UserScreen(),
                          type: PageTransitionType.fade));
                },
                icon: IconlyBold.user3,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              TextField(
                controller: _textEditingController,
                // keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Search',
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).colorScheme.secondary)),
                    suffixIcon: Icon(
                      IconlyLight.search,
                      color: lightIconsColor,
                    )),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      SizedBox(
                        height: size.height * 0.25,
                        width: double.infinity,
                        child: Swiper(
                          itemCount: 3,
                          itemBuilder: (ctx, index) {
                            return const SaleWidget();
                          },
                          autoplay: false,
                          pagination: const SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                  color: Colors.white,
                                  activeColor: Colors.deepPurple)),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 15, top: 15, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Latest Products',
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700),
                                ),
                                AppBarIcons(
                                    function: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: const FeedsScreen(),
                                              type: PageTransitionType.fade));
                                    },
                                    icon: IconlyBold.arrowRightCircle)
                              ],
                            ),
                          ),
                        ),
                      ),
                      FutureBuilder<List<NewProductsModel>>(
                          future: APIHandler.getAllProducts(),
                          builder: ((context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 90.0),
                                child: CircularProgressIndicator(
                                  color: lightIconsColor,
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text(
                                      'An error occured : ${snapshot.error}'));
                            } else if (snapshot.data == null) {
                              return const Center(
                                  child:
                                      Text('No products has been added yet!'));
                            }
                            return FeedsGridWidget(productList: snapshot.data!);
                          }))
                      // productList.isEmpty
                      //     ? Padding(
                      //         padding: const EdgeInsets.only(top: 90.0),
                      //         child: CircularProgressIndicator(
                      //           color: lightIconsColor,
                      //         ),
                      //       )
                      //     : FeedsGridWidget(
                      //         productList: productList,
                      //       ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
