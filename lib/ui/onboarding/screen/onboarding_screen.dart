import 'package:evently_c16/core/resources/AssetsManager.dart';
import 'package:evently_c16/core/resources/ColorsManager.dart';
import 'package:evently_c16/core/resources/RoutesManager.dart';
import 'package:evently_c16/core/source/remote/PrefsManager.dart';
import 'package:evently_c16/model/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  void nextPage() async {
    if (currentPage < onboardingPages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      await PrefsManager.setFirstTime(false);
      Navigator.pushReplacementNamed(context, RoutesManager.login);
    }
  }

  void previousPage() async {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset(
          AssetsManager.logoBar,
          height: 50,
          fit: BoxFit.fitHeight,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: onboardingPages.length,
              onPageChanged: (index) {
                setState(() => currentPage = index);
              },
              itemBuilder: (context, index) {
                final page = onboardingPages[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      Center(child: Image.asset(page.image, height: 300)),
                      const SizedBox(height: 40),
                      Text(
                        page.title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: ColorsManager.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        page.subtitle,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: previousPage,
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                  ),
                  color: ColorsManager.primaryColor,
                  iconSize: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingPages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: currentPage == index ? 24 : 8,
                      decoration: BoxDecoration(
                        color: currentPage == index
                            ? ColorsManager.primaryColor
                            : Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: nextPage,
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                  color: ColorsManager.primaryColor,
                  iconSize: 28,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
