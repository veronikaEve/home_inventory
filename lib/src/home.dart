import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> getJson() {
  return rootBundle.loadString('data/index.json');
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildSearch() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for an item ...',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              controller: _controller,
              onChanged: (String value) async {
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildSuggestionDropdown();
                  },
                );
              },
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.blue[600],
              alignment: Alignment.center,
              child: ListView(
                shrinkWrap: true,
                children: const <Widget>[
                  Text("I'm dedicating every day to you"),
                  Text('Domestic life was never quite my style'),
                  Text('When you smile, you knock me out, I fall apart'),
                  Text('And I thought I was so smart'),
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildSuggestionDropdown() {
    var myData = json.decode(await getJson());

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }

  Widget _buildAdd() {
    return ElevatedButton(
        onPressed: () {}, child: const Icon(Icons.add_outlined));
  }

  List data = []; // names we get from API
  List filteredData = []; // names filtered by search text

  void _getData() async {
    final response = ;
    List tempList = [];
    for (int i = 0; i < response.data['results'].length; i++) {
      tempList.add(response.data['results'][i]);
    }

    setState(() {
      data = tempList;
      filteredData = data;
    });
  }

// Widget _buildList() {
//   if (!(_searchText.isEmpty)) {
//     List tempList = [];
//     for (int i = 0; i < filteredData.length; i++) {
//       if (filteredData[i]['name'].toLowerCase().contains(_searchText.toLowerCase())) {
//         tempList.add(filteredData[i]);
//       }
//     }
//     filteredData = tempList;
//   }
//   return ListView.builder(
//     itemCount: data == null ? 0 : filteredData.length,
//     itemBuilder: (BuildContext context, int index) {
//       return new ListTile(
//         title: Text(filteredData[index]['name']),
//         onTap: () => print(filteredData[index]['name']),
//       );
//     },
//   );
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Heyo, have a good day :)'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              _buildSearch(),
              _buildAdd(),
            ],
          ),
        ));
  }
}
