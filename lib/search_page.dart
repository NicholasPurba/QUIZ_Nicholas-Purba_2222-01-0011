import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> searchResults = [];

  void performSearch(String query) {
    // Simulated search logic
    final dummyData = ['Cleaning', 'Extraction', 'Filling', 'Root Canal', 'Checkup'];
    searchResults = dummyData
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Treatments'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search input field with a cleaner design
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search Treatments',
                  labelStyle: TextStyle(color: Colors.blue[800]),
                  prefixIcon: Icon(Icons.search, color: Colors.blue[800]),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      performSearch('');
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue[800]!),
                  ),
                ),
                onChanged: (value) {
                  performSearch(value);
                },
              ),
            ),
            const SizedBox(height: 20.0),

            // Displaying search results or a no results message
            Expanded(
              child: searchResults.isEmpty
                  ? Center(
                      child: Text(
                        'No treatments found.',
                        style: TextStyle(fontSize: 18, color: Colors.blue[400]),
                      ),
                    )
                  : ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16.0),
                            title: Text(
                              searchResults[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[800],
                              ),
                            ),
                            subtitle: Text(
                              'Tap to learn more about this treatment.',
                              style: TextStyle(color: Colors.blue[500]),
                            ),
                            leading: Icon(
                              Icons.local_hospital,
                              color: Colors.blue[800],
                            ),
                            onTap: () {
                              // Add your navigation or action here
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('You selected ${searchResults[index]}')),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
