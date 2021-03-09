part of 'notification_bloc.dart';

class NotificationInitial extends MasterState {}

class ShowNotification extends MasterState{
  List<Ad> ads;

  ShowNotification(this.ads);
}

