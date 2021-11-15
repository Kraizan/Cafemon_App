import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final totalPrice;
  final items;
  final count;
  const CheckoutPage({Key? key, this.totalPrice, this.items, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: Colors.red[500],
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(48,0,0,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Cafe',
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'M',
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 28,
                height: 28,
                child: Image.asset('assets/pokeball-png-45330.png'),
              ),
              const Text(
                'N',
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        width: 500,
        height: 500,
        child: Text('$totalPrice'),
      ),
    );
  }
}