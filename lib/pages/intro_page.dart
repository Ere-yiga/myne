import 'package:flutter/material.dart';
import 'package:erenmine/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PickVault",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Image.asset('lib/images/bts.jpg', height: 240),
            ),

            const SizedBox(height: 20),

            Text("Spikey", style: TextStyle(fontSize: 24)),

            const SizedBox(height: 20),

            Text(
              "Brand new dark theme image, made with custom theme image, just for you.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),
            
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
              
                padding: EdgeInsets.all(8),
                
                child: Center(
                  child: Text("Buy now", style: TextStyle(
                    color: Colors.white
                  )),
                )
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart'
          ),
        ],
      ),
    );
  }
}