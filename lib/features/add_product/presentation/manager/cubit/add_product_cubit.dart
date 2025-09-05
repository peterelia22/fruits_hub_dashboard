import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../core/repos/product_repo/products_repo.dart';
import '../../../domain/entites/products_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
      : super(AddProductInitial());
  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;
  Future<void> addProduct(ProductsEntity product) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(product.imageFile);
    result.fold((l) => emit(AddProductFailure(l.message)), (url) async {
      product.imageUrl = url;
      var result = await productsRepo.addProduct(product);
      result.fold(
        (l) => emit(AddProductFailure(l.message)),
        (r) => emit(AddProductSuccess()),
      );
    });
  }
}
