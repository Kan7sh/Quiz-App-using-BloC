import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_bloc_metromax/blocs/question_bloc/question_bloc.dart';
import 'package:quiz_bloc_metromax/blocs/question_bloc/question_event.dart';
import 'package:quiz_bloc_metromax/blocs/question_bloc/question_state.dart';
import 'package:quiz_bloc_metromax/repository/quiz_repository.dart';
import 'package:quiz_bloc_metromax/screens/quiz_finished_screen.dart';
import 'package:quiz_bloc_metromax/screens/quiz_start_screen.dart';

import '../blocs/quiz_bloc/quiz_bloc.dart';

class QuizQuestionScreen extends StatefulWidget {
  const QuizQuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuizQuestionScreen> createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  int? selectedValue;
  int currentQuestion=1;
  QuizRepository quizRepository=QuizRepository();

  @override
  void initState() {
    super.initState();
    quizRepository.set_current_quiz_id(1);
    BlocProvider.of<QuestionBloc>(context).add(
        LoadQuestion(quizRepository.current_question_id())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100,),
          BlocBuilder<QuestionBloc,QuestionState>(
              builder:(BuildContext context,state){
                if(state is QuestionLoaded){
                  return Text(state.question);
                }
                return const Text("");
              }),
          const SizedBox(height: 20,),
          BlocBuilder<QuestionBloc,QuestionState>(
            builder: (BuildContext context,state){
            if(state is QuestionLoaded){
              return Column(
                children: [
                  RadioListTile<int>(
                    title: Text(state.options[0].option_info),
                    value: state.options[0].option_id,
                    groupValue:state.selected,
                    onChanged: (value) {
                      BlocProvider.of<QuestionBloc>(context).add(TapOption(quizRepository.current_question_id(),value!));
                    },
                  ),
                  RadioListTile<int>(
                    title: Text(state.options[1].option_info),
                    value: state.options[1].option_id,
                    groupValue: state.selected,
                    onChanged: (value) {
                      BlocProvider.of<QuestionBloc>(context).add(TapOption(quizRepository.current_question_id(),value!));
                    },
                  ),
                  RadioListTile<int>(
                    title: Text(state.options[2].option_info),
                    value: state.options[2].option_id,
                    groupValue: state.selected,
                    onChanged: (value) {
                      BlocProvider.of<QuestionBloc>(context).add(TapOption(quizRepository.current_question_id(),value!));
                    },

                  ),
                  RadioListTile<int>(
                    title: Text(state.options[3].option_info),
                    value: state.options[3].option_id,
                    groupValue: state.selected,
                    onChanged: (value) {
                      BlocProvider.of<QuestionBloc>(context).add(TapOption(quizRepository.current_question_id(),value!));
                      },
                  ),


                ],
              );
            }

            return const Center(child: CircularProgressIndicator());
            },
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: (){
                    if(quizRepository.get_previous_question_id()==-1){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) =>  BlocProvider(
                          create:(context)=>QuizBloc(),
                          child: QuizStartScreen(),
                        )),
                      );
                    }else{
                      BlocProvider.of<QuestionBloc>(context).add(TapPreviousQuestion(quizRepository.get_previous_question_id()));
                      quizRepository.set_current_question(quizRepository.current_question_id()-1);
                    }
                  },
                  child: const Text("Prev")
              ),
              ElevatedButton(
                  onPressed: (){
                    if(quizRepository.get_next_question_id()==-1){
                      final result = BlocProvider.of<QuestionBloc>(context).getObject.get_result();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> QuizFinishedScreen(result: result)));
                    }else{
                      BlocProvider.of<QuestionBloc>(context).add(TapNextQuestion(quizRepository.get_next_question_id()));
                      quizRepository.set_current_question(quizRepository.current_question_id()+1);
                    }
                  },
                  child: const Text("Next")
              ),
            ],
          )
        ],
      ),
    );
  } 
}
