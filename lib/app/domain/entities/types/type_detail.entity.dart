import 'package:equatable/equatable.dart';

class TypeDetail extends Equatable {
  final String name;
  final String url;

  const TypeDetail({
    required this.name,
    required this.url,
  });

  const TypeDetail.empty()
      : name = '',
        url = '';

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}
