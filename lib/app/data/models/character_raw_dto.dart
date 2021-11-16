import '../../domain/entities/character_raw.dart';
import 'character_page_dto.dart';

class CharacterRawDataDTO extends CharacterRawData {
  final int? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHTML;
  final String? etag;
  final CharacterPageDTO? data;

  CharacterRawDataDTO({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHTML,
    this.etag,
    this.data,
  });

  CharacterRawDataDTO.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        status = json['status'] as String?,
        copyright = json['copyright'] as String?,
        attributionText = json['attributionText'] as String?,
        attributionHTML = json['attributionHTML'] as String?,
        etag = json['etag'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? CharacterPageDTO.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'copyright': copyright,
        'attributionText': attributionText,
        'attributionHTML': attributionHTML,
        'etag': etag,
        'data': data?.toJson()
      };
}

extension CharacterRawDataMapper on CharacterRawDataDTO {
  CharacterRawData toEntity() {
    return CharacterRawData(
      code: code,
      status: status,
      copyright: copyright,
      attributionText: attributionText,
      attributionHTML: attributionHTML,
      etag: etag,
      data: data,
    );
  }
}
