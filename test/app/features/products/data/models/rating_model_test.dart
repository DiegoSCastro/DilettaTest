import 'package:diletta_test/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RatingModel', () {
    test('should create a valid model from JSON', () {
      final json = {'rate': 4.5, 'count': 100};
      final model = RatingModel.fromJson(json);
      expect(model.rate, 4.5);
      expect(model.count, 100);
    });

    test('should return a JSON map containing proper data', () {
      final model = RatingModel(rate: 4.5, count: 100);
      final json = model.toJson();
      expect(json['rate'], 4.5);
      expect(json['count'], 100);
    });

    test('should create a model from entity', () {
      final entity = Rating(rate: 4.5, count: 100);
      final model = RatingModel.fromEntity(entity);
      expect(model.rate, 4.5);
      expect(model.count, 100);
    });

    test('should convert model to entity', () {
      final model = RatingModel(rate: 4.5, count: 100);
      final entity = model.toEntity();
      expect(entity.rate, 4.5);
      expect(entity.count, 100);
    });
  });
}
