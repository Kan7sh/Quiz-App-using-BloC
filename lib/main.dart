import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_bloc_metromax/blocs/quiz_bloc/quiz_bloc.dart';
import 'package:quiz_bloc_metromax/screens/quiz_start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Quiz App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          home: BlocProvider(create:(context)=>QuizBloc(),
          child: const QuizStartScreen())
      );
  }
}

