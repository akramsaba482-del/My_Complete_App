import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotesScreen extends StatefulWidget {
  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Map<String, dynamic>> notes = [];
  final controller = TextEditingController();
  final List<Color> colors = [Colors.yellow.shade100, Colors.blue.shade100, Colors.green.shade100, Colors.pink.shade100];

  void addNote() {
    if (controller.text.isNotEmpty) {
      setState(() => notes.add({
        "text": controller.text,
        "date": DateFormat('dd MMM, hh:mm a').format(DateTime.now()),
        "color": colors[notes.length % colors.length]
      }));
      controller.clear();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: notes.isEmpty
         ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.note_alt_outlined, size: 80, color: Colors.grey), SizedBox(height: 10), Text("No Notes Yet", style: TextStyle(fontSize: 18, color: Colors.grey))]))
          : ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: notes.length,
              itemBuilder: (context, index) => Dismissible(
                key: Key(notes[index]["date"]),
                direction: DismissDirection.endToStart,
                background: Container(alignment: Alignment.centerRight, padding: EdgeInsets.only(right: 20), color: Colors.red, child: Icon(Icons.delete, color: Colors.white)),
                onDismissed: (_) => setState(() => notes.removeAt(index)),
                child: Card(color: notes[index]["color"], shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), child: ListTile(
                  title: Text(notes[index]["text"], style: TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Text(notes[index]["date"], style: TextStyle(fontSize: 12)),
                )),
              ),
            ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.deepPurple, onPressed: () {
        showDialog(context: context, builder: (_) => AlertDialog(
          title: Text("New Note"), content: TextField(controller: controller, maxLines: 4, decoration: InputDecoration(hintText: "Write something...", border: OutlineInputBorder())),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")), ElevatedButton(onPressed: addNote, child: Text("Save"))],
        ));
      }, child: Icon(Icons.add, color: Colors.white)),
    );
  }
}