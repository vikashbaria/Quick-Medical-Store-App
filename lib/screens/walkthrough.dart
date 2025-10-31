import 'package:flutter/material.dart';
import 'package:medical_store_mobile_app/screens/login_screen.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough({super.key});

  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      "image": "assets/splash_image_1.png",
      "title": "View and buy\nMedicine online",
      "desc":
          "Etiam mollis metus non purus\nfaucibus sollicitudin. Pellentesque\nsagittis mi. Integer.",
    },
    {
      "image": "assets/splash_image_1.png",
      "title": "Fast and Secure\nDelivery",
      "desc":
          "Order medicines easily and get them\ndelivered securely at your doorstep.",
    },
    {
      "image": "assets/splash_image_1.png",
      "title": "24/7 Support\nAlways Available",
      "desc":
          "We are here to assist you anytime.\nStay healthy with our continuous support.",
    },
  ];

  void _nextPage() {
    if (_currentPage == _pages.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 120,
          left: 40,
          right: 40,
          bottom: 40,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(page["image"]!, height: 250),
                      const SizedBox(height: 40),
                      Text(
                        page["title"]!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        page["desc"]!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF090F47).withOpacity(0.45),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _skip,
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: const Color(0xFF090F47).withOpacity(0.45),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: _currentPage == index ? 24 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? const Color(0xFF4157FF)
                            : const Color(0xFF4157FF).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _nextPage,
                  child: Text(
                    _currentPage == _pages.length - 1 ? "Done" : "Next",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4157FF),
                      fontWeight: FontWeight.w400,
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
