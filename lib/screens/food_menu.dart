import 'package:flutter/cupertino.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/food_item.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu({super.key});

  final List items = comidas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter( child: Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text('Menu',
                style: TextStyle(fontFamily: 'Caveat', fontSize: 32),
                textAlign: TextAlign.center),
          )),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return FoodItem(
                  imageURI: items[index]['image'],
                  itemTitle: items[index]['name'],
                  itemPrice: items[index]['price']);
            }, childCount: items.length),
          ),
        ],
      ),
    );
  }
}
