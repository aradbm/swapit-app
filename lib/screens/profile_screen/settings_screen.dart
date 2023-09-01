import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/theme_provider.dart';
import 'package:swapit_app/utilities/shared_pref.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});
  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = ref.watch(themeProviderNotifier);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            )),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Dark/light Mode'),
              Switch(
                value: themeProvider.isDarkMode(),
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                  SharedPrefs.setBool('isDarkMode', value);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
