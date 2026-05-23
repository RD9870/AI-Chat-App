import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
// import 'package:v_wallet_frontend/screens/handeling_screens/splash_screen.dart';
import 'screens/main_screens/home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO fillin the providers used
    return //MultiProvider(
    // providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
    // child:
    ToastificationWrapper(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const HomeScreen(), //const ScreenRouter(),
      ),
      // ),
    );
  }
}

// class ScreenRouter extends StatefulWidget {
//   const ScreenRouter({super.key});

//   @override
//   State<ScreenRouter> createState() => _ScreenRouterState();
// }

// class _ScreenRouterState extends State<ScreenRouter> {
  // @override
  // void initState() {
    // Provider.of<AuthProvider>(context, listen: false).initAuthProvider();
    // super.initState();
  // }

  // @override
  // Widget build(BuildContext context) {
    // return Consumer<AuthProvider>(
    //   builder: (context, authConsumer, _) {
        // TODO cjange the network connection handeling
        // return authConsumer.hasInternet == false
        //     ? NetworkErrorPage(
        //         onClick: () {
        //           Provider.of<AuthProvider>(
        //             context,
        //             listen: false,
        //           ).initAuthProvider();
        //         },
        //       )
        // :

        // TODO change AuthStatus routing
        // authConsumer.status == AuthStatus.authenticated
        //     ? MainViewScreen()
        //     : authConsumer.status == AuthStatus.unauthenticated
        //     ? IntroScreen()
        //     : authConsumer.status == AuthStatus.authenticating
        //     ? LoadingScreen()
        //     : LoadingScreen();
      // },
    // );
  // }
// }
