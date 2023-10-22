import 'package:feeds/ui/screens/feeds_screen.dart';
import 'package:feeds/ui/screens/home_screen.dart';
import 'package:feeds/ui/screens/login_screen.dart';
import 'package:feeds/ui/screens/post_feed_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/route_names.dart';
import '../ui/screens/comments_screen.dart';

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const LogInScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case feedScreen:
        return MaterialPageRoute(builder: (context) => const FeedsScreen());
      case postFeedScreen:
        return MaterialPageRoute(builder: (context) => const PostFeedScreen());
      case commentsScreen:
        return  MaterialPageRoute(builder: (context) => const CommentsScreen());
      default:
        return MaterialPageRoute(builder: (context) => const LogInScreen());
    }
  }
}
