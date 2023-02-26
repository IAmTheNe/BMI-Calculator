import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bmi_calculator/blocs/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/repositories/bmi/bmi_repository.dart';
import 'package:bmi_calculator/screens/home/home_screen.dart';
import 'package:bmi_calculator/screens/information/information_screen.dart';
import 'package:bmi_calculator/screens/result/result_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiCubit(BmiRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BMI Calculator',
        theme: ThemeData(),
        initialRoute: '/',
        routes: {
          '/': (_) => const HomeScreen(),
          '/info': (_) => const InformationScreen(),
          '/result': (_) => const ResultScreen(),
        },
      ),
    );
  }
}
