import 'package:ecommerceappui/models/products.dart';
import 'package:ecommerceappui/services/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  final Products product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              fit: BoxFit.fill,
              width: double.infinity,
              height: 300,
              product.imgUrl,
            ),
            SizedBox(height: 15),

            Text(product.title, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),

      bottomSheet: Container(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Row(children: [Text("Price: "), Text(product.price.toString())]),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final cartProvider = Provider.of<CartProvider>(
                          context,
                          listen: false,
                        );
                        cartProvider.addCartItem(
                          productId: product.productId,
                          name: product.title,
                          imgUrl: product.imgUrl,
                          price: product.price,
                        );
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text("success")));
                      },
                      child: Text("Add to Cart"),
                    ),
                  ),
                  SizedBox(width: 12),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
