import 'dart:convert';
import 'dart:io';

import 'package:flutter_learning/models/image_model.dart';
import 'package:http/http.dart' as http;

class ImageRepository {
  Future<List<ImageModel>> getNetworkImage() async {
    try {
      var endpointUrl =
          Uri.parse('https://jsonplaceholder.typicode.com/photos');
      final response = await http.get(endpointUrl);

      if (response.statusCode == 200) {
        final List<dynamic> decodeMessage = jsonDecode(response.body) as List;
        // final Map<String, dynamic> decodeMessage = jsonDecode(response.body);

        final List<ImageModel> images = decodeMessage.map((listItem) {
          return ImageModel.fromJson(listItem);
        }).toList();
        return images;
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
      throw Exception("Unknown Error");
    }
  }
}
