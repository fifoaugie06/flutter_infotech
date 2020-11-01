import 'package:flutter/material.dart';
import 'package:flutter_infotech/models/CategoryDetail.dart';
import 'package:flutter_infotech/providers/CategoryProvider.dart';
import 'package:provider/provider.dart';

import 'views/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Dashboard(),
        ),
      ),
    );
  }
}
