import 'package:equatable/equatable.dart';
import 'package:heb/core/utils/validators.util.dart';
import 'package:heb/app/domain/entities/types/type_detail.entity.dart';

class TypeDetailModel extends Equatable {
  const TypeDetailModel({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory TypeDetailModel.fromJson(Map<String, dynamic>? json) {
    return TypeDetailModel(
      name: ValidatorUtils.containsKey<String>(json, 'name', ''),
      url: ValidatorUtils.containsKey<String>(json, 'url', ''),
    );
  }

  TypeDetail toEntity() {
    return TypeDetail(
      name: name,
      url: url,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }

  @override
  List<Object?> get props => [name, url];
}
