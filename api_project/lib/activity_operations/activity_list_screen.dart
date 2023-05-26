import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActivityListScreen extends StatefulWidget {
  @override
  _ActivityListScreenState createState() => _ActivityListScreenState();
}

class _ActivityListScreenState extends State<ActivityListScreen> {
  List<dynamic> _activities = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final activityUrl = 'https://10.0.2.2:7214/api/Activities';
    final userUrl = 'https://10.0.2.2:7214/api/User';

    final activityResponse = await http.get(Uri.parse(activityUrl));
    final userResponse = await http.get(Uri.parse(userUrl));

    if (activityResponse.statusCode == 200 && userResponse.statusCode == 200) {
      final activityData = jsonDecode(activityResponse.body);
      final userData = jsonDecode(userResponse.body);

      Map<int, String> userNames = {};
      for (final user in userData) {
        userNames[user['id']] = user['name'];
      }

      List<dynamic> activities = [];
      for (final activity in activityData) {
        int userId = activity['userId'];
        String userName = userNames[userId] ?? 'Bilinmiyor';

        Map<String, dynamic> updatedActivity = {
          'id': activity['id'],
          'name': activity['name'],
          'category': activity['category'],
          'description': activity['description'],
          'price': activity['price'],
          'userName': userName,
        };

        activities.add(updatedActivity);
      }

      setState(() {
        _activities = activities;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Hata'),
          content: Text('Veri alma hatası: ${activityResponse.statusCode} - ${userResponse.statusCode}'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tamam'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aktivite Listesi'),
      ),
      body: ListView.builder(
        itemCount: _activities.length,
        itemBuilder: (context, index) {
          final activity = _activities[index];
          return ListTile(
            title: Text(activity['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kullanıcı: ${activity['userName']}'),
                Text('Kategori: ${activity['category']}'),
                Text('Açıklama: ${activity['description']}'),
                Text('Fiyat: ${activity['price']} TL'),
              ],
            ),
            onTap: () {
              // Aktiviteye tıklandığında yapılacak işlemler
            },
          );
        },
      ),
    );
  }
}
