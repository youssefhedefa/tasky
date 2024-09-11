abstract class LogInState{}

class LogInInitialState extends LogInState{}

class LogInLoadingState extends LogInState{}

class LogInSuccessState extends LogInState{}

class LogInErrorState extends LogInState{
  final String message;

  LogInErrorState({required this.message});
}