import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;
  final String profileImageUrl;

  const ProfileScreen({
    super.key,
    required this.userName,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Profile",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF090F47),
              ),
            ),
            const SizedBox(height: 30),

            /// 🔹 Profile Header
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, $userName",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF090F47),
                      ),
                    ),
                    const Text(
                      "Welcome to  Quick Medical Store",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),

            /// 🔹 Menu Options
            _menuItem(
              icon: Icons.edit_outlined,
              title: "Edit Profile",
              onTap: () {},
            ),
            _menuItem(
              icon: Icons.shopping_bag_outlined,
              title: "My orders",
              onTap: () {},
            ),
            _menuItem(
              icon: Icons.receipt_long_outlined,
              title: "Billing",
              onTap: () {},
            ),
            _menuItem(icon: Icons.help_outline, title: "Faq", onTap: () {}),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _menuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: const Color(0xFF090F47)),
          title: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF090F47),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: onTap,
        ),
        const Divider(height: 1, thickness: 0.3, color: Colors.grey),
      ],
    );
  }

  /// 🔹 Bottom Navigation Bar
  Widget _bottomNavBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      child: SizedBox(
        height: 52,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home_outlined, size: 22, color: Colors.grey),
            Icon(Icons.notifications_none, size: 22, color: Colors.grey),
            Icon(Icons.local_hospital, size: 22, color: Color(0xFF4157FF)),
            Icon(Icons.person_outline, size: 22, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
