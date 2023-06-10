import 'package:flutter_test/flutter_test.dart';
import 'package:heb/app/domain/entities/types/type.entity.dart';
import 'package:heb/app/domain/entities/types/type_detail.entity.dart';

void main() {
  group('TypeDetail', () {
    test('should return correct empty TypeDetail entity', () {
      // arrange & act
      const typeDetail = TypeDetail.empty();

      // assert
      expect(typeDetail.name, '');
      expect(typeDetail.url, '');
    });

    test('should return correct list of props', () {
      // arrange
      const typeDetail = TypeDetail(
        name: 'Electric',
        url: 'https://example.com',
      );

      // act
      final props = typeDetail.props;

      // assert
      expect(props, ['Electric', 'https://example.com']);
    });
  });

  group('PokType', () {
    test('should return correct empty PokType entity', () {
      // arrange & act
      const pokType = PokType.empty();

      // assert
      expect(pokType.slot, 0);
      expect(pokType.detail, const TypeDetail.empty());
    });

    test('should return correct list of props', () {
      // arrange
      const pokType = PokType(
        slot: 1,
        detail: TypeDetail(name: 'Electric', url: 'https://example.com'),
      );

      // act
      final props = pokType.props;

      // assert
      expect(props, [
        1,
        const TypeDetail(name: 'Electric', url: 'https://example.com'),
      ]);
    });
  });
}
