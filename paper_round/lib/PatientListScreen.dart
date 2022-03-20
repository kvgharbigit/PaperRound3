import 'package:flutter/material.dart';
import 'package:fhir/r4.dart';

class PatientListScreen extends StatelessWidget {
  PatientListScreen({Key? key}) : super(key: key);

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  final dummyPatient = Patient(name: <HumanName>[
    HumanName(
      family: 'Atreides',
      given: ['Paul'],
    )
  ]);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PatientListTile(dummyPatient),
            Container(
              height: 100,
              color: Colors.red[400],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: width * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.person),
                        Text("UR 12345"),
                        Text("FNAME LNAME"),
                        Text("Ward 4N"),
                        Text("Bed 2"),
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("55yof"),
                        Text("Day 3"),
                        Text("Post Op Appendicitis"),
                      ],
                    ),
                  ),
                  Center(child: Text('')),
                ],
              ),
            ),
            Container(
              height: 100,
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
        child: Center(
          child: Text(patient.name!.first.toString()),
        ));
  }
}
