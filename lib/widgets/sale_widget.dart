import 'package:flutter/material.dart';

class SaleWidget extends StatelessWidget {
  const SaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
            colors: [Color(0xff7a60a5), Color(0xff82c3df)],
            begin: FractionalOffset(0.0, 0),
            end: FractionalOffset(1, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xff9689ce),
                    borderRadius: BorderRadius.circular(18)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Get the special discount',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Flexible(
                        child: SizedBox(
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              '50 %\nOFF',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Image.network('https://i.ibb.co/vwB46Yq/shoes.png',
                  width: double.infinity, fit: BoxFit.contain),
            ),
          )
        ],
      ),
    );
  }
}
