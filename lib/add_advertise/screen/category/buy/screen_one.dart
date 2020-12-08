import 'package:flutter/material.dart';
import 'package:iranpasman/add_advertise/screen/category/model/drop_down_model.dart';

class FirstBuyScreen extends StatefulWidget {
  @override
  _FirstBuyScreenState createState() => _FirstBuyScreenState();
}

class _FirstBuyScreenState extends State<FirstBuyScreen> {

  DropDownModel weightModel;
  DropDownModel selectedPrice;
  List<DropDownModel> weights = [
    DropDownModel(title: "تن",id: "0"),
    DropDownModel(title: "کیلوگرم",id: "1"),
    DropDownModel(title: "گرم",id: "2"),
  ];

  List<DropDownModel> prices = [
    DropDownModel(title: "تومان",id: "0"),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weightModel = weights[0];
    selectedPrice = prices[0];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("آگهی خرید",style: TextStyle(fontSize: 19),),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "عنوان آگهی"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width *.4,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "وزن"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    width: size.width *.4,

                    child: DropdownButton<DropDownModel>(
                      isExpanded: true,
                      underline: Container(),
                      value: weightModel,
                      onChanged: (DropDownModel newValue) {
                        setState(() {
                          weightModel = newValue;
                        });
                      },
                      items: weights
                          .map<DropdownMenuItem<DropDownModel>>((DropDownModel value) {
                        return DropdownMenuItem<DropDownModel>(
                          value: value,
                          child: Container(

                              child: Text(value.title)),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width *.4,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "قیمت"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    width: size.width *.4,

                    child: DropdownButton<DropDownModel>(
                      isExpanded: true,
                      underline: Container(),
                      value: selectedPrice,
                      onChanged: (DropDownModel newValue) {
                        setState(() {
                          selectedPrice = newValue;
                        });
                      },
                      items: prices
                          .map<DropdownMenuItem<DropDownModel>>((DropDownModel value) {
                        return DropdownMenuItem<DropDownModel>(
                          value: value,
                          child: Container(
                              child: Text(value.title)),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
