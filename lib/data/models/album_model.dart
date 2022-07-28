import 'package:clean_arch_demo/domain/entities/album.dart';

class AlbumModel {
  const AlbumModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  final int userId;
  final int id;
  final String title;

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  Album toEntity() => Album(
        userId: userId,
        id: id,
        title: title,
      );
}
