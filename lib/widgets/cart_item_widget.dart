import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget(this.cartItem);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Tem certeza?'),
            content: Text('Quer remover o item do carrinho?'),
            actions: [
              FlatButton(
                child: Text(
                  'Não',
                ),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                  return false;
                },
              ),
              FlatButton(
                child: Text(
                  'Sim',
                ),
                onPressed: () {
                  Provider.of<Cart>(context, listen: false)
                      .removeItem(cartItem.productId);
                  Navigator.of(ctx).pop(true);
                  return true;
                },
              ),
            ],
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                  child: Text("${cartItem.price}"),
                ),
              ),
            ),
            title: Text(cartItem.title),
            subtitle: Text(
                "Total: R\$ ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}"),
            trailing: Text("${cartItem.quantity}x"),
          ),
        ),
      ),
    );
  }
}
