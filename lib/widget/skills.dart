import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../model/skill.dart';

class Skills extends StatelessWidget {
  final skillsQuery = QueryBuilder<Skill>(Skill()).query();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ParseResponse>(
      future: skillsQuery,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.success) {
            if (snapshot.data.count > 0) {
              List<Skill> skills = snapshot.data.results.cast();
              return ListView(
                children: skills.map((skill) => Text(skill.title)).toList(),
              );
            } else {
              return Text('No data');
            }
          } else {
            return Text('Error fetching data: ${snapshot.data.error}');
          }
        } else if (snapshot.hasError) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${snapshot.error}",
                  textAlign: TextAlign.center,
                )
              ]);
        } else {
          // By default, show a loading spinner.
          return Column(
            children: <Widget>[
              Text('loading skills...'),
              CircularProgressIndicator(),
            ],
          );
        }
      },
    );
  }
}
