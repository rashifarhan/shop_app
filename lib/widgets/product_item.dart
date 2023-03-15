import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/product_details_screen.dart';

import '../providers/product.dart';


class ProductItem extends StatelessWidget {


   const ProductItem({Key? key,})
       : super(key: key);

  @override
  Widget build(BuildContext context) {
   final product= Provider.of<Product>(context);


    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetails.routeName,arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.grey.withOpacity(.3),
          leading: IconButton(
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              icon:product.isFavorite==false? Icon(
                Icons.favorite_border,
                color: Colors.red,
              ):Icon(Icons.favorite,color: Colors.red,)

          ),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.orange,
              )),
          title: Center(child: Text(product.title)),
        ),
      ),
    );
  }
}
