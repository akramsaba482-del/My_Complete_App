import 'package:flutter/material.dart';
import 'shop_screen.dart';
import 'notes_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  int cartCount = 0;

  void addToCart() {
    setState(() => cartCount++);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Added to Cart! Total: $cartCount"), duration: Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [ShopScreen(onAddToCart: addToCart), NotesScreen()];

    return Scaffold(
      appBar: AppBar(
        title: Text("My Complete App", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.deepPurple.shade100,
            child: Icon(Icons.person, color: Colors.deepPurple),
          ),
          SizedBox(width: 8),
          Stack(
            children: [
              IconButton(icon: Icon(Icons.shopping_cart_outlined), onPressed: () {}),
              if (cartCount > 0)
                Positioned(
                  right: 6, top: 6,
                  child: CircleAvatar(radius: 8, backgroundColor: Colors.red,
                    child: Text("$cartCount", style: TextStyle(fontSize: 10, color: Colors.white))),
                )
            ],
          ),
          SizedBox(width: 10),
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.note_alt), label: "Notes"),
        ],
      ),
    );
  }
}