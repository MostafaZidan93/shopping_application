import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/modules/shopping_login_screen/shopping_login_screen.dart';
import 'package:shopping_application/shared/components.dart';
import 'package:shopping_application/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body
});
}




class OnBoardingScreen extends StatefulWidget {


  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //Variables
  bool isLast = false;
  var boardController = PageController();

  //MARK: - Boarding Model.
  List<BoardingModel> boardingList = [
    BoardingModel(image: "onBoarding1", title: "Title1", body: "Body1"),
    BoardingModel(image: "onBoarding2", title: "Title2", body: "Body2"),
    BoardingModel(image: "onBoarding3", title: "Title3", body: "Body3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
              textTitle: "SKIP",
              function: (){
                navigateAndDismissAllBehind(context, ShopLoginScreen());
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  itemBuilder: (context, index) => buildBoardingItem(boardingList[index]),
                  itemCount: boardingList.length,
                  physics: BouncingScrollPhysics(),
                  controller: boardController,
                onPageChanged: (int index) {
                    if(index == boardingList.length - 1)
                      {
                        setState(() {
                          isLast = true;
                        });
                        print("This is the last");
                      } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    count: boardingList.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: defaultColor,
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 3,
                      spacing: 5,
                    ),
                ),
                Spacer(),
                FloatingActionButton(
                    onPressed: () {
                      if(isLast)
                        {
                          navigateAndDismissAllBehind(context, ShopLoginScreen());
                        } else
                          {
                            boardController.nextPage(
                              duration: Duration(
                                  milliseconds: 1500
                              ),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          }
                    },
                    child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Container(
          child: Image(
            image: AssetImage("assets/images/${model.image}.jpg"),
            height: 300,

          ),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Text(
        model.title,
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Text(
        model.body,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      SizedBox(
        height: 30,
      ),
    ],
  );
}
