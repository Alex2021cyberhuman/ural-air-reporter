import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  final List<Map<String, dynamic>> _data = [
    {'id': 1, 'date': '2024-01-15', 'pm25': 12.5, 'pm10': 25.3, 'status': 'Хорошо'},
    {'id': 2, 'date': '2024-01-16', 'pm25': 35.8, 'pm10': 48.2, 'status': 'Умеренно'},
    {'id': 3, 'date': '2024-01-17', 'pm25': 65.2, 'pm10': 78.9, 'status': 'Плохо'},
    {'id': 4, 'date': '2024-01-18', 'pm25': 18.7, 'pm10': 32.1, 'status': 'Хорошо'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Таблица данных'),
        backgroundColor: Colors.green[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Дата')),
            DataColumn(label: Text('PM2.5')),
            DataColumn(label: Text('PM10')),
            DataColumn(label: Text('Статус')),
          ],
          rows: _data.map((item) {
            return DataRow(
              cells: [
                DataCell(Text(item['id'].toString())),
                DataCell(Text(item['date'])),
                DataCell(Text(item['pm25'].toString())),
                DataCell(Text(item['pm10'].toString())),
                DataCell(
                  Chip(
                    label: Text(
                      item['status'],
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: _getStatusColor(item['status']),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Добавить новую запись
        },
        backgroundColor: Colors.green[800],
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Хорошо':
        return Colors.green;
      case 'Умеренно':
        return Colors.orange;
      case 'Плохо':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}