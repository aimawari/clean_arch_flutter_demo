import 'package:clean_arch_demo/presentation/providers/album_provider.dart';
import 'package:clean_arch_demo/presentation/screens/album.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch_demo/injection.dart' as injection;

void main() {
  injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AlbumProvider>(
          create: (_) => injection.locator<AlbumProvider>(),
        )
      ],
      child: const MaterialApp(
        title: 'Album Demo',
        home: AlbumScreen(),
      ),
    );
  }
}
