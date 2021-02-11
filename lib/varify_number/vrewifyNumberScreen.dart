import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/master_bloc/master_state.dart';
import 'package:iranpasman/varify_number/bloc/bloc.dart';

class VerifyNumberScreen extends StatelessWidget {

  String phoneNumber;
  GlobalKey<FormFieldState> phoneKey = GlobalKey<FormFieldState>();
  VerifyBloc _bloc = VerifyBloc(InitialVerifyState());
  TextEditingController controller = TextEditingController();


  VerifyNumberScreen({this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ورود"),
      ),
      body: BlocBuilder(
        cubit: _bloc,
        builder:(context,state)=> Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "کد پیامکی ارسال شده به شماره ${this.phoneNumber} را وارد کنید",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                key: phoneKey,
                controller: controller,
                decoration: InputDecoration(
                    labelText: "کد", border: UnderlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: (input) {
                  if (input.length != 4) {
                    return "کد وارد شده نا معتبر است";
                  }
                },
              ),
              SizedBox(
                height: 25,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: state is ShowLoading ? Theme.of(context).primaryColor.withOpacity(.3):Theme.of(context).primaryColor,
                onPressed: () {
                  if (state is! ShowLoading) {
                    if (phoneKey.currentState.validate()) {
                      print("Phone Number is correct");
                      _bloc.add(VerifyCode(
                          context: context, phoneNumber: phoneNumber,code: controller.text));
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      state is ShowLoading
                          ? CircularProgressIndicator()
                          : Text(
                        "ورود",
                        style:
                        TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
