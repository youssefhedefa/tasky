abstract class LogOutState{}

class LogOutInitialState extends LogOutState{}

class LogOutLoadingState extends LogOutState{}

class LogOutSuccessState extends LogOutState{}

class LogOutErrorState extends LogOutState{
  final String message;

  LogOutErrorState({required this.message});
}