import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/models/cart_model.dart';
import 'package:provider_app/models/my_app_model.dart';
import 'package:provider_app/models/theme_model.dart';
import 'package:provider_app/screens/my_catalog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartModel>(
          create: (context) => CartModel(),
        ),
        ChangeNotifierProvider<MyAppModel>(create: (context) => MyAppModel())
      ],
      child: Consumer<MyAppModel>(
        builder: (context, model, _) {
          if (model.isLoading) {
            return const MaterialApp(
              title: 'Flutter Demo',
              home: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return ChangeNotifierProvider<ThemeModel>(
              create: (context) => ThemeModel(currentTheme: model.theme),
              child: Consumer<ThemeModel>(
                builder: (context, model, _) {
                  return MaterialApp(
                    title: 'Flutter Demo',
                    theme: model.currentTheme,
                    home: MyCatalog(),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
