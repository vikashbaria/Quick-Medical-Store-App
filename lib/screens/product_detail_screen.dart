import 'package:flutter/material.dart';
import 'package:medical_store_mobile_app/screens/cart_screen.dart';
import '../models/product_model.dart';
import '../widgets/package_option.dart';
import '../widgets/rating_bar.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),

        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.shopping_cart_outlined, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF090F47),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              product.description,
              style: const TextStyle(
                color: Color(0xFF090F47),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),

            Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Image.asset("assets/crop_product.png", height: 180),
              ),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Text(
                  "Rs.${product.oldPrice}",
                  style: const TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "Rs.${product.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                Icon(Icons.add_shopping_cart, color: Color(0xFF006AFF)),
                SizedBox(width: 10),
                Text("Add to cart", style: TextStyle(color: Color(0xFF006AFF))),
              ],
            ),
            Text(
              "Etiam mollis ",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            Divider(thickness: 0.5),
            const SizedBox(height: 16),

            const Text(
              "Package size",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                PackageOption(price: 106, pellets: 500, isSelected: true),
                SizedBox(width: 20),
                PackageOption(price: 166, pellets: 110),
                SizedBox(width: 20),
                PackageOption(price: 252, pellets: 300),
              ],
            ),
            const SizedBox(height: 16),

            const Text(
              "Product Details",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xff090F47),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Color(0x73090F47),
              ),
            ),

            const SizedBox(height: 16),
            const Text(
              "Ingredients",

              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xff090F47),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Color(0x73090F47),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Text(
                  "Expiry Date: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF090F47),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  " ${product.expiryDate}",
                  style: TextStyle(
                    color: Color(0x73090F47),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Text(
                  "Brand Name",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF090F47),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  " ${product.brandName}",
                  style: TextStyle(
                    color: Color(0x73090F47),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        SizedBox(width: 6),
                        Text(
                          "4.2",
                          style: TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(Icons.star, color: Color(0xFFFFC000), size: 36),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "923 Ratings\nand 257 Reviews",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),

                const SizedBox(width: 25),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildRatingBar(5, 0.67),
                      buildRatingBar(4, 0.20),
                      buildRatingBar(3, 0.07),
                      buildRatingBar(2, 0.00),
                      buildRatingBar(1, 0.02),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 4),
                const Text(
                  "4.2",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  "05- Oct 2020",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Text(
              "Erric Hoffman",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Interdum et malesuada fames ac ante ipsum primis in faucibus. "
              "Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas.",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Color(0xFF4157FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartScreen()),
                );
              },
              child: Text(
                "GO TO CART",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
