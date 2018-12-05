import 'package:flutter/material.dart';

class ListKPIs extends StatefulWidget {
  @override
  ListKPIsState createState() => new ListKPIsState();
}

class ListKPIsState extends State<ListKPIs> {
  final _kPIs = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    _kPIs.add("Experiencia");
    _kPIs.add("Productividad");
    _kPIs.add("Ahorro");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('KPIs'),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: _kPIs.length,
            itemBuilder: (context, i) {
              return _buildKPIRow(_kPIs[i]);
            }));
  }

  Widget _buildKPIRow(_project) {
    return ListTile(
      leading: const Icon(
        Icons.lens,
        color: Colors.green,
      ),
      title: Text(
        _project,
        style: _biggerFont,
      ),
    );
  }
}
