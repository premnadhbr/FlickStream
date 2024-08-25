import 'package:flickstream/utils/colors.dart';
import 'package:flickstream/view/home/homepage.dart';
import 'package:flickstream/view/onboarding/widgets/customcard.dart';
import 'package:flickstream/view/onboarding/widgets/dotindocator.dart';
import 'package:flickstream/view/onboarding/widgets/onboarding_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(onboardingList[_currentIndex].bgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(28),
          decoration:
              BoxDecoration(gradient: AppColors.customOnboardingGradient),
          child: Column(
            children: [
              const Spacer(),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  controller: _pageController,
                  itemCount: onboardingList.length,
                  itemBuilder: (context, index) {
                    return OnboardingCard(
                      onboarding: onboardingList[index],
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDotsIndicator(
                    dotsCount: onboardingList.length,
                    position: _currentIndex,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_currentIndex == onboardingList.length - 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Homepage()));
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                        );
                      }
                    },
                    child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.kPrimary,
                            shape: BoxShape.rectangle),
                        margin: const EdgeInsets.only(right: 20),
                        child: const Icon(Icons.arrow_forward_ios)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
