import 'package:flluter_provider/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flluter_provider/providers/all_product.dart';
import 'package:Provider/Provider.dart';

class ProductDetailScreen extends StatelessWidget{
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productid =
        ModalRoute.of(context)?.settings!.arguments as String;
    final productid =
        Provider.of<Product>(context).AllProducts.firstWhere((prodid) => prodid.id == productid);
    // ...
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            child: Image.network(
              "${Product.imageUrl}",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height:30,),
          Text("${Product.title}", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}