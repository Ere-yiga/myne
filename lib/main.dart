import 'package:flutter/material.dart';
import 'package:erenmine/pages/intro_page.dart';

void main(){
    runApp(MyWidget());
  }
  
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}