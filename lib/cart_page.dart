import 'package:ecommerceappui/services/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.getCartItem.values.toList();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              cartProvider.clearCart();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("clear cart")));
            },
            icon: Icon(Icons.clear),
          ),
          Text(cartProvider.totalAmount.toString()),
          SizedBox(width: 10),
          Text(cartProvider.itemCount.toString()),
        ],
      ),
      body:
          cartProvider.itemCount == 0
              ? Center(child: Text("empty cart"))
              : Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];

                      return ListTile(
                        leading: Image.network(item.imgUrl),
                        title: Text(item.name),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  cartProvider.decreaseQunatity(item.productId);
                                },
                                icon: Icon(Icons.remove),
                              ),
                              Text(item.quantity.toString()),

                              IconButton(
                                onPressed: () {
                                  cartProvider.increasQunatity(item.productId);
                                },
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
    );
  }
}
