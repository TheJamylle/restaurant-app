import 'package:flutter/cupertino.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/highlight_item.dart';

class Highlights extends StatelessWidget {
  const Highlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text('Destaques',
                style: TextStyle(fontFamily: 'Caveat', fontSize: 32),
                textAlign: TextAlign.center),
          )),
          MediaQuery.of(context).orientation == Orientation.portrait
              ? const _PortraitList()
              : const _LandscapeList()
        ],
      ),
    );
  }
}

class _PortraitList extends StatelessWidget {
  const _PortraitList({super.key});

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return HighlightItem(
            imageURI: items[index]['image'],
            itemTitle: items[index]['name'],
            itemPrice: items[index]['price'],
            itemDescription: items[index]['description']);
      }, childCount: items.length),
    );
  }
}

class _LandscapeList extends StatelessWidget {
  const _LandscapeList({super.key});

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return HighlightItem(
            imageURI: items[index]['image'],
            itemTitle: items[index]['name'],
            itemPrice: items[index]['price'],
            itemDescription: items[index]['description']);
      }, childCount: items.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8, childAspectRatio: 1.2),
    );
  }
}
