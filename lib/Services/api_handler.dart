import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_store/api_constants/api_constants.dart';
import 'package:mini_store/models/products_model.dart';

class APIHandler {
  static Future<List<ProductsModel>> getAllProducts() async {
//[GET] https://api.escuelajs.co/api/v1/products

    var uri = Uri.https(baseUrl, 'api/v1/products');

    var response = await http.get(uri);

    var data = jsonDecode(response.body);

    List tempList = [];
    for (var v in data) {
      tempList.add(v);
    }

    return ProductsModel.productsFromSnapshot(tempList);
  }
}
