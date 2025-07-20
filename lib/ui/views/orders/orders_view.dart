import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/apihelper/apihelper.dart';
import '../../common/app_colors.dart';
import '../../common/customwidget/snakbar_helper.dart';
import '../../common/customwidget/text_helper.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/common/btn/btn.dart';
import 'orders_viewmodel.dart';

class OrdersView extends StackedView<OrdersViewModel> {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OrdersViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
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
                              data: "My Orders",
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
            Padding(
              padding: EdgeInsets.only(
                left: screenWidthFraction(context, dividedBy: 15),
                right: screenWidthFraction(context, dividedBy: 20),
              ),
              child: Row(
                children: [
                  cat(context, viewModel, "My Order"),
                  cat(context, viewModel, "Incoming Order"),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: ApiHelper.allcart(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.toString() == '[]') {
                      return Center(
                        child: text_helper(data: "No Data"),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (snapshot.data[index]["isbook"] == "true") {
                            return FutureBuilder(
                              future: snapshot.data[index]["type"] == "car"
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
                                    if (viewModel.type == "My Order") {
                                      if (snapshot.data[index]["uid"] ==
                                          viewModel.sharedpref
                                              .readString("email")) {
                                        return listdata(snapshot.data[index],
                                            viewModel, context, snapshot2.data);
                                      } else {
                                        return SizedBox.shrink();
                                      }
                                    } else {
                                      if (snapshot2.data["uid"] ==
                                          viewModel.sharedpref
                                              .readString("email")) {
                                        return listdata(snapshot.data[index],
                                            viewModel, context, snapshot2.data);
                                      } else {
                                        return SizedBox.shrink();
                                      }
                                    }
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
          ],
        )));
  }

  Widget listdata(
    Map<String, dynamic> item,
    OrdersViewModel viewModel,
    BuildContext context,
    Map<String, dynamic> product,
  ) {
    // Grab first image if available
    final imgUrl = (product['img'] is List && product['img'].isNotEmpty)
        ? product['img'][0]
        : null;

    // Common fields
    final title = product['title'] ?? 'Unknown Item';
    final price = product['price'] ?? 0;
    final quantity = item['quantity'] ?? 1;
    final type = item['type'] ?? 'n/a';

    // Car-specific extras
    final isCar = type.toString().toLowerCase() == 'car';
    final brand = isCar ? product['brand'] : null;
    final year = isCar ? product['year'] : null;
    final mileage = isCar ? product['milage'] : null;
    final city = isCar ? product['city'] : null;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: const Color(0xFF1E1E2F),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: imgUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imgUrl,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.broken_image, color: Colors.grey),
                ),
              )
            : const Icon(Icons.image_not_supported,
                color: Colors.grey, size: 64),
        title: Text(
          isCar ? '$brand • $title' : title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              'Rs $price × $quantity',
              style: const TextStyle(color: Colors.white70),
            ),
            Text(
              'Type: ${type[0].toUpperCase()}${type.substring(1)}',
              style: const TextStyle(color: Colors.white60),
            ),
            if (isCar) ...[
              const SizedBox(height: 4),
              Text('Year: $year',
                  style: const TextStyle(color: Colors.white60)),
              Text('Mileage: $mileage km',
                  style: const TextStyle(color: Colors.white60)),
              Text('City: $city',
                  style: const TextStyle(color: Colors.white60)),
            ],
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                  onTap: () {
                    displayProgress(context);
                    ApiHelper.deletecart(item['_id']);
                    hideProgress(context);
                    viewModel.notifyListeners();
                  },
                  child: Icon(Icons.delete, color: red,)),
            )
          ],
        ),
      ),
    );
  }

  Widget cat(BuildContext context, OrdersViewModel viewModel, String title,
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

  @override
  OrdersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrdersViewModel();
}
