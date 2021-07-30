import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shop/widgets/product_form.dart';

import './edit_product_screen.dart';
import '../widgets/main_drawer.dart';
import '../widgets/user_product_item.dart';
import '../providers/products.dart';
import '../providers/product.dart';

class UserProducts extends StatelessWidget {
  static const routerName = '/user-products';

  void _openForm(ctx, {Product selectedProduct}) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return Wrap(
          children: [
            ProductForm(selectedProduct: selectedProduct),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Product'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(EditProductScreen.routerName),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (_, i) => Column(
            children: [
              UserProductItem(
                productsData.items[i].id,
                productsData.items[i].title,
                productsData.items[i].imageUrl,
                () => productsData.removeSingleItem(productsData.items[i].id),
                () =>
                    _openForm(context, selectedProduct: productsData.items[i]),
              ),
              Divider(),
            ],
          ),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
