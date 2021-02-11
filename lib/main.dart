import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:loja_virtual/screens/base/base_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      child: MaterialApp(
      title: 'Loja da Gra',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff9cbeff),
        scaffoldBackgroundColor: Color(0xff9cbeff),
        appBarTheme: const AppBarTheme(
          elevation: 0
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BaseScreen(),
    )
    );
  }
}
