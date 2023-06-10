import 'package:flutter_test/flutter_test.dart';
import 'package:heb/app/data/models/types/type.model.dart';
import 'package:heb/app/data/models/types/type_detail.model.dart';

void main() {
  group('TypeDetailModel', () {
    test('should return correct TypeDetail entity', () {
      // arrange
      const typeDetailModel = TypeDetailModel(
        name: 'Electric',
        url: 'https://example.com',
      );
      // act
      final typeDetailEntity = typeDetailModel.toEntity();
      // assert
      expect(typeDetailEntity.name, 'Electric');
      expect(typeDetailEntity.url, 'https://example.com');
    });

    test('should return correct JSON representation', () {
      // arrange
      const typeDetailModel = TypeDetailModel(
        name: 'Electric',
        url: 'https://example.com',
      );
      // act
      final json = typeDetailModel.toJson();
      // assert
      expect(json, {'name': 'Electric', 'url': 'https://example.com'});
    });
  });

  group('TypeModel', () {
    test('should return correct PokType entity', () {
      // arrange
      const typeModel = TypeModel(
        slot: 1,
        detail: TypeDetailModel(name: 'Electric', url: 'https://example.com'),
      );

      // act
      final typeEntity = typeModel.toEntity();
      // assert
      expect(typeEntity.slot, 1);
      expect(typeEntity.detail.name, 'Electric');
      expect(typeEntity.detail.url, 'https://example.com');
    });

    test('should return correct JSON representation', () {
      // arrange
      const typeModel = TypeModel(
        slot: 1,
        detail: TypeDetailModel(name: 'Electric', url: 'https://example.com'),
      );

      // act
      final json = typeModel.toJson();
      // assert
      expect(json, {
        'slot': 1,
        'type': {'name': 'Electric', 'url': 'https://example.com'}
      });
    });
  });
}
