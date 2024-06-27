import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/providers/cart_provider.dart';
import 'package:flutter_riverpod_example/screens/cart/cart_screen.dart';

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberOfItemsInCart = ref.watch(cartNotifierProvider).length;
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const CartScreen();
            }));
          },
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
        Positioned(
          child: Container(
            width: 18,
            height: 18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent,
            ),
            child: Text('$numberOfItemsInCart',
                style: const TextStyle(fontSize: 10, color: Colors.white)),
          ),
        )
      ],
    );
  }
}
