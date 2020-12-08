import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/Advertise/bloc/bloc.dart';
import 'package:iranpasman/Advertise/screen/image_screen.dart';
import 'package:iranpasman/master_bloc/master_state.dart';
import 'package:iranpasman/models/Ad.dart';
import 'package:iranpasman/widgets/buy_clipper.dart';
import 'package:iranpasman/widgets/info_btn.dart';

class AdvertiseScreen extends StatelessWidget {
  Ad advertise;
  String id;

  AdvertiseScreen({this.advertise, this.id});

  @override
  Widget build(BuildContext context) {
    AdvertiseBloc _bloc;
    if (advertise != null) {
      _bloc = AdvertiseBloc(ShowProduct(advertise));
    } else {
      _bloc = AdvertiseBloc(ShowLoading());
      _bloc.add(GetAdvertise(id));
    }



    return Scaffold(
      body: BlocBuilder(
        cubit: _bloc,
        builder: (context, state) {
          if (state is ShowProduct) {
            return Stack(
              children: [
//                CarouselSlider(
//                    options: CarouselOptions(
//                        viewportFraction: 1, height: size.width - 100),
//                    items: [
//                      Image.asset("assets/images/image1.webp", fit: BoxFit.cover),
//                      Image.asset("assets/images/image2.webp", fit: BoxFit.cover),
//                    ]),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context){
                        return ImageScreen(advertise.images);
                      })
                    );
                  },

                  child: Hero(
                    tag: advertise.images[0],
                    child: Image.asset(
                      advertise.images[0],
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.maxFinite,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 170,
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
                                    "استان :  ${advertise.state}",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    "شهر :  ${advertise.city}",
                                    style: TextStyle(color: Colors.grey),
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    advertise.title,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      advertise.description,
                                      style: TextStyle(fontSize: 14.5),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  Container(
                                    height: 55,
                                  ),
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
            );
          }

          return CircularProgressIndicator();
        },
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
