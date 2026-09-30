import 'package:flutter/material.dart';
import 'product_card.dart';
import 'product_detail.dart';

class ShopScreen extends StatelessWidget {
  final VoidCallback onAddToCart;
  ShopScreen({required this.onAddToCart});

  final List<Map<String, String>> products = [
    {"name": "Watch", "price": "2000", "image": "https://images.unsplash.com/photo-1523170335258-f5ed11844a49?w=500"},
    {"name": "Shoes", "price": "3500", "image": "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500"},
    {"name": "Bag", "price": "1500", "image": "https://images.unsplash.com/photo-1590874103328-eac38a683ce7?w=500"},
    {"name": "Glasses", "price": "800", "image": "https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=500"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search products...",
              prefixIcon: const Icon(Icons.search),
              filled: true, fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.8),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(
                  name: products[index]["name"]!, price: products[index]["price"]!, image: products[index]["image"]!, onAddToCart: onAddToCart,
                ))),
                child: Hero(tag: products[index]["name"]!, child: ProductCard(name: products[index]["name"]!, price: products[index]["price"]!, image: products[index]["image"]!)),
              );
            },
          ),
        ),
      ],
    );
  }
}