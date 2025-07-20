import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import '../../../common/ui_helpers.dart';
import 'chatover_model.dart';

class ChatOver extends StackedView<ChatoverModel> {
  ChatOver({super.key, required this.id, required this.did});
  String id;
  String did;

  @override
  Widget builder(
    BuildContext context,
    ChatoverModel viewModel,
    Widget? child,
  ) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: ApiHelper.allChatByid(id),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data['c'].toString() == '[]') {
                  return Center(
                    child: Text(
                      "No Messages!",
                      style: TextStyle(
                        fontSize: getResponsiveMediumFontSize(context),
                      ),
                    ),
                  );
                } else {
                  List l = List.of(snapshot.data['c']).reversed.toList();
                  return ListView.builder(
                    itemCount: l.length,
                    reverse: true,
                    itemBuilder: (BuildContext context, int index) {
                      var sender = l[index]['sendby'] ==
                          viewModel.sharedpref.readString("email");

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                          alignment: sender
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            width: screenWidthFraction(context, dividedBy: 6),
                            padding: EdgeInsets.symmetric(
                              vertical:
                                  screenHeightFraction(context, dividedBy: 100),
                              horizontal:
                                  screenWidthFraction(context, dividedBy: 100),
                            ),
                            margin: EdgeInsets.fromLTRB(
                              sender
                                  ? screenWidthFraction(context, dividedBy: 100)
                                  : screenWidthFraction(context,
                                      dividedBy: 400),
                              screenHeightFraction(context, dividedBy: 80),
                              sender
                                  ? screenWidthFraction(context, dividedBy: 400)
                                  : screenWidthFraction(context,
                                      dividedBy: 100),
                              screenHeightFraction(context, dividedBy: 80),
                            ),
                            decoration: BoxDecoration(
                              color: sender ? Colors.white24 : Colors.blueGrey,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(sender ? 12 : 0),
                                topRight: Radius.circular(sender ? 0 : 12),
                                bottomLeft: const Radius.circular(12),
                                bottomRight: const Radius.circular(12),
                              ),
                              border: Border.all(
                                color: const Color(0xFF00CCFF),
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
                                              color: const Color(0xFF0A0F25),
                                              data: snapshot.data['name']
                                                  .toString(),
                                              size: getResponsiveTinyFontSize(
                                                  context),
                                              textAlign: TextAlign.start,
                                            );
                                          } else if (snapshot.hasError) {
                                            return Icon(
                                              Icons.error,
                                              color: black,
                                              size: getResponsiveSmallFontSize(
                                                  context),
                                            );
                                          } else {
                                            return displaySimpleProgress(
                                                context);
                                          }
                                        },
                                      )
                                    : text_helper(
                                        fontFamily: "Saira_Condensed",
                                        color: const Color(0xFF0A0F25),
                                        data: "Admin",
                                        size:
                                            getResponsiveTinyFontSize(context),
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
                                  color: const Color(0xFF0A0F25),
                                  data: l[index]['date']
                                      .toString()
                                      .substring(0, 15),
                                  size: getResponsiveTinyFontSize(context),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              } else if (snapshot.hasError) {
                return Icon(
                  Icons.error,
                  size: getResponsiveLargeFontSize(context),
                );
              } else {
                return CircularProgressIndicator(
                  strokeWidth: screenWidthFraction(context, dividedBy: 100),
                );
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(screenWidthFraction(context, dividedBy: 400)),
          child: SizedBox(
            width: screenWidth(context),
            height: screenHeightFraction(context, dividedBy: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: text_view_helper(
                      hint: "Enter Message",
                      prefix: Icon(
                        Icons.chat,
                        color: const Color(0xFF00CCFF),
                        size: getResponsiveMediumFontSize(context),
                      ),
                      controller: viewModel.chat),
                ),
                InkWell(
                  onTap: () async {
                    await ApiHelper.addChat(
                        id,
                        {
                          "sendby": viewModel.sharedpref.readString("email"),
                          "mess": viewModel.chat.text,
                          "date": DateTime.now().toString()
                        },
                        did);
                    viewModel.chat.clear();
                    viewModel.notifyListeners();
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                        screenWidthFraction(context, dividedBy: 100)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          screenWidthFraction(context, dividedBy: 15)),
                      color: const Color(0xFF00CCFF),
                    ),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: getResponsiveMediumFontSize(context),
                    ),
                  ),
                ),
                SizedBox(width: screenWidthFraction(context, dividedBy: 150)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  ChatoverModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatoverModel();
}
