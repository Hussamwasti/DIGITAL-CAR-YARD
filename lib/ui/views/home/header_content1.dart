import 'package:digitalcaryard/ui/widgets/common/btn/btn.dart';
import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';

class HeaderContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopHeaderContent1();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopHeaderContent1();
        } else {
          return MobileHeaderContent1();
        }
      },
    );
  }
}

class DesktopHeaderContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: screenWidthFraction(context, dividedBy: 13),
              top: screenHeightFraction(context, dividedBy: 4.5),
              bottom: screenHeightFraction(context, dividedBy: 3),
              right: 0,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              width: _width / 2.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "We Are",
                    style: TextStyle(
                      fontFamily: "Saira_Condensed",
                      color: Colors.white38,
                      fontWeight: FontWeight.w500,
                      fontSize: getResponsiveLargeFontSize(context),
                    ),
                  ),
                  SizedBox(
                      height: screenHeightFraction(context, dividedBy: 100)),
                  Text(
                    "Digital Car Yard",
                    style: TextStyle(
                      fontFamily: "Ethnocentric",
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: getResponsiveFontSize(context, fontSize: 32),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeightFraction(context, dividedBy: 50)),
                    child: Text(
                      "Best Cars and Products selling platform That offer Guarantee,\nwhich has helped us to achieve a high success rate.",
                      style: TextStyle(
                        fontSize: getResponsiveMediumFontSize(context),
                        color: Colors.white38,
                        fontFamily: "SourceSans3",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: screenHeightFraction(context, dividedBy: 25)),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: screenWidthFraction(context, dividedBy: 8),
                      height: screenHeightFraction(context, dividedBy: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF00CCFF), // Aqua border
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF00CCFF).withOpacity(0.40),
                              blurRadius: 6,
                              offset: Offset(3, 3),
                            ),
                          ],
                          color: const Color(0xFF00CCFF),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "GET STARTED ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "SourceSans3",
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      getResponsiveSmallFontSize(context)),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: getResponsiveMediumLargeFontSize(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidthFraction(context, dividedBy: 1.7),
                  top: screenHeightFraction(context, dividedBy: 7),
                ),
                child: Container(
                  height: screenHeight(context) -
                      screenHeightFraction(context, dividedBy: 2.3),
                  width: screenWidthFraction(context, dividedBy: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white24,
                    border: Border.all(
                      color: const Color(0xFF00CCFF), // Aqua border
                      width: 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00CCFF).withOpacity(0.15),
                        // blurRadius: 10,
                        // offset: const Offset(5, 5),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidthFraction(context, dividedBy: 2.2),
                  top: screenHeightFraction(context, dividedBy: 12),
                ),
                child: SizedBox(
                  child: Image.asset('assets/Lamborghini Car image - rbg.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MobileHeaderContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              // Car Image with Styling
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeightFraction(context, dividedBy: 100),
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: screenHeightFraction(context, dividedBy: 3),
                      width: screenWidthFraction(context),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/Lamborghini Car image - rbg.png",
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Text and Button Section
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidthFraction(context, dividedBy: 20),
                  vertical: screenHeightFraction(context, dividedBy: 70),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "We Are",
                      style: TextStyle(
                        fontFamily: "Saira_Condensed",
                        color: Colors.white38,
                        fontWeight: FontWeight.w500,
                        fontSize: getResponsiveLargeFontSize(context),
                      ),
                    ),
                    SizedBox(
                        height: screenHeightFraction(context, dividedBy: 80)),
                    Text(
                      "Digital Car Yard",
                      style: TextStyle(
                        fontFamily: "Ethnocentric",
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: getResponsiveFontSize(context, fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical:
                              screenHeightFraction(context, dividedBy: 50)),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Best Cars and Products selling platform That offer Guarantee,\nwhich has helped us to achieve a high success rate.",
                        style: TextStyle(
                          fontSize: getResponsiveMediumFontSize(context),
                          color: Colors.white38,
                          fontFamily: "SourceSans3",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: screenHeightFraction(context, dividedBy: 50)),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: screenWidthFraction(context, dividedBy: 5),
                        height: screenHeightFraction(context, dividedBy: 30),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00CCFF),
                          border: Border.all(
                            color: const Color(0xFF00CCFF),
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF00CCFF).withOpacity(0.40),
                              blurRadius: 6,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "GET STARTED ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "SourceSans3",
                                  fontWeight: FontWeight.bold,
                                  fontSize: getResponsiveSmallFontSize(context),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: getResponsiveMediumLargeFontSize(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
