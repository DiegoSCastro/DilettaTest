import '../app.dart';

sealed class AppRoutes {
  static const home = '/';
  static const details = '/details';
  static const wishlist = '/wishlist';

  static final routes = {
    home: (context) => const HomePage(),
    details: (context) => const DetailsPage(),
    wishlist: (context) => const WishlistPage(),
  };
}
