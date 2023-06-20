import '../../models/option_model.dart';

abstract class QuestionState{}

class QuestionInitialState extends QuestionState {}
class QuestionLoaded extends QuestionState{

  final String question;
  final List<Option> options;
  final int selected;
  QuestionLoaded(this.question,this.options,this.selected);
}

