import 'package:equatable/equatable.dart';

import '../../../../app.dart';

class Product extends Equatable {
  final int id;
  final double price;
  final String title;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  const Product({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  @override
  List<Object?> get props => [
        id,
        price,
        title,
        description,
        category,
        image,
        rating,
      ];
}
