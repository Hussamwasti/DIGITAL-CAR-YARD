import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalcaryard/ui/views/about/about_view.dart';
import 'package:digitalcaryard/ui/widgets/common/addremainder/addremainder.dart';
import 'package:digitalcaryard/ui/widgets/common/chatover/chatover.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import '../../common/apihelper/apihelper.dart';
import '../../common/app_colors.dart';
import '../../common/customwidget/button_helper.dart';
import '../../common/customwidget/snakbar_helper.dart';
import '../../common/customwidget/text_helper.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/common/addcars/addcars.dart';
import '../../widgets/common/btn/btn.dart';
import '../../widgets/common/searchbar/searchbar.dart';
import 'content7.dart';
import 'header_content1.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  HomeView({Key? key}) : super(key: key);

  OverlayEntry? _overlayEntry;
  String searchText = '';
  String? selectedLocation;
  double? selectedPrice;

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
                                      dividedBy: 100)),
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
                                title: "My Cars",
                                function: () {
                                  myCars(context, viewModel);
                                },
                              ),
                              SizedBox(
                                  width: screenWidthFraction(context,
                                      dividedBy: 100)),
                              Btn(
                                buttonId: "3",
                                title: "Remainders",
                                function: () {
                                  addRemainder(context, viewModel);
                                },
                              ),
                              SizedBox(
                                  width: screenWidthFraction(context,
                                      dividedBy: 100)),
                              Btn(
                                buttonId: "4",
                                title: "Sell Car",
                                function: () {
                                  addCar(context, viewModel);
                                },
                              ),
                              SizedBox(
                                  width: screenWidthFraction(context,
                                      dividedBy: 100)),
                              Btn(
                                buttonId: "5",
                                title: "About Us",
                                function: () {
                                  aboutUs(context, viewModel);
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
                              horizontalSpaceTiny(context),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // The gradient accent stripe
                Container(
                  height: screenWidthFraction(context, dividedBy: 1000),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF0066FF),
                        Color(0xFF00CCFF),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  HeaderContent1(),
                  verticalSpaceLarge(context),
                  Divider(
                    indent: screenWidthFraction(context, dividedBy: 4),
                    endIndent: screenWidthFraction(context, dividedBy: 4),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidthFraction(context, dividedBy: 35),
                    ),
                    child: FutureBuilder(
                      future: ApiHelper.allRemainder(
                        viewModel.sharedpref.readString("email"),
                      ),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        // Loading state
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: displaySimpleProgress(context),
                          );
                        }

                        if (snapshot.hasData) {
                          // Empty state
                          if (snapshot.data.toString() == '[]') {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    screenWidthFraction(context, dividedBy: 20),
                                vertical: screenHeightFraction(context,
                                    dividedBy: 40),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text_helper(
                                    fontFamily: "Saira-BlackItalic",
                                    data: "Remainders",
                                    size: screenWidth(context) < 800
                                        ? getResponsiveFontSize(context,
                                            fontSize: 45)
                                        : getResponsiveExtraLargeFontSize(
                                            context),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  verticalSpaceMedium(context),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.warning_amber_rounded,
                                          color: red,
                                          size: getResponsiveFontSize(context,
                                              fontSize: 150),
                                        ),
                                        text_helper(
                                          data: "No Remainders!",
                                          size: getResponsiveMediumFontSize(
                                              context),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          // Data exists
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidthFraction(context,
                                      dividedBy: 20),
                                  vertical: screenHeightFraction(context,
                                      dividedBy: 40),
                                ),
                                child: text_helper(
                                  fontFamily: "Saira-BlackItalic",
                                  data: "Remainders",
                                  size: screenWidth(context) < 800
                                      ? getResponsiveFontSize(context,
                                          fontSize: 45)
                                      : getResponsiveExtraLargeFontSize(
                                          context),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidthFraction(context,
                                        dividedBy: 20)),
                                child: GridView.builder(
                                  itemCount: snapshot.data.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        MediaQuery.of(context).size.width < 800
                                            ? 3
                                            : 4,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 43,
                                    childAspectRatio: 1,
                                  ),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    // it works fine without checking or filtering the date
                                    return _buildRemainderCard(
                                        context, snapshot, index);
                                  },
                                  // itemBuilder: (context, index) {
                                  //   // Keep all your original date comparison logic here
                                  //   String today = DateTime.now()
                                  //       .toString()
                                  //       .substring(0, 10);
                                  //   String dataDate =
                                  //       snapshot.data[index]["date"] ?? "N/A";
                                  //   String freqStr =
                                  //       snapshot.data[index]["freq"] ?? "N/A";
                                  //
                                  //   if (dataDate == today) {
                                  //     return _buildRemainderCard(
                                  //         context, snapshot, index);
                                  //   }
                                  //
                                  //   if (freqStr.isNotEmpty) {
                                  //     int? freqDays = int.tryParse(freqStr);
                                  //     if (freqDays != null &&
                                  //         freqDays >= 0 &&
                                  //         freqDays < 10000) {
                                  //       try {
                                  //         DateTime originalDate =
                                  //             DateTime.parse(dataDate);
                                  //         DateTime nextDate = originalDate
                                  //             .add(Duration(days: freqDays));
                                  //
                                  //         if (nextDate
                                  //                 .toString()
                                  //                 .substring(0, 10) ==
                                  //             today) {
                                  //           if (dataDate != today) {
                                  //             ApiHelper.updateRemDate(
                                  //               snapshot.data[index]["_id"],
                                  //               today,
                                  //             );
                                  //           }
                                  //           return _buildRemainderCard(
                                  //               context, snapshot, index);
                                  //         }
                                  //       } catch (e) {
                                  //         return const SizedBox.shrink();
                                  //       }
                                  //     }
                                  //   }
                                  //
                                  //   return const SizedBox.shrink();
                                  // },
                                ),
                              ),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  verticalSpaceSmall(context),
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
                      ? FutureBuilder(
                          future: ApiHelper.allCar(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final activeItems = snapshot.data
                                  ?.where((item) => item['status'] == "true")
                                  .toList();

                              final filteredItems = activeItems?.where((item) {
                                final titleMatch = searchText.isEmpty ||
                                    item['title']
                                        .toString()
                                        .toLowerCase()
                                        .contains(searchText.toLowerCase());

                                final locationMatch =
                                    selectedLocation == null ||
                                        item['city'].toString().toLowerCase() ==
                                            selectedLocation!.toLowerCase();

                                final priceMatch = selectedPrice == null ||
                                    (double.tryParse(
                                                item['price'].toString()) ??
                                            0) <=
                                        selectedPrice!;

                                return titleMatch &&
                                    locationMatch &&
                                    priceMatch;
                              }).toList();

                              if (filteredItems!.isEmpty) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.warning_amber_rounded,
                                          size: 100, color: Colors.red),
                                      Text(
                                        searchText.isEmpty
                                            ? "No Cars Available!"
                                            : "No Matching Cars Found!",
                                      ),
                                    ],
                                  ),
                                );
                              }

                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidthFraction(context,
                                        dividedBy: 14)),
                                child: Wrap(
                                  children: filteredItems.map((item) {
                                    return listData(
                                        item, viewModel, false, true, context);
                                  }).toList(),
                                )


                                // GridView.builder(
                                //   itemCount: filteredItems.length,
                                //   gridDelegate:
                                //       SliverGridDelegateWithFixedCrossAxisCount(
                                //     crossAxisCount:
                                //         MediaQuery.of(context).size.width < 800
                                //             ? 2
                                //             : 4,
                                //     crossAxisSpacing: 3,
                                //     mainAxisSpacing: 3,
                                //     childAspectRatio: 0.78,
                                //   ),
                                //   shrinkWrap: true,
                                //   physics: NeverScrollableScrollPhysics(),
                                //   itemBuilder: (context, index) {
                                //     final item = filteredItems[index];
                                //     return listData(
                                //         item, viewModel, false, true, context);
                                //   },
                                // ),
                              );
                            } else if (snapshot.hasError) {
                              return const Center(child: Icon(Icons.error));
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        )
                      : FutureBuilder(
                          future: ApiHelper.allProducts(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              // Filter active items first
                              final activeItems = snapshot.data
                                  .where((item) => item['status'] == "true")
                                  .toList();

                              // Apply search filter if text exists
                              final filteredItems = activeItems?.where((item) {
                                final titleMatch = searchText.isEmpty ||
                                    item['title']
                                        .toString()
                                        .toLowerCase()
                                        .contains(searchText.toLowerCase());

                                final locationMatch =
                                    selectedLocation == null ||
                                        item['city'].toString().toLowerCase() ==
                                            selectedLocation!.toLowerCase();

                                final priceMatch = selectedPrice == null ||
                                    (double.tryParse(
                                                item['price'].toString()) ??
                                            0) <=
                                        selectedPrice!;

                                return titleMatch &&
                                    locationMatch &&
                                    priceMatch;
                              }).toList();

                              if (filteredItems.isEmpty) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.warning_amber_rounded,
                                        color: red,
                                        size: getResponsiveFontSize(context,
                                            fontSize: 150),
                                      ),
                                      text_helper(
                                        data: searchText.isEmpty
                                            ? "No Products Available!"
                                            : "No Matching Products Found!",
                                        size: getResponsiveMediumFontSize(
                                            context),
                                      ),
                                    ],
                                  ),
                                );
                              }

                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidthFraction(context,
                                        dividedBy: 14)),
                                child: Wrap(
                                  children: filteredItems.map<Widget>((item) {
                                    return listDataProduct(
                                        item, viewModel, false, context);
                                  }).toList(),
                                )


                                // SingleChildScrollView(
                                //   child: GridView.builder(
                                //     itemCount: filteredItems.length,
                                //     gridDelegate:
                                //         SliverGridDelegateWithFixedCrossAxisCount(
                                //       crossAxisCount:
                                //           MediaQuery.of(context).size.width <
                                //                   800
                                //               ? 2
                                //               : 4,
                                //       crossAxisSpacing: 3,
                                //       mainAxisSpacing: 3,
                                //       childAspectRatio: 0.85,
                                //     ),
                                //     shrinkWrap: true,
                                //     physics:
                                //         NeverScrollableScrollPhysics(), // Prevent scroll conflict if nested
                                //     itemBuilder: (context, index) {
                                //       final item = filteredItems[index];
                                //       return listDataProduct(
                                //           item, viewModel, false, context);
                                //     },
                                //   ),
                                // ),
                              );
                            } else if (snapshot.hasError) {
                              return const Icon(Icons.error);
                            } else {
                              return displaySimpleProgress(context);
                            }
                          },
                        ),
                  verticalSpaceMedium(context),
                  Content7T1()
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Color(0xFF00CCFF),
        onPressed: () async {
          if (_overlayEntry == null) {
            Map c = await ApiHelper.registerChat(
                viewModel.sharedpref.readString("email"), "admin@admin.com");
            if (c['status']) {
              _showChatInterface(context, c['message'], c['did'], viewModel);
            }
          } else {
            _overlayEntry?.remove();
            _overlayEntry = null;
          }
        },
        child: const Icon(
          Iconsax.message1,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget cat(BuildContext context, HomeViewModel viewModel, String title,
      [double leftPadding = 0]) {
    return Padding(
      padding: EdgeInsets.only(
          left: leftPadding,
          top: 0.0,
          bottom: screenHeightFraction(context, dividedBy: 40),
          right: 0),
      child: InkWell(
        onTap: () {
          viewModel.type = title;
          viewModel.notifyListeners();
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: screenHeightFraction(context, dividedBy: 40),
            horizontal: screenWidthFraction(context, dividedBy: 100),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: screenWidthFraction(context, dividedBy: 100),
            vertical: screenHeightFraction(context, dividedBy: 30),
          ),
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
                    ? const Color(0xFF00CCFF).withOpacity(0.2) // Subtle glow
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
                  fontSize: getResponsiveSmallMediumFontSize(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showChatInterface(
      BuildContext context, String id, String did, HomeViewModel viewModel) {
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: screenWidth(context) < 800
            ? screenHeightFraction(context, dividedBy: 100)
            : screenHeightFraction(context, dividedBy: 50),
        right: screenWidth(context) < 800
            ? screenWidthFraction(context, dividedBy: 100)
            : screenWidthFraction(context, dividedBy: 100),
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: screenWidth(context) < 800
                ? screenWidthFraction(context, dividedBy: 30)
                : screenWidthFraction(context, dividedBy: 4),
            height: screenWidth(context) < 800
                ? screenHeightFraction(context, dividedBy: 30)
                : screenHeightFraction(context, dividedBy: 1.25),
            decoration: BoxDecoration(
              color: const Color(0xFF0A0F25),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
              border: Border.all(
                color: const Color(0xFF00CCFF).withOpacity(0.5),
                width: 1.5,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                children: [
                  // Header
                  Container(
                    height: screenWidth(context) < 800
                        ? screenHeightFraction(context, dividedBy: 30)
                        : screenHeightFraction(context, dividedBy: 13),
                    decoration: BoxDecoration(
                      color: Color(0xFF00CCFF),
                      borderRadius: BorderRadius.circular(10),
                      border: Border(
                        bottom: BorderSide(
                          color: const Color(0xFF00CCFF).withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidthFraction(context, dividedBy: 80),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.chat,
                          color: Color(0xFF0A0F25),
                          size: getResponsiveMediumLargeFontSize(context),
                        ),
                        SizedBox(
                            width:
                                screenWidthFraction(context, dividedBy: 130)),
                        Text(
                          'Chat',
                          style: TextStyle(
                            color: Color(0xFF0A0F25),
                            fontSize: getResponsiveMediumFontSize(context),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.close_rounded,
                            size: getResponsiveMediumLargeFontSize(context),
                          ),
                          color: Color(0xFF0A0F25),
                          onPressed: _removeChatInterface,
                        ),
                      ],
                    ),
                  ),
                  // Chat content
                  Expanded(
                    child: ChatOver(
                      id: id,
                      did: did,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    overlay?.insert(_overlayEntry!);
  }

  void _removeChatInterface() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  Widget listData(Map item, HomeViewModel viewModel, bool delete,
      bool isNotOwnCar, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenHeightFraction(context, dividedBy: 50),
        horizontal: screenWidthFraction(context, dividedBy: 100),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: screenWidthFraction(context, dividedBy: 60),
        vertical: screenHeightFraction(context, dividedBy: 80),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2F),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF00CCFF).withOpacity(0.3),
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  height: screenWidth(context) < 800
                      ? screenHeightFraction(context, dividedBy: 6.3)
                      : screenHeightFraction(context, dividedBy: 3.6),
                  width: screenWidth(context) < 800
                      ? screenHeightFraction(context, dividedBy: 6.3)
                      : screenWidthFraction(context, dividedBy: 3.6),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF00CCFF).withOpacity(0.5),
                      width: 1.2,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: item['img'][0],
                    imageBuilder: (context, imageProvider) => Container(
                      width: screenWidthCustom(context, 0.1),
                      height: screenWidthCustom(context, 0.1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: const Color(0xFF00CCFF),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: screenWidthFraction(context, dividedBy: 5),
                      height: screenWidthFraction(context, dividedBy: 5),
                      color: Colors.white24,
                      child: Icon(
                        Icons.error,
                        color: const Color(0xFF00CCFF),
                      ),
                    ),
                  ),
                ),
              ),
              if (delete) ...[
                horizontalSpaceMedium(context),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context) < 800
                        ? screenWidthFraction(context, dividedBy: 80)
                        : screenWidthFraction(context, dividedBy: 80),
                    vertical: screenWidth(context) < 800
                        ? screenHeightFraction(context, dividedBy: 200)
                        : screenHeightFraction(context, dividedBy: 100),
                  ),
                  decoration: BoxDecoration(
                    color: item['status'] == "true"
                        ? Colors.green.withOpacity(0.2)
                        : Colors.amber.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: item['status'] == "true"
                          ? Colors.green
                          : Colors.amber,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    item['status'] == "true"
                        ? "Approved"
                        : item['status'] == "false"
                            ? "Pending"
                            : item['status'],
                    style: TextStyle(
                      color: item['status'] == "true"
                          ? Colors.green
                          : Colors.amber,
                      fontSize: screenWidth(context) < 800
                          ? getResponsiveFontSize(context, fontSize: 10)
                          : getResponsiveSmallFontSize(context),
                    ),
                  ),
                ),
              ],
            ],
          ),

          verticalSpaceSmall(context),

          Text(
            item['title'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "SourceSans3",
              fontWeight: FontWeight.bold,
              fontSize: screenWidth(context) < 800
                  ? getResponsiveFontSize(context, fontSize: 30)
                  : getResponsiveSmallFontSize(context),
              color: Colors.blueAccent,
            ),
          ),
          Text(
            "PKR ${item['price']}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "SourceSans3",
              color: Colors.green,
              fontSize: screenWidth(context) < 800
                  ? getResponsiveFontSize(context, fontSize: 20)
                  : getResponsiveLittleFontSize(context),
            ),
          ),
          // location row
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.white70,
                size: screenWidth(context) < 800
                    ? getResponsiveFontSize(context, fontSize: 18)
                    : getResponsiveTinyFontSize(context),
              ),
              SizedBox(width: screenWidthFraction(context, dividedBy: 100)),
              text_helper(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                data: item['city'],
                size: screenWidth(context) < 800
                    ? getResponsiveFontSize(context, fontSize: 18)
                    : getResponsiveTinyFontSize(context),
                color: Colors.white70,
              ),
            ],
          ),
          SizedBox(height: screenHeightFraction(context, dividedBy: 60)),

          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (isNotOwnCar) ...[
                button_helper(
                  width: screenWidthFraction(context, dividedBy: 10),
                  onPress: () => viewModel.carDetails(item),
                  child: Text(
                    "Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SourceSans3",
                      fontWeight: FontWeight.bold,
                      fontSize: getResponsiveSmallFontSize(context),
                    ),
                  ),
                ),
              ],
              horizontalSpaceMedium(context),
              if (delete) ...[
                button_helper(
                  borderColor: Colors.red,
                  color: Colors.red,
                  onPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: appbarBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: customBlueColor,
                              width: 1.2,
                            ),
                          ),
                          title: text_helper(
                            color: Colors.red,
                            data: "DELETE",
                            fontWeight: FontWeight.bold,
                            size: screenWidth(context) < 800
                                ? getResponsiveFontSize(context,
                                    fontSize: 60)
                                : getResponsiveMediumLargeFontSize(context),
                          ),
                          content: text_helper(
                            data: "Are you sure?",
                            size: screenWidth(context) < 800
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
                                  onPress: () async {
                                    displayProgress(context);
                                    // await ApiHelper.deleteCar(item['_id']);
                                    hideProgress(context);
                                    Navigator.pop(context);
                                  },
                                  child: text_helper(
                                    data: "No",
                                    size: screenWidth(context) < 800
                                        ? getResponsiveFontSize(context,
                                            fontSize: 30)
                                        : getResponsiveSmallFontSize(
                                            context),
                                  ),
                                ),
                                horizontalSpaceMedium(context),
                                button_helper(
                                  borderColor: Colors.red,
                                  color: Colors.red,
                                  onPress: () async {
                                    displayProgress(context);
                                    await ApiHelper.deleteProduct(
                                        item['_id']);
                                    hideProgress(context);
                                    viewModel.notifyListeners();
                                    Navigator.pop(context);
                                  },
                                  child: text_helper(
                                    data: "Yes",
                                    size: screenWidth(context) < 800
                                        ? getResponsiveFontSize(context,
                                            fontSize: 30)
                                        : getResponsiveSmallFontSize(
                                            context),
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
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SourceSans3",
                      fontWeight: FontWeight.bold,
                      fontSize: getResponsiveSmallFontSize(context),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget listDataProduct(
      Map item, HomeViewModel viewModel, bool delete, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenHeightFraction(context, dividedBy: 50),
        horizontal: screenWidthFraction(context, dividedBy: 100),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: screenWidthFraction(context, dividedBy: 40),
        vertical: screenHeightFraction(context, dividedBy: 80),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2F),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF00CCFF).withOpacity(0.3),
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image with improved styling
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  height: screenWidth(context) < 800
                      ? screenHeightFraction(context, dividedBy: 6)
                      : screenHeightFraction(context, dividedBy: 3.6),
                  width: screenWidth(context) < 800
                      ? screenHeightFraction(context, dividedBy: 6)
                      : screenWidthFraction(context, dividedBy: 3.6),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF00CCFF).withOpacity(0.5),
                      width: 1.2,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: item['img'][0],
                    imageBuilder: (context, imageProvider) => Container(
                      width: screenWidthCustom(context, 0.1),
                      height: screenWidthCustom(context, 0.1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: const Color(0xFF00CCFF),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: screenWidthFraction(context, dividedBy: 5),
                      height: screenWidthFraction(context, dividedBy: 5),
                      color: Colors.white24,
                      child: Icon(
                        Icons.error,
                        color: const Color(0xFF00CCFF),
                      ),
                    ),
                  ),
                ),
              ),
              if (delete) ...[
                horizontalSpaceMedium(context),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context) < 800
                        ? screenWidthFraction(context, dividedBy: 80)
                        : screenWidthFraction(context, dividedBy: 80),
                    vertical: screenWidth(context) < 800
                        ? screenHeightFraction(context, dividedBy: 200)
                        : screenHeightFraction(context, dividedBy: 100),
                  ),
                  decoration: BoxDecoration(
                    color: item['status'] == "true"
                        ? Colors.green.withOpacity(0.2)
                        : Colors.amber.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: item['status'] == "true"
                          ? Colors.green
                          : Colors.amber,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    item['status'] == "true"
                        ? "Approved"
                        : item['status'] == "false"
                            ? "Pending"
                            : item['status'],
                    style: TextStyle(
                      color: item['status'] == "true"
                          ? Colors.green
                          : Colors.amber,
                      fontSize: screenWidth(context) < 800
                          ? getResponsiveFontSize(context, fontSize: 10)
                          : getResponsiveSmallFontSize(context),
                    ),
                  ),
                ),
              ],
            ],
          ),

          verticalSpaceSmall(context),

          Text(
            item['title'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "SourceSans3",
              fontWeight: FontWeight.bold,
              fontSize: screenWidth(context) < 800
                  ? getResponsiveFontSize(context, fontSize: 50)
                  : getResponsiveSmallFontSize(context),
              color: customBlueColor,
            ),
          ),
          Text(
            "PKR ${item['price']}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "SourceSans3",
              color: Colors.green,
              fontSize: screenWidth(context) < 800
                  ? getResponsiveFontSize(context, fontSize: 40)
                  : getResponsiveLittleFontSize(context),
            ),
          ),
          SizedBox(height: screenHeightFraction(context, dividedBy: 60)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              button_helper(
                width: screenWidthFraction(context, dividedBy: 10),
                onPress: () => viewModel.productDetails(item),
                child: Text(
                  "Details",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "SourceSans3",
                    fontWeight: FontWeight.bold,
                    fontSize: getResponsiveSmallFontSize(context),
                  ),
                ),
              ),
              horizontalSpaceMedium(context),
              if (delete) ...[
                button_helper(
                  borderColor: Colors.red,
                  color: Colors.red,
                  onPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: appbarBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: customBlueColor,
                              width: 1.2,
                            ),
                          ),
                          title: text_helper(
                            color: Colors.red,
                            data: "DELETE",
                            fontWeight: FontWeight.bold,
                            size: screenWidth(context) < 800
                                ? getResponsiveFontSize(context,
                                    fontSize: 60)
                                : getResponsiveMediumLargeFontSize(context),
                          ),
                          content: text_helper(
                            data: "Are you sure?",
                            size: screenWidth(context) < 800
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
                                  onPress: () async {
                                    displayProgress(context);
                                    // await ApiHelper.deleteCar(item['_id']);
                                    hideProgress(context);
                                    Navigator.pop(context);
                                  },
                                  child: text_helper(
                                    data: "No",
                                    size: screenWidth(context) < 800
                                        ? getResponsiveFontSize(context,
                                            fontSize: 30)
                                        : getResponsiveSmallFontSize(
                                            context),
                                  ),
                                ),
                                horizontalSpaceMedium(context),
                                button_helper(
                                  borderColor: Colors.red,
                                  color: Colors.red,
                                  onPress: () async {
                                    displayProgress(context);
                                    await ApiHelper.deleteProduct(
                                        item['_id']);
                                    hideProgress(context);
                                    viewModel.notifyListeners();
                                    Navigator.pop(context);
                                  },
                                  child: text_helper(
                                    data: "Yes",
                                    size: screenWidth(context) < 800
                                        ? getResponsiveFontSize(context,
                                            fontSize: 30)
                                        : getResponsiveSmallFontSize(
                                            context),
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
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SourceSans3",
                      fontWeight: FontWeight.bold,
                      fontSize: getResponsiveSmallFontSize(context),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Future<void> addCar(BuildContext context, HomeViewModel viewModel) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: Color(0xFF00CCFF).withOpacity(0.5),
              width: 1.5,
            ),
          ),
          child: const AddCars(),
        );
      },
    );
    viewModel.notifyListeners();
  }

  Future<void> addRemainder(
      BuildContext context, HomeViewModel viewModel) async {
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
          child: AddRemainder(),
        );
      },
    );
    viewModel.notifyListeners();
  }

  Future<void> aboutUs(BuildContext context, HomeViewModel viewModel) async {
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

  Future<void> myCars(BuildContext context, HomeViewModel viewModel) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF0A0F25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: const Color(0xFF00CCFF).withOpacity(0.5),
              width: 1.5,
            ),
          ),
          child: Container(
            color: backgroundColor,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 1,
              maxWidth: MediaQuery.of(context).size.width * 1,
            ),
            child: Column(
              children: [
                Container(
                  height: 90,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0A0F25),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        color: const Color(0xFF00CCFF).withOpacity(0.5),
                        width: 1.5,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/Digital Card Yard Logo.png",
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Text(
                        'My Cars',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Saira-BlackItalic",
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 2,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF0066FF), Color(0xFF00CCFF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
                // Content
                Expanded(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        horizontalSpaceLarge(context),
                        horizontalSpaceLarge(context),
                        horizontalSpaceMedium(context),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "assets/Digital Card Yard Logo.png",
                              width: screenWidthCustom(context, 0.25),
                              height: screenWidthCustom(context, 0.20),
                            ),
                            text_helper(
                              fontFamily: "Ethnocentric",
                              data: "Digital Car Yard",
                              size: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )
                          ],
                        ),
                        horizontalSpaceLarge(context),
                        horizontalSpaceLarge(context),
                        FutureBuilder(
                          future: ApiHelper.allCar(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xFF00CCFF),
                                ),
                              );
                            }

                            if (snapshot.hasError) {
                              return Center(
                                child: Icon(
                                  Icons.error,
                                ),
                              );
                            }

                            if (!snapshot.hasData ||
                                snapshot.data.toString() == '[]') {
                              return const Center(
                                child: Text(
                                  "No Cars Found!",
                                ),
                              );
                            }

                            final userCars = snapshot.data
                                .where((item) =>
                                    item['uid'] ==
                                    viewModel.sharedpref.readString("email"))
                                .toList();

                            if (userCars.isEmpty) {
                              return const Center(
                                child: Text(
                                  "No Cars Registered!",
                                  style: TextStyle(color: Colors.white70),
                                ),
                              );
                            }

                            return Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.all(8),
                                itemCount: userCars.length,
                                itemBuilder: (context, index) {
                                  return listData(userCars[index], viewModel,
                                      true, false, context);
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    viewModel.notifyListeners();
  }

  Widget _buildRemainderCard(
      BuildContext context, AsyncSnapshot snapshot, int index) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenHeightFraction(context, dividedBy: 40),
        horizontal: screenWidthFraction(context, dividedBy: 100),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: screenWidthFraction(context, dividedBy: 90),
        vertical: screenHeightFraction(context, dividedBy: 90),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2F),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF00CCFF).withOpacity(0.5),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00CCFF).withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          text_helper(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            data: snapshot.data[index]["title"] ?? "N/A",
            fontWeight: FontWeight.bold,
            size: screenWidth(context) < 800
                ? getResponsiveFontSize(context, fontSize: 50)
                : getResponsiveSmallFontSize(context),
            color: customBlueColor,
          ),
          verticalSpaceSmall(context),
          Expanded(
            child: text_helper(
              overflow: TextOverflow.ellipsis,
              maxLines: 6,
              data: snapshot.data[index]["des"] ?? "N/A",
              size: screenWidth(context) < 800
                  ? getResponsiveFontSize(context, fontSize: 40)
                  : getResponsiveLittleFontSize(context),
              textAlign: TextAlign.start,
              color: Colors.white70,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: text_helper(
              data: snapshot.data[index]["date"] ?? "N/A",
              size: screenWidth(context) < 800
                  ? getResponsiveFontSize(context, fontSize: 40)
                  : getResponsiveLittleFontSize(context),
              color: const Color(0xFF00CCFF).withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserMenu(BuildContext context, HomeViewModel viewModel) {
    String? imgUrl = viewModel.sharedpref.readString('img');
    String? nameUrl = viewModel.sharedpref.readString('name');
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
              // Cart View
              print('Cart View');
              break;
            case 2:
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
                  "👋 Hello, $nameUrl!",
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
            onTap: viewModel.orders,
            value: 0,
            child: Row(
              children: [
                Icon(Icons.menu, color: Colors.white),
                SizedBox(width: 10),
                Text("My Orders", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          PopupMenuItem(
            onTap: viewModel.toCartView,
            value: 1,
            child: Row(
              children: [
                Icon(Icons.shopping_cart_rounded, color: Colors.white),
                SizedBox(width: 10),
                Text("View Cart", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          PopupMenuItem(
            value: 2,
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
          child: imgUrl != null && imgUrl.isNotEmpty
              ? CircleAvatar(
                  backgroundImage: NetworkImage(imgUrl),
                  backgroundColor: Colors.grey[300],
                )
              : CircleAvatar(
                  // radius: screenWidthFraction(context, dividedBy: 300),
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, color: Colors.white),
                ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
