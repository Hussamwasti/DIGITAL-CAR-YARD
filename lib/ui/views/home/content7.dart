import 'package:flutter/material.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';

class Content7T1 extends StatefulWidget {
  Content7T1({Key? key}) : super(key: key);

  @override
  _Content7T1State createState() => _Content7T1State();
}

class _Content7T1State extends State<Content7T1> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopHeaderContent7();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopHeaderContent7();
        } else {
          return MobileHeaderContent7();
        }
      },
    );
  }
}

class DesktopHeaderContent7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              const Divider(),
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeightFraction(context, dividedBy: 20)),
                child: Container(
                  width: screenWidth(context),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            screenWidthFraction(context, dividedBy: 40)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/Digital Card Yard Logo.png",
                                      height: getResponsiveExtraLargeFontSize(
                                          context),
                                    ),
                                    SizedBox(
                                        width: screenWidthFraction(context,
                                            dividedBy: 100)),
                                    Text(
                                      "Digital Car Yard",
                                      style: TextStyle(
                                        fontFamily: "Ethnocentric",
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                        fontSize: getResponsiveMediumFontSize(
                                            context),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: screenHeightFraction(context,
                                        dividedBy: 40)),
                                Container(
                                  width: screenWidthFraction(context,
                                      dividedBy: 5),
                                  child: Text(
                                    "Digital Car Yard is a premier global car trading platform. Since 2022, we've guaranteed authentic, inspected vehicles and exceptional customer service.",
                                    style: TextStyle(
                                      fontFamily: "SourceSans3",
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white38,
                                      fontSize:
                                          getResponsiveSmallFontSize(context),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Services",
                                  style: TextStyle(
                                    fontFamily: "Saira_Condensed",
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                    fontSize:
                                        getResponsiveMediumFontSize(context),
                                  ),
                                ),
                                SizedBox(
                                    height: screenHeightFraction(context,
                                        dividedBy: 80)),
                                _buildFooterItem("Sell cars", context),
                                _buildFooterItem("Buy cars", context),
                                _buildFooterItem("Buy Products", context),
                                _buildFooterItem("Remainders", context),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "About Us",
                                  style: TextStyle(
                                    fontFamily: "Saira_Condensed",
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                    fontSize:
                                        getResponsiveMediumFontSize(context),
                                  ),
                                ),
                                SizedBox(
                                    height: screenHeightFraction(context,
                                        dividedBy: 80)),
                                _buildFooterItem("Our Vision", context),
                                _buildFooterItem("Portfolio", context),
                                _buildFooterItem("Team", context),
                                _buildFooterItem("Career", context),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Get In Touch",
                                  style: TextStyle(
                                    fontFamily: "Saira_Condensed",
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                    fontSize:
                                        getResponsiveMediumFontSize(context),
                                  ),
                                ),
                                SizedBox(
                                    height: screenHeightFraction(context,
                                        dividedBy: 80)),
                                _buildFooterItem("+923111111111", context),
                                _buildFooterItem(
                                    "digitalcaryard@gmail.com", context),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                            height:
                                screenHeightFraction(context, dividedBy: 25)),
                        Text(
                          "2022 Digital Car Yard",
                          style: TextStyle(
                            fontFamily: "SourceSans3",
                            fontSize: getResponsiveSmallFontSize(context),
                          ),
                        ),
                        SizedBox(
                            height:
                                screenHeightFraction(context, dividedBy: 40)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterItem(String text, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: screenHeightFraction(context, dividedBy: 100)),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "SourceSans3",
          fontWeight: FontWeight.w300,
          color: Colors.white38,
          fontSize: getResponsiveSmallFontSize(context),
        ),
      ),
    );
  }
}

class MobileHeaderContent7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeightFraction(context, dividedBy: 30)),
                child: Container(
                  width: screenWidth(context),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            screenWidthFraction(context, dividedBy: 40)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/Digital Card Yard Logo.png",
                                          height:
                                              getResponsiveExtraLargeFontSize(
                                                  context),
                                        ),
                                        SizedBox(
                                            width: screenWidthFraction(context,
                                                dividedBy: 100)),
                                        Text(
                                          "Digital Car Yard",
                                          style: TextStyle(
                                            fontFamily: "Ethnocentric",
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                            fontSize:
                                                getResponsiveMediumFontSize(
                                                    context),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height: screenHeightFraction(context,
                                            dividedBy: 40)),
                                    Container(
                                      width: screenWidthFraction(context,
                                          dividedBy: 2),
                                      child: Text(
                                        "Digital Car Yard is a premier global car trading platform. Since 2022, we've guaranteed authentic, inspected vehicles and exceptional customer service.",
                                        style: TextStyle(
                                          fontFamily: "SourceSans3",
                                          fontWeight: FontWeight.w300,
                                          color: unselectedColor,
                                          fontSize: getResponsiveSmallFontSize(
                                              context),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Services",
                                      style: TextStyle(
                                        fontFamily: "Saira_Condensed",
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                        fontSize: getResponsiveMediumFontSize(
                                            context),
                                      ),
                                    ),
                                    SizedBox(
                                        height: screenHeightFraction(context,
                                            dividedBy: 80)),
                                    _buildFooterItem("Sell Cars", context),
                                    _buildFooterItem("Buy Cars", context),
                                    _buildFooterItem("Buy Products", context),
                                    _buildFooterItem("Remainders", context),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                                height: screenHeightFraction(context,
                                    dividedBy: 30)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenWidthFraction(context,
                                      dividedBy: 3),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "About Us",
                                        style: TextStyle(
                                          fontFamily: "Saira_Condensed",
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                          fontSize: getResponsiveMediumFontSize(
                                              context),
                                        ),
                                      ),
                                      SizedBox(
                                          height: screenHeightFraction(context,
                                              dividedBy: 80)),
                                      _buildFooterItem("Our Vision", context),
                                      _buildFooterItem("Portfolio", context),
                                      _buildFooterItem("Team", context),
                                      _buildFooterItem("Career", context),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Get In Touch",
                                      style: TextStyle(
                                        fontFamily: "Saira_Condensed",
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                        fontSize: getResponsiveMediumFontSize(
                                            context),
                                      ),
                                    ),
                                    SizedBox(
                                        height: screenHeightFraction(context,
                                            dividedBy: 80)),
                                    _buildFooterItem("+923111111111", context),
                                    _buildFooterItem(
                                        "digitalcaryard@gmail.com", context),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                            height:
                                screenHeightFraction(context, dividedBy: 25)),
                        Text(
                          "© 2022 Digital Car Yard",
                          style: TextStyle(
                            fontFamily: "SourceSans3",
                            fontSize: getResponsiveSmallFontSize(context),
                          ),
                        ),
                        SizedBox(
                            height:
                                screenHeightFraction(context, dividedBy: 30)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterItem(String text, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: screenHeightFraction(context, dividedBy: 100)),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "SourceSans3",
          fontWeight: FontWeight.w300,
          color: unselectedColor,
          fontSize: getResponsiveSmallFontSize(context),
        ),
      ),
    );
  }
}
