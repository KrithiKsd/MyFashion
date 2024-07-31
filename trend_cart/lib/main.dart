import 'package:flutter/material.dart';
import 'package:trend_cart/view/cart_details.dart';
import 'package:trend_cart/view/favorite_screen.dart';
import 'package:trend_cart/view/home_screen.dart';
import 'package:trend_cart/view/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyFashion',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'MyFashion'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex=0;
  List screens= [
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,

      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value){
          setState(() {
            currentIndex= value;
          });
        },
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.blueGrey,
        items: const[
          BottomNavigationBarItem(
            label:"Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label:"WishList",
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label:"MyCart",
            icon: Icon(Icons.add_shopping_cart),
          ),
          BottomNavigationBarItem(
            label:"Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
