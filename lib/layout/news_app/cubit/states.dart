abstract class NewsSates {}

class NewsInitialStates extends NewsSates {}

class NewsBottomNavStates extends NewsSates {}

class NewsGetBusinessLoadingStates extends NewsSates {}

class NewsGetBusinessSuccessStates extends NewsSates {}

class NewsGetBusinessErrorStates extends NewsSates {
  final String error;

  NewsGetBusinessErrorStates(this.error);
}

class NewsGetSportsLoadingStates extends NewsSates {}

class NewsGetSportsSuccessStates extends NewsSates {}

class NewsGetSportsErrorStates extends NewsSates {
  final String error;

  NewsGetSportsErrorStates(this.error);
}

class NewsGetScienceLoadingStates extends NewsSates {}

class NewsGetScienceSuccessStates extends NewsSates {}

class NewsGetScienceErrorStates extends NewsSates {
  final String error;

  NewsGetScienceErrorStates(this.error);
}
class NewsGetSearchLoadingStates extends NewsSates {}

class NewsGetSearchSuccessStates extends NewsSates {}

class NewsGetSearchErrorStates extends NewsSates {
  final String error;

  NewsGetSearchErrorStates(this.error);
}
