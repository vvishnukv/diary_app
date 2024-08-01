import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/diary_entry.dart';
import '../providers/diary_provider.dart';
import 'add_edit_entry_screen.dart';

class ViewEntryScreen extends StatefulWidget {
  final DiaryEntry entry;

  ViewEntryScreen({required this.entry});

  @override
  _ViewEntryScreenState createState() => _ViewEntryScreenState();
}

class _ViewEntryScreenState extends State<ViewEntryScreen> {
  late DiaryEntry entry;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final diaryProvider = Provider.of<DiaryProvider>(context);
    entry = diaryProvider.entries.firstWhere((e) => e.id == widget.entry.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Entry'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddEditEntryScreen(entry: entry),
                ),
              );
              setState(() {});
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              final confirm = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Delete Entry', style: TextStyle(color: Colors.red)),
                  content: Text('Are you sure you want to delete this entry?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: Text('Delete'),
                    ),
                  ],
                ),
              );
              if (confirm == true) {
                Provider.of<DiaryProvider>(context, listen: false).deleteEntry(entry.id!);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.title,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 8),
            Text(
              entry.dateTime.toLocal().toString().split(' ')[0],
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              entry.content,
              style: TextStyle(fontSize: 18, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
