import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/pages/cart_pages.dart';
import 'package:shopping_cart_app/providers/cart_provider.dart';
import 'package:shopping_cart_app/providers/product_provider.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductProvider>().product;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        actions: [
          Consumer<CartProvider>(
            builder: (_, cart, _) {
              return Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                  if (cart.itemCount > 0)
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        cart.itemCount.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, i) {
          return ListTile(
            title: Text(products[i].name),
            subtitle: Text('RS ${products[i].price}'),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                context.read<CartProvider>().AddToCart(products[i]);
              },
            ),
          );
        },
      ),
    );
  }
}
