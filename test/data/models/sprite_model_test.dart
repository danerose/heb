import 'package:flutter_test/flutter_test.dart';
import 'package:heb/app/data/models/sprites/sprite.model.dart';

void main() {
  group('SpriteModel', () {
    test('should return correct Sprite entity', () {
      // arrange
      const spriteModel = SpriteModel(back: 'back.png', front: 'front.png');
      // act
      final spriteEntity = spriteModel.toEntity();
      // assert
      expect(spriteEntity.back, 'back.png');
      expect(spriteEntity.front, 'front.png');
    });

    test('should return correct JSON representation', () {
      // arrange
      const spriteModel = SpriteModel(back: 'back.png', front: 'front.png');
      // act
      final json = spriteModel.toJson();
      // assert
      expect(json, {'back_default': 'back.png', 'front_default': 'front.png'});
    });
  });
}
