import 'package:ecommerceappui/cart_page.dart';
import 'package:ecommerceappui/wigets/my_list_tile.dart';
import 'package:ecommerceappui/models/products.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List productList = [
    Products(
      productId: "1",
      title: "Pizza",
      imgUrl:
          "https://m.media-amazon.com/images/I/71RnyO1k6+L._AC_SY300_SX300_.jpg",
      price: 40,
      catName: "pizza",
    ),
    Products(
      productId: "2",
      title: "Burger",
      imgUrl:
          "https://m.media-amazon.com/images/I/71RnyO1k6+L._AC_SY300_SX300_.jpg",
      price: 40,
      catName: "burger",
    ),
    Products(
      productId: "3",
      title: "Momo",
      imgUrl:
          "https://m.media-amazon.com/images/I/71RnyO1k6+L._AC_SY300_SX300_.jpg",
      price: 40,
      catName: "momo",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop App"),
        actions: [
          IconButton(
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                ),
            icon: Icon(Icons.shopping_bag),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Latest Post"),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  final product = productList[index];
                  return MyListTile(product: product);
                },
              ),
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
