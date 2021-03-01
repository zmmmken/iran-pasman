import 'package:iranpasman/add_advertise/bloc/add_advertise_state.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AddAdvertiseEvent {}

class NavigateAnotherState extends AddAdvertiseEvent{
  final AddAdvertiseState state;
  final context;
  NavigateAnotherState(this.context,this.state);

}
