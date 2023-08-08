abstract class NewsState{}

class NewsInitialState extends NewsState{}

class NewsbottomNavState extends NewsState{}

class LoadingDataState extends NewsState{}

class NewsgetBusinessSuccessState extends NewsState{}

class NewsgetBusinessErrorState extends NewsState{
  final String error;

  NewsgetBusinessErrorState(this.error);
}