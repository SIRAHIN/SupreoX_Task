import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supreox_test_task/depencency/controllers_binding.dart';
import 'package:supreox_test_task/routes/routes_name.dart';
import 'package:supreox_test_task/routes/routes_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
     fontFamily: GoogleFonts.inter().fontFamily
     ),
     initialRoute: RoutesName.addToCardScreen,
     getPages: routes,
     initialBinding: ControllerBindings(),
    );
    }
}