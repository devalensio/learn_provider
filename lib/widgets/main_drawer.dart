import 'package:flutter/material.dart';

import '../screens/orders_screen.dart';
import '../screens/user_products.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              title: Text('Shopuu'),
              automaticallyImplyLeading: false,
            ),
            Divider(),
            ListTile(
              onTap: () => Navigator.of(context).pushReplacementNamed('/'),
              leading: Icon(Icons.shop),
              title: Text(
                'Shop',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            ListTile(
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routerName),
              leading: Icon(Icons.payment),
              title: Text(
                'Order',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            ListTile(
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(UserProducts.routerName),
              leading: Icon(Icons.edit),
              title: Text(
                'Manage Products',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
