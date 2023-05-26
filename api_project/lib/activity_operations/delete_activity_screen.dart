import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteActivityScreen extends StatefulWidget {
  @override
  _DeleteActivityScreenState createState() => _DeleteActivityScreenState();
}

class _DeleteActivityScreenState extends State<DeleteActivityScreen> {
  TextEditingController _activityIdController = TextEditingController();

  Future<void> _deleteActivity() async {
    int activityId = int.tryParse(_activityIdController.text) ?? 0;
    if (activityId > 0) {
      final apiUrl = 'https://10.0.2.2:7214/api/Activities/$activityId';

      final response = await http.delete(Uri.parse(apiUrl));

      if (response.statusCode == 204) {
        // Aktivite başarıyla silindi
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Başarılı'),
            content: Text('Aktivite başarıyla silindi.'),
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
      } else {
        // Hata durumunda hata mesajını işleme
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Hata'),
            content: Text('Aktivite silinirken bir hata oluştu: ${response.statusCode}'),
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
    } else {
      // Geçersiz ID uyarısı
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Uyarı'),
          content: Text('Geçersiz aktivite ID'),
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
        title: Text('Aktivite Sil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _activityIdController,
              decoration: InputDecoration(
                labelText: 'Aktivite ID',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _deleteActivity,
              child: Text('Aktiviteyi Sil'),
            ),
          ],
        ),
      ),
    );
  }
}
