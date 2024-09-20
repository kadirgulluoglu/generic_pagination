import 'package:flutter/material.dart';
import 'package:generic_pagination/features/product/view/product_view.dart';
import 'package:generic_pagination/features/product/viewmodel/product_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pagination',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => ProductViewModel(),
        child: const ProductView(),
      ),
    );
  }
}
