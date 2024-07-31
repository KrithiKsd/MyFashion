import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trend_cart/model/products.dart';

import '../controller/product_provider.dart';
import '../widgets/product_card.dart';
/*import 'package:shopmate/models/MyProducts.dart';
import 'package:shopmate/pages/details_screen.dart';
import '../widgets/product_card.dart';*/

class HomeScreen extends StatefulWidget{

  //final String category;

  const HomeScreen({super.key});

  State<HomeScreen> createState()=> _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{


  late Future<List<Products>> futureProducts;
  late List<Products> allProducts = [];




  @override
  void initState() {
    super.initState();
    futureProducts = fetchAllProducts();

    futureProducts.then((products){
      setState(() {
        allProducts= products;
      });
    });
  }

  int isSelected= 0;
  /*@override
  Widget build(BuildContext context) {
    return MaterialApp(
      // your app configuration
      home: Scaffold(

        body: FutureBuilder<List<Products>>(
        future: futureProducts,
        builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else {
        // Display the grid layout using allProducts list
        return
          _buildAllProducts();
        *//*GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: allProducts.length,
          itemBuilder: (context, index) {
            return ProductTile(product: allProducts[index]);
          },
        );*//*
      }
    },
    ),
    ),
    );
  }*/


  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(20.0),
      // your app configuration
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Text("Categories",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),


      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildProductCategory(index: 0, name: "All Products", image:"assets/category/women.jpg"),
          _buildProductCategory(index: 1, name: "Electronics", image:"assets/category/electr.jpg"),
          _buildProductCategory(index: 2, name: "Jewelleries", image:"assets/category/jewel.jpg"),
          _buildProductCategory(index: 3, name: "Mens clothing", image:"assets/category/men.jpg"),
          _buildProductCategory(index: 4, name: "Women's clothing", image:"assets/category/womenbrown.jpg"),
        ],
      ),
      ),
          const SizedBox(height: 10),

          Expanded(
            child:  isSelected==0
                ? _buildAllProducts()
                : isSelected == 1
                ? _buildAllProducts()
                : _buildAllProducts()
          ),

        /*  const Text("Today Super Deal",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),*/

      ],
      ),
    );
  }



  Widget _buildProductCategory({required int index, required String name, required String image}) {
    return GestureDetector(
      onTap: () => setState(() => isSelected = index),
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(top: 10, right: 10),
        decoration: BoxDecoration(
          color: isSelected == index ? Colors.lightGreen : Colors.grey,
           // Make the container circular
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

              Image.asset(image,
                  width: 90,
                  height: 80,
                  fit: BoxFit.fill),
           // ),
            const SizedBox(height: 5),
            Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 18,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,),
            ),
          ],
        ),
      ),
    );
  }



  _buildAllProducts() =>  // Adjust the top margin value as needed
  GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100 / 140),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: allProducts.length,
    itemBuilder: (context, index) {
      //final allProducts = allProducts[index];
      return
       GestureDetector(
         /* onTap: ()=> Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailsScreen(product: allProducts)
            ),
          ),*/
          child: ProductCard(product: allProducts[index]),
        );
    },
  );


 /* Widget build(BuildContext context){
    return Padding(padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
      *//*const Text("Products",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildProductCategory(index: 0, name:"All Products"),
            _buildProductCategory(index: 1, name:"Vegetables"),
            _buildProductCategory(index: 2, name:"Fruits"),
          ]

        ),*//*
       *//* Container(
          margin: EdgeInsets.only(top: 20),
        ),*//*
        SizedBox(height: 20),
       *//* Expanded(
            child:  isSelected==0
                ? _buildAllProducts()
                : isSelected == 1
                ? _buildVegetables()
                : _buildVFruits(),
        ),*//*
        FutureBuilder<List<Products>>(
          future: futureProducts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Products> productList = snapshot.data!;
              // Use productList to build your UI
              return ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(productList[index].title),
                    // Add other details you want to display
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            // By default, show a loading spinner
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),

      ],
    )
    );

  }*/



 /* _buildAllProducts() =>  // Adjust the top margin value as needed
    GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.allProducts.length,
        itemBuilder: (context, index) {
          final allProducts = MyProducts.allProducts[index];
          return
          GestureDetector(
            onTap: ()=> Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailsScreen(product: allProducts)
            ),
            ),
            child: ProductCard(product: allProducts),
          );
        },
  );


  _buildVegetables()=>  GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: MyProducts.vegList.length,
      itemBuilder: (context, index) {
        final vegetables = MyProducts.vegList[index];
        return 
          GestureDetector(
            onTap: ()=> Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailsScreen(product: vegetables)
                )
            ),
            child: ProductCard(product: vegetables),
          );
          
      },
  );


  _buildVFruits()=>
    GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: MyProducts.fruitList.length,
      itemBuilder: (context, index) {
        final fruits = MyProducts.fruitList[index];
        return GestureDetector(
          onTap: ()=>Navigator.push((context),
              MaterialPageRoute(builder: (context) => DetailsScreen(product: fruits)
              )
          ),
          child: ProductCard(product: fruits),
        );
      },
  );*/



}

class ProductTile extends StatelessWidget {
  final Products product;

  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Image.network(
            product.image,
            height: 80,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}