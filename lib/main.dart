import 'package:core/resource_state.dart';
import 'package:domain/model/cases.dart';
import 'package:flutter/material.dart';

import 'src/blocs/cases_bloc.dart';
import 'src/di/injector.dart';

void main() async {
  await injectDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Covid 19 Global'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final casesBloc = getIt<CasesBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
          stream: casesBloc.globalCases,
          builder: (context, AsyncSnapshot<Resource<Case>> snapshot) {
            if(!snapshot.hasData) return Container();

            final result = snapshot.data;

            if (result.resourceState == ResourceState.SUCCESS) {
              return Center(
                child: Text(
                    'Confirmed : ${result.data.confirmed} \nRecovered : ${result.data.recovered} \nDeaths : ${result.data.deaths}'),
              );
            } else if (result.resourceState == ResourceState.ERROR) {
              Center(
                child: Text(result.message),
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
