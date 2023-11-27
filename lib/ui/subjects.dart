import 'package:flutter/material.dart';

class SubjectsApp extends StatefulWidget {
  const SubjectsApp({super.key});

  @override
  State<SubjectsApp> createState() => _SubjectsAppState();
}

class _SubjectsAppState extends State<SubjectsApp> {
  final List<String> _subjects = ["Timski Proekt",
                           "Implementacija na sistemi so otvoren kod",
                           "Menadzment informaciski sistemi",
                           "Mobilni informaciski sistemi",
                           "Pravo na drushtva"];
  String _subject = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("203195", style: TextStyle(
            color: Colors.white
          ),),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("List of subjects this semestar", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue
            ),),
            Expanded(
                child: ListView.builder(
                    itemCount: _subjects.length,
                    itemBuilder: (context, int index) {
                      return ListTile(
                        title: Text(_subjects[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outlined, size: 30, color: Colors.red,),
                          onPressed: (){
                            setState(() {
                              _subjects.removeAt(index);
                            });
                          },
                        ),
                      );
                    }))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Subject",
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: const Text("Add a subject", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                    ),),
                  content: TextField(
                    onChanged: (text) {
                      _subject = text;
                    },
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red
                        ),)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _subjects.add(_subject);
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("Add", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue
                        ),)),
                  ],
                );
              });
        },
        child: const Icon(Icons.add_outlined, color: Colors.blue, size: 40,),
      ),
    );
  }
}
