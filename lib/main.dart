import 'package:flutter/material.dart';
import 'model/Bloc.dart';
import 'model/User.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Bloc"),
          ),
          body: Center(
              child: StreamBuilder(
            initialData: ["Vacio"],
            stream: bloc.userList,
            builder: (context, snapshot) {
              return ListView(
                children: snapshot.data.map<Widget>((user) {
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text('age: ${user.age}'),
                  );
                }).toList(),
              );
            },
          )),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => bloc.setUser(User.CreateRandom()),
          ),
        ));
  }
}
