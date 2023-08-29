import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/screens/tabs_screen.dart';
import 'package:flutter/services.dart';
import 'package:swapit_app/screens/auth_screen/log_in.dart';
import 'package:swapit_app/components/splash_screen.dart';
import 'package:swapit_app/utilities/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]); //

  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final themeProvider = ref.watch(themeProviderNotifier);
        return MaterialApp(
          title: 'Swapit',
          theme: theme,
          darkTheme: darkTheme,
          themeMode: themeProvider.themeMode,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: SplashScreen());
              }
              if (userSnapshot.hasData) {
                return const TabsScreen();
              }
              return const LoginPage();
            },
          ),
        );
      },
    );
  }
}
