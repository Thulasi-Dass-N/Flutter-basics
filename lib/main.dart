import 'package:flutter/material.dart';
import 'package:flutter_learning/screens/Chat_Screen.dart';
import 'package:flutter_learning/screens/Login_Screen.dart';
import 'package:flutter_learning/screens/product_screen.dart';
import 'package:flutter_learning/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => AuthService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static Map<String, WidgetBuilder> customRoutes = <String, WidgetBuilder>{
    // '/': (context) => LoginScreen(),
    '/chat': (context) => const ChatScreen(),
    '/product': (context) => const ProductScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chat Application",
      theme: ThemeData(
        canvasColor: Colors.transparent,
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.cyanAccent, foregroundColor: Colors.black),
      ),
      // home: LoginScreen(),
      // routes: {'/chat': (context) => const ChatScreen()},
      home: FutureBuilder<bool>(
        future: context.read<AuthService>().isLoggedIn(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data!) {
              return const ProductScreen();
            } else {
              return LoginScreen();
            }
          }
          return const CircularProgressIndicator();
        },
      ),
      routes: customRoutes,
      // routes: {'/chat': (context) => const ChatScreen()},
    );
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   // routerConfig: RouteApp().router,
    //   // home: LoginScreen(),
    //
    //   // home: randomAnswer(),
    // );
  }
}
