import 'package:dio/dio.dart';
import 'package:mc_character/core/utils/constants.dart';

import '../../../core/core_packages.dart';
import '../../../core/utils/crypto.dart';
import '../models/character_raw_dto.dart';

class CharacterService {
  final _httpService = GetIt.I<HttpService>();

  Future<CharacterRawDataDTO> characterListing(int offset) async {
    var limit = Constant.ITEMS_PER_PAGE;
    var key = Constant.PUBLIC_KEY;
    var ts = DateTime.now().millisecondsSinceEpoch.toString();
    var hash = Cryptography.generateMd5(ts);
    try {
      Response response = await _httpService.get(
        "characters?offset=$offset&limit=$limit&apikey=$key&ts=$ts&hash=$hash",
      );
      return CharacterRawDataDTO.fromJson(
        response.data,
      );
      // await Future.delayed(Duration(seconds: 1));
      // return Future.error('error');
    } catch (error) {
      throw error;
    }
  }
}
