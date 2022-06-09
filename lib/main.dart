import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoon_the_restaurant/data/home_cubit/home_cubit.dart';
import 'package:spoon_the_restaurant/data/splash_cubit/splash_cubit.dart';
import 'package:spoon_the_restaurant/pages/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<SplashCubit>(create: (BuildContext context) => SplashCubit(),),
      BlocProvider<HomeCubit>(create: (BuildContext context) => HomeCubit(),),

    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       // primarySwatch: Colors.blue,
      ),
      home:SplashScreen()
    );
  }
}
