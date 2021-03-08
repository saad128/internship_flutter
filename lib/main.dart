import 'package:flutter/material.dart';
import 'package:my_shop_app/providers/products_provider.dart';
import 'package:my_shop_app/screens/product_detail_screen.dart';
import 'package:my_shop_app/screens/product_overview_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),

        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName : (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}



