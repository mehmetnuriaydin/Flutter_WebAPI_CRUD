import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActivityCreationScreen extends StatefulWidget {
  @override
  _ActivityCreationScreenState createState() => _ActivityCreationScreenState();
}

class _ActivityCreationScreenState extends State<ActivityCreationScreen> {
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  Future<void> _createActivity() async {
    String userId = _userIdController.text.trim();
    String name = _nameController.text.trim();
    String category = _categoryController.text.trim();
    String description = _descriptionController.text.trim();
    String price = _priceController.text.trim();

    final apiUrl = 'https://10.0.2.2:7214/api/Activities';

    // Aktivite verilerini JSON formatına dönüştürme
    final activityData = {
      'userId': userId,
      'name': name,
      'category': category,
      'description': description,
      'price': price,
    };
    final jsonData = jsonEncode(activityData);

    // API'ye isteği gönderme
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonData,
    );

    // Yanıt kontrol
    if (response.statusCode == 201) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Aktivite Oluşturuldu'),
          content: Text('Aktivite $name başarıyla oluşturuldu.'),
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
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Hata'),
          content: Text('Aktivite oluşturma hatası: ${response.statusCode}'),
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
        title: Text('Aktivite Oluşturma'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _userIdController,
                decoration: InputDecoration(
                  labelText: 'Kullanıcı ID',
                ),
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Aktivite Adı',
                ),
              ),
              TextField(
                controller: _categoryController,
                decoration: InputDecoration(
                  labelText: 'Kategori',
                ),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Açıklama',
                ),
              ),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Fiyat',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _createActivity,
                child: Text('Aktivite Oluştur'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
