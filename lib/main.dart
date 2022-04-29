import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "todo app",
    home: TODOAPP(),
  ));
}

class TODOAPP extends StatefulWidget {
  @override
  _TODOAPPState createState() => _TODOAPPState();
}

class _TODOAPPState extends State<TODOAPP> {
  String value;

  var listTODO = [''];
  addtodo(String item) {
    setState(() {
      listTODO.add(item);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("todoapp"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: listTODO.length,
          itemBuilder: (context, index) {
            return index == 0
                ? Padding(
                    padding: const EdgeInsets.all(16.0), child: TextFormField(
                      decoration: InputDecoration(
                     
                        hintText: "Add items",
                      ),
                      onChanged: (val){
                        setState(() {
                          value=val;
                        });
                      },
                    ))
                : ListTile(
                    leading: Icon(Icons.work),
                    title: Text('${listTODO[index]}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green)),
                  );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:()=>{ addtodo(value)},
      ),
    );
  }
}
