class Items {
  final String? resourceURI;
  final String? name;
  final String? type;

  Items({
    this.resourceURI,
    this.name,
    this.type,
  });

  Items.fromJson(Map<String, dynamic> json)
      : resourceURI = json['resourceURI'] as String?,
        name = json['name'] as String?,
        type = json['type'] as String?;

  Map<String, dynamic> toJson() =>
      {'resourceURI': resourceURI, 'name': name, 'type': type};
}
