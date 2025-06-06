import 'package:ecommerceappui/models/products.dart';
import 'package:ecommerceappui/pages/product_detail.dart';
import 'package:ecommerceappui/services/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyListTile extends StatelessWidget {
  final Products product;
  const MyListTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                height: 80,
                width: 80,
                fit: BoxFit.cover,
                product.imgUrl,
              ),
            ),
            SizedBox(height: 6),
            Text(product.title),
            SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: 50, child: Text("\$${product.price}")),
                GestureDetector(
                  onTap: () {
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
