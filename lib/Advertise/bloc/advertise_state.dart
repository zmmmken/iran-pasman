import 'package:iranpasman/master_bloc/bloc.dart';
import 'package:iranpasman/models/Ad.dart';
import 'package:meta/meta.dart';

class InitialAdvertiseState extends MasterState {}

class ShowProduct extends MasterState{
  final Ad advertise;
  ShowProduct(this.advertise);
}

class ShowPhoneNumber extends MasterState{}
