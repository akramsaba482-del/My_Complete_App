import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String name, price, image;
  final VoidCallback onAddToCart;
  ProductDetailScreen({required this.name, required this.price, required this.image, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(tag: name, child: Image.network(image, height: 350, fit: BoxFit.cover)),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text("Rs. $price", style: TextStyle(fontSize: 22, color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                SizedBox(height: 15),
                Text("Premium quality product with 1 year warranty. Free delivery all over Pakistan."),
                SizedBox(height: 25),
                SizedBox(
                  width: double.infinity, height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    onPressed: () { onAddToCart(); Navigator.pop(context); },
                    child: Text("Add to Cart", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}