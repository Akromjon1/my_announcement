import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_announcement/pages/intro_page/intro_page.dart';
import 'package:my_announcement/pages/main/main_page.dart';
import 'package:my_announcement/pages/splash_page/splash_page.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'pages/home/home_page.dart';
import 'pages/order/order_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Announcement',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.black,
          ),
        ),
        home: const SplashScreen(),
        routes: {
          IntroPage.id: (context)=>  const IntroPage(),
          SplashScreen.id: (context)=>  const SplashScreen(),
          HomePage.id: (context)=>  const HomePage(),
          MainPage.id: (context)=>  const MainPage(),
        },
      ),
    );
  }
}
