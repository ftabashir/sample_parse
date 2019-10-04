import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sample_parse/backend/init-parse.dart';

class RootWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RootState();
  }
}

class RootState extends State<RootWidget> {
  Future<void> parseFuture;

  @override
  void initState() {
    super.initState();
    parseFuture = initParse();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa', 'IR'),
      ],
      locale: Locale('fa', 'IR'),
      title: 'ParseServer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ParseServer'),
        ),
        body: Center(
          child: FutureBuilder<void>(
            future: parseFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text("Connected to ParseServer");
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
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
