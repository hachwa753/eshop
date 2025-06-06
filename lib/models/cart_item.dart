class CartItem {
  final String id;
  final String productId;
  final String name;
  final String imgUrl;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.imgUrl,
    required this.price,
    this.quantity = 1,
  });
}
