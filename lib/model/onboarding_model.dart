import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c16/core/resources/AssetsManager.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String subtitle;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

final List<OnboardingModel> onboardingPages = [
  OnboardingModel(
    image: AssetsManager.onboarding_1,
    title: "onboardingTitle1".tr(),
    subtitle: "onboardingSubtitle1".tr(),
  ),
  OnboardingModel(
    image: AssetsManager.onboarding_2,
    title: "onboardingTitle2".tr(),
    subtitle: "onboardingSubtitle2".tr(),
  ),
  OnboardingModel(
    image: AssetsManager.onboarding_3,
    title: "onboardingTitle3".tr(),
    subtitle: "onboardingSubtitle3".tr(),
  ),
];
