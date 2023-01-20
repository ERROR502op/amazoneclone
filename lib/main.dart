import 'package:flutter/material.dart';
import 'package:practice/constants/globalvariable.dart';
import 'package:practice/feautures/auth/screens/authscreen.dart';
import 'package:practice/providers/user_provider.dart';
import 'package:practice/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: const AppBarTheme(elevation: 0),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (setting) => generateRoute(setting),
        home: AuthScreen());
  }
}
