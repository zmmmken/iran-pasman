import 'package:meta/meta.dart';

@immutable
abstract class AddAdvertiseState {}

class InitialAddAdvertiseState extends AddAdvertiseState {}

class MasterBuyState extends AddAdvertiseState{}
class MasterCellState extends AddAdvertiseState{}
class MasterBidState extends AddAdvertiseState{}


