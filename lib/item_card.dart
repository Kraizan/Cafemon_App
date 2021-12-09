import 'package:flutter/material.dart';

dynamic totalPrice = 0;
List Items = [];
List Count = [];
List Price = [];

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
        totalPrice -= widget.itemPrice;
        if(Count[Items.indexOf(widget.itemName)] > 1){
          Count[Items.indexOf(widget.itemName)]--;
        }
        else if(Count[Items.indexOf(widget.itemName)] == 1){
          Count.removeAt(Items.indexOf(widget.itemName));
          Items.remove(widget.itemName);
          Price.remove(widget.itemPrice);
        }
        else{
          null;
        }
      }
    });
  }
  void add() {
    setState(() {
      _n++;
      totalPrice += widget.itemPrice;
      if(Items.contains(widget.itemName)){
        Count[Items.indexOf(widget.itemName)]++;
      }
      else{
        Items.add(widget.itemName);
        Count.insert(Items.indexOf(widget.itemName), 1);
        Price.add(widget.itemPrice);
      }
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
                          heroTag: "rem ${widget.itemName}",
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
                          heroTag: "add ${widget.itemName}",
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
