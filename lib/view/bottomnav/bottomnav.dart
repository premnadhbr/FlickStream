import 'package:flickstream/controller/home/bloc/home_bloc.dart';
import 'package:flickstream/utils/colors.dart';
import 'package:flickstream/view/home/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  HomeBloc homeBloc = HomeBloc();

  List<Widget> screens = <Widget>[
    const Homepage(),
    const Homepage(),
    const Homepage(),
    const Homepage(),
    const Homepage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: homeBloc,
      builder: (context, state) {
        return Scaffold(
          body: screens.elementAt(state.value),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.KBackground,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.kPrimary,
            unselectedIconTheme: const IconThemeData(color: AppColors.kWhite),
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            items: const [
              BottomNavigationBarItem(icon: Icon(Ionicons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Ionicons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Ionicons.newspaper), label: 'News'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart), label: 'WishList'),
              BottomNavigationBarItem(
                  icon: Icon(Ionicons.person_outline), label: 'Profile')
            ],
            currentIndex: state.value,
            unselectedItemColor: const Color.fromARGB(255, 207, 205, 205),
            onTap: (value) {
              homeBloc.add(BottomNavigationEvent(value: value));
            },
          ),
        );
      },
    );
  }
}
