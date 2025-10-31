import 'package:flutter/material.dart';
import 'package:medical_store_mobile_app/models/product_model.dart';
import 'package:medical_store_mobile_app/screens/add_product.dart';
import 'package:medical_store_mobile_app/screens/product_detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({super.key, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Dental',
      'colors': [Color(0xFFFF9598), Color(0xFFFF70A7)],
    },
    {
      'title': 'Wellness',
      'colors': [Color(0xFF19E5A5), Color(0xFF15BD92)],
    },
    {
      'title': 'Homeo',
      'colors': [Color(0xFFFFC06F), Color(0xFFFF793A)],
    },
    {
      'title': 'Eye care',
      'colors': [Color(0xFF4DB7FF), Color(0xFF3E7DFF)],
    },
  ];

  final product = Product(
    id: '1',
    name: 'Sugar Free Gold Low Calories',
    description: 'Etiam mollis metus non purus',
    imageUrl: 'assets/Product_images.png',
    price: 56,
    oldPrice: 99,
    expiryDate: '25/12/2023',
    brandName: 'Something',
    rating: 4.4,
    ratingsCount: 923,
    reviewsCount: 257,
  );

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('products')
        .limit(4)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  String capitalizeFirst(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      _homeBody(), // main home body
      const Center(child: Text("Comming Soon..")),
      const Center(child: Text("Comming Soon..")),
      _profilePage(context),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFF),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(
          color: const Color(0xFF4157FF),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.blue.shade700, width: 1.5),
        ),
        child: IconButton(
          icon: const Icon(Icons.add, color: Colors.white, size: 26),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddProductScreen()),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: SizedBox(
          height: 52,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _bottomNavIcon(Icons.home, 0),
              _bottomNavIcon(Icons.notifications, 1),
              const SizedBox(width: 52),
              _bottomNavIcon(Icons.shopping_bag, 2),
              _bottomNavIcon(Icons.person, 3),
            ],
          ),
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }

  /// 🔹 Bottom Nav Icon Helper
  Widget _bottomNavIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(icon, size: 22),
      color: _selectedIndex == index
          ? const Color(0xFF4157FF)
          : const Color(0x73090F47),
      onPressed: () => setState(() => _selectedIndex = index),
    );
  }

  Widget _homeBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 40),
          _buildCategories(),
          const SizedBox(height: 20),
          _buildBanner(),
          const SizedBox(height: 20),
          _buildDealsSection(),
          const SizedBox(height: 10),
          _buildProductsGrid(),
        ],
      ),
    );
  }

  Widget _profilePage(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Profile",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    'https://scontent.fkhi10-1.fna.fbcdn.net/v/t39.30808-1/248229040_4422302187884985_7319573855011673340_n.jpg?stp=dst-jpg_s160x160_tt6&_nc_cat=104&ccb=1-7&_nc_sid=1d2534&_nc_eui2=AeH0f3trJQbx82D0ex3aJBbxeGDgpzzK8Al4YOCnPMrwCTiI-2EXLSK5VstIvV55AlfnxjwTZg0wZPATzjexDFHM&_nc_ohc=qNAaVrvKI1YQ7kNvwHu9ojx&_nc_oc=AdnRhZ1t7jHsARR_XpLmmCp3YtraZ0wIEKMvzjWaRHdS93CG8Oky7dFFZguZjjJnat4&_nc_zt=24&_nc_ht=scontent.fkhi10-1.fna&_nc_gid=05ZD6YMJaUiBD2YVi6WYfw&oh=00_AfdWvIiXLbVv9yOO3rHkFWJ7msGhNaLXWd-MUnx-iHQfuw&oe=690A56F3',
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, ${capitalizeFirst(widget.userName)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Welcome to Quick Medical Store",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            _profileItem(Icons.edit, "Edit Profile"),
            _profileItem(Icons.receipt_long, "My Orders"),
            _profileItem(Icons.credit_card, "Billing"),
            _profileItem(Icons.help_outline, "FAQ"),
          ],
        ),
      ),
    );
  }

  Widget _profileItem(IconData icon, String title) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.blue),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
        const Divider(height: 1),
      ],
    );
  }

  /// 🔹 Below are the same methods from your original code 👇
  Widget _buildHeader() {
    /* same as your version */
    return SizedBox(
      height: 220,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4157FF), Color(0xFF3D50E7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.only(left: 24, right: 24, top: 44),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        "https://scontent.fkhi10-1.fna.fbcdn.net/v/t39.30808-1/248229040_4422302187884985_7319573855011673340_n.jpg?stp=dst-jpg_s160x160_tt6&_nc_cat=104&ccb=1-7&_nc_sid=1d2534&_nc_eui2=AeH0f3trJQbx82D0ex3aJBbxeGDgpzzK8Al4YOCnPMrwCTiI-2EXLSK5VstIvV55AlfnxjwTZg0wZPATzjexDFHM&_nc_ohc=qNAaVrvKI1YQ7kNvwHu9ojx&_nc_oc=AdnRhZ1t7jHsARR_XpLmmCp3YtraZ0wIEKMvzjWaRHdS93CG8Oky7dFFZguZjjJnat4&_nc_zt=24&_nc_ht=scontent.fkhi10-1.fna&_nc_gid=05ZD6YMJaUiBD2YVi6WYfw&oh=00_AfdWvIiXLbVv9yOO3rHkFWJ7msGhNaLXWd-MUnx-iHQfuw&oe=690A56F3",
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.notifications_none, color: Colors.white),
                        SizedBox(width: 12),
                        Icon(Icons.shopping_cart_outlined, color: Colors.white),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  "Hi, ${capitalizeFirst(widget.userName)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                const Text(
                  "Welcome to Quick Medical Store",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -20,
            left: 26,
            right: 26,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey, width: 0.2),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search Medicine & Healthcare products',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    /* same as before */
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Top Categories",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF090F47),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: categories.map((cat) {
              return Container(
                height: 120,
                width: 74,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: cat['colors'] as List<Color>,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    Text(
                      cat['title'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildBanner() {
    /* same as before */
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 146,
        decoration: BoxDecoration(
          color: const Color(0xFFD6E4FF),
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: AssetImage("assets/banner.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Save extra on\n every order",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Etiam mollis metus\nnon faucibus.",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDealsSection() {
    /* same */
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Deals of the Day",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff090F47),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
            child: const Text(
              "More",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF006AFF),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsGrid() {
    /* same logic as before */
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No products available"));
          }

          final products = snapshot.data!;
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.72,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFFEEEEF0).withOpacity(0.5),
                        ),
                        child: Center(
                          child:
                              (product['imageUrl'] != null &&
                                  product['imageUrl'].toString().isNotEmpty)
                              ? Image.network(
                                  product['imageUrl'],
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.broken_image,
                                      size: 50,
                                    );
                                  },
                                )
                              : const Icon(Icons.medical_services, size: 50),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['name'] ?? 'No Name',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Color(0xFF090F47),
                            ),
                          ),
                          Text(
                            product['description'] ?? 'No Description',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Color(0xFF090F47),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rs.${product['price'] ?? '0'}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.amber.shade400,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  "${product['rating'] ?? 0}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
