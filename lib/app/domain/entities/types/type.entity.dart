import 'package:equatable/equatable.dart';
import 'package:heb/app/domain/entities/types/type_detail.entity.dart';

class PokType extends Equatable {
  final int slot;
  final TypeDetail detail;

  const PokType({
    required this.slot,
    required this.detail,
  });

  const PokType.empty()
      : slot = 0,
        detail = const TypeDetail.empty();

  @override
  List<Object?> get props => [
        slot,
        detail,
      ];
}
