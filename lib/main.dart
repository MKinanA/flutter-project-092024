import 'package:buku_bacaan_wajib_untuk_mahasiswa/main_page.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const App(),
    defaultDevice: Devices.android.smallPhone
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        brightness: MediaQuery.of(context).platformBrightness
      ),
      home: const MainPage()
    );
  }
}