import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_bloc_metromax/blocs/question_bloc/question_event.dart';
import 'package:quiz_bloc_metromax/blocs/question_bloc/question_state.dart';
import 'package:quiz_bloc_metromax/repository/question_repository.dart';

class QuestionBloc extends Bloc<QuestionEvent,QuestionState>{

  QuestionsRepository questionRepository = QuestionsRepository();
  final _dataController = StreamController<int>();
  QuestionsRepository get getObject => questionRepository;


  Stream<int> get dataStream => _dataController.stream;
  QuestionBloc():super(QuestionInitialState()){
    
    on<LoadQuestion>((event,emit){
      emit(QuestionLoaded(questionRepository.get_question(event.question_id),questionRepository.get_options(event.question_id),questionRepository.get_selected_option(event.question_id)));
    });
    on<TapNextQuestion>((event,emit){
      emit(QuestionLoaded(questionRepository.get_question(event.question_id),questionRepository.get_options(event.question_id),questionRepository.get_selected_option(event.question_id)));
    });
    on<TapPreviousQuestion>((event,emit){
      emit(QuestionLoaded(questionRepository.get_question(event.question_id), questionRepository.get_options(event.question_id),questionRepository.get_selected_option(event.question_id)));
    });
    on<TapOption>((event,emit){
      questionRepository.set_selected_option(event.question_id, event.option_id);
      emit(QuestionLoaded(questionRepository.get_question(event.question_id), questionRepository.get_options(event.question_id),questionRepository.get_selected_option(event.question_id)));
    });


  }
}