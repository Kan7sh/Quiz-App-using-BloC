import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_bloc_metromax/blocs/quiz_bloc/quiz_event.dart';
import 'package:quiz_bloc_metromax/blocs/quiz_bloc/quiz_state.dart';
import 'package:quiz_bloc_metromax/repository/quiz_repository.dart';

import '../../models/quiz_model.dart';

class QuizBloc extends Bloc<QuizEvent,QuizState>{

    QuizBloc():super(QuizInitialState()){
        on<LoadQuizInfo>((event,emit){
            QuizRepository quizRepository=QuizRepository();
            Quiz? quiz = quizRepository.get_quiz(event.quiz_id);
            emit(QuizInfoLoaded(quiz!.quiz_description,quiz.quiz_category));
        });

        on<StartQuiz>((event,emit)=>emit(QuizStart()));
    }



}