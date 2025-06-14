import 'package:fitness/pages/Home.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/viewModel/DietViewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DietViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        home: HomePage(),
      ),
    );
  }
}
