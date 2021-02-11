import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/login/bloc/login_event.dart';
import 'package:iranpasman/master_bloc/bloc.dart';

import 'bloc/bloc.dart';
import 'bloc/login_bloc.dart';

class EnterPhoneNumberScreen extends StatelessWidget {
  GlobalKey<FormFieldState> phoneKey = GlobalKey<FormFieldState>();
  LoginBloc _bloc = LoginBloc(InitialLoginState());
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: _bloc,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text("ورود"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "شماره تلفن خود را وارد کنید",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                key: phoneKey,
                controller: controller,
                decoration: InputDecoration(
                    labelText: "تلفن", border: UnderlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: (input) {
                  if (input.length < 11) {
                    return "شماره تلفن معتبر وارد کنید";
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
                      _bloc.add(SendCode(
                          context: context, phoneNumber: controller.text));
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
                              "ارسال کد",
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
