class Thumbnail {
  final String? path;
  final String? extension;

  Thumbnail({
    this.path,
    this.extension,
  });

  Thumbnail.fromJson(Map<String, dynamic> json)
      : path = json['path'] as String?,
        extension = json['extension'] as String?;

  Map<String, dynamic> toJson() => {'path': path, 'extension': extension};
}
