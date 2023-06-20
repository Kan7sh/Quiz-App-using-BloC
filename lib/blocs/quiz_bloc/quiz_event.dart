abstract class QuizEvent{}

class LoadQuizInfo extends QuizEvent{
  final int quiz_id;
  LoadQuizInfo(this.quiz_id);
}

class StartQuiz extends QuizEvent{
  final int quiz_id;
  StartQuiz(this.quiz_id);
}
class SubmittedQuiz extends QuizEvent{
  final int quiz_id;
  SubmittedQuiz(this.quiz_id);
}
