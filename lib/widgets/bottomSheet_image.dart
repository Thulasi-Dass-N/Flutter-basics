import 'package:flutter/material.dart';
import 'package:flutter_learning/models/image_model.dart';
import 'package:flutter_learning/repo/image_repository.dart';

class NetworkImagePicker extends StatelessWidget {
  final Function(String) onSelectedImage;
  NetworkImagePicker({super.key, required this.onSelectedImage});

  final ImageRepository imageRepo = ImageRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ImageModel>>(
        future: imageRepo.getNetworkImage(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ImageModel>> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    maxCrossAxisExtent:
                        MediaQuery.of(context).size.width * 0.5),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        onSelectedImage((snapshot.data![index].thumbnail));
                      },
                      child: Image.network(snapshot.data![index].thumbnail));
                });
            // return Image.network(snapshot.data![0].thumbnail);
          }
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
