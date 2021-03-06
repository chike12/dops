import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'kpis.dart';

class ListProjects extends StatefulWidget {
  @override
  ListProjectsState createState() => new ListProjectsState();
}

class ListProjectsState extends State<ListProjects> {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('proyecto').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.documents[index];
                return _buildProjectRow('${ds['nombre']}', '${ds['icon']}');
              });
        });
  }

  Widget _buildProjectRow(String _projectName, String _projectIcon) {
    return ListTile(
      leading: projectIcon(_projectIcon),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ListKPIs(projectName: _projectName);
        }));
      },
      title: Text(
        _projectName,
        style: _biggerFont,
      ),
    );
  }

  Widget projectIcon(String _projectIcon) {
    IconData acUnit =
        IconData(int.parse(_projectIcon), fontFamily: 'MaterialIcons');
    return Icon(acUnit);
  }
}
