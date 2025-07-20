import 'package:digitalcaryard/ui/common/app_colors.dart';
import 'package:digitalcaryard/ui/common/ui_helpers.dart';
import 'package:digitalcaryard/ui/widgets/common/btn/btn.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/customwidget/text_helper.dart';
import 'searchbar_model.dart';

class Searchbar extends StatelessWidget {
  final Function(String) onChanged;
  final Function(String?, double?) onFilterChanged;
  final bool isNotShopkeeper;
  const Searchbar(
      {super.key,
      required this.onChanged,
      required this.onFilterChanged,
      required this.isNotShopkeeper});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchbarModel>.reactive(
      viewModelBuilder: () => SearchbarModel(),
      builder: (context, viewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: viewModel.search,
                    onChanged: (value) {
                      viewModel.updateSearchText(value);
                      onChanged(value);
                    },
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getResponsiveSmallFontSize(context),
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
                    cursorColor: const Color(0xFF00CCFF),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeightFraction(context, dividedBy: 100),
                        horizontal:
                            screenWidthFraction(context, dividedBy: 100),
                      ),
                      hintText: "What are you looking for?",
                      hintStyle: TextStyle(
                        color: Colors.white60,
                        fontSize: getResponsiveSmallFontSize(context),
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: const Color(0xFF00CCFF),
                        size: getResponsiveMediumLargeFontSize(context),
                      ),
                      suffixIcon: viewModel.searchText.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                viewModel.clearSearch();
                                onChanged('');
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: const Color(0xFF1E1E2F),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            screenWidthFraction(context, dividedBy: 15)),
                        borderSide: const BorderSide(
                          color: Color(0xFF00CCFF),
                          width: 1.2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            screenWidthFraction(context, dividedBy: 15)),
                        borderSide: const BorderSide(
                          color: unselectedColor,
                          width: 1.2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            screenWidthFraction(context, dividedBy: 15)),
                        borderSide: const BorderSide(
                          color: Color(0xFF00CCFF),
                          width: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    IconButton(
                      onPressed: () => _showFilterDialog(
                          context, viewModel, onFilterChanged, isNotShopkeeper),
                      icon: Icon(
                        Icons.filter_alt_outlined,
                        color: viewModel.hasActiveFilters
                            ? Colors.red
                            : const Color(0xFF00CCFF),
                        size: getResponsiveLargeFontSize(context),
                      ),
                    ),
                    if (viewModel.hasActiveFilters)
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 12,
                            minHeight: 12,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

void _showFilterDialog(BuildContext context, SearchbarModel viewModel,
    Function(String?, double?) onFilterChanged, bool isShopkeeper) {
  String? selectedLocation = viewModel.locationFilter;
  double? selectedPrice = viewModel.priceFilter;

  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        backgroundColor: appbarBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: customBlueColor,
            width: 1.2,
          ),
        ),
        title: Text("Filter"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isShopkeeper)
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
                value: selectedLocation,
                hint: Text("Select Location"),
                items: ['Lahore', 'Karachi', 'Islamabad', 'Multan']
                    .map((location) {
                  return DropdownMenuItem(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (value) => selectedLocation = value,
              ),
            SizedBox(height: 16),
            DropdownButtonFormField<double>(
              decoration: InputDecoration(
                labelText: 'Maximum Price',
                border: OutlineInputBorder(),
              ),
              value: selectedPrice,
              hint: Text("Select Max Price"),
              // adjust it according to your product or car price
              items: [100000, 500000, 1000000, 2000000, 5000000].map((price) {
                return DropdownMenuItem(
                  value: price.toDouble(),
                  child: Text("≤ ${price ~/ 100000} Lakh"),
                );
              }).toList(),
              onChanged: (value) => selectedPrice = value,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              viewModel.clearFilters();
              onFilterChanged(null, null);
              Navigator.pop(context);
            },
            child: Text("Clear All", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00CCFF),
            ),
            onPressed: () {
              viewModel.applyFilters(
                location: selectedLocation,
                price: selectedPrice,
              );
              onFilterChanged(selectedLocation, selectedPrice);
              Navigator.pop(context);
            },
            child: Text(
              "Apply Filters",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
