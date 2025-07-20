import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:digitalcaryard/ui/common/apihelper/apihelper.dart';
import 'package:digitalcaryard/ui/common/app_colors.dart';
import 'package:digitalcaryard/ui/common/customwidget/button_helper.dart';
import 'package:digitalcaryard/ui/common/customwidget/snakbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import '../../common/customwidget/text_helper.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/common/btn/btn.dart';
import 'cardetails_viewmodel.dart';

class CarDetailsView extends StackedView<CardetailsViewModel> {
  CarDetailsView({Key? key, required this.details, this.type = "u"})
      : super(key: key);
  Map details;
  String type;

  @override
  Widget builder(
    BuildContext context,
    CardetailsViewModel viewModel,
    Widget? child,
  ) {
    // details = {
    //   "_id": "67647a51a61eb20766154873",
    //   "title": "audii",
    //   "des": "sadf adfads fdsafds dsf saf sf saasd f",
    //   "img": [
    //     "https://firebasestorage.googleapis.com/v0/b/digitalcardyard.appspot.com/o/user%2F01.jpg-1734638157481.jpg?alt=media&token=fc8df768-e6a0-47eb-b5ae-6cb170d2a8cd",
    //     "https://firebasestorage.googleapis.com/v0/b/digitalcardyard.appspot.com/o/user%2F02.jpg-1734638157483.jpg?alt=media&token=64291f5d-8f7f-45bf-b8c1-1a391b46088d",
    //     "https://firebasestorage.googleapis.com/v0/b/digitalcardyard.appspot.com/o/user%2F03.jpg-1734638157486.jpg?alt=media&token=e5d8d451-62c8-4b06-9165-4284bb425aac",
    //     "https://firebasestorage.googleapis.com/v0/b/digitalcardyard.appspot.com/o/user%2F04.jpg-1734638157488.jpg?alt=media&token=7cdad14f-7569-42f7-9b26-578c23fa74a7"
    //   ],
    //   "price": "456789",
    //   "milage": "789",
    //   "city": "Lahore",
    //   "year": "2024",
    //   "brand": "BMW",
    //   "register": "Registered",
    //   "color": "Black",
    //   "engine": "Petrol",
    //   "enginecapacity": "1000cc",
    //   "transmission": "Automatic",
    //   "status": "false"
    // };
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
                              data: "Car Details",
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
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white24,
                      border: Border.all(
                        color: Color(0xFF00CCFF), // Aqua border
                        width: 1.2,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              text_helper(
                                data: "Images",
                                fontWeight: FontWeight.bold,
                                size: 30,
                              ),
                              verticalSpaceSmall(context),
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: screenHeightCustom(
                                      context, 0.43), // Height of the carousel
                                  autoPlay: true, // Auto-slide
                                  enableInfiniteScroll:
                                      true, // Infinite scrolling
                                ),
                                items: details['img'].map<Widget>((url) {
                                  return InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                              child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: CachedNetworkImage(
                                              imageUrl: url,
                                              placeholder: (context, url) =>
                                                  const Center(
                                                      child:
                                                          CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                              fit: BoxFit.cover,
                                            ),
                                          ));
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: CachedNetworkImage(
                                          imageUrl: url,
                                          placeholder: (context, url) =>
                                              const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          fit: BoxFit.cover,
                                        ),
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
                                    color:
                                        const Color(0xFF00CCFF), // Aqua border
                                    width: 1.2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF00CCFF)
                                          .withOpacity(0.15),
                                      // blurRadius: 10,
                                      // offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    b(details['milage'] ?? 'N/A' + " KM",
                                        Iconsax.setting, context),
                                    b(details['city'] ?? 'N/A',
                                        Iconsax.location, context),
                                    b(details['year'] ?? 'N/A',
                                        Iconsax.calendar, context),
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
                                      return Column(
                                        children: [
                                          Container(
                                            width: screenWidth(context),
                                            padding: const EdgeInsets.all(10),
                                            margin: const EdgeInsets.fromLTRB(
                                                10, 5, 10, 0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white24,
                                              border: Border.all(
                                                color: const Color(
                                                    0xFF00CCFF), // Aqua border
                                                width: 1.2,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color(0xFF00CCFF)
                                                      .withOpacity(0.15),
                                                  // blurRadius: 10,
                                                  // offset: const Offset(5, 5),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                heading1(
                                                  context,
                                                  "Name",
                                                  snapshot.data['name'] ??
                                                      'N/A',
                                                ),
                                                heading1(
                                                  context,
                                                  "Number",
                                                  snapshot.data['number'] ??
                                                      'N/A',
                                                  0,
                                                ),
                                              ],
                                            ),
                                          ),
                                          verticalSpaceMassive(context),
                                          type == "u"
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    // button_helper(
                                                    //   color: customBlueColor,
                                                    //   borderColor:
                                                    //   customBlueColor,
                                                    //   onPress: () async {
                                                    //     displayProgress(
                                                    //         context);
                                                    //     ApiHelper.registercart(
                                                    //         snapshot
                                                    //             .data['email'],
                                                    //         details["_id"],
                                                    //         "1",
                                                    //         "car",
                                                    //         context);
                                                    //     hideProgress(context);
                                                    //   },
                                                    //   width:
                                                    //   screenWidth(context),
                                                    //   child: Row(
                                                    //     mainAxisAlignment:
                                                    //     MainAxisAlignment
                                                    //         .center,
                                                    //     children: [
                                                    //       Text(
                                                    //         "Add to Cart",
                                                    //         style: TextStyle(
                                                    //             color: Colors
                                                    //                 .white,
                                                    //             fontFamily:
                                                    //             "SourceSans3",
                                                    //             fontWeight:
                                                    //             FontWeight
                                                    //                 .bold,
                                                    //             fontSize: 14),
                                                    //       ),
                                                    //       Icon(
                                                    //         Icons
                                                    //             .add_shopping_cart_rounded,
                                                    //         color: Colors.white,
                                                    //       ),
                                                    //     ],
                                                    //   ),
                                                    // ),
                                                    // button_helper(
                                                    //   onPress: () async {
                                                    //     viewModel.toCartView();
                                                    //   },
                                                    //   width:
                                                    //   screenWidth(context),
                                                    //   child: Row(
                                                    //     mainAxisAlignment:
                                                    //     MainAxisAlignment
                                                    //         .center,
                                                    //     children: [
                                                    //       Text(
                                                    //         "VIEW CART ",
                                                    //         style: TextStyle(
                                                    //             color: Colors
                                                    //                 .white,
                                                    //             fontFamily:
                                                    //             "SourceSans3",
                                                    //             fontWeight:
                                                    //             FontWeight
                                                    //                 .bold,
                                                    //             fontSize: 14),
                                                    //       ),
                                                    //       Icon(
                                                    //         Icons
                                                    //             .shopping_cart_rounded,
                                                    //         color: Colors.white,
                                                    //       ),
                                                    //     ],
                                                    //   ),
                                                    // ),
                                                    button_helper(
                                                      onPress: () => viewModel
                                                          .chat(snapshot
                                                              .data['email']),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          text_helper(
                                                            data: "chat",
                                                            color: white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            size: 12,
                                                          ),
                                                          Icon(
                                                            Icons.chat,
                                                            color: white,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : const SizedBox.shrink(),
                                        ],
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
                              verticalSpaceMassive(context),
                              type == "a"
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        button_helper(
                                          onPress: () async {
                                            displayProgress(context);
                                            await ApiHelper.statusChange(
                                                details["_id"], "true");
                                            hideProgress(context);
                                            Navigator.pop(context);
                                          },
                                          width: screenWidth(context),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "APPROVE CAR ",
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
                                            await ApiHelper.statusChange(
                                                details["_id"], "reject");
                                            hideProgress(context);
                                            Navigator.pop(context);
                                          },
                                          width: screenWidth(context),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "REJECT CAR ",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "SourceSans3",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                              Icon(
                                                Icons.close_rounded,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox.shrink()
                            ],
                          ),
                        ),
                        horizontalSpaceSmall(context),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  text_helper(
                                    data: "Car Details",
                                    fontWeight: FontWeight.bold,
                                    size: 30,
                                  ),
                                ],
                              ),
                              Container(
                                width: screenWidth(context),
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white24,
                                  border: Border.all(
                                    color:
                                        const Color(0xFF00CCFF), // Aqua border
                                    width: 1.2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF00CCFF)
                                          .withOpacity(0.15),
                                      // blurRadius: 10,
                                      // offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    heading1(context, "Title",
                                        details['title'] ?? 'N/A'),
                                    heading1(context, "Description",
                                        details['des'] ?? 'N/A'),
                                    heading1(context, "Price",
                                        "PKR " '${details['price'] ?? 'N/A'}'),
                                    heading1(context, "City",
                                        details['city'] ?? 'N/A'),
                                    heading1(context, "Year",
                                        details['year'] ?? 'N/A'),
                                    heading1(context, "Brand",
                                        details['brand'] ?? 'N/A'),
                                    heading1(context, "Register",
                                        details['register'] ?? 'N/A'),
                                    heading1(context, "Color",
                                        details['color'] ?? 'N/A', 0),
                                  ],
                                ),
                              ),
                              verticalSpaceSmall(context),
                              verticalSpaceMedium(context),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  text_helper(
                                    data: "Other Details",
                                    fontWeight: FontWeight.bold,
                                    size: 30,
                                  ),
                                ],
                              ),
                              Container(
                                width: screenWidth(context),
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white24,
                                  border: Border.all(
                                    color:
                                        const Color(0xFF00CCFF), // Aqua border
                                    width: 1.2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF00CCFF)
                                          .withOpacity(0.15),
                                      // blurRadius: 10,
                                      // offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    heading1(context, "Engine Type",
                                        details['engine'] ?? 'N/A'),
                                    heading1(context, "Engine Capacity",
                                        details['enginecapacity'] ?? 'N/A'),
                                    heading1(context, "Transmission",
                                        details['transmission'] ?? 'N/A', 0),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget heading1(BuildContext context, String data, String data2,
      [double height = 1]) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text_helper(
                data: '$data:',
                fontWeight: FontWeight.bold,
                color: appbarBackgroundColor,
              ),
              horizontalSpaceSmall(context),
              Expanded(
                child: text_helper(
                  data: data2,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: screenWidth(context),
          height: height,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget b(String data, IconData icons, BuildContext context) {
    return Column(
      children: [
        Icon(
          icons,
          color: appbarBackgroundColor,
        ),
        verticalSpaceTiny(context),
        text_helper(
          data: data,
        )
      ],
    );
  }

  @override
  CardetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CardetailsViewModel();
}
