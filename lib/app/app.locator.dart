// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/fire_service.dart';
import '../services/shareprefs_service.dart';
import '../ui/views/cardetails/cardetails_viewmodel.dart';
import '../ui/views/cart/cart_viewmodel.dart';
import '../ui/widgets/common/searchbar/searchbar_model.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ShareprefsService());
  locator.registerLazySingleton(() => FireService());
  locator.registerLazySingleton(() => CartViewModel());
  locator.registerLazySingleton(() => CardetailsViewModel());
  locator.registerLazySingleton(() => SearchbarModel());
}
