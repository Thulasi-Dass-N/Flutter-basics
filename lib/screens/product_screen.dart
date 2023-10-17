import 'package:flutter/material.dart';
import 'package:flutter_learning/models/bottomsheet_image_entity.dart';
import 'package:flutter_learning/repo/bottomsheet_image_repo.dart';
import 'package:flutter_learning/repo/image_repository.dart';

class ProductScreen extends StatefulWidget {
  // final Function(String) onSelectedImage;

  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ImageRepository imageRepo = ImageRepository();

  final BottomImageRepository bottomRepo = BottomImageRepository();

  @override
  void initState() {
    bottomRepo.getNetworkImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Product Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20), right: Radius.circular(20))),
        child: FutureBuilder<BottomSheetEntity>(
            future: bottomRepo.getNetworkImage(),
            builder: (BuildContext context,
                AsyncSnapshot<BottomSheetEntity> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              decoration: const BoxDecoration(),
                              child: Text(
                                'Name : ${snapshot.data!.products[index].title}',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none),
                              ),
                            ),
                            Image.network(
                                snapshot.data!.products[index].thumbnail),
                          ],
                        ),
                      );
                    });
                // return Image.network(snapshot.data![0].thumbnail);
              } else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text('This is the error : ${snapshot.error}'),
                );
              }
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }),
      ),
    );
  }
}
