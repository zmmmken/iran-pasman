import 'package:flutter/material.dart';
import 'package:iranpasman/Advertise/screen/advertise_screen.dart';
import 'package:iranpasman/models/Ad.dart';

class AdvertiseItem extends StatelessWidget {
  Ad advertise;


  AdvertiseItem(this.advertise);

  @override
  Widget build(BuildContext context) {
    return itemCart(advertise, context);
  }


  BorderSide itemCartLineSide=new BorderSide(color: Colors.grey.withOpacity(0.6),width: 1);
  TextStyle titleOfItemCartTextStyle=new TextStyle(fontWeight: FontWeight.bold,color: Colors.black);

  Widget itemCart(Ad advertise,BuildContext context) {
    return InkWell (
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              return AdvertiseScreen(advertise: advertise,);
            })
        );
        print("hi");
      },
      child: new Ink(
        width: double.infinity,
//        margin: EdgeInsets.only(left: 20,right: 20),
        padding: EdgeInsets.only(bottom: 10,top: 10,right: 20,left: 20),
        decoration: new BoxDecoration(
//           color: Colors.grey,
          border: new Border(bottom:itemCartLineSide, ),
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new SizedBox(height: 5,),
            new Text(advertise.title,style:titleOfItemCartTextStyle ,overflow: TextOverflow.ellipsis,),
            new SizedBox(height: 5,),
            Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _imageInCart((advertise.images != null && advertise.images.length>0) ? advertise?.images[0] : ""),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textIconAttach(text1:"قیمت",text2: advertise.price ?? "",icon:Icons.attach_file_rounded ),
                      textIconAttach(text1:"دسته",text2: advertise.category ?? "",icon:Icons.category_rounded ),
                      textIconAttach(text1:"استان",text2: advertise.state.title ?? "",icon:Icons.circle ),
                      textIconAttach(text1:"شهر",text2: advertise.city.title ?? "",icon:Icons.location_on ),

                    ],
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _imageInCart(String imageAddress) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: FadeInImage(
          height: 120,
          width: 100,
          fit: BoxFit.cover,
          placeholder: AssetImage("assets/images/image1.webp"), image: NetworkImage(imageAddress)),
    );



  }

  Widget textIconAttach({IconData icon,String text1,String text2}) {
    return Container(

      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.only(right: 7),
//      color: Colors.red,
      child: new Row(

        mainAxisAlignment:MainAxisAlignment.start ,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Icon(icon,color:Colors.orange,size: 20,),
          new SizedBox(width: 5,),
          new Text( text1,style: new TextStyle(fontWeight: FontWeight.bold )),
          new Text( ":",style: new TextStyle(fontWeight: FontWeight.bold )),
          Container(
              height: 30,
              padding: EdgeInsets.only(right: 3,top: 2),
//              color: Colors.blue,
              child: new Text( text2,style: new TextStyle(fontWeight: FontWeight.w400,fontSize: 12 ),overflow: TextOverflow.ellipsis,)
          ),
        ],
      ),
    );
  }

}
