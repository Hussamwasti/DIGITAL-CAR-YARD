import 'package:digitalcaryard/ui/common/apihelper/apihelper.dart';
import 'package:digitalcaryard/ui/common/app_colors.dart';
import 'package:digitalcaryard/ui/common/customwidget/snakbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../common/customwidget/text_helper.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/common/btn/btn.dart';
import 'cart_viewmodel.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({super.key});

  @override
  Widget builder(BuildContext context, CartViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
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
                            data: "Your Cart",
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
            child: Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: ApiHelper.allcart(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        viewModel.total = "0";
                        if (snapshot.data.toString() == '[]') {
                          return Center(
                            child: text_helper(data: "No Data"),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (snapshot.data[index]["uid"] ==
                                  viewModel.sharedpref.readString("email")) {
                                if (snapshot.data[index]["isbook"] == "false") {
                                  return FutureBuilder(
                                    future:
                                    snapshot.data[index]["type"] == "car"
                                        ? ApiHelper.findonecar(
                                        snapshot.data[index]['pid'])
                                        : ApiHelper.findoneproduct(
                                        snapshot.data[index]['pid']),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot2) {
                                      if (snapshot2.hasData) {
                                        if (snapshot2.data.toString() == '[]') {
                                          return SizedBox();
                                        } else {
                                          final qty = int.parse(snapshot.data[index]["quantity"]);
                                          final price = int.parse(snapshot2.data["price"]);
                                          viewModel.total = (int.parse(viewModel.total) + price * qty).toString();
                                          if ((index + 1) == snapshot.data.length) {
                                            viewModel.up();
                                          }

                                          return listdata(
                                              snapshot.data[index],
                                              viewModel,
                                              context,
                                              snapshot2.data);
                                        }
                                      } else if (snapshot2.hasError) {
                                        return const Icon(
                                          Icons.error,
                                        );
                                      } else {
                                        return displaySimpleProgress(context);
                                      }
                                    },
                                  );
                                } else {
                                  return SizedBox.shrink();
                                }
                              } else {
                                return SizedBox.shrink();
                              }
                            },
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
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // color: Colors.white24,
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
                  margin: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total: Rs ${viewModel.total}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18)),
                      Btn(
                        buttonId: '9',
                        function: () => viewModel.checkout(context),
                        title: 'Checkout',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listdata(
      Map item, CartViewModel viewModel, BuildContext context, Map product) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: const Color(0xFF1E1E2F),
      child: ListTile(
        title:
        Text(product["title"], style: const TextStyle(color: Colors.white)),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Rs ${product["price"].toString()} x ${item["quantity"]}",
                style: const TextStyle(color: Colors.white70)),
            Text("Type : ${item["type"]}",
                style: const TextStyle(color: Colors.white60)),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove, color: Colors.redAccent),
              onPressed: () => viewModel.decreaseQuantity(
                  item["_id"], (int.parse(item["quantity"]) - 1).toString()),
            ),
            Text("${item["quantity"]}",
                style: const TextStyle(color: Colors.white)),
            IconButton(
              icon: const Icon(Icons.add, color: Colors.green),
              onPressed: () => viewModel.increaseQuantity(
                  item["_id"], (int.parse(item["quantity"]) + 1).toString()),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => viewModel.removeFromCart(item["_id"]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CartViewModel viewModelBuilder(BuildContext context) => CartViewModel();
}
