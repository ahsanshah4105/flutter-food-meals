import 'package:get/get.dart';
import '../../modules/dashboard/home/bindings/add_meal_binding.dart';
import '../../modules/dashboard/landing/binding/dashboard_binding.dart';
import '../../modules/dashboard/landing/views/dashboard.dart';
import '../../modules/dashboard/profile/bindings/edit_profile_binding.dart';
import '../../modules/dashboard/home/bindings/recipe_page_binding.dart';
import '../../modules/dashboard/home/bindings/weekly_plan_binding.dart';
import '../../modules/dashboard/home/views/add_meals_page.dart';
import '../../modules/dashboard/profile/views/edit_profile_page.dart';
import '../../modules/dashboard/home/views/recipes_page.dart';
import '../../modules/dashboard/home/views/weekly_plan.dart';
import '../../modules/on_boarding/binding/on_board_binding.dart';
import '../../modules/on_boarding/views/on_boarding_home.dart';
import '../../modules/splash/bindings/splash_binding.dart';
import '../../modules/splash/splash_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.Splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.OnboardingHome,
      page: () => OnBoardingHome(),
      binding: OnBoardBinding(),
    ),
    GetPage(
      name: AppRoutes.DashBoard,
      page: () => DashBoard(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => EditProfilePage(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.weeklyPlan,
      page: () => WeeklyPlan(),
      binding: WeeklyPlanBinding(),
    ),
    GetPage(
      name: AppRoutes.addMeals,
      page: () => AddMealsPage(),
      binding: AddMealBinding(),
    ),
    GetPage(
      name: AppRoutes.recipes,
      page: () => RecipesPage(),
      binding: RecipePageBinding(),
    ),
  ];
}
