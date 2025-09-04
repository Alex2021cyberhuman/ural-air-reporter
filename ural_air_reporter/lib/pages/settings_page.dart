import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkMode = false;
  String _selectedLanguage = 'Русский';
  double _updateInterval = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки системы'),
        backgroundColor: Colors.purple[800],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader('Уведомления'),
          SwitchListTile(
            title: const Text('Включить уведомления'),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          const SizedBox(height: 20),
          _buildSectionHeader('Внешний вид'),
          SwitchListTile(
            title: const Text('Тёмная тема'),
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
            },
          ),
          const SizedBox(height: 20),
          _buildSectionHeader('Язык'),
          DropdownButtonFormField<String>(
            value: _selectedLanguage,
            items: ['Русский', 'English', 'Deutsch', 'Español']
                .map((language) => DropdownMenuItem(
              value: language,
              child: Text(language),
            ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedLanguage = value!;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Выберите язык',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          _buildSectionHeader('Интервал обновления'),
          Slider(
            value: _updateInterval,
            min: 5.0,
            max: 60.0,
            divisions: 11,
            label: '${_updateInterval.round()} минут',
            onChanged: (value) {
              setState(() {
                _updateInterval = value;
              });
            },
          ),
          Text(
            'Интервал обновления: ${_updateInterval.round()} минут',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              _showSaveDialog();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[800],
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              'Сохранить настройки',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey,
      ),
    );
  }

  void _showSaveDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Сохранение'),
        content: const Text('Настройки успешно сохранены!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}