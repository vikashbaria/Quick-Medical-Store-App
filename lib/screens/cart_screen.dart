import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // 🧩 Sample cart data
  List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Sugar free gold',
      'description': 'bottle of 500 pellets',
      'price': 25.0,
      'quantity': 1,
      'imageUrl': 'https://placehold.co/100x100.png',
    },
    {
      'name': 'Sugar free gold',
      'description': 'bottle of 500 pellets',
      'price': 18.0,
      'quantity': 1,
      'imageUrl': 'https://placehold.co/100x100.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double orderTotal = cartItems.fold(
      0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
    double itemDiscount = 28.80;
    double couponDiscount = 15.80;
    double total = orderTotal - itemDiscount - couponDiscount;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black87),
        title: const Text(
          "Your cart",
          style: TextStyle(
            color: Color(0xFF090F47),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        /*actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                "+ Add more",
                style: TextStyle(
                  color: Color(0xFF4157FF),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],*/
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${cartItems.length} Items in your cart",
                  style: const TextStyle(
                    color: Color(0xFF090F47),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "+ Add more",
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 🧩 Cart Items
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    elevation: 0.3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item['imageUrl'],
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item['name'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Color(0xFF090F47),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          cartItems.removeAt(index);
                                        });
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.grey,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  item['description'],
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color.fromRGBO(9, 15, 71, 0.45),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Rs.${item['price']}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF090F47),
                                        fontSize: 18,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        _quantityButton(
                                          icon: Icons.remove,
                                          onTap: () {
                                            setState(() {
                                              if (item['quantity'] > 1) {
                                                item['quantity']--;
                                              }
                                            });
                                          },
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          child: Text(
                                            "${item['quantity']}",
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        _quantityButton(
                                          icon: Icons.add,
                                          onTap: () {
                                            setState(() {
                                              item['quantity']++;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // 🧾 Payment Summary
            const Text(
              "Payment Summary",
              style: TextStyle(
                color: Color(0xFF090F47),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),

            _summaryRow("Order Total", "Rs.${orderTotal.toStringAsFixed(2)}"),
            SizedBox(height: 20),
            _summaryRow(
              "Items Discount",
              "- ${itemDiscount.toStringAsFixed(2)}",
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            _summaryRow(
              "Coupon Discount",
              "- ${couponDiscount.toStringAsFixed(2)}",
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            _summaryRow("Shipping", "Free", color: Colors.grey),
            const Divider(height: 24, thickness: 0.6),
            _summaryRow(
              "Total",
              "Rs.${total.toStringAsFixed(2)}",
              isBold: true,
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Place Order",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(
    String title,
    String value, {
    bool isBold = false,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: color ?? const Color.fromRGBO(9, 15, 71, 0.45),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),

          Text(
            value,
            style: TextStyle(
              color: Color.fromRGBO(9, 15, 71, 1),
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
              fontSize: isBold ? 15 : 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: const Color(0xFFE0E4FF),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 16, color: const Color(0xFF4157FF)),
      ),
    );
  }
}
