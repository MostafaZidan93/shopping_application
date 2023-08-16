import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class OnBoardingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Image(
                image: AssetImage("assets/images/onBoarding3.jpg"),
              height: 300,
            ),
          ],
        ),
      )
    );
  }
}
