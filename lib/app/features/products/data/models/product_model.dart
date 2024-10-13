import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

///ProductModel Model
@freezed
class ProductModel with _$ProductModel {
  /// Constructor of [ProductModel]
  const factory ProductModel({
    required int id,
    @Default(0.0) double price,
    @Default('') String title,
    @Default('') String description,
    @Default('') String category,
    @Default('') String image,
    @Default(RatingModel()) RatingModel rating,
  }) = _ProductModel;
  const ProductModel._();

  /// Convert json [Map] in a [ProductModel]
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  factory ProductModel.fromEntity(Product entity) {
    return ProductModel(
      id: entity.id,
      price: entity.price,
      title: entity.title,
      description: entity.description,
      category: entity.category,
      image: entity.image,
      rating: RatingModel.fromEntity(entity.rating),
    );
  }

  Product toEntity() => Product(
        id: id,
        price: price,
        title: title,
        description: description,
        category: category,
        image: image,
        rating: rating.toEntity(),
      );
}
