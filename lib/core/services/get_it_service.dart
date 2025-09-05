import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo_implementation.dart'
    show ImagesRepoImplementation;
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruits_hub_dashboard/features/orders/data/repos/order_repo_impl.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:get_it/get_it.dart';

import '../../constants.dart';
import '../repos/images_repo/images_repo.dart';
import '../repos/product_repo/products_repo.dart';
import '../repos/product_repo/products_repo_implementation.dart';
import 'cloudinary_service.dart';
import 'storage_service.dart';
import 'supbase_storage.dart';

final getIt = GetIt.instance;

void setupGetit() {
  // getIt.registerSingleton<StorageService>(
  //   CloudinaryService(
  //     cloudName: kCloudinaryCloudName,
  //     uploadPreset: kCloudinaryuploadPreset,
  //     apiKey: kCloudinaryApiKey,
  //   ),
  // );
  getIt.registerSingleton<StorageService>(
    SupbaseStorageService(),
  );

  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImplementation(getIt.get<StorageService>()),
  );
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImplementation(
    getIt.get<DatabaseService>(),
  ));
  getIt.registerSingleton<OrdersRepo>(
    OrderRepoImpl(getIt.get<FireStoreService>()),
  );
}
