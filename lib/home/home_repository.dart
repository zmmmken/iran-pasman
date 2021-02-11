import 'package:iranpasman/models/Ad.dart';
import 'package:iranpasman/models/ad_types.dart';
import 'package:iranpasman/models/category.dart';
import 'package:iranpasman/network.dart';

class HomeRepository {
  NetworkProvider network = NetworkProvider();

  List<Category> selectedCategory=[];
  List<Category> tempSelectedCategory=[];

  List<Category> allCategory;

  Map<AdTypes,List<Ad>> ads = {
    AdTypes.BUY : null,
    AdTypes.SELL : null
  };

  Map<AdTypes,int> pages = {
    AdTypes.BUY : 0,
    AdTypes.SELL : 0
  };


  List<Ad> buyAds;
  int buyPage = 0;

  List<Ad> sellAds;
  int sellPage = 0;

  getAds(AdTypes type,context) async {
    try {
      List<Ad> temp = await network.getAds(page: pages[type],category: selectedCategory.length>0 ? selectedCategory[0].id : null);
      if(ads[type]== null){
        ads[type] = [];
      }
        ads[type].addAll(temp);
        if(temp.length > 0)
          pages[type]++;
        return ads[type];

    }catch(e){}


  }

  getCategoryList()async{
    List<Category> categories = await network.getAllCategory();
    return categories;
  }

  getRootCategory()async{
    List<Category> categories = await network.getRootCategory();
    return categories;
  }

}
