import 'package:eschool/ui/widgets/settingsContainer.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('SettingsScreen()');
    return const Scaffold(
      body: SettingsContainer(),
    );
  }
}
