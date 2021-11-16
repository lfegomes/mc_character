import '../../domain/entities/items.dart';

class ItemsDTO extends Items {
  final String? resourceURI;
  final String? name;
  final String? type;

  ItemsDTO({
    this.resourceURI,
    this.name,
    this.type,
  });

  ItemsDTO.fromJson(Map<String, dynamic> json)
      : resourceURI = json['resourceURI'] as String?,
        name = json['name'] as String?,
        type = json['type'] as String?;

  Map<String, dynamic> toJson() =>
      {'resourceURI': resourceURI, 'name': name, 'type': type};
}

extension ItemsMapper on ItemsDTO {
  Items toEntity() {
    return Items(
      resourceURI: resourceURI,
      name: name,
      type: type,
    );
  }
}
