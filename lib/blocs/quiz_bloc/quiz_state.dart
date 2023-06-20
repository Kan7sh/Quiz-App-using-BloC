abstract class QuizState{}

class QuizInitialState extends QuizState{}
class QuizInfoLoaded extends QuizState{
  final String quiz_description;
  final String quiz_category;
  QuizInfoLoaded(this.quiz_description,this.quiz_category);
}
class QuizStart extends QuizState{}
class QuizSubmitted extends QuizState{}