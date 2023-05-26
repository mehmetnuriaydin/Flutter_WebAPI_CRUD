import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteUserScreen extends StatefulWidget {
  @override
  _DeleteUserScreenState createState() => _DeleteUserScreenState();
}

class _DeleteUserScreenState extends State<DeleteUserScreen> {
  TextEditingController _userIdController = TextEditingController();

  Future<void> _deleteUser() async {
    int userId = int.tryParse(_userIdController.text) ?? 0;
    if (userId > 0) {
      final apiUrl = 'https://10.0.2.2:7214/api/User/$userId';

      final response = await http.delete(Uri.parse(apiUrl));

      if (response.statusCode == 204) {
        // Kullanıcı başarıyla silindi
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Başarılı'),
            content: Text('Kullanıcı başarıyla silindi.'),
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
            content: Text('Kullanıcı silinirken bir hata oluştu: ${response.statusCode}'),
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
          content: Text('Geçersiz kullanıcı ID'),
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
        title: Text('Kullanıcı Sil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _userIdController,
              decoration: InputDecoration(
                labelText: 'Kullanıcı ID',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _deleteUser,
              child: Text('Kullanıcıyı Sil'),
            ),
          ],
        ),
      ),
    );
  }
}
