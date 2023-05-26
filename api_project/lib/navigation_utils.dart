import 'package:api_project/activity_operations/activity_creation_screen.dart';
import 'package:api_project/activity_operations/activity_list_screen.dart';
import 'package:api_project/activity_operations/delete_activity_screen.dart';
import 'package:api_project/user_operations/delete_user_screen.dart';
import 'package:api_project/user_operations/user_creation_screen.dart';
import 'package:api_project/user_operations/user_list_screen.dart';
import 'package:flutter/material.dart';

class NavigationUtils {
  static void goToUserCreation(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserCreationScreen(),
      ),
    );
  }

  static void goToUserList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserListScreen(),
      ),
    );
  }

  static void deleteUser(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeleteUserScreen(),
      ),
    );
  }

  static void goToActivityCreation(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ActivityCreationScreen(),
      ),
    );
  }

  static void goToActivityList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ActivityListScreen(),
      ),
    );
  }

  static void deleteActivity(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeleteActivityScreen(),
      ),
    );
  }
}
