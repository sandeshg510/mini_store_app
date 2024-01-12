import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_store/api_constants/api_constants.dart';
import 'package:mini_store/models/products_model.dart';

import '../models/new_products_model.dart';

class APIHandler {
  static Future<List<NewProductsModel>> getAllProducts() async {
//[GET] https://api.escuelajs.co/api/v1/products
    // new :    https://fakestoreapi.com/products/

    var uri = Uri.https(baseUrl, 'products/');

    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/'));

    var data = jsonDecode(response.body);

    List tempList = [];
    for (var v in data) {
      tempList.add(v);
    }

    return NewProductsModel.productsFromSnapshot(tempList);
  }
}
