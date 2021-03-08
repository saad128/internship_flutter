import 'package:flutter/material.dart';
import 'package:my_shop_app/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {


  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    // this give us the id
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context, listen: false).findbyId
      (productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
