import 'package:flutter_test/flutter_test.dart';
import 'package:heb/app/domain/entities/sprites/sprite.entity.dart';

void main() {
  group('Sprite', () {
    test('should return correct empty Sprite entity', () {
      // arrange & act
      const sprite = Sprite.empty();

      // assert
      expect(sprite.back, '');
      expect(sprite.front, '');
    });

    test('should return correct list of props', () {
      // arrange
      const sprite = Sprite(back: 'back.png', front: 'front.png');

      // act
      final props = sprite.props;

      // assert
      expect(props, ['back.png', 'front.png']);
    });
  });
}
