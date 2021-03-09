import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop_app/providers/cart.dart';
import 'package:my_shop_app/screens/cart-screen.dart';
import 'package:my_shop_app/widgets/badge.dart';
import 'package:my_shop_app/widgets/product_grid.dart';
import 'package:provider/provider.dart';

enum FilterOption { Favorite, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOption selectedValue) {
              setState(() {
                if (selectedValue == FilterOption.Favorite) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorite'),
                value: FilterOption.Favorite,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOption.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: ( _, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child:
                IconButton(icon: Icon(Icons.shopping_cart), 
                    onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                    }),
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
