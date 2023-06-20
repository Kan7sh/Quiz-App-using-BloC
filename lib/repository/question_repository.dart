import '../../models/option_model.dart';
import '../../models/question_model.dart';

class QuestionsRepository{

  static Map<int,Question> question_map = {
    1: Question(1,[Option(1,'Paris'), Option(2, 'London'),Option(3, 'Rome'),Option(4, "Berlin")], 'What is the capital city of France?',1,0),
    2: Question(2, [Option(1,'Leonardo da Vinci'), Option(2, 'Pablo Picasso'),Option(3,'Vincent van Gogh'),Option(4,'Michelangelo')],'Who painted the Mona Lisa?',1,0),
    3:Question(3,[Option(1, 'Mars'),Option(2, 'Jupiter'),Option(3,'Venus'),Option(4,'Saturn')],'Which planet is known as the Red Planet?',1,0),
    4:Question(4,[Option(1, 'Mount Kilimanjaro'),Option(2, 'Mount Everest'),Option(3,'Mount Fuji'),Option(4,'Mount McKinley')],'What is the tallest mountain in the world?',2,0),
  };
  String get_question(int question_id){
    return question_map[question_id]!.question_info;
  }
  int get_selected_option(int question_id){
    return question_map[question_id]!.userAns;

  }
  bool set_selected_option(int question_id,int option){
    question_map[question_id]!.userAns=option;
    return true;
  }
  List<Option> get_options(int question_id, {bool reset = false}){
    return question_map[question_id]!.options;
  }
  bool toggle_option_selection(int question_id, int option_id, bool current_selected_state ){
    Option option = question_map[question_id]!.options.firstWhere((opt) => opt.option_id == option_id);
    return option.set_selection_state(!current_selected_state);

  }
  int get_ans(int question_id){
    return  question_map[question_id]!.ans;
  }
  int get_result(){
    int correct=0;
    for(int i=1;i<5;i++){
      if(question_map[i]?.userAns==question_map[i]?.ans){
        correct++;
      }
    }
    return correct;
  }

}
