import 'package:clean_arch_demo/domain/entities/album.dart';
import 'package:clean_arch_demo/domain/usecases/get_album.dart';
import 'package:flutter/material.dart';

enum AlbumProviderStatus {
  initialized,
  loading,
  success,
  error
}

class AlbumProvider extends ChangeNotifier {
  AlbumProvider(this._getAlbum) {
    fetchAlbum();
  }

  final GetAlbum _getAlbum;

  AlbumProviderStatus status = AlbumProviderStatus.initialized;
  Album? album;

  void fetchAlbum() async {
    status = AlbumProviderStatus.loading;
    final result = await _getAlbum.execute();

    result.fold((failure) {
      status = AlbumProviderStatus.error;
    }, (data) {
      status = AlbumProviderStatus.success;
      album = data;
    });

    notifyListeners();
  }
}
