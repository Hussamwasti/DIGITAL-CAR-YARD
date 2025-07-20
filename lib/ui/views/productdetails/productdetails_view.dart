import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:digitalcaryard/ui/common/apihelper/apihelper.dart';
import 'package:digitalcaryard/ui/common/app_colors.dart';
import 'package:digitalcaryard/ui/common/customwidget/button_helper.dart';
import 'package:digitalcaryard/ui/common/customwidget/text_helper.dart';
import 'package:digitalcaryard/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import '../../common/customwidget/snakbar_helper.dart';
import '../../widgets/common/btn/btn.dart';
import 'productdetails_viewmodel.dart';

class ProductdetailsView extends StackedView<ProductdetailsViewModel> {
  ProductdetailsView({Key? key, required this.details, this.type = "s"})
      : super(key: key);
  final Map details;
  final String type;

  @override
  Widget builder(
      BuildContext context, ProductdetailsViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: screenHeight(context) * 0.16,
                  width: screenWidth(context),
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  decoration: const BoxDecoration(color: Color(0xFF0A0F25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        height: screenHeight(context),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Btn(
                          buttonId: '8',
                          icon: Icon(Icons.arrow_back_rounded),
                          function: () => viewModel.toHomeView(),
                        ),
                      ),
                      horizontalSpaceMedium(context),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/Digital Card Yard Logo.png",
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ],
                      ),
                      horizontalSpaceMedium(context),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(2, 2, 2, 10),
                          height: screenHeight(context),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: text_helper(
                              fontFamily: "Saira-BlackItalic",
                              data: "Product Details",
                              size: 33,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // The gradient accent stripe
                Container(
                  height: 2, // 2px tall
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white24,
                    border: Border.all(
                      color: const Color(0xFF00CCFF),
                      width: 1.2,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Left Column - Images and Owner Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image Carousel (same style as CarDetailsView)
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                text_helper(
                                  data: "Images",
                                  fontWeight: FontWeight.bold,
                                  size: 30,
                                ),
                              ],
                            ),
                            verticalSpaceSmall(context),
                            CarouselSlider(
                              options: CarouselOptions(
                                height: screenHeightCustom(context, 0.43),
                                autoPlay: true,
                                enableInfiniteScroll: true,
                              ),
                              items: details['img'].map<Widget>((url) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: CachedNetworkImage(
                                      imageUrl: url,
                                      placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator(
                                          color: const Color(0xFF00CCFF),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            verticalSpaceSmall(context),
                            Container(
                              width: screenWidth(context),
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white24,
                                border: Border.all(
                                  color: const Color(0xFF00CCFF),
                                  width: 1.2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF00CCFF)
                                        .withOpacity(0.15),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildInfoItem(Iconsax.tag,
                                      details['category'] ?? 'N/A', context),
                                  _buildInfoItem(Iconsax.dollar_circle,
                                      "PKR ${details['price']}", context),
                                  _buildInfoItem(Iconsax.location,
                                      details['city'] ?? 'N/A', context),
                                ],
                              ),
                            ),
                            verticalSpaceMedium(context),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                text_helper(
                                  data: "Owner Details",
                                  fontWeight: FontWeight.bold,
                                  size: 30,
                                ),
                              ],
                            ),
                            FutureBuilder(
                              future: ApiHelper.findOne(details['uid']),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data.toString() == '[]') {
                                    return const SizedBox.shrink();
                                  } else {
                                    return Container(
                                      width: screenWidth(context),
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 10, 20, 10),
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white24,
                                        border: Border.all(
                                          color: const Color(0xFF00CCFF),
                                          width: 1.2,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xFF00CCFF)
                                                .withOpacity(0.15),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _buildDetailRow("Name",
                                              snapshot.data['name'] ?? 'N/A'),
                                          _buildDetailRow(
                                              "Number",
                                              snapshot.data['number'] ?? 'N/A',
                                              0),
                                          verticalSpaceSmall(context),
                                          if (type == "u") ...[
                                            button_helper(
                                              onPress: () async {
                                                displayProgress(context);
                                                ApiHelper.registercart(
                                                    viewModel.sharedpref.readString("email"),
                                                    details["_id"],
                                                    "1",
                                                    "product",
                                                    context);
                                                hideProgress(context);
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  text_helper(
                                                    data: "ADD TO CART",
                                                    color:
                                                        const Color(0xff0F1A3C),
                                                    fontWeight: FontWeight.bold,
                                                    size: 12,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            verticalSpaceSmall(context),
                                            button_helper(
                                              onPress: () => viewModel
                                                  .chat(snapshot.data['email']),
                                              width: screenWidth(context),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  text_helper(
                                                    data: "CHAT",
                                                    color:
                                                        const Color(0xff0F1A3C),
                                                    fontWeight: FontWeight.bold,
                                                    size: 12,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    );
                                  }
                                } else if (snapshot.hasError) {
                                  return const Icon(Icons.error);
                                } else {
                                  return displaySimpleProgress(context);
                                }
                              },
                            ),
                            // Admin actions
                            if (type == "a") ...[
                              verticalSpaceMedium(context),
                              button_helper(
                                onPress: () async {
                                  displayProgress(context);
                                  await ApiHelper.statusChangeProduct(
                                      details["_id"], "true");
                                  hideProgress(context);
                                  Navigator.pop(context);
                                },
                                width: screenWidth(context),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "APPROVE PRODUCT ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "SourceSans3",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Icon(
                                      Icons.done_rounded,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              verticalSpaceSmall(context),
                              button_helper(
                                color: Colors.red,
                                borderColor: Colors.red,
                                onPress: () async {
                                  displayProgress(context);
                                  await ApiHelper.statusChangeProduct(
                                      details["_id"], "reject");
                                  hideProgress(context);
                                  Navigator.pop(context);
                                },
                                width: screenWidth(context),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "REJECT PRODUCT ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "SourceSans3",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Icon(
                                      Icons.close_rounded,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      horizontalSpaceSmall(context),
                      // Right Column - Product Details (same layout as CarDetailsView)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                text_helper(
                                  data: "Product Details",
                                  fontWeight: FontWeight.bold,
                                  size: 30,
                                ),
                              ],
                            ),
                            Container(
                              width: screenWidth(context),
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                              margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white24,
                                border: Border.all(
                                  color: const Color(0xFF00CCFF),
                                  width: 1.2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF00CCFF)
                                        .withOpacity(0.15),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildDetailRow(
                                      "Title", details['title'] ?? 'N/A'),
                                  _buildDetailRow(
                                      "Description", details['des'] ?? 'N/A'),
                                  _buildDetailRow(
                                      "Category", details['category'] ?? 'N/A'),
                                  _buildDetailRow("Price",
                                      "PKR ${details['price'] ?? 'N/A'}"),
                                  _buildDetailRow(
                                      "City", details['city'] ?? 'N/A'),
                                  _buildDetailRow("Condition",
                                      details['condition'] ?? 'N/A'),
                                  _buildDetailRow(
                                      "Color", details['color'] ?? 'N/A', 0),
                                ],
                              ),
                            ),
                            verticalSpaceMedium(context),
                            verticalSpaceSmall(context),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                text_helper(
                                  data: "Additional Details",
                                  fontWeight: FontWeight.bold,
                                  size: 30,
                                ),
                              ],
                            ),
                            Container(
                              width: screenWidth(context),
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                              margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white24,
                                border: Border.all(
                                  color: const Color(0xFF00CCFF),
                                  width: 1.2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF00CCFF)
                                        .withOpacity(0.15),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildDetailRow(
                                      "Brand", details['brand'] ?? 'N/A'),
                                  _buildDetailRow(
                                      "Model", details['model'] ?? 'N/A'),
                                  _buildDetailRow("Warranty",
                                      details['warranty'] ?? 'N/A', 0),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper methods (same as CarDetailsView)
  Widget _buildDetailRow(String label, String value, [double height = 1]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text_helper(
                data: '$label:',
                fontWeight: FontWeight.bold,
                color: appbarBackgroundColor,
              ),
              Expanded(
                child: text_helper(
                  data: value,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          Container(
            height: height,
            margin: const EdgeInsets.only(top: 8),
            color: Colors.white.withOpacity(0.1),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text, BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: appbarBackgroundColor),
        verticalSpaceTiny(context),
        text_helper(data: text),
      ],
    );
  }

  @override
  ProductdetailsViewModel viewModelBuilder(BuildContext context) =>
      ProductdetailsViewModel();
}
