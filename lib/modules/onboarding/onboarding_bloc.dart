import 'package:app/modules/onboarding/onboarding_model.dart';

abstract class OnboardingRepo {
  Future<OnboardingModel> getonBoarding();
}
