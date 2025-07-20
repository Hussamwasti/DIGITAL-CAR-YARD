import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import '../../../common/ui_helpers.dart';
import '../../../widgets/common/btn/btn.dart';
import 'chating_view_viewmodel.dart';

class ChatingViewView extends StackedView<ChatingViewViewModel> {
  ChatingViewView({Key? key, required this.id, required this.did})
      : super(key: key);
  String id, did;
  @override
  Widget builder(
    BuildContext context,
    ChatingViewViewModel viewModel,
    Widget? child,
  ) {
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
                          buttonId: '10',
                          icon: Icon(Icons.arrow_back_rounded),
                          function: () => viewModel.toAllChatView(),
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
                              data: 'Chat',
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
              child: FutureBuilder(
                future: ApiHelper.allChatByid(id),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data['c'].toString() == '[]') {
                      return const Center(
                        child: Text("No Messages!"),
                      );
                    } else {
                      List l = List.of(snapshot.data['c']).reversed.toList();
                      return ListView.builder(
                        itemCount: l.length,
                        reverse: true,
                        itemBuilder: (BuildContext context, int index) {
                          var sender = l[index]['sendby'] ==
                              viewModel.sharedpref.readString("email");
                          return Align(
                            alignment: sender
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              margin: EdgeInsets.fromLTRB(
                                  sender ? 40 : 10, 5, sender ? 10 : 40, 5),
                              decoration: BoxDecoration(
                                color:
                                    sender ? Colors.white24 : Colors.blueGrey,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(sender ? 12 : 0),
                                  topRight: Radius.circular(sender ? 0 : 12),
                                  bottomLeft: Radius.circular(sender ? 12 : 12),
                                  bottomRight:
                                      Radius.circular(sender ? 12 : 12),
                                ),
                                border: Border.all(
                                  color: const Color(0xFF00CCFF), // Aqua border
                                  width: 1.2,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  l[index]['sendby'] != "admin@admin.com"
                                      ? FutureBuilder(
                                          future: ApiHelper.findOne(
                                              l[index]['sendby']),
                                          builder: (BuildContext context,
                                              AsyncSnapshot snapshot) {
                                            if (snapshot.hasData) {
                                              return text_helper(
                                                data: snapshot.data['name']
                                                    .toString(),
                                                color: Color(0xFF0A0F25),
                                                fontFamily: "Saira_Condensed",
                                                size: getResponsiveTinyFontSize(
                                                    context),
                                                textAlign: TextAlign.start,
                                              );
                                            } else if (snapshot.hasError) {
                                              return const Icon(
                                                Icons.error,
                                                color: black,
                                              );
                                            } else {
                                              return displaySimpleProgress(
                                                  context);
                                            }
                                          },
                                        )
                                      : text_helper(
                                          fontFamily: "Saira_Condensed",
                                          color: Color(0xFF0A0F25),
                                          data: "Admin",
                                          size: getResponsiveTinyFontSize(
                                              context),
                                          textAlign: TextAlign.start,
                                        ),
                                  text_helper(
                                    data: l[index]['mess'].toString(),
                                    color: unselectedColor,
                                    size: getResponsiveLittleFontSize(context),
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.start,
                                  ),
                                  text_helper(
                                    fontFamily: "Saira_Condensed",
                                    color: Color(0xFF0A0F25),
                                    data: l[index]['date']
                                        .toString()
                                        .substring(0, 15),
                                    size: getResponsiveTinyFontSize(context),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  } else if (snapshot.hasError) {
                    return const Icon(
                      Icons.error,
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: screenWidth(context),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: text_view_helper(
                            hint: "Enter Message",
                            prefix: const Icon(
                              Icons.chat,
                              color: Color(0xFF00CCFF),
                            ),
                            controller: viewModel.chat)),
                    horizontalSpaceTiny(context),
                    InkWell(
                      onTap: () async {
                        await ApiHelper.addChat(
                            id,
                            {
                              "sendby":
                                  viewModel.sharedpref.readString("email"),
                              "mess": viewModel.chat.text,
                              "date": DateTime.now().toString()
                            },
                            did);
                        viewModel.chat.clear();
                        viewModel.notifyListeners();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFF00CCFF),
                        ),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    horizontalSpaceTiny(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ChatingViewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatingViewViewModel();
}
