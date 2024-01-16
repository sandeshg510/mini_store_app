import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:mini_store/api_constants/api_constants.dart';
import 'package:mini_store/models/users_model.dart';
import '../models/categories_model.dart';
import '../models/new_products_model.dart';

class APIHandler {
  static Future<NewProductsModel> getProductbyId({required String Id}) async {
    try {
      var uri = Uri.https(
        baseUrl2,
        'products/$Id',
      );
      var response = await http.get(uri);
      var data = jsonDecode(response.body);
      return NewProductsModel.fromJson(data);
    } catch (error) {
      log('An error occured while getting product details $error');
      throw error.toString();
    }
  }

  static Future<List<dynamic>> getData(
      {required String url, required String target, String? limit}) async {
    try {
      var uri = Uri.https(url, target,
          target == 'products' ? {'offset': '0', 'limit': limit} : {});
      var response = await http.get(uri);
      var data = jsonDecode(response.body);
      List tempList = [];
      if (response.statusCode != 200) {
        throw data['message'];
      }
      for (var v in data) {
        tempList.add(v);
      }
      return tempList;
    } catch (error) {
      log('An error occured $error');
      throw error.toString();
    }
  }

  static Future<List<NewProductsModel>> getAllProducts(
      {required String limit}) async {
    List temp = await getData(url: baseUrl2, target: 'products', limit: limit);
    return NewProductsModel.productsFromSnapshot(temp);
  }

  static Future<List<UsersModel>> getAllUsers() async {
    List temp = await getData(url: baseUrl, target: 'api/v1/users');
    return UsersModel.usersFromSnapshot(temp);
  }

  static Future<List<CategoriesModel>> getAllcategories() async {
    List temp = await getData(url: baseUrl, target: 'api/v1/categories');
    return CategoriesModel.categoriesFromSnapshot(temp);
  }

//        Products with 3 images but the API's changed unfortunately
//
// static Future<List<ProductsModel>> getAllProducts() async {
//   List temp = await getData(url: baseUrl, target: 'api/v1/products/');
//   return ProductsModel.productsFromSnapshot(temp);
// }
}
