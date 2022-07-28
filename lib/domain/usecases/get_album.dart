import 'package:clean_arch_demo/data/failure.dart';
import 'package:clean_arch_demo/domain/entities/album.dart';
import 'package:clean_arch_demo/domain/repositories/album_repository.dart';
import 'package:dartz/dartz.dart';

class GetAlbum {
  final AlbumRepository repository;

  GetAlbum(this.repository);

  Future<Either<Failure, Album>> execute() {
    return repository.getAlbum();
  }
}
