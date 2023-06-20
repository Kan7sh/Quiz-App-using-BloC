import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_bloc_metromax/blocs/question_bloc/question_bloc.dart';
import 'package:quiz_bloc_metromax/blocs/quiz_bloc/quiz_bloc.dart';
import 'package:quiz_bloc_metromax/blocs/quiz_bloc/quiz_event.dart';
import 'package:quiz_bloc_metromax/blocs/quiz_bloc/quiz_state.dart';
import 'package:quiz_bloc_metromax/repository/quiz_repository.dart';
import 'package:quiz_bloc_metromax/screens/quiz_question_screen.dart';

class QuizStartScreen extends StatefulWidget {
  const QuizStartScreen({Key? key}) : super(key: key);

  @override
  State<QuizStartScreen> createState() => _QuizStartScreenState();
}

class _QuizStartScreenState extends State<QuizStartScreen> {

  QuizRepository quizRepository=QuizRepository();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuizBloc>(context).add(
      LoadQuizInfo(1)
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100,),
            BlocBuilder<QuizBloc,QuizState>(
                builder:(context,state){
                  if(state is QuizInfoLoaded){
                    return Text(state.quiz_description);
                  }else{
                    return const Text("");
                  }
                  }),
          const SizedBox(height: 10,),
          BlocBuilder<QuizBloc,QuizState>(
            builder: (BuildContext context, state) {
            if( state is QuizInfoLoaded){
              return Text(state.quiz_category);
            }else{
              return const Text("");
            }
          },),
          const SizedBox(height: 10,),
          ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BlocProvider(
                  create: (context)=>QuestionBloc() ,
                    child: const QuizQuestionScreen()

                )));
              },
              child: const Text("Start")
          )
        ],
      ),
    );
  }
}
