import 'package:diletta_test/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductModel', () {
    test('should create a valid model from JSON', () {
      final json = {
        'id': 1,
        'price': 10.0,
        'title': 'Test Product',
        'description': 'Test Description',
        'category': 'Test Category',
        'image': 'Test Image',
        'rating': {'rate': 4.5, 'count': 100}
      };

      final model = ProductModel.fromJson(json);

      expect(model.id, 1);
      expect(model.price, 10.0);
      expect(model.title, 'Test Product');
      expect(model.description, 'Test Description');
      expect(model.category, 'Test Category');
      expect(model.image, 'Test Image');
      expect(model.rating.rate, 4.5);
      expect(model.rating.count, 100);
    });

    test('should return a JSON map containing proper data', () {
      final model = ProductModel(
        id: 1,
        price: 10.0,
        title: 'Test Product',
        description: 'Test Description',
        category: 'Test Category',
        image: 'Test Image',
        rating: RatingModel(rate: 4.5, count: 100),
      );

      final json = model.toJson();

      expect(json['id'], 1);
      expect(json['price'], 10.0);
      expect(json['title'], 'Test Product');
      expect(json['description'], 'Test Description');
      expect(json['category'], 'Test Category');
      expect(json['image'], 'Test Image');
    });

    test('should create a model from entity', () {
      final entity = Product(
        id: 1,
        price: 10.0,
        title: 'Test Product',
        description: 'Test Description',
        category: 'Test Category',
        image: 'Test Image',
        rating: Rating(rate: 4.5, count: 100),
      );

      final model = ProductModel.fromEntity(entity);

      expect(model.id, 1);
      expect(model.price, 10.0);
      expect(model.title, 'Test Product');
      expect(model.description, 'Test Description');
      expect(model.category, 'Test Category');
      expect(model.image, 'Test Image');
      expect(model.rating.rate, 4.5);
      expect(model.rating.count, 100);
    });

    test('should convert model to entity', () {
      final model = ProductModel(
        id: 1,
        price: 10.0,
        title: 'Test Product',
        description: 'Test Description',
        category: 'Test Category',
        image: 'Test Image',
        rating: RatingModel(rate: 4.5, count: 100),
      );

      final entity = model.toEntity();

      expect(entity.id, 1);
      expect(entity.price, 10.0);
      expect(entity.title, 'Test Product');
      expect(entity.description, 'Test Description');
      expect(entity.category, 'Test Category');
      expect(entity.image, 'Test Image');
      expect(entity.rating.rate, 4.5);
      expect(entity.rating.count, 100);
    });
  });
}
