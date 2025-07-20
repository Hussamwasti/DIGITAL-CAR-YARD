import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/ui_helpers.dart';
import '../../../widgets/common/btn/btn.dart';
import 'allchat_viewmodel.dart';

class AllchatView extends StackedView<AllchatViewModel> {
  const AllchatView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AllchatViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
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
                        buttonId: '9',
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
                            data: "All Chats",
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
          FutureBuilder(
            future: ApiHelper.allChatBydid(
              viewModel.sharedpref.readString("email"),
            ),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return const Expanded(
                  child: Center(
                    child: Icon(Icons.error),
                  ),
                );
              } else if (snapshot.hasData) {
                if (snapshot.data.toString() == '[]') {
                  return const Expanded(
                    child: Center(
                      child: Text("No Chats Found!"),
                    ),
                  );
                } else {
                  return Expanded(
                    child: Row(
                      children: [
                        horizontalSpaceLarge(context),
                        Icon(
                          Icons.message_rounded,
                          size: 400,
                          color: Color(0xFF00CCFF),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              verticalSpaceSmall(context),
                              verticalSpaceLarge(context),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () async {
                                        viewModel.toChatingViewView(
                                            snapshot.data[index]['_id'],
                                            snapshot.data[index]['did']);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 20, 10),
                                        margin: const EdgeInsets.fromLTRB(
                                            50, 20, 70, 0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                            FutureBuilder(
                                              future: ApiHelper.findOne(
                                                snapshot.data[index]['uid'],
                                              ),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot snapshot2) {
                                                if (snapshot2.hasData) {
                                                  return text_helper(
                                                    data: snapshot2.data['name']
                                                        .toString(),
                                                    size: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  );
                                                } else if (snapshot2.hasError) {
                                                  return Icon(
                                                    Icons.error,
                                                    color: Colors.white,
                                                  );
                                                } else {
                                                  return const CircularProgressIndicator(
                                                    color: Color(0xFF00CCFF),
                                                  );
                                                }
                                              },
                                            ),
                                            text_helper(
                                              data: snapshot.data[index]['date']
                                                  .toString()
                                                  .substring(0, 10),
                                              size: getResponsiveTinyFontSize(
                                                  context),
                                              color: Colors.white70,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              } else {
                return const Expanded(
                    child: Center(child: Text("Unexpected Error")));
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  AllchatViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AllchatViewModel();
}
