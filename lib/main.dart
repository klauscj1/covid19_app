import 'package:covid19_app/pages/home_page.dart';
import 'package:covid19_app/providers/countries_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountriesProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Covid 19',
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
