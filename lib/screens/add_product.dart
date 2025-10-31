import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _oldPriceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();

  bool _isLoading = false;

  void _addProduct() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await FirebaseFirestore.instance.collection('products').add({
        'name': _nameController.text.trim(),
        'description': _descriptionController.text.trim(),
        'price': double.tryParse(_priceController.text.trim()) ?? 0,
        'oldPrice': double.tryParse(_oldPriceController.text.trim()) ?? 0,
        'imageUrl': _imageUrlController.text.trim(),
        'brandName': _brandController.text.trim(),
        'expiryDate': _expiryController.text.trim(),
        'rating': double.tryParse(_ratingController.text.trim()) ?? 0,
        'createdAt': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      _formKey.currentState!.reset();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _oldPriceController.dispose();
    _imageUrlController.dispose();
    _brandController.dispose();
    _expiryController.dispose();
    _ratingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const inputTextStyle = TextStyle(fontSize: 14);
    const labelStyle = TextStyle(fontSize: 13, color: Colors.black54);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ...[
                {'controller': _nameController, 'label': 'Product Name'},
                {'controller': _descriptionController, 'label': 'Description'},
                {
                  'controller': _priceController,
                  'label': 'Price',
                  'type': TextInputType.number,
                },
                {
                  'controller': _oldPriceController,
                  'label': 'Old Price',
                  'type': TextInputType.number,
                },
                {'controller': _imageUrlController, 'label': 'Image URL'},
                {'controller': _brandController, 'label': 'Brand Name'},
                {'controller': _expiryController, 'label': 'Expiry Date'},
                {
                  'controller': _ratingController,
                  'label': 'Rating',
                  'type': TextInputType.number,
                },
              ].map((field) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: field['controller'] as TextEditingController,
                    keyboardType: field['type'] as TextInputType?,
                    decoration: InputDecoration(
                      labelText: field['label'] as String,
                      labelStyle: labelStyle,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: inputTextStyle,
                    validator: (value) => value!.isEmpty
                        ? 'Please enter ${field['label']}'
                        : null,
                  ),
                );
              }).toList(),
              const SizedBox(height: 12),
              _isLoading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: _addProduct,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Add Product",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
