import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListKPIs extends StatefulWidget {
  final String projectName;

  // In the constructor, require a projectName
  ListKPIs({Key key, @required this.projectName}) : super();

  @override
  ListKPIsState createState() => new ListKPIsState(projectName: projectName);
}

class ListKPIsState extends State<ListKPIs> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final String projectName;

  // In the constructor, require a projectName
  ListKPIsState({Key key, @required this.projectName}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('KPIs'),
        ),
        body: _buildListView(context));
  }

  Widget _buildListView(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('resultadoKpi')
            .where('nombreProyecto', isEqualTo: projectName)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.documents[index];
                ResultadoKpi resultadoKpi = new ResultadoKpi();
                resultadoKpi.aspiracion = ds['aspiracion'];
                resultadoKpi.meta = ds['meta'];
                resultadoKpi.resultado = ds['resultado'];
                resultadoKpi.periodo = ds['periodo'];
                resultadoKpi.nombre = ds['nombre'];
                return _buildKPIRow(context, resultadoKpi);
              });
        });
  }

  Widget _buildKPIRow(BuildContext context, ResultadoKpi resultadoKpi) {
    return ListTile(
      leading: Icon(
        Icons.lens,
        color: resultadoKpi.resultado / resultadoKpi.meta >= 0.95
            ? Colors.green
            : resultadoKpi.resultado / resultadoKpi.meta >= 0.7
                ? Colors.yellow
                : Colors.red,
      ),
      title: Text(
        resultadoKpi.nombre,
        style: _biggerFont,
      ),
      subtitle: Text(
        resultadoKpi.periodo,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('Meta: '),
              Text(resultadoKpi.meta.toString() + '%'),
            ],
          ),
          Column(
            children: <Widget>[
              Text('Real: '),
              Text(resultadoKpi.resultado.toString() + '%'),
            ],
          ),
          Column(
            children: <Widget>[
              Text('Aspiracion: '),
              Text(resultadoKpi.aspiracion.toString() + '%'),
            ],
          )
        ],
      ),
    );
  }
}

class ResultadoKpi {
  int aspiracion = 0;
  int meta = 0;
  int resultado = 0;
  String periodo = '';
  String nombre = '';
}
