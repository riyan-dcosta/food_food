import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_model.freezed.dart';

@freezed
class ProductsModel with _$ProductsModel {
  const factory ProductsModel({
    required String productName,
    required String productUrl,
    required int maxAvailable,
    required int selected,
    required bool isAvailable,
  }) = _ProductsModel;
}
