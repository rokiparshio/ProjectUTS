import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:walletappui/util/My_card.dart';
import 'package:walletappui/util/my_button.dart';
import 'package:walletappui/util/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // pagecontroller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.pink,
          child: Icon(
            Icons.monetization_on,
            size: 32,
            ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              IconButton(
                onPressed:() {}, 
                icon: Icon(
                  Icons.home,
                  size: 32,
                  color: Colors.pink[200],
                  ),
                ),
              
              IconButton(
                onPressed:() {}, 
                icon: Icon(
                  Icons.settings,
                  size: 32,
                  color: Colors.grey,
                  ),
                ),
                  ]),
          ),
        ),
        body: SafeArea(
            child: Column(children: [
          // app bar
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'My',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Cards',
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                  // plus button
                  Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add)),
                ],
              )),

          SizedBox(height: 25),

          // cards
          Container(
            height: 200,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: [
                MyCard(
                  balance: 5250.25,
                  cardNumber: 12345678,
                  expirymonth: 10,
                  expiryYear: 24,
                  color: Colors.deepPurple[300],
                ),
                MyCard(
                  balance: 342.23,
                  cardNumber: 12345678,
                  expirymonth: 11,
                  expiryYear: 23,
                  color: Colors.blue[300],
                ),
                MyCard(
                  balance: 420.42,
                  cardNumber: 12345678,
                  expirymonth: 8,
                  expiryYear: 22,
                  color: Colors.green[300],
                ),
              ],
            ),
          ),

          SizedBox(height: 25),

          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.grey.shade800,
            ),
          ),

          SizedBox(height: 40),

          // 3 buttons -> send + pay + bills
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // send button
                MyButton(
                  iconImagePath: 'lib/icons/send-money.png',
                  buttonText: 'Send',
                  ),
                
                // pay buttn
                MyButton(
                  iconImagePath: 'lib/icons/debit-card.png',
                  buttonText: 'Pay',
                  ),
          
                // bills button
                MyButton(
                  iconImagePath: 'lib/icons/receipt.png',
                  buttonText: 'Bills',
                  ),
              ],
            ),
          ),
            
          SizedBox(height: 40),

          // column -> stats + transactions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                // statistics
                MyListTile(
                  iconImagePath: 'lib/icons/analytics.png', 
                  titleTitle: 'Statistics', 
                  titleSubTitle: 'Payment and Income',
                ),
               
               // transaction
               MyListTile(
                  iconImagePath: 'lib/icons/transaction.png', 
                  titleTitle: 'Transactions', 
                  titleSubTitle: 'Transaction History',
                  ),
              ],
             ),
           )
         ],
       ),
     ), 
    );
   }
 } 
