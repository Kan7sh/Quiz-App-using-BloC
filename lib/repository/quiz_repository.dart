import '../../models/quiz_model.dart';

class QuizRepository{
  static Map<int, Quiz> quiz_map = {1 : Quiz(1, "Places", "Welcome to the General Knowledge Quiz! This quiz is designed to test your knowledge on a variety of topics from around the world. It covers a wide range of subjects such as geography, history, art, and science. Whether you're a trivia enthusiast or simply looking to expand your knowledge, this quiz is perfect for you!")};
  static Map<int, List<int>> quiz_questions = {1: [1,2,3,4]};
  static int current_question_index=0;
  static int? current_quiz_id;
  bool set_current_quiz_id(int quiz_id){
    current_quiz_id = quiz_id;
    current_question_index = 0;
    return true;
  }
  Quiz? get_quiz(int quiz_id){

    return quiz_map[quiz_id];
  }
  int current_question_id(){
    return quiz_questions[current_quiz_id]![current_question_index];
  }
  bool is_last_question(){
    return current_question_index == quiz_questions[current_quiz_id]!.length -1;
  }
  int get_next_question_id(){
    if(is_last_question())return -1;
    return quiz_questions[current_quiz_id]![current_question_index + 1];
  }
  bool is_first_question(){
    return current_question_index == 0;
  }
  int get_previous_question_id(){
    if(is_first_question()) return -1;
    return quiz_questions[current_quiz_id]![current_question_index - 1];
  }
  bool set_current_question(int question_id){
    if (quiz_questions[current_quiz_id]!.indexOf(question_id) == -1)return false;
    current_question_index = quiz_questions[current_quiz_id]!.indexOf(question_id);
    return true;
  }
}