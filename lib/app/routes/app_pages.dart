import 'package:get/get.dart';

import '../modules/apartment_reservation_details/bindings/apartment_reservation_details_binding.dart';
import '../modules/apartment_reservation_details/views/apartment_reservation_details_view.dart';
import '../modules/apartments/bindings/apartments_binding.dart';
import '../modules/apartments/views/apartments_view.dart';
import '../modules/appartment_reservation/bindings/appartment_reservation_binding.dart';
import '../modules/appartment_reservation/views/appartment_reservation_view.dart';
import '../modules/chalet_reservation_details/bindings/chalet_reservation_details_binding.dart';
import '../modules/chalet_reservation_details/views/chalet_reservation_details_view.dart';
import '../modules/chalets_reservation/bindings/chalets_reservation_binding.dart';
import '../modules/chalets_reservation/views/chalets_reservation_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/chat_details_page/bindings/chat_details_page_binding.dart';
import '../modules/chat_details_page/views/chat_details_page_view.dart';
import '../modules/chats/bindings/chats_binding.dart';
import '../modules/chats/views/chats_view.dart';
import '../modules/city_destinations/bindings/city_destinations_binding.dart';
import '../modules/city_destinations/views/city_destinations_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/destination_details/bindings/destination_details_binding.dart';
import '../modules/destination_details/views/destination_details_view.dart';
import '../modules/destinations/bindings/destinations_binding.dart';
import '../modules/destinations/views/destinations_view.dart';
import '../modules/favorites/bindings/favorites_binding.dart';
import '../modules/favorites/views/favorites_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/hotel_reservation/bindings/hotel_reservation_binding.dart';
import '../modules/hotel_reservation/views/hotel_reservation_view.dart';
import '../modules/hotel_reservation_details/bindings/hotel_reservation_details_binding.dart';
import '../modules/hotel_reservation_details/views/hotel_reservation_details_view.dart';
import '../modules/hotels/bindings/hotels_binding.dart';
import '../modules/hotels/views/hotels_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/reservations/bindings/reservations_binding.dart';
import '../modules/reservations/views/reservations_view.dart';
import '../modules/resorts/bindings/resorts_binding.dart';
import '../modules/resorts/views/resorts_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;
  //  static const INITIAL = Routes.DASHBOARD;
  // static const INITIAL = Routes.WELCOME;

  // static const INITIAL = Routes.WELCOME;
  static const INITIAL = Routes.SPLASH; // use splash screen instead

  //change initial page

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHATS,
      page: () => ChatsView(),
      binding: ChatsBinding(),
    ),
    GetPage(
      name: _Paths.RESERVATIONS,
      page: () => ReservationsView(),
      binding: ReservationsBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITES,
      page: () => FavoritesView(),
      binding: FavoritesBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.DESTINATIONS,
      page: () => DestinationsView(),
      binding: DestinationsBinding(),
    ),
    GetPage(
      name: _Paths.DESTINATION_DETAILS,
      page: () => DestinationDetailsView(),
      binding: DestinationDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.CITY_DESTINATIONS,
      page: () => CityDestinationsView(),
      binding: CityDestinationsBinding(),
    ),
    GetPage(
      name: _Paths.HOTELS,
      page: () => HotelsView(),
      binding: HotelsBinding(),
    ),
    GetPage(
      name: _Paths.APARTMENTS,
      page: () => ApartmentsView(),
      binding: ApartmentsBinding(),
    ),
    GetPage(
      name: _Paths.RESORTS,
      page: () => ResortsView(),
      binding: ResortsBinding(),
    ),
    GetPage(
      name: _Paths.HOTEL_RESERVATION,
      page: () => HotelReservationView(),
      binding: HotelReservationBinding(),
    ),
    GetPage(
      name: _Paths.APARTMENT_RESERVATION,
      page: () => ApartmentReservationView(),
      binding: ApartmentReservationBinding(),
    ),
    GetPage(
      name: _Paths.CHALETS_RESERVATION,
      page: () => ChaletsReservationView(),
      binding: ChaletsReservationBinding(),
    ),
    GetPage(
      name: _Paths.APARTMENT_RESERVATION_DETAILS,
      page: () => ApartmentReservationDetailsView(),
      binding: ApartmentReservationDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CHALET_RESERVATION_DETAILS,
      page: () => ChaletReservationDetailsView(),
      binding: ChaletReservationDetailsBinding(),
    ),
    GetPage(
      name: _Paths.HOTEL_RESERVATION_DETAILS,
      page: () => HotelReservationDetailsView(),
      binding: HotelReservationDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_DETAILS_PAGE,
      page: () => ChatDetailsPageView(),
      binding: ChatDetailsPageBinding(),
    ),
  ];
}
