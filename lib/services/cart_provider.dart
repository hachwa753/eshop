import 'package:ecommerceappui/models/cart_item.dart';
import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _cartItems = {};
  Map<String, CartItem> get getCartItem => {..._cartItems};

  int get itemCount => _cartItems.length;

  double get totalAmount {
    return _cartItems.values.fold(
      0.0,
      (previousValue, element) =>
          previousValue + (element.price * element.quantity),
    );
  }

  void addCartItem({
    required String productId,
    required String name,
    required String imgUrl,
    required double price,
  }) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (value) => CartItem(
          id: value.id,
          productId: value.productId,
          name: value.name,
          imgUrl: value.imgUrl,
          price: value.price,
          quantity: value.quantity + 1,
        ),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          productId: productId,
          name: name,
          imgUrl: imgUrl,
          price: price,
        ),
      );
    }
  }

  void increasQunatity(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (value) => CartItem(
          id: value.id,
          productId: value.productId,
          name: value.name,
          imgUrl: value.imgUrl,
          price: value.price,
          quantity: value.quantity + 1,
        ),
      );
      notifyListeners();
    }
  }

  void decreaseQunatity(String productId) {
    if (!_cartItems.containsKey(productId)) return;

    final currentItem = _cartItems[productId]!;

    if (currentItem.quantity > 1) {
      _cartItems.update(
        productId,
        (value) => CartItem(
          id: value.id,
          productId: value.productId,
          name: value.name,
          imgUrl: value.imgUrl,
          price: value.price,
          quantity: value.quantity - 1,
        ),
      );
    } else {
      _cartItems.remove(productId);
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
