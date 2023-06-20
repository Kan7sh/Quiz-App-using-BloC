abstract class QuestionEvent{}

class LoadQuestion extends QuestionEvent{
  final int question_id;
  LoadQuestion(this.question_id);
}

class TapOption extends QuestionEvent{
  final int question_id;
  final int option_id;
  TapOption(this.question_id,this.option_id);
}
class TapNextQuestion extends QuestionEvent{
  final int question_id;
  TapNextQuestion(this.question_id);
}
class TapPreviousQuestion extends QuestionEvent{
  final int question_id;
  TapPreviousQuestion(this.question_id);
}

class GetResult extends QuestionEvent{}