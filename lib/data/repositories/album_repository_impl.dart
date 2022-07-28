import 'package:clean_arch_demo/data/datasources/remote_data_source.dart';
import 'package:clean_arch_demo/data/failure.dart';
import 'package:clean_arch_demo/domain/entities/album.dart';
import 'package:clean_arch_demo/domain/repositories/album_repository.dart';
import 'package:dartz/dartz.dart';

class AlbumRepositoryImpl extends AlbumRepository {
  AlbumRepositoryImpl({required this.remoteDataSource});

  final RemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, Album>> getAlbum() async {
    try {
      final result = await remoteDataSource.getAlbum();
      return Right(result.toEntity());
    } on Exception catch (_) {
      return const Left(ConnectionFailure("Please check your connection"));
    }
  }
}
