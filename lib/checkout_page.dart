import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

class CheckoutPage extends StatelessWidget {
  final totalPrice;
  final items;
  final count;
  final price;
  const CheckoutPage({Key? key, this.totalPrice, this.items, this.count, this.price}) : super(key: key);

  void _sendSMS(String message, List<String> recipents) async {

  }

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
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: ListView(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.greenAccent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.12,
                              child: const Text(
                                  'S. No.',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: const Text(
                                    'Food Item',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  ),
                                )
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.1,
                                child: const Text(
                                    'Qty',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  ),
                                )
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.1,
                                child: const Text(
                                    'Price',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  ),
                                )
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                for(int i=0; i<items.length; i++) EachItem(index: i+1, item: items[i], count: count[i], price: price[i])
              ],
            )
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Total Price : ',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Rs. $totalPrice/-',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
                ElevatedButton.icon(
                    onPressed: () async {
                      String _result = await sendSMS(message: "Message", recipients: ['7727984699'])
                          .catchError((onError) {
                        print(onError);
                      });
                      print(_result);
                    },
                    icon: const Icon(Icons.local_grocery_store),
                    label: const Text('Confirm Order'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EachItem extends StatelessWidget {
  final item;
  final count;
  final index;
  final price;
  const EachItem({Key? key, this.index, this.item, this.count, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200]
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,5,0,5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.12,
                    child: Text(index.toString()),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(item)
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Text(count.toString())
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Text((count * price).toString())
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
