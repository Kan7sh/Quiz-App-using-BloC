import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_bloc_metromax/blocs/quiz_bloc/quiz_bloc.dart';
import 'package:quiz_bloc_metromax/screens/quiz_start_screen.dart';

class QuizFinishedScreen extends StatelessWidget {
  final int result;

  QuizFinishedScreen({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 120),
          Center(child: Text("Score: ${result}/4")),
          const SizedBox(height: 50),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  BlocProvider(
                    create:(context)=>QuizBloc(),
                    child: QuizStartScreen(),
                  )),
                );
              },
              child: const Text("Retake"),
            ),
          ),
        ],
      ),
    );
  }
}
