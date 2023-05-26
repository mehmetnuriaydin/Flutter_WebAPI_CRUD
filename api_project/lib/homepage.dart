import 'package:flutter/material.dart';
import 'package:api_project/navigation_utils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Sayfa'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  NavigationUtils.goToUserCreation(context);
                },
                child: Text('Kullanıcı Oluştur'),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: 200.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  NavigationUtils.goToUserList(context);
                },
                child: Text('Kullanıcıları Listele'),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: 200.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  NavigationUtils.deleteUser(context);
                },
                child: Text('Kullanıcı Sil'),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: 200.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  NavigationUtils.goToActivityCreation(context);
                },
                child: Text('Aktivite Oluştur'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: 200.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  NavigationUtils.goToActivityList(context);
                },
                child: Text('Aktiviteleri Listele'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: 200.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  NavigationUtils.deleteActivity(context);
                },
                child: Text('Aktivite Sil'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
