import 'dart:convert';
import 'dart:io';

import 'package:flutter_learning/models/bottomsheet_image_entity.dart';
import 'package:http/http.dart' as http;

class BottomImageRepository {
  Future<BottomSheetEntity> getNetworkImage() async {
    try {
      var id = '';
      var endpointUrl = Uri.parse('https://dummyjson.com/products/$id');
      final response = await http.get(endpointUrl);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        BottomSheetEntity productList = BottomSheetEntity.fromJson(jsonData);

        // print("Total products: ${productList.products.length}");
        // print("First product title: ${productList.products[0].thumbnail}");
        // print("Total items in the list: ${productList.total}");

        return productList;
      } else {
        throw Exception("API ERROR");
      }
    } on SocketException {
      throw Exception("No Internet Connection :(");
    } on HttpException {
      throw Exception("unable to access the Images :(");
    } on FormatException {
      throw Exception("Format Error :(");
    } catch (e) {
      throw Exception("Unknown Error $e");
    }
  }
}
