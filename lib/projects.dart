import 'package:flutter/material.dart';
import 'kpis.dart';

class ListProjects extends StatefulWidget {
  @override
  ListProjectsState createState() => new ListProjectsState();
}

class ListProjectsState extends State<ListProjects> {
  final _projects = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    _projects.add("Consultas y Reclamos");
    _projects.add("Banca Negocio");
    _projects.add("Credito Consumo");
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _projects.length,
        itemBuilder: (context, i) {
          return _buildProjectRow(_projects[i]);
        });
  }

  Widget _buildProjectRow(_project) {
    return ListTile(
      leading: const Icon(
        Icons.lens,
        color: Colors.green,
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return ListKPIs();
        }));
      },
      title: Text(
        _project,
        style: _biggerFont,
      ),
    );
  }
}
