import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mini_store/consts/global_colors.dart';
import 'package:mini_store/screens/product_details.dart';

class FeedWidget extends StatelessWidget {
  const FeedWidget(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.price});
  final String title, imageUrl, price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductDetails()));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5, top: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                        text: '\$',
                        style: const TextStyle(color: Colors.blue),
                        children: <TextSpan>[
                          TextSpan(
                              text: price,
                              style: TextStyle(
                                  color: lightTextColor,
                                  fontWeight: FontWeight.w600))
                        ]),
                  ),
                ),
                const Icon(IconlyBold.heart)
              ]),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  errorWidget: const Icon(
                    IconlyBold.danger,
                    color: Colors.red,
                    size: 28,
                  ),
                  imageUrl: imageUrl,
                  width: double.infinity,
                  boxFit: BoxFit.fill,
                  height: size.height * 0.2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
