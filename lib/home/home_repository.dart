import 'package:iranpasman/models/Ad.dart';
import 'package:iranpasman/models/ad_types.dart';
import 'package:iranpasman/network.dart';

class HomeRepository {
  NetworkProvider network = NetworkProvider();

  List<Ad> buyAds;
  int buyPage = 0;

  List<Ad> sellAds;
  int sellPage = 0;

  getAds(AdTypes type) async {
    int page = type == AdTypes.BUY ? buyPage : sellPage;
    try {
      List<Ad> temp = await network.getAds(page: page);
      if (type == AdTypes.BUY) {
        if (buyAds == null) {
          buyAds = [];
        }
        buyAds.addAll(temp);
        if(temp.length > 0)
          buyPage++;
        return buyAds;
      } else if (type == AdTypes.SELL) {
        if (sellAds == null) {
          sellAds = [];
        }
        sellAds.addAll(temp);
        if(temp.length > 0)
          sellPage++;
        return sellAds;
      }
    }catch(e){}


  }
}
