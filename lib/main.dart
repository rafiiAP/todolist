import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.lightBlue)),
  home: MyApp(),
));


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos = [];
  String input = '';

  @override
  void initState() {
    super.initState();
    todos.add("item1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mytodos'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius:
                  BorderRadius.circular(8)),
                  title: Text('Add Todolist'),
                  content: TextField(
                    onChanged: (String value){
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    FlatButton(
                        onPressed: (){
                          setState((){
                            todos.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text('Add'))
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int  index){
            return Dismissible(
                key: Key(todos[index]),
                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(borderRadius:
                  BorderRadius.circular(8)),
                  child: ListTile(
                    title: Text(todos[index]),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.blue,
                        ),
                        onPressed: (){
                          setState((){
                            todos.removeAt(index);
                          });
                        }),
                  ),
                ));
          }),
    );
  }
}
