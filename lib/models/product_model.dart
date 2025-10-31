class Product {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final double oldPrice;
  final String expiryDate;
  final String brandName;
  final double rating;
  final int ratingsCount;
  final int reviewsCount;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.oldPrice,
    required this.expiryDate,
    required this.brandName,
    required this.rating,
    required this.ratingsCount,
    required this.reviewsCount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      oldPrice: (json['oldPrice'] ?? 0).toDouble(),
      expiryDate: json['expiryDate'] ?? '',
      brandName: json['brandName'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      ratingsCount: json['ratingsCount'] ?? 0,
      reviewsCount: json['reviewsCount'] ?? 0,
    );
  }
}
