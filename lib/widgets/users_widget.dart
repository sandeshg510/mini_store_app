import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mini_store/consts/global_colors.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: FancyShimmerImage(
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        imageUrl: 'https://placeimg.com/640/480/any ',
        width: size.width * 0.15,
        boxFit: BoxFit.fill,
        height: size.height * 0.15,
      ),
      title: Text('user Name'),
      subtitle: Text('useremail@mail.com'),
      trailing: Text(
        'user Role',
        style: TextStyle(
          color: lightIconsColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
