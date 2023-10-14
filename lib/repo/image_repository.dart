import 'dart:convert';
import 'package:flutter_learning/models/image_model.dart';
import 'package:http/http.dart' as http;

class ImageRepository {
  Future<List<ImageModel>> getNetworkImage() async {
    var endpointUrl = Uri.parse('https://jsonplaceholder.typicode.com/photos');
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
  }
}
