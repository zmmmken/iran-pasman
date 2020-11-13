import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iranpasman/widgets/buy_btn.dart';
import 'package:iranpasman/widgets/buy_clipper.dart';
import 'package:iranpasman/widgets/info_button.dart';

class AdvertiseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1, height: size.width - 100),
              items: [
                Image.asset("assets/images/image1.webp", fit: BoxFit.cover),
                Image.asset("assets/images/image2.webp", fit: BoxFit.cover),
              ]),
          Column(
            children: [
              SizedBox(
                height: 250,
              ),
              Expanded(
                child: ClipPath(
                  clipper: AdClipper(),
                  child: Container(
                    width: double.maxFinite,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "شماره آگهی :  123456",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "توضیحات : ",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.",
                                style: TextStyle(
                                    fontSize: 14.5),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Container(height: 55,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ClipPath(
              clipper: BuyClipper(),
              child: InfoButton(),
            ),
          )
        ],
      ),
    );
  }
}

class AdClipper extends CustomClipper<Path> {
  double constant = 25;

  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - constant, 0);
    path.lineTo(size.width, constant);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, constant);
    path.lineTo(constant, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
