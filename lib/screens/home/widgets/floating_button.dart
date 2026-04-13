import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../screens/payment/cart.dart';

class floating_button extends StatelessWidget {
  const floating_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xffEB6A58),
      shape: CircleBorder(),
      elevation: 5,
      child: Icon(Icons.shopping_bag, color: Colors.white),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder:
            (context) => Cart(),));
      },
    );
  }
}