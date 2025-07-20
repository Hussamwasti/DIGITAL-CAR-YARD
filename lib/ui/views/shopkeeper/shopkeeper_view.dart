import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalcaryard/ui/widgets/common/addproduct/addproduct.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/apihelper/apihelper.dart';
import '../../common/app_colors.dart';
import '../../common/customwidget/button_helper.dart';
import '../../common/customwidget/snakbar_helper.dart';
import '../../common/customwidget/text_helper.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/common/btn/btn.dart';
import '../../widgets/common/searchbar/searchbar.dart';
import '../about/about_view.dart';
import '../home/content7.dart';
import '../home/header_content1.dart';
import 'shopkeeper_viewmodel.dart';

class ShopkeeperView extends StackedView<ShopkeeperViewModel> {
  ShopkeeperView({Key? key}) : super(key: key);

  String searchText = '';
  String? selectedLocation;
  double? selectedPrice;

  @override
  Widget builder(
    BuildContext context,
    ShopkeeperViewModel viewModel,
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
                                      dividedBy: 200)),
                              Icon(
                                Icons.store_mall_directory_rounded,
                                size: screenWidth(context) < 800
                                    ? getResponsiveFontSize(context,
                                        fontSize: 35)
                                    : getResponsiveFontSize(context,
                                        fontSize: 35),
                              ),
                              SizedBox(
                                  width: screenWidthFraction(context,
                                      dividedBy: 150)),
                              Text(
                                'Shopkeeper',
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
                                      dividedBy: 80)),
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
                                title: "Add Product",
                                function: () {
                                  addProduct(context, viewModel);
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
                                  isNotShopkeeper: false,
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
                  verticalSpaceSmall(context),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: text_helper(
                        fontFamily: "Saira_Condensed",
                        data: "Sell Your Products Here!",
                        size: 33,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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
                              data: "Your Products",
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
                  FutureBuilder(
                    future: ApiHelper.allProducts(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.toString() == '[]') {
                          return const SizedBox.shrink();
                        } else {
                          // Filter active items first
                          final activeItems = snapshot.data
                              .where((item) => item['status'] == "true")
                              .where((item) =>
                                  item['uid'] ==
                                  viewModel.sharedpref.readString("email"))
                              .toList();

                          // Apply search filter if text exists
                          final filteredItems = activeItems?.where((item) {
                            final titleMatch = searchText.isEmpty ||
                                item['title']
                                    .toString()
                                    .toLowerCase()
                                    .contains(searchText.toLowerCase());

                            final locationMatch = selectedLocation == null ||
                                item['city'].toString().toLowerCase() ==
                                    selectedLocation!.toLowerCase();

                            final priceMatch = selectedPrice == null ||
                                (double.tryParse(item['price'].toString()) ??
                                        0) <=
                                    selectedPrice!;

                            return titleMatch && locationMatch && priceMatch;
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
                                    size: getResponsiveMediumFontSize(context),
                                  ),
                                ],
                              ),
                            );
                          }

                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidthFraction(context,
                                    dividedBy: 44)),
                            child: Wrap(
                              children: filteredItems.map<Widget>((item) {
                                return listData(
                                    item, viewModel, true, context);
                              }).toList(),
                            )


                            // SingleChildScrollView(
                            //   child: GridView.builder(
                            //     itemCount: filteredItems.length,
                            //     gridDelegate:
                            //         SliverGridDelegateWithFixedCrossAxisCount(
                            //       crossAxisCount:
                            //           MediaQuery.of(context).size.width < 800
                            //               ? 2
                            //               : 3,
                            //       crossAxisSpacing: 3,
                            //       mainAxisSpacing: 3,
                            //       childAspectRatio: 1,
                            //     ),
                            //     shrinkWrap: true,
                            //     physics: NeverScrollableScrollPhysics(),
                            //     itemBuilder: (context, index) {
                            //       final item = filteredItems[index];
                            //       return listData(
                            //           item, viewModel, true, context);
                            //     },
                            //   ),
                            // ),
                          );
                        }
                      } else if (snapshot.hasError) {
                        return const Icon(
                          Icons.error,
                        );
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
    );
  }

  Widget listData(Map item, ShopkeeperViewModel viewModel, bool delete,
      BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenHeightFraction(context, dividedBy: 40),
        horizontal: screenWidthFraction(context, dividedBy: 100),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: screenWidthFraction(context, dividedBy: 29),
        vertical: screenHeightFraction(context, dividedBy: 50),
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
                      ? screenHeightFraction(context, dividedBy: 6)
                      : screenHeightFraction(context, dividedBy: 2.5),
                  width: screenWidth(context) < 800
                      ? screenHeightFraction(context, dividedBy: 6)
                      : screenWidthFraction(context, dividedBy: 3),
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
              horizontalSpaceMedium(context),
              if (delete) ...[
                Column(
                  children: [
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
                    horizontalSpaceTiny(context),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/Digital Card Yard Logo.png",
                        height: screenWidth(context) < 800
                            ? screenHeightFraction(context, dividedBy: 15)
                            : screenWidthFraction(context, dividedBy: 6),
                        width: screenWidth(context) < 800
                            ? screenHeightFraction(context, dividedBy: 15)
                            : screenWidthFraction(context, dividedBy: 13),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
          text_helper(
            data: item['title'],
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            size: screenWidth(context) < 800
                ? getResponsiveFontSize(context, fontSize: 50)
                : getResponsiveSmallFontSize(context),
          ),
          text_helper(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            data: "PKR ${item['price']}",
            color: Colors.green,
            size: screenWidth(context) < 800
                ? getResponsiveFontSize(context, fontSize: 40)
                : getResponsiveLittleFontSize(context),
          ),
          SizedBox(height: screenHeightFraction(context, dividedBy: 60)),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              mainAxisSize: MainAxisSize.min,
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

  Future<void> addProduct(
      BuildContext context, ShopkeeperViewModel viewModel) async {
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
          child: const AddProduct(),
        );
      },
    );
    viewModel.notifyListeners();
  }

  Future<void> aboutUs(
      BuildContext context, ShopkeeperViewModel viewModel) async {
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

  Widget _buildUserMenu(BuildContext context, ShopkeeperViewModel viewModel) {
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
            case 0:
              // View Profile
              print("View Profile");
              break;
            case 2:

              break;
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
          const PopupMenuItem(
            value: 0,
            child: Row(
              children: [
                Icon(Icons.person, color: Colors.white),
                SizedBox(width: 10),
                Text("View Profile", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          PopupMenuItem(
            onTap: () => viewModel.orders(),
            value: 1,
            child: Row(
              children: [
                Icon(Icons.book_outlined, color: Colors.white),
                SizedBox(width: 10),
                Text("Orders", style: TextStyle(color: Colors.white)),
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
  ShopkeeperViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ShopkeeperViewModel();
}
