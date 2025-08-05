import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_service.dart';
import 'package:get_it/get_it.dart';

import '../repos/product_repo/products_repo.dart';
import '../repos/product_repo/products_repo_implementation.dart';

final getIt = GetIt.instance;

void setupGetit() {
  // getIt.registerSingleton<StorageService>(StorageService());
  // getIt.registerSingleton<ImagesRepo>(
  //     ImagesRepoImplementation(StorageService()));
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImplementation(
    getIt.get<DatabaseService>(),
  ));
}
