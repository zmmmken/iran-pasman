part of 'home_bloc.dart';

class HomeTab extends MasterState {
  final int tab;

  HomeTab(this.tab);
}

class ShowHomeData extends MasterState{
  AdTypes types;
  List<Ad> ads;
  List<DailyPriceModel> prices;

  ShowHomeData(this.ads);
}


class LoadMoreData extends ShowHomeData{
  LoadMoreData(List ads):super(ads);
}