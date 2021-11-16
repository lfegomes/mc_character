import '../../domain/entities/thumbnail.dart';

class ThumbnailDTO extends Thumbnail {
  final String? path;
  final String? extension;

  ThumbnailDTO({
    this.path,
    this.extension,
  });

  ThumbnailDTO.fromJson(Map<String, dynamic> json)
      : path = json['path'] as String?,
        extension = json['extension'] as String?;

  Map<String, dynamic> toJson() => {'path': path, 'extension': extension};
}
