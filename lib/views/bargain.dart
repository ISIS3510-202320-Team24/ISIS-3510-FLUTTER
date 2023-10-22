import 'package:flutter/material.dart';
import 'package:unishop/models/product.dart';
import 'package:unishop/repositories/posts_repository.dart';
import 'package:unishop/widgets/floating_button.dart';
import 'package:unishop/widgets/footer.dart';
import 'package:unishop/widgets/header.dart';
import 'package:unishop/widgets/product_catalog.dart';

class BargainView extends StatefulWidget {
  @override
  State<BargainView> createState() => _BargainViewState();
}

class _BargainViewState extends State<BargainView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            toolbarHeight: 120,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Header(currentIndex: 3),
          ),
          floatingActionButton: FloatingButton(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<List<Product>>(
              future: fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return Text('No se encontraron datos');
                } else {
                  final products = snapshot.data!;
                  return ProductCatalog(products: products);
                }
              },
            ),
          ),
          bottomNavigationBar: Footer(currentIndex: 0),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked),
    );
  }

  Future<List<Product>> fetchProducts() async {
    return PostsRepository.getBargains();
  }
}