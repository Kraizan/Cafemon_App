import 'package:cafemon_app/item_card.dart';
import 'package:flutter/material.dart';
import 'checkout_page.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({Key? key}) : super(key: key);

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: Colors.red[500],
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView(
              children: const [
                ItemCard(
                  itemName: 'Masala Chai',
                  itemDescription: 'Ye h humari masala chai',
                  itemImage: 'https://www.godairyfree.org/wp-content/uploads/2009/07/pics-masala-chai-feature.jpg',
                  itemPrice: 10,
                ),
                ItemCard(
                  itemName: 'Patties',
                  itemDescription: 'Ye h humari patties',
                  itemImage: 'https://5.imimg.com/data5/HU/FN/MY-26914611/vegetable-patties-500x500.jpg',
                  itemPrice: 15,
                ),
                ItemCard(
                  itemName: 'Masala Patties',
                  itemDescription: 'Ye h humari masala patties',
                  itemImage: 'https://5.imimg.com/data5/HU/FN/MY-26914611/vegetable-patties-500x500.jpg',
                  itemPrice: 25,
                ),
                ItemCard(
                  itemName: 'Momos',
                  itemDescription: 'Ye h humare momos',
                  itemImage: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Momo_nepal.jpg/1200px-Momo_nepal.jpg',
                  itemPrice: 50,
                ),
                ItemCard(
                  itemName: 'Veg. Sandwich',
                  itemDescription: 'Ye h humare veg. sandwich',
                  itemImage: 'https://static.toiimg.com/thumb/60057435.cms?width=1200&height=900',
                  itemPrice: 40,
                ),
                ItemCard(
                  itemName: 'Grilled Sandwich',
                  itemDescription: 'Ye h humare grilled sandwich',
                  itemImage: 'https://static.toiimg.com/thumb/54714340.cms?imgsize=458099&width=800&height=800',
                  itemPrice: 50,
                ),
                ItemCard(
                  itemName: 'Hot Coffee',
                  itemDescription: 'Ye h humari hot coffee',
                  itemImage: 'https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1024-512,f_auto,q_auto:best/newscms/2019_33/2203981/171026-better-coffee-boost-se-329p.jpg',
                  itemPrice: 50,
                ),
                ItemCard(
                  itemName: 'Cold Coffee',
                  itemDescription: 'Ye h humari cold coffee',
                  itemImage: 'https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1024-512,f_auto,q_auto:best/newscms/2019_33/2203981/171026-better-coffee-boost-se-329p.jpg',
                  itemPrice: 60,
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.12,
            color: Colors.amberAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    SizedBox(
                      child: Text(
                        'Total Price',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      height: 30,
                    ),
                    SizedBox(
                      child: Text(
                        'price',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                      height: 30,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckoutPage(totalPrice: totalPrice, items: Items, count: Count)),
                    );
                    for(int i=0; i<Items.length; i++){
                      print(Items[i]);
                      print(Count[i]);
                    }
                  },
                  child: const Text('Place Order'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
