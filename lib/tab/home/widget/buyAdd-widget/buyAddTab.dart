import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class buyAddTab extends StatelessWidget{
  BorderSide itemCartLineSide=new BorderSide(color: Colors.grey.withOpacity(0.6),width: 1);
  TextStyle titleOfItemCartTextStyle=new TextStyle(fontWeight: FontWeight.bold,color: Colors.black);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        new Container(
          height: 10,
          width: double.infinity,
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [
                Colors.transparent,
                Colors.grey.withOpacity(0.2)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7,0.99]
            )
          ),
        ),
        new SizedBox(height: 4,),
        itemList(context),
      ],
    );
  }

 Widget itemList(BuildContext context) {
    return new Expanded(
      child: new Container(
        width: double.infinity,
        child:new ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index){
            return itemCart(index,context);

          },
        ) ,
      ),
    );
 }

  Widget itemCart(int index,BuildContext context) {
    return GestureDetector (
      onTap: (){
        Navigator.of(context).pushNamed("/BuyPassmand");
        print("hi");
      },
      child: new Container(
         width: double.infinity,
         margin: EdgeInsets.only(left: 20,right: 20),
         padding: EdgeInsets.only(bottom: 10,top: 10),
         decoration: new BoxDecoration(
//           color: Colors.grey,
           border: new Border(top:itemCartLineSide, ),
         ),
         child: new Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             new SizedBox(height: 5,),
             new Text("خرید همهخ ضایعات و لوارم و ضایعات منرل کابینت  ",style:titleOfItemCartTextStyle ,overflow: TextOverflow.ellipsis,),
             new SizedBox(height: 5,),
             Container(
               child: new Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   _imageInCart("assets/images/trash.jpg"),
                   new Column(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       textIconAttach(text1:"قیمت",text2: " 1100تومن به ازای هر کیلو",icon:Icons.attach_file_rounded ),
                       textIconAttach(text1:"دسته",text2: "ضایعات اهن",icon:Icons.category_rounded ),
                       textIconAttach(text1:"استان",text2: "تهران",icon:Icons.circle ),
                       textIconAttach(text1:"شهر",text2: "تهران",icon:Icons.location_on ),

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
    return new Container(
      height: 120,
      width: 110,
      decoration: new BoxDecoration(
        color: Colors.orange,
       border: Border.all(style:BorderStyle.none),
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imageAddress),

        )

      ),
    );
 }

 Widget textIconAttach({IconData icon,String text1,String text2}) {
    return Container(
      width: 258,
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.only(right: 7),
//      color: Colors.red,
      child: new Row(

        mainAxisAlignment:MainAxisAlignment.start ,
        children: [
          new Icon(icon,color:Colors.orange,size: 20,),
          new SizedBox(width: 5,),
          new Text( text1,style: new TextStyle(fontWeight: FontWeight.bold )),
          new Text( ":",style: new TextStyle(fontWeight: FontWeight.bold )),
          Container(
              width: 180,
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