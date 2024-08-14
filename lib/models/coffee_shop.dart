import 'package:coffee_shop_2/models/coffee.dart';
import 'package:flutter/cupertino.dart';

class CoffeeShop extends ChangeNotifier{
  // coffee for sale list
  final List<Coffee> _shop = [
    // black coffee
    Coffee(
      name: 'Long Black',
      price: '4.10',
      imagePath: 'assets/images/black_coffee.png',
    ),
    Coffee(
      name: 'Latte',
      price: '4.20',
      imagePath: 'assets/images/latte.png',
    ),
    Coffee(
      name: 'Espresso',
      price: '3.50',
      imagePath: 'assets/images/espresso.png',
    ),
    Coffee(
      name: 'Iced Coffee',
      price: '4.40',
      imagePath: 'assets/images/cold_coffee.png',
    ),
  ];
  // user cart
  List<Coffee> _userCart = [];
  // get coffee list
  List<Coffee> get coffeeShop => _shop;
  // get user cart
  List<Coffee> get userCart => _userCart;
  // add item to cart
  void addItemTOCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
  }
  // remove item from cart
  void removeItemFromCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }
}
