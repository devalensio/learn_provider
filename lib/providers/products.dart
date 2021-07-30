import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
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
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Denim',
      description: 'New denim',
      price: 35.00,
      imageUrl:
          'https://www.pngkit.com/png/detail/89-896796_denim-jacket-free-png-image-denim-jacket-png.png',
    ),
    Product(
      id: 'p6',
      title: 'Folding Bike',
      description: 'New Folding Bike',
      price: 70.99,
      imageUrl:
          'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//94/MTA-10714359/pacific_sepeda_lipat_folding_bike_16_pacific_bike_dart_3-0_not_fnhon_10_speed_full01_mieksmrl.jpg',
    ),
    Product(
      id: 'p7',
      title: 'PC Gaming',
      description: 'New PC Gaming with powerfull gaming environment',
      price: 102.55,
      imageUrl:
          'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//94/MTA-5429245/amd_pc_gaming_ryzen_3_3200g_ssd_120gb_hdd_500gb_led_20in_lengkap_full01_nta76px5.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Poodle Dog',
      description: 'Playfull poodle dog',
      price: 30.00,
      imageUrl:
          'https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2020/10/14113105/Poodle-puppy-sitting-on-the-bed-in-the-morning-500x486.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void removeSingleItem(String id) {
    final isProductFound = _items.singleWhere((prod) => prod.id == id);

    if (isProductFound != null) {
      _items.removeWhere((prod) => prod.id == id);
    }

    notifyListeners();
  }

  void addProduct(Product addedProduct) {
    _items.add(addedProduct);

    notifyListeners();
  }

  void editProduct(String id, Product editedProduct) {
    final index = _items.indexWhere((prod) => prod.id == id);

    if (index >= 0) {
      _items[index] = editedProduct;
    }

    notifyListeners();
  }
}
