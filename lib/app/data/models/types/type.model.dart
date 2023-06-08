import 'package:equatable/equatable.dart';
import 'package:heb/core/utils/validators.util.dart';

import 'package:heb/app/domain/entities/types/type.entity.dart';
import 'package:heb/app/data/models/types/type_detail.model.dart';

class TypeModel extends Equatable {
  const TypeModel({
    required this.slot,
    required this.detail,
  });

  final int slot;
  final TypeDetailModel detail;

  factory TypeModel.fromJson(Map<String, dynamic>? json) {
    return TypeModel(
      slot: ValidatorUtils.containsKey<int>(json, 'slot', 0),
      detail: TypeDetailModel.fromJson(
        ValidatorUtils.containsKey(json, 'type', null),
      ),
    );
  }

  PokType toEntity() {
    return PokType(
      slot: slot,
      detail: detail.toEntity(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slot': slot,
      'type': detail.toJson(),
    };
  }

  @override
  List<Object?> get props => [slot, detail];
}
