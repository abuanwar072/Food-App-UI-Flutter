import 'package:flutter/material.dart';
import 'package:food_app_ui_flutter/conststant.dart';
import 'package:food_app_ui_flutter/screens/details.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TopBar(),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: 'Healthy', style: kHeading),
                    TextSpan(text: ' Food', style: kHeadingLight),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
            ],
          ),
        ),
        Stack(
          // fit: StackFit.loose,
          children: <Widget>[
            ClipPath(
              clipper: CustomShape(),
              child: Container(
                color: Colors.white,
                width: screenWidth,
                height: screenHeight * 0.695,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Items(
                  screenHeight: screenHeight,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      BottomButton(
                        buttonIcon: Icon(Icons.search),
                        press: () {},
                      ),
                      BottomButton(
                        buttonIcon: Icon(Icons.search),
                        press: () {},
                      ),
                      RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        onPressed: () {},
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Checkout',
                          style: kHeadingSmall.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({this.buttonIcon, this.press});

  final Icon buttonIcon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: press,
      child: buttonIcon,
      padding: EdgeInsets.symmetric(vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 100;
    clippedPath.moveTo(0.0 + curveDistance, 0.0);
    clippedPath.quadraticBezierTo(0.0, 0.0, 0.0, 0.0 + curveDistance);
    clippedPath.lineTo(0.0, size.height);
    clippedPath.lineTo(size.width, size.height);
    clippedPath.lineTo(size.width, 0.0);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Items extends StatelessWidget {
  const Items({
    Key key,
    @required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(),
                ),
              );
            },
            child: Iteam(
              screenHeight: screenHeight,
              itemName: "Salmon Bowl",
              itemPrice: 24.00,
              itemPic: "assets/Images/plate1.png",
            ),
          ),
          Iteam(
            screenHeight: screenHeight,
            itemName: "Spring Bowl",
            itemPrice: 22.50,
            itemPic: "assets/Images/plate3.png",
          ),
          Iteam(
            screenHeight: screenHeight,
            itemName: "Avocado Bowl",
            itemPrice: 22.50,
            itemPic: "assets/Images/plate4.png",
          ),
          Iteam(
            screenHeight: screenHeight,
            itemName: "Avocado Bowl",
            itemPrice: 22.50,
            itemPic: "assets/Images/plate4.png",
          ),
          Iteam(
            screenHeight: screenHeight,
            itemName: "Spring Bowl",
            itemPrice: 22.50,
            itemPic: "assets/Images/plate3.png",
          ),
          SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}

class Iteam extends StatelessWidget {
  const Iteam({
    @required this.screenHeight,
    @required this.itemName,
    @required this.itemPrice,
    @required this.itemPic,
  });

  final double screenHeight;
  final String itemName;
  final double itemPrice;
  final String itemPic;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 50,
          backgroundImage: AssetImage("$itemPic"),
        ),
        Container(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$itemName',
                style: kHeadingSmall,
                maxLines: 1,
              ),
              Text('\$$itemPrice', style: kPriceText),
            ],
          ),
        ),
        Icon(
          Icons.add,
          size: 30,
        )
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.arrow_back_ios,
          size: 30,
          color: Colors.white,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.filter_list,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.more_horiz,
              size: 30,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}
