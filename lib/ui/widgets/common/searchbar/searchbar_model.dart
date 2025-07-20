import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SearchbarModel extends BaseViewModel {
  TextEditingController search = TextEditingController();
  String _searchText = '';
  String? _locationFilter;
  double? _priceFilter;
  bool _hasActiveFilters = false;

  String get searchText => _searchText;
  String? get locationFilter => _locationFilter;
  double? get priceFilter => _priceFilter;
  bool get hasActiveFilters => _hasActiveFilters;

  void updateSearchText(String value) {
    _searchText = value;
    notifyListeners();
  }

  void clearSearch() {
    search.clear();
    _searchText = '';
    notifyListeners();
  }

  void applyFilters({String? location, double? price}) {
    _locationFilter = location;
    _priceFilter = price;
    _hasActiveFilters = location != null || price != null;
    notifyListeners();
  }

  void clearFilters() {
    _locationFilter = null;
    _priceFilter = null;
    _hasActiveFilters = false;
    notifyListeners();
  }
}
