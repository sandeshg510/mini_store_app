import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../consts/global_colors.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});

  TextStyle titleStyle =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  TextStyle midTitleStyle =
      const TextStyle(fontWeight: FontWeight.w500, fontSize: 18);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(),
                Text(
                  'Category',
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
                          'Loren Ipsum',
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
                                    text: '168.00',
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
                      return Image.network('https://i.ibb.co/vwB46Yq/shoes.png',
                          width: double.infinity, fit: BoxFit.contain);
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
                      const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Text(
                          'ndcnns bcdjkcn ask sjnsx jcnjxs cjncj xjsn bcdjkcn ask sjnsx jcnjxs cjncj xjsn sjsx kisi jsnd Sansedn snk ehwieis sjuuetbcdjkcn ask sjnsx jcnjxs cjncj xjsn sjsx kisi jsnd Sansedn snk ehwieis sjuuetbcdjkcn ask sjnsx jcnjxs cjncj xjsn sjsx kisi jsnd Sansedn snk ehwieis sjuuetsjsx kisi jsnd Sansedn snk ehwieis sjuuet!',
                          style: TextStyle(fontSize: 25),
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
