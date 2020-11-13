import 'package:iranpasman/bloc/main_bloc/main_state.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MainEvent {}

class ChangeState extends MainEvent{
  final int state;

  ChangeState(this.state);
}

