import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalcaryard/ui/common/apihelper/apihelper.dart';
import 'package:digitalcaryard/ui/common/app_colors.dart';
import 'package:digitalcaryard/ui/common/customwidget/text_helper.dart';
import 'package:digitalcaryard/ui/common/ui_helpers.dart';
import 'package:digitalcaryard/ui/views/admins/admin/analytics_admin.dart';
import 'package:digitalcaryard/ui/widgets/common/users/users.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../widgets/common/btn/btn.dart';
import '../../../widgets/common/searchbar/searchbar.dart';
import '../../about/about_view.dart';
import '../../home/content7.dart';
import '../../home/header_content1.dart';
import 'admin_viewmodel.dart';

class AdminView extends StackedView<AdminViewModel> {
  AdminView({Key? key}) : super(key: key);

  String searchText = '';
  String? selectedLocation;
  double? selectedPrice;

  @override
  Widget builder(
    BuildContext context,
    AdminViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Column(
              children: [
                Container(
                  height: screenWidth(context) < 800
                      ? screenHeightFraction(context, dividedBy: 13)
                      : screenHeightFraction(context, dividedBy: 6),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context) < 800
                        ? screenWidthFraction(context, dividedBy: 30)
                        : screenWidthFraction(context, dividedBy: 40),
                    vertical: screenWidth(context) < 800
                        ? screenHeightFraction(context, dividedBy: 80)
                        : screenHeightFraction(context, dividedBy: 40),
                  ),
                  decoration: const BoxDecoration(color: Color(0xFF0A0F25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/Digital Card Yard Logo.png",
                              height: screenWidth(context) < 800
                                  ? screenHeightFraction(context, dividedBy: 15)
                                  : screenWidthFraction(context, dividedBy: 8),
                              width: screenWidth(context) < 800
                                  ? screenHeightFraction(context, dividedBy: 15)
                                  : screenWidthFraction(context, dividedBy: 13),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          width: screenWidthFraction(context, dividedBy: 60)),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth(context) < 800
                                ? screenWidthFraction(context, dividedBy: 100)
                                : screenWidthFraction(context, dividedBy: 90),
                            vertical: screenWidth(context) < 800
                                ? screenHeightFraction(context, dividedBy: 100)
                                : screenHeightFraction(context, dividedBy: 60),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                  width: screenWidthFraction(context,
                                      dividedBy: 200)),
                              Icon(
                                Icons.admin_panel_settings_rounded,
                                size: screenWidth(context) < 800
                                    ? getResponsiveFontSize(context,
                                        fontSize: 35)
                                    : getResponsiveFontSize(context,
                                        fontSize: 35),
                              ),
                              SizedBox(
                                  width: screenWidthFraction(context,
                                      dividedBy: 100)),
                              Text(
                                'Admin View',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth(context) < 800
                                      ? getResponsiveFontSize(context,
                                          fontSize: 23)
                                      : getResponsiveFontSize(context,
                                          fontSize: 23),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Saira-BlackItalic",
                                ),
                              ),
                              SizedBox(
                                  width: screenWidthFraction(context,
                                      dividedBy: 40)),
                              Btn(
                                buttonId: "1",
                                title: "Chats",
                                function: () {
                                  viewModel.allChats();
                                },
                              ),
                              SizedBox(
                                  width: screenWidthFraction(context,
                                      dividedBy: 100)),
                              Btn(
                                buttonId: "2",
                                title: "Users",
                                function: () {
                                  user(context, viewModel);
                                },
                              ),
                              SizedBox(
                                  width: screenWidthFraction(context,
                                      dividedBy: 100)),
                              Btn(
                                buttonId: "3",
                                title: "About Us",
                                function: () {
                                  aboutUs(context, viewModel);
                                },
                              ),
                              SizedBox(
                                  width: screenWidthFraction(context,
                                      dividedBy: 80)),
                              Btn(
                                buttonId: "4",
                                title: "Analytics",
                                function: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AnalyticsAdmin(),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                  width: screenWidthFraction(context,
                                      dividedBy: 80)),
                              Expanded(
                                child: Searchbar(
                                  onChanged: (value) {
                                    searchText = value;
                                    viewModel.notifyListeners();
                                  },
                                  onFilterChanged: (location, price) {
                                    selectedLocation = location;
                                    selectedPrice = price;
                                    viewModel.notifyListeners();
                                  },
                                  isNotShopkeeper: true,
                                ),
                              ),
                              SizedBox(
                                  width: screenWidthFraction(context,
                                      dividedBy: 80)),
                              _buildUserMenu(context, viewModel),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Gradient accent stripe
                Container(
                  height: screenWidthFraction(context, dividedBy: 1000),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF0066FF), Color(0xFF00CCFF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ],
            ),
            // Main Content
            Expanded(
              child: ListView(
                children: [
                  HeaderContent1(),
                  Divider(
                    indent: screenWidthFraction(context, dividedBy: 4),
                    endIndent: screenWidthFraction(context, dividedBy: 4),
                  ),
                  SizedBox(
                      height: screenHeightFraction(context, dividedBy: 60)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidthFraction(context, dividedBy: 20),
                      vertical: screenHeightFraction(context, dividedBy: 40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: screenWidthFraction(context,
                                    dividedBy: 40)),
                            text_helper(
                              fontFamily: "Saira-BlackItalic",
                              data: "Categories",
                              size: screenWidth(context) < 800
                                  ? getResponsiveFontSize(context, fontSize: 45)
                                  : getResponsiveExtraLargeFontSize(context),
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidthFraction(context, dividedBy: 15),
                      right: screenWidthFraction(context, dividedBy: 20),
                    ),
                    child: Row(
                      children: [
                        cat(context, viewModel, "Cars"),
                        cat(context, viewModel, "Products"),
                      ],
                    ),
                  ),
                  viewModel.type == 'Cars'
                      ? Expanded(
                          child: SingleChildScrollView(
                            child: FutureBuilder(
                              future: ApiHelper.allCar(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data.toString() == '[]') {
                                    return Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.warning_amber_rounded,
                                            color: red,
                                            size: getResponsiveMassiveFontSize(
                                                context),
                                          ),
                                          text_helper(
                                            data: "No Data!",
                                            size: getResponsiveMediumFontSize(
                                                context),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    final pendingItems = snapshot.data
                                        .where(
                                            (item) => item['status'] == "false")
                                        .toList();

                                    // Apply search filter
                                    final filteredItems =
                                        pendingItems?.where((item) {
                                      final titleMatch = searchText.isEmpty ||
                                          item['title']
                                              .toString()
                                              .toLowerCase()
                                              .contains(
                                                  searchText.toLowerCase());

                                      final locationMatch = selectedLocation ==
                                              null ||
                                          item['city']
                                                  .toString()
                                                  .toLowerCase() ==
                                              selectedLocation!.toLowerCase();

                                      final priceMatch =
                                          selectedPrice == null ||
                                              (double.tryParse(item['price']
                                                          .toString()) ??
                                                      0) <=
                                                  selectedPrice!;

                                      return titleMatch &&
                                          locationMatch &&
                                          priceMatch;
                                    }).toList();

                                    return Padding(
                                      padding: EdgeInsets.all(
                                          screenWidthFraction(context,
                                              dividedBy: 100)),
                                      child: filteredItems.isEmpty
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.warning_amber_rounded,
                                                  color: red,
                                                  size:
                                                      getResponsiveMassiveFontSize(
                                                          context),
                                                ),
                                                text_helper(
                                                  data: searchText.isEmpty
                                                      ? "No Pending Cars!"
                                                      : "No Matching Pending Cars Found!",
                                                  size:
                                                      getResponsiveMediumFontSize(
                                                          context),
                                                ),
                                              ],
                                            )
                                          : Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      screenWidthFraction(
                                                          context,
                                                          dividedBy: 44)),
                                              child: Wrap(
                                                children: filteredItems
                                                    .map<Widget>((item) {
                                                  return Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical:
                                                          screenHeightFraction(
                                                              context,
                                                              dividedBy: 100),
                                                      horizontal:
                                                          screenWidthFraction(
                                                              context,
                                                              dividedBy: 100),
                                                    ),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          screenWidthFraction(
                                                              context,
                                                              dividedBy: 31),
                                                      vertical:
                                                          screenHeightFraction(
                                                              context,
                                                              dividedBy: 50),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF1E1E2F),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                        color: const Color(
                                                                0xFF00CCFF)
                                                            .withOpacity(0.3),
                                                        width: 1.2,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          14),
                                                              child: Container(
                                                                height: screenWidth(
                                                                            context) <
                                                                        800
                                                                    ? screenHeightFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            6)
                                                                    : screenHeightFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            2.95),
                                                                width: screenWidth(
                                                                            context) <
                                                                        800
                                                                    ? screenHeightFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            6)
                                                                    : screenWidthFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            7.8),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: const Color(
                                                                            0xFF00CCFF)
                                                                        .withOpacity(
                                                                            0.5),
                                                                    width: 1.2,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              14),
                                                                ),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl:
                                                                      item['img']
                                                                          [0],
                                                                  imageBuilder:
                                                                      (context,
                                                                              imageProvider) =>
                                                                          Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              14),
                                                                      image:
                                                                          DecorationImage(
                                                                        image:
                                                                            imageProvider,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  placeholder:
                                                                      (context,
                                                                              url) =>
                                                                          Center(
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: const Color(
                                                                          0xFF00CCFF),
                                                                    ),
                                                                  ),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      Container(
                                                                    width: screenWidthFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            5),
                                                                    height: screenWidthFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            5),
                                                                    color: Colors
                                                                        .white24,
                                                                    child: Icon(
                                                                      Icons
                                                                          .error,
                                                                      color: const Color(
                                                                          0xFF00CCFF),
                                                                      size: getResponsiveLargeFontSize(
                                                                          context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: screenWidthFraction(
                                                                    context,
                                                                    dividedBy:
                                                                        200)),
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              child:
                                                                  Image.asset(
                                                                "assets/Digital Card Yard Logo.png",
                                                                height: screenWidth(
                                                                            context) <
                                                                        800
                                                                    ? screenHeightFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            15)
                                                                    : screenWidthFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            6),
                                                                width: screenWidth(
                                                                            context) <
                                                                        800
                                                                    ? screenHeightFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            15)
                                                                    : screenWidthFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            13),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                            height:
                                                                screenHeightFraction(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                        text_helper(
                                                          data: item['title'],
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.blueAccent,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          size: screenWidth(
                                                                      context) <
                                                                  800
                                                              ? getResponsiveMassiveFontSize(
                                                                  context)
                                                              : getResponsiveSmallFontSize(
                                                                  context),
                                                        ),
                                                        text_helper(
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          data:
                                                              "PKR ${item['price']}",
                                                          color: Colors.green,
                                                          size: screenWidth(
                                                                      context) <
                                                                  800
                                                              ? getResponsiveLargeFontSize(
                                                                  context)
                                                              : getResponsiveLittleFontSize(
                                                                  context),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(
                                                              Icons.location_on,
                                                              color: Colors
                                                                  .white70,
                                                              size: screenWidth(
                                                                          context) <
                                                                      800
                                                                  ? getResponsiveMediumFontSize(
                                                                      context)
                                                                  : getResponsiveTinyFontSize(
                                                                      context),
                                                            ),
                                                            SizedBox(
                                                                width: screenWidthFraction(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                            text_helper(
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              data:
                                                                  item['city'],
                                                              size: screenWidth(
                                                                          context) <
                                                                      800
                                                                  ? getResponsiveMediumFontSize(
                                                                      context)
                                                                  : getResponsiveTinyFontSize(
                                                                      context),
                                                              color: Colors
                                                                  .white70,
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                            height:
                                                                screenHeightFraction(
                                                                    context,
                                                                    dividedBy:
                                                                        60)),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            button_helper(
                                                              borderColor:
                                                                  customBlueColor,
                                                              color:
                                                                  customBlueColor,
                                                              onPress: () =>
                                                                  viewModel
                                                                      .carDetails(
                                                                          item),
                                                              child: Text(
                                                                "Details",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      "SourceSans3",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      getResponsiveSmallFontSize(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                            button_helper(
                                                              borderColor:
                                                                  Colors.red,
                                                              color: Colors.red,
                                                              onPress: () {
                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                      backgroundColor:
                                                                          appbarBackgroundColor,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                        side:
                                                                            BorderSide(
                                                                          color:
                                                                              customBlueColor,
                                                                          width:
                                                                              1.2,
                                                                        ),
                                                                      ),
                                                                      title:
                                                                          text_helper(
                                                                        color: Colors
                                                                            .red,
                                                                        data:
                                                                            "DELETE",
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        size: screenWidth(context) <
                                                                                800
                                                                            ? getResponsiveFontSize(context,
                                                                                fontSize: 60)
                                                                            : getResponsiveMediumLargeFontSize(context),
                                                                      ),
                                                                      content:
                                                                          text_helper(
                                                                        data:
                                                                            "Are you sure?",
                                                                        size: screenWidth(context) <
                                                                                800
                                                                            ? getResponsiveFontSize(context,
                                                                                fontSize: 40)
                                                                            : getResponsiveSmallFontSize(context),
                                                                      ),
                                                                      actions: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            button_helper(
                                                                              onPress: () => Navigator.pop(context),
                                                                              child: text_helper(
                                                                                data: "No",
                                                                                size: screenWidth(context) < 800 ? getResponsiveFontSize(context, fontSize: 30) : getResponsiveSmallFontSize(context),
                                                                              ),
                                                                            ),
                                                                            horizontalSpaceMedium(context),
                                                                            button_helper(
                                                                              borderColor: Colors.red,
                                                                              color: Colors.red,
                                                                              onPress: () async {
                                                                                displayProgress(context);
                                                                                await ApiHelper.deleteCar(item['_id']);
                                                                                hideProgress(context);
                                                                                viewModel.notifyListeners();
                                                                                Navigator.pop(context);
                                                                              },
                                                                              child: text_helper(
                                                                                data: "Yes",
                                                                                size: screenWidth(context) < 800 ? getResponsiveFontSize(context, fontSize: 30) : getResponsiveSmallFontSize(context),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Text(
                                                                "Delete",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      "SourceSans3",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      getResponsiveSmallFontSize(
                                                                          context),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                    );
                                  }
                                } else if (snapshot.hasError) {
                                  return Icon(
                                    Icons.error,
                                    size: getResponsiveLargeFontSize(context),
                                  );
                                } else {
                                  return displaySimpleProgress(context);
                                }
                              },
                            ),
                          ),
                        )
                      : Expanded(
                          child: SingleChildScrollView(
                            child: FutureBuilder(
                              future: ApiHelper.allProducts(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data.toString() == '[]') {
                                    return Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.warning_amber_rounded,
                                            color: red,
                                            size: getResponsiveMassiveFontSize(
                                                context),
                                          ),
                                          text_helper(
                                            data: "No Data!",
                                            size: getResponsiveMediumFontSize(
                                                context),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    final pendingProducts = snapshot.data
                                        .where(
                                            (item) => item['status'] == "false")
                                        .toList();

                                    // Apply search filter
                                    final filteredItems =
                                        pendingProducts?.where((item) {
                                      final titleMatch = searchText.isEmpty ||
                                          item['title']
                                              .toString()
                                              .toLowerCase()
                                              .contains(
                                                  searchText.toLowerCase());

                                      final locationMatch = selectedLocation ==
                                              null ||
                                          item['city']
                                                  .toString()
                                                  .toLowerCase() ==
                                              selectedLocation!.toLowerCase();

                                      final priceMatch =
                                          selectedPrice == null ||
                                              (double.tryParse(item['price']
                                                          .toString()) ??
                                                      0) <=
                                                  selectedPrice!;

                                      return titleMatch &&
                                          locationMatch &&
                                          priceMatch;
                                    }).toList();

                                    return Padding(
                                      padding: EdgeInsets.all(
                                          screenWidthFraction(context,
                                              dividedBy: 100)),
                                      child: filteredItems.isEmpty
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.warning_amber_rounded,
                                                  color: red,
                                                  size:
                                                      getResponsiveMassiveFontSize(
                                                          context),
                                                ),
                                                text_helper(
                                                  data: searchText.isEmpty
                                                      ? "No Pending Products!"
                                                      : "No Matching Pending Products Found!",
                                                  size:
                                                      getResponsiveMediumFontSize(
                                                          context),
                                                ),
                                              ],
                                            )
                                          : Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      screenWidthFraction(
                                                          context,
                                                          dividedBy: 44)),
                                              child: Wrap(
                                                children: filteredItems
                                                    .map<Widget>((item) {
                                                  return Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical:
                                                          screenHeightFraction(
                                                              context,
                                                              dividedBy: 100),
                                                      horizontal:
                                                          screenWidthFraction(
                                                              context,
                                                              dividedBy: 100),
                                                    ),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          screenWidthFraction(
                                                              context,
                                                              dividedBy: 21),
                                                      vertical:
                                                          screenHeightFraction(
                                                              context,
                                                              dividedBy: 50),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF1E1E2F),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                        color: const Color(
                                                                0xFF00CCFF)
                                                            .withOpacity(0.3),
                                                        width: 1.2,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          14),
                                                              child: Container(
                                                                height: screenWidth(
                                                                            context) <
                                                                        800
                                                                    ? screenHeightFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            6)
                                                                    : screenHeightFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            2.95),
                                                                width: screenWidth(
                                                                            context) <
                                                                        800
                                                                    ? screenHeightFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            6)
                                                                    : screenWidthFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            7.8),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: const Color(
                                                                            0xFF00CCFF)
                                                                        .withOpacity(
                                                                            0.5),
                                                                    width: 1.2,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              14),
                                                                ),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl:
                                                                      item['img']
                                                                          [0],
                                                                  imageBuilder:
                                                                      (context,
                                                                              imageProvider) =>
                                                                          Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              14),
                                                                      image:
                                                                          DecorationImage(
                                                                        image:
                                                                            imageProvider,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  placeholder:
                                                                      (context,
                                                                              url) =>
                                                                          Center(
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: const Color(
                                                                          0xFF00CCFF),
                                                                    ),
                                                                  ),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      Container(
                                                                    width: screenWidthFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            5),
                                                                    height: screenWidthFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            5),
                                                                    color: Colors
                                                                        .white24,
                                                                    child: Icon(
                                                                      Icons
                                                                          .error,
                                                                      color: const Color(
                                                                          0xFF00CCFF),
                                                                      size: getResponsiveLargeFontSize(
                                                                          context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: screenWidthFraction(
                                                                    context,
                                                                    dividedBy:
                                                                        200)),
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              child:
                                                                  Image.asset(
                                                                "assets/Digital Card Yard Logo.png",
                                                                height: screenWidth(
                                                                            context) <
                                                                        800
                                                                    ? screenHeightFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            15)
                                                                    : screenWidthFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            6),
                                                                width: screenWidth(
                                                                            context) <
                                                                        800
                                                                    ? screenHeightFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            15)
                                                                    : screenWidthFraction(
                                                                        context,
                                                                        dividedBy:
                                                                            13),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                            height:
                                                                screenHeightFraction(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                        text_helper(
                                                          data: item['title'],
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.blueAccent,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          size: screenWidth(
                                                                      context) <
                                                                  800
                                                              ? getResponsiveMassiveFontSize(
                                                                  context)
                                                              : getResponsiveSmallFontSize(
                                                                  context),
                                                        ),
                                                        text_helper(
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          data:
                                                              "PKR ${item['price']}",
                                                          color: Colors.green,
                                                          size: screenWidth(
                                                                      context) <
                                                                  800
                                                              ? getResponsiveLargeFontSize(
                                                                  context)
                                                              : getResponsiveLittleFontSize(
                                                                  context),
                                                        ),
                                                        SizedBox(
                                                            height:
                                                                screenHeightFraction(
                                                                    context,
                                                                    dividedBy:
                                                                        60)),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            button_helper(
                                                              width:
                                                                  screenWidthFraction(
                                                                      context,
                                                                      dividedBy:
                                                                          10),
                                                              borderColor:
                                                                  customBlueColor,
                                                              color:
                                                                  customBlueColor,
                                                              onPress: () =>
                                                                  viewModel
                                                                      .productDetails(
                                                                          item),
                                                              child: Text(
                                                                "Details",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      "SourceSans3",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      getResponsiveSmallFontSize(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                            button_helper(
                                                              borderColor:
                                                                  Colors.red,
                                                              color: Colors.red,
                                                              onPress: () {
                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                      backgroundColor:
                                                                          appbarBackgroundColor,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                        side:
                                                                            BorderSide(
                                                                          color:
                                                                              customBlueColor,
                                                                          width:
                                                                              1.2,
                                                                        ),
                                                                      ),
                                                                      title:
                                                                          text_helper(
                                                                        color: Colors
                                                                            .red,
                                                                        data:
                                                                            "DELETE",
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        size: screenWidth(context) <
                                                                                800
                                                                            ? getResponsiveFontSize(context,
                                                                                fontSize: 60)
                                                                            : getResponsiveMediumLargeFontSize(context),
                                                                      ),
                                                                      content:
                                                                          text_helper(
                                                                        data:
                                                                            "Are you sure?",
                                                                        size: screenWidth(context) <
                                                                                800
                                                                            ? getResponsiveFontSize(context,
                                                                                fontSize: 40)
                                                                            : getResponsiveSmallFontSize(context),
                                                                      ),
                                                                      actions: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            button_helper(
                                                                              onPress: () => Navigator.pop(context),
                                                                              child: text_helper(
                                                                                data: "No",
                                                                                size: screenWidth(context) < 800 ? getResponsiveFontSize(context, fontSize: 30) : getResponsiveSmallFontSize(context),
                                                                              ),
                                                                            ),
                                                                            horizontalSpaceMedium(context),
                                                                            button_helper(
                                                                              borderColor: Colors.red,
                                                                              color: Colors.red,
                                                                              onPress: () async {
                                                                                displayProgress(context);
                                                                                await ApiHelper.deleteProduct(item['_id']);
                                                                                hideProgress(context);
                                                                                viewModel.notifyListeners();
                                                                                Navigator.pop(context);
                                                                              },
                                                                              child: text_helper(
                                                                                data: "Yes",
                                                                                size: screenWidth(context) < 800 ? getResponsiveFontSize(context, fontSize: 30) : getResponsiveSmallFontSize(context),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Text(
                                                                "Delete",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      "SourceSans3",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      getResponsiveSmallFontSize(
                                                                          context),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                    );
                                  }
                                } else if (snapshot.hasError) {
                                  return Icon(
                                    Icons.error,
                                    size: getResponsiveLargeFontSize(context),
                                  );
                                } else {
                                  return displaySimpleProgress(context);
                                }
                              },
                            ),
                          ),
                        ),
                  SizedBox(
                      height: screenHeightFraction(context, dividedBy: 30)),
                  Content7T1(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cat(BuildContext context, AdminViewModel viewModel, String title,
      [double leftPadding = 0]) {
    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding,
        top: screenHeightFraction(context, dividedBy: 300),
        bottom: screenHeightFraction(context, dividedBy: 300),
        right: 0,
      ),
      child: InkWell(
        onTap: () {
          viewModel.type = title;
          viewModel.notifyListeners();
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(screenWidthFraction(context, dividedBy: 130)),
          margin: EdgeInsets.all(screenWidthFraction(context, dividedBy: 100)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xFF1E1E2F),
            border: Border.all(
              color: viewModel.type == title
                  ? const Color(0xFF00CCFF)
                  : unselectedColor,
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: viewModel.type == title
                    ? const Color(0xFF00CCFF).withOpacity(0.2)
                    : Colors.transparent,
                blurRadius: 6,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '   $title   ',
                style: TextStyle(
                  color: viewModel.type == title
                      ? const Color(0xFF00CCFF)
                      : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: getResponsiveSmallFontSize(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> user(BuildContext context, AdminViewModel viewModel) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: const Color(0xFF00CCFF).withOpacity(0.5),
              width: 1.5,
            ),
          ),
          backgroundColor: backgroundColor,
          child: Users(),
        );
      },
    );
    viewModel.notifyListeners();
  }

  Future<void> aboutUs(BuildContext context, AdminViewModel viewModel) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: const Color(0xFF00CCFF).withOpacity(0.5),
              width: 1.5,
            ),
          ),
          backgroundColor: backgroundColor,
          child: AboutView(),
        );
      },
    );
    viewModel.notifyListeners();
  }

  Widget _buildUserMenu(BuildContext context, AdminViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: PopupMenuButton<int>(
        offset: const Offset(0, 50),
        color: const Color(0xFF1E1E2F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onSelected: (value) {
          switch (value) {
            // case 0:
            //   // View Profile
            //   print("View Profile");
            //   break;
            case 1:
              // Logout logic
              print("Logout");
              break;
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: -1,
            enabled: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "👋 Hello, Admin!",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Divider(color: Colors.white24),
              ],
            ),
          ),
          // const PopupMenuItem(
          //   value: 0,
          //   child: Row(
          //     children: [
          //       Icon(Icons.person, color: Colors.white),
          //       SizedBox(width: 10),
          //       Text("View Profile", style: TextStyle(color: Colors.white)),
          //     ],
          //   ),
          // ),
          PopupMenuItem(
            value: 1,
            onTap: () => viewModel.logout(),
            child: Row(
              children: [
                Icon(Icons.logout_rounded, color: Colors.red),
                SizedBox(width: 10),
                Text("Logout", style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ],
        child: Padding(
          padding: EdgeInsets.all(
            screenWidthFraction(context, dividedBy: 3000),
          ),
          child: CircleAvatar(
            backgroundColor: backgroundColor,
            child: Image.asset('assets/Digital Card Yard Logo.png'),
          ),
        ),
      ),
    );
  }

  @override
  AdminViewModel viewModelBuilder(BuildContext context) => AdminViewModel();
}
