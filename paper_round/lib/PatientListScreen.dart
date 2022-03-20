import 'package:flutter/material.dart';
import 'package:fhir/r4.dart';

class PatientListScreen extends StatelessWidget {
  PatientListScreen({Key? key}) : super(key: key);

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  final dummyPatient = Patient()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              color: Colors.red[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 250,
              color: Colors.red[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 250,
              color: Colors.yellow[100],
              child: const Center(child: Text('Entry C')),
            ),
          ],
        ),
      )),
    );
  }
}

class PatientListTile extends StatelessWidget {
  PatientListTile(this.patient, {Key? key}) : super(key: key);
  Patient patient;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.red[500],
      child: Center(child: Text(patient.name!.first.toString())),
    );
  }
}

