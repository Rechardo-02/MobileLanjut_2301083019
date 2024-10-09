import 'package:flluter_provider/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flluter_provider/providers/all_product.dart';
import 'package:flluter_provider/widgets/product_item.dart';

class ProductGrid extends StatelessWidget{
  final productData = Provider.of<Products>(context);
  final AllProduct = productData.allProduct;
  return GridView.builder(
    Padding: const EdgeInsets.all(10.0),
    itemCount: allproduct.length,
    itemBuilder: (ctx, i) => ProductItem(
      AllProduct[i].id!,
      AllProduct[i].title!,
      AllProduct[i].imageUrl!,
    ),
    
  )
}