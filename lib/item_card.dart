import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final itemName;
  final itemDescription;
  final itemImage;
  final itemPrice;
  const ItemCard({Key? key, this.itemName, this.itemDescription, this.itemImage, this.itemPrice}) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int _n = 0;

  void minus() {
    setState(() {
      if (_n != 0) {
        _n--;
      }
    });
  }
  void add() {
    setState(() {
      _n++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.97,
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white70,
        elevation: 5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
                height: MediaQuery.of(context).size.width * 0.28,
                child: Image.network(
                    widget.itemImage,
                    fit: BoxFit.fill
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      widget.itemName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      widget.itemDescription,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                  child: Text(
                    'Rs. ${widget.itemPrice}/-',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      child: FittedBox(
                        child: FloatingActionButton(
                          onPressed: minus,
                          child: Icon(Icons.remove),
                        ),
                      ),
                    ),
                    Text('  $_n  '),
                    Container(
                      width: 25,
                      height: 25,
                      child: FittedBox(
                        child: FloatingActionButton(
                          onPressed: add,
                          child: Icon(Icons.add),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
