// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  final int value;

  HomeState({required this.value});
}

final class HomeInitial extends HomeState {
  HomeInitial({required super.value});
}

// class BottomNavigationDoneState extends HomeState {
//   final int value;
//   BottomNavigationDoneState({
//     required this.value,
//   });
// }
