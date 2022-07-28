import 'package:clean_arch_demo/data/datasources/remote_data_source.dart';
import 'package:clean_arch_demo/data/repositories/album_repository_impl.dart';
import 'package:clean_arch_demo/domain/repositories/album_repository.dart';
import 'package:clean_arch_demo/domain/usecases/get_album.dart';
import 'package:clean_arch_demo/presentation/providers/album_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(() => AlbumProvider(locator()));

  // usecase
  locator.registerLazySingleton(() => GetAlbum(locator()));

  // repository
  locator.registerLazySingleton<AlbumRepository>(
    () => AlbumRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
