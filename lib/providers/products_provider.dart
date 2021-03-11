import 'package:flutter/cupertino.dart';
import 'package:my_shop_app/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'RedShirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
      'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
        id: 'p2',
        title: 'Trousers',
        description: 'A nice pair of trousers.',
        price: 59.99,
        imageUrl: 'https://5.imimg.com/data5/DS/MN/MY-14409136/mens-sports-trouser-500x500.jpg'),
    Product(
        id: 'p3',
        title: 'FryingPan',
        description: 'A nice Frying Pan.',
        price: 19.99,
        imageUrl: 'https://target.scene7.com/is/image/Target/GUEST_458a8723-a558-4c34-8bdb-513a05c87b6a?wid=488&hei=488&fmt=pjpeg'),
    Product(
        id: 'p4',
        title: 'BlackScarf',
        description: 'A nice Scarf.',
        price: 19.99,
        imageUrl: 'https://5.imimg.com/data5/YF/MO/MY-41009203/fancy-ladies-scarf-500x500.jpg'),
  ];

  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if(_showFavoritesOnly){
    //   return _items.where((element) => element.isFavorite).toList();
    // }
    return [..._items];
  }
  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  // void showFavoritesOnly(){
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }
  // void showAll(){
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  Product findbyId(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void addProduct(Product product) {
    final newProduct = Product(
      id: DateTime.now().toString(),
      title: product.title,
      price: product.price,
      description: product.description,
      imageUrl: product.imageUrl,
    );
    _items.add(newProduct);
    notifyListeners();
  }
  void updateProduct(String id, Product newProduct){
    final prodIndex = _items.indexWhere((element) => element.id == id);
    if(prodIndex >= 0){
      _items[prodIndex] = newProduct;
      notifyListeners();
    }else{
        print('...');
    }
  }
  void deleteProduct(String id){
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}