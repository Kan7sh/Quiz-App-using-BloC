// ignore_for_file: non_constant_identifier_names

import 'option_model.dart';

class Question{
  final int question_id;
  final String question_info;
  final List<Option> options;
  final int ans;
  int userAns;
  Question(this.question_id, this.options, this.question_info,this.ans,this.userAns);
}