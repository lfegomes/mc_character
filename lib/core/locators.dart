import 'package:get_it/get_it.dart';

import '../app/data/repositories/character_repo.dart';
import '../app/data/services/character_service.dart';
import '../app/domain/interfaces/character_interface.dart';
import '../app/domain/use_case/character_usecase.dart';
import '../app/presentation/viewmodel/character_viewmodel.dart';
import 'shared/http_service.dart';

void setupLocators() {
  /// Core
  GetIt.I.registerLazySingleton<HttpService>(() => HttpService());

  /// Service
  GetIt.I.registerLazySingleton<CharacterService>(() => CharacterService());

  /// Repository
  GetIt.I.registerLazySingleton<ICharacterRepo>(() => CharacterRepo(GetIt.I()));

  /// Use Case
  GetIt.I.registerLazySingleton<CharacterUseCase>(
      () => CharacterUseCase(GetIt.I()));

  /// ViewModel
  GetIt.I.registerLazySingleton<CharacterViewModel>(
      () => CharacterViewModel(GetIt.I()));
}
