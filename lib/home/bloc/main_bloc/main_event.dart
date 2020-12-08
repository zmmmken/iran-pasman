import 'package:iranpasman/home/bloc/main_bloc/main_state.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MainEvent {}

class ChangeState extends MainEvent{
  final MainState state;

  ChangeState(this.state);
}

