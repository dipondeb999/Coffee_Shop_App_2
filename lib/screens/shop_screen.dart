import 'package:coffee_shop_2/components/coffee_tile.dart';
import 'package:coffee_shop_2/constant.dart';
import 'package:coffee_shop_2/models/coffee.dart';
import 'package:coffee_shop_2/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  // add coffee to cart
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemTOCart(coffee);

    // let user know it add been successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alert!'),
        content: const Text('Successfully added to cart...'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('ok'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                // heading message
                const Text(
                  'How would you like your coffee?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 25),
                // list of coffee to buy
                Expanded(
                  child: ListView.builder(
                    itemCount: value.coffeeShop.length,
                    itemBuilder: (context, index) {
                      // get individual coffee
                      Coffee eachCoffee = value.coffeeShop[index];
                      // return the tile for this coffee
                      return CoffeeTile(
                        coffee: eachCoffee,
                        onPressed: () => addToCart(eachCoffee),
                        icon: const Icon(Icons.add),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
