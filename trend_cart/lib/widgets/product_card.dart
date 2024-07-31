import 'package:flutter/material.dart';


import '../model/products.dart';



class ProductCard extends StatefulWidget{

  final Products product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState()=> _ProductCardState();

}

class _ProductCardState extends State<ProductCard>{

  @override
  Widget build(BuildContext context){

   // final provider = FavoriteProvider.of(context);

    return Container(

      width: MediaQuery.of(context).size.width /2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.withOpacity(0.1)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
             children:  [
              GestureDetector(
               // onTap: ()=>provider.toggleFavorite(widget.product),
                  child: const Icon(
                 //   provider.isExist(widget.product)?
                    Icons.favorite

                    //color: Colors.lightGreen,
                  )
              )
             ],
          ),
          SizedBox(
            height: 130,
            width: 130,
            child: Image.network(
              widget.product.image,
              height: 80,
              width: double.infinity,
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(
            widget.product.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            widget.product.category.name,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.green,
            ),
          ),
          Text('\$'" ${widget.product.price}",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),),
        ],
      ),
    );
  }
}