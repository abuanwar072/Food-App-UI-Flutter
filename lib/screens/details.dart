import 'package:flutter/material.dart';
import 'package:food_app_ui_flutter/conststant.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWight = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(
          "Details",
          style: kHeadingSmall.copyWith(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 75.0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0),
                  ),
                  color: Colors.white),
              // height: screenHeight - 10.0,
              width: screenWight,
              margin: EdgeInsets.only(bottom: 45),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: screenHeight * .2 + 10,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Avocado',
                            style: kHeading.copyWith(color: Colors.black),
                          ),
                          TextSpan(
                            text: ' Bowl',
                            style: kHeadingLight.copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '\$24.00',
                          style: kPriceText.copyWith(fontSize: 25),
                        ),
                        Container(
                            height: 30.0,
                            color: Colors.grey.withOpacity(.6),
                            width: 1.0),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            height: 40,
                            width: 120,
                            color: kSecondaryColor,
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                Text(
                                  '2',
                                  style: kHeadingSmall.copyWith(
                                      color: Colors.white),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Container(
                                    padding: EdgeInsets.all(1),
                                    color: Colors.white,
                                    child: Icon(
                                      Icons.add,
                                      color: kSecondaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 25),
                        child: Row(
                          children: <Widget>[
                            ScroolCard(
                              select: true,
                              title: 'WEIGHT',
                              ammount: "300",
                              unit: 'G',
                            ),
                            ScroolCard(
                              select: false,
                              title: 'Calories',
                              ammount: "267",
                              unit: 'Cal',
                            ),
                            ScroolCard(
                              select: false,
                              title: 'Vitamins',
                              ammount: "A, B6",
                              unit: 'VIT',
                            ),
                            ScroolCard(
                              select: false,
                              title: 'Calories',
                              ammount: "267",
                              unit: 'Cal',
                            ),
                          ],
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        width: screenWight,
                        height: 80,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            '\$48.00',
                            style: kHeading.copyWith(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: (screenWight / 2) - 100,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Images/plate1.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScroolCard extends StatelessWidget {
  const ScroolCard({this.select, this.title, this.ammount, this.unit});
  final bool select;
  final String title;
  final String ammount;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        padding: EdgeInsets.all(15),
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: select ? kSecondaryColor : Colors.transparent,
          border: Border.all(
            style: BorderStyle.solid,
            color: Colors.grey.withOpacity(.5),
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '$title'.toUpperCase(),
              style: kNormalText.copyWith(
                  color: select ? Colors.white : Colors.grey),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '$ammount\n',
                    style: kHeadingSmall.copyWith(
                        color: select ? Colors.white : Colors.black),
                  ),
                  TextSpan(
                    text: '$unit'.toUpperCase(),
                    style: TextStyle(
                        color: select ? Colors.white : Colors.black,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
