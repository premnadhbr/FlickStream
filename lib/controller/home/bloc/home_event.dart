// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class BottomNavigationEvent extends HomeEvent {
  final int value;
  BottomNavigationEvent({
    required this.value,
  });
}
