import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/widgets/product_grid_item_widget.dart';

class ProductGridWidget extends StatelessWidget {
  final bool showFavoriteOnly;

  const ProductGridWidget(this.showFavoriteOnly);
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    final products = showFavoriteOnly
        ? productsProvider.favoriteItems
        : productsProvider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (_, i) {
        return ChangeNotifierProvider.value(
          value: products[i],
          child: ProductGridItemWidget(),
        );
      },
    );
  }
}
