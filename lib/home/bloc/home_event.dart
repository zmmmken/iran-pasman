part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class ChangeHomeTab extends HomeEvent{
  AdTypes adType;
  ChangeHomeTab({this.adType  });
}

class GetMoreHomeData extends HomeEvent{
  AdTypes adType;

  GetMoreHomeData(this.adType);
}