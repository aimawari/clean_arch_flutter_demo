import 'package:clean_arch_demo/data/failure.dart';
import 'package:clean_arch_demo/domain/entities/album.dart';
import 'package:dartz/dartz.dart';

abstract class AlbumRepository {
  Future<Either<Failure, Album>> getAlbum();
}
