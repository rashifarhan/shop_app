import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  static const routeName='/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId=ModalRoute.of(context)?.settings.arguments as String;
    final productData=Provider.of<Products>(context).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(productData.title),
      ),
    );
  }
}
