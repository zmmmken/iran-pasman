import 'package:iranpasman/Advertise/screen/advertise_screen.dart';
import 'package:iranpasman/models/Ad.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AdvertiseEvent {}

class GetAdvertise extends AdvertiseEvent{
  final String id;

  GetAdvertise(this.id);

}

class ShowContactInformation extends AdvertiseScreen{}

class ShowAdEvent extends AdvertiseEvent{
  Ad ad;

  ShowAdEvent(this.ad);

}