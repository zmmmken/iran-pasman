import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:iranpasman/Error/error.dart';
import 'package:iranpasman/master_bloc/bloc.dart';
import 'package:iranpasman/models/Ad.dart';
import 'package:iranpasman/notif/repository/notification_repoository.dart';
import 'package:meta/meta.dart';

part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, MasterState> {
  NotificationBloc() : super(NotificationInitial());

  NotificationRepository repository = NotificationRepository();

  @override
  Stream<MasterState> mapEventToState(
    NotificationEvent event,
  ) async* {
    if (event is getNotifications) {
      try {
        yield ShowLoading();
        await repository.getNotifications();
        if (repository.notifications.length == 0) {
          yield NoData();
        } else {
          yield ShowNotification(repository.notifications);
        }
      } catch (e) {
        if (e is TokenException) {
          yield TokenError();
        } else if (e is ConnectionException) {
          yield NetworkError();
        } else if (e is PublicException) {
          yield OtherError();
        }
      }
    }
  }
}
