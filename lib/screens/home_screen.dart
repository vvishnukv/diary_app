import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/diary_provider.dart';
import '../models/diary_entry.dart';
import 'add_edit_entry_screen.dart';
import 'view_entry_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diary App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DiarySearchDelegate(),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<DiaryProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Consumer<DiaryProvider>(
        builder: (context, provider, child) {
          final entries = provider.entries
              .where((entry) =>
          entry.title.contains(_searchQuery) ||
              entry.content.contains(_searchQuery))
              .toList();
          return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              return ListTile(
                title: Text(entry.title),
                subtitle: Text(
                  '${entry.dateTime.toLocal()}'.split(' ')[0],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ViewEntryScreen(entry: entry),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddEditEntryScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DiarySearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<DiaryProvider>(
      builder: (context, provider, child) {
        final results = provider.entries
            .where((entry) =>
        entry.title.contains(query) || entry.content.contains(query))
            .toList();
        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            final entry = results[index];
            return ListTile(
              title: Text(entry.title),
              subtitle: Text(
                '${entry.dateTime.toLocal()}'.split(' ')[0],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ViewEntryScreen(entry: entry),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer<DiaryProvider>(
      builder: (context, provider, child) {
        final suggestions = provider.entries
            .where((entry) =>
        entry.title.contains(query) || entry.content.contains(query))
            .toList();
        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final entry = suggestions[index];
            return ListTile(
              title: Text(entry.title),
              subtitle: Text(
                '${entry.dateTime.toLocal()}'.split(' ')[0],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ViewEntryScreen(entry: entry),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
