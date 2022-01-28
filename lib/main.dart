import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:motiweights/device_brain.dart';
import 'package:motiweights/screens/login.dart';
import 'package:motiweights/screens/devices.dart';
import 'package:motiweights/screens/home.dart';
import 'package:motiweights/screens/registration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:motiweights/screens/user_profile.dart';
import 'package:motiweights/utilities/constants.dart';

FlutterBlue flutterBlue = FlutterBlue.instance;
DeviceBrain deviceBrain = DeviceBrain();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: kBackgroundColour,
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      // initialRoute: initialRoute: FirebaseAuth.instance.currentUser == null ? '/sign-in' : '/profile',
      routes: {
        DevicesPage.id: (context) => const DevicesPage(),
        HomePage.id: (context) => const HomePage(),
        LoginPage.id: (context) => const LoginPage(),
        RegistrationPage.id: (context) => const RegistrationPage(),
        UserPage.id: (context) => const UserPage(),
      },
    ),
  );
}

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // User is not signed in
        if (!snapshot.hasData) {
          return SignInScreen(
            headerBuilder: (context, constraints, _) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Hero(
                    tag: 'logo',
                    child: SizedBox(
                        child:
                            Image.asset('images/motiweights_logo_notext.png'),
                        height: 140.0)),
              );
            },
            providerConfigs: const [
              EmailProviderConfiguration(),
              GoogleProviderConfiguration(
                clientId:
                    '834863370711-k7dnhjbr353iv2e96bggg8eaprmks0h8.apps.googleusercontent.com',
              ),
            ],
          );
        }
        return const HomePage();
      },
    );
  }
}
