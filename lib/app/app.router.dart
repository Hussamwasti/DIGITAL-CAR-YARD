// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:digitalcaryard/ui/views/about/about_view.dart' as _i11;
import 'package:digitalcaryard/ui/views/admins/admin/admin_view.dart' as _i5;
import 'package:digitalcaryard/ui/views/auth/login/login_view.dart' as _i3;
import 'package:digitalcaryard/ui/views/auth/signup/signup_view.dart' as _i4;
import 'package:digitalcaryard/ui/views/cardetails/cardetails_view.dart' as _i6;
import 'package:digitalcaryard/ui/views/cart/cart_view.dart' as _i12;
import 'package:digitalcaryard/ui/views/chat/allchat/allchat_view.dart' as _i7;
import 'package:digitalcaryard/ui/views/chat/chating_view/chating_view_view.dart'
    as _i8;
import 'package:digitalcaryard/ui/views/home/home_view.dart' as _i2;
import 'package:digitalcaryard/ui/views/orders/orders_view.dart' as _i13;
import 'package:digitalcaryard/ui/views/productdetails/productdetails_view.dart'
    as _i10;
import 'package:digitalcaryard/ui/views/shopkeeper/shopkeeper_view.dart' as _i9;
import 'package:flutter/material.dart' as _i14;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i15;

class Routes {
  static const homeView = '/home-view';

  static const loginView = '/login-view';

  static const signupView = '/signup-view';

  static const adminView = '/admin-view';

  static const carDetailsView = '/car-details-view';

  static const allchatView = '/allchat-view';

  static const chatingViewView = '/chating-view-view';

  static const shopkeeperView = '/shopkeeper-view';

  static const productdetailsView = '/productdetails-view';

  static const aboutView = '/about-view';

  static const cartView = '/cart-view';

  static const ordersView = '/orders-view';

  static const all = <String>{
    homeView,
    loginView,
    signupView,
    adminView,
    carDetailsView,
    allchatView,
    chatingViewView,
    shopkeeperView,
    productdetailsView,
    aboutView,
    cartView,
    ordersView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i3.LoginView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i4.SignupView,
    ),
    _i1.RouteDef(
      Routes.adminView,
      page: _i5.AdminView,
    ),
    _i1.RouteDef(
      Routes.carDetailsView,
      page: _i6.CarDetailsView,
    ),
    _i1.RouteDef(
      Routes.allchatView,
      page: _i7.AllchatView,
    ),
    _i1.RouteDef(
      Routes.chatingViewView,
      page: _i8.ChatingViewView,
    ),
    _i1.RouteDef(
      Routes.shopkeeperView,
      page: _i9.ShopkeeperView,
    ),
    _i1.RouteDef(
      Routes.productdetailsView,
      page: _i10.ProductdetailsView,
    ),
    _i1.RouteDef(
      Routes.aboutView,
      page: _i11.AboutView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.cartView,
      page: _i12.CartView,
    ),
    _i1.RouteDef(
      Routes.ordersView,
      page: _i13.OrdersView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => const HomeViewArguments(),
      );
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.HomeView(key: args.key),
        settings: data,
      );
    },
    _i3.LoginView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginView(),
        settings: data,
      );
    },
    _i4.SignupView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.SignupView(),
        settings: data,
      );
    },
    _i5.AdminView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.AdminView(),
        settings: data,
      );
    },
    _i6.CarDetailsView: (data) {
      final args = data.getArgs<CarDetailsViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.CarDetailsView(
            key: args.key, details: args.details, type: args.type),
        settings: data,
      );
    },
    _i7.AllchatView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.AllchatView(),
        settings: data,
      );
    },
    _i8.ChatingViewView: (data) {
      final args = data.getArgs<ChatingViewViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.ChatingViewView(key: args.key, id: args.id, did: args.did),
        settings: data,
      );
    },
    _i9.ShopkeeperView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.ShopkeeperView(),
        settings: data,
      );
    },
    _i10.ProductdetailsView: (data) {
      final args = data.getArgs<ProductdetailsViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.ProductdetailsView(
            key: args.key, details: args.details, type: args.type),
        settings: data,
      );
    },
    _i11.AboutView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.AboutView(),
        settings: data,
      );
    },
    _i12.CartView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.CartView(),
        settings: data,
      );
    },
    _i13.OrdersView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.OrdersView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HomeViewArguments {
  const HomeViewArguments({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class CarDetailsViewArguments {
  const CarDetailsViewArguments({
    this.key,
    required this.details,
    this.type = "u",
  });

  final _i14.Key? key;

  final Map<dynamic, dynamic> details;

  final String type;

  @override
  String toString() {
    return '{"key": "$key", "details": "$details", "type": "$type"}';
  }

  @override
  bool operator ==(covariant CarDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.details == details && other.type == type;
  }

  @override
  int get hashCode {
    return key.hashCode ^ details.hashCode ^ type.hashCode;
  }
}

class ChatingViewViewArguments {
  const ChatingViewViewArguments({
    this.key,
    required this.id,
    required this.did,
  });

  final _i14.Key? key;

  final String id;

  final String did;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id", "did": "$did"}';
  }

  @override
  bool operator ==(covariant ChatingViewViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id && other.did == did;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode ^ did.hashCode;
  }
}

class ProductdetailsViewArguments {
  const ProductdetailsViewArguments({
    this.key,
    required this.details,
    this.type = "s",
  });

  final _i14.Key? key;

  final Map<dynamic, dynamic> details;

  final String type;

  @override
  String toString() {
    return '{"key": "$key", "details": "$details", "type": "$type"}';
  }

  @override
  bool operator ==(covariant ProductdetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.details == details && other.type == type;
  }

  @override
  int get hashCode {
    return key.hashCode ^ details.hashCode ^ type.hashCode;
  }
}

extension NavigatorStateExtension on _i15.NavigationService {
  Future<dynamic> navigateToHomeView({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCarDetailsView({
    _i14.Key? key,
    required Map<dynamic, dynamic> details,
    String type = "u",
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.carDetailsView,
        arguments:
            CarDetailsViewArguments(key: key, details: details, type: type),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAllchatView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.allchatView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatingViewView({
    _i14.Key? key,
    required String id,
    required String did,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.chatingViewView,
        arguments: ChatingViewViewArguments(key: key, id: id, did: did),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToShopkeeperView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.shopkeeperView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProductdetailsView({
    _i14.Key? key,
    required Map<dynamic, dynamic> details,
    String type = "s",
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.productdetailsView,
        arguments:
            ProductdetailsViewArguments(key: key, details: details, type: type),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAboutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.aboutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrdersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.ordersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAdminView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.adminView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCarDetailsView({
    _i14.Key? key,
    required Map<dynamic, dynamic> details,
    String type = "u",
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.carDetailsView,
        arguments:
            CarDetailsViewArguments(key: key, details: details, type: type),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAllchatView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.allchatView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatingViewView({
    _i14.Key? key,
    required String id,
    required String did,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.chatingViewView,
        arguments: ChatingViewViewArguments(key: key, id: id, did: did),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithShopkeeperView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.shopkeeperView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProductdetailsView({
    _i14.Key? key,
    required Map<dynamic, dynamic> details,
    String type = "s",
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.productdetailsView,
        arguments:
            ProductdetailsViewArguments(key: key, details: details, type: type),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAboutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.aboutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOrdersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.ordersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
