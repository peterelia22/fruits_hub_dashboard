import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';

import '../../services/storage_service.dart';

class ImagesRepoImplementation implements ImagesRepo {
  final StorageService storageService;

  ImagesRepoImplementation(this.storageService);
  @override
  Future<Either<Failure, String>> uploadImage(File imageFile) async {
    try {
      String url =
          await storageService.uploadFile(imageFile, BackendEndpoint.images);
      return Right(url);
    } catch (e) {
      return Left(ServerFailure('Failed to upload image: $e'));
    }
  }
}
