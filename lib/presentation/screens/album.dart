import 'package:clean_arch_demo/presentation/providers/album_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final albumProvider = Provider.of<AlbumProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: albumProvider.status == AlbumProviderStatus.loading
            ? const CircularProgressIndicator()
            : albumProvider.status == AlbumProviderStatus.success
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("title: ${albumProvider.album!.title}"),
                      Text("id: ${albumProvider.album!.id}"),
                      Text("userId: ${albumProvider.album!.userId}"),
                    ],
                  )
                : const Text("Error"),
      ),
    );
  }
}
