import 'package:flutter/material.dart';
import 'package:art_store_ui/art_store_home.dart';

void main() {
  runApp(const ArtStoreApp());
}

class CustomError extends StatelessWidget {
  CustomError({Key? key, this.errorDetails}) : super(key: key);
  FlutterErrorDetails? errorDetails;
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
          color: Colors.tealAccent,
          child: Center(
              child: Text(errorDetails.toString(),
                  style: TextStyle(color: Colors.black))))
    ]);
  }
}


class ArtStoreApp extends StatelessWidget {
  const ArtStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return CustomError(errorDetails: errorDetails);
        };
        return widget!;
      },
      home: ArtStoreHome()
    );
  }
}

