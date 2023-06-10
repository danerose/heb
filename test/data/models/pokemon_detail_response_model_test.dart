import 'package:flutter_test/flutter_test.dart';
import 'package:heb/app/data/models/types/type.model.dart';
import 'package:heb/app/data/models/sprites/sprite.model.dart';
import 'package:heb/app/data/models/types/type_detail.model.dart';
import 'package:heb/app/data/models/pokemon_detail_response.model.dart';

void main() {
  group('PokemonDetailResponseModel', () {
    test('should return correct PokemonDetailResponse entity', () {
      // arrange
      const spriteModel = SpriteModel(back: 'back.png', front: 'front.png');
      const typeModel = TypeModel(
        slot: 1,
        detail: TypeDetailModel(name: 'Electric', url: 'https://example.com'),
      );
      const detailResponseModel = PokemonDetailResponseModel(
        sprite: spriteModel,
        types: [typeModel],
      );

      // act
      final detailResponseEntity = detailResponseModel.toEntity();

      // assert
      expect(detailResponseEntity.sprite.back, 'back.png');
      expect(detailResponseEntity.sprite.front, 'front.png');
      expect(detailResponseEntity.types.length, 1);
      expect(detailResponseEntity.types[0].slot, 1);
      expect(detailResponseEntity.types[0].detail.name, 'Electric');
      expect(detailResponseEntity.types[0].detail.url, 'https://example.com');
    });
  });
}
