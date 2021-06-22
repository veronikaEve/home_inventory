import 'dart:convert';

import 'package:flutter/material.dart';

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
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Search for an item ...',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                ),
                onChanged: (String value) async {
                  if (value != '13') {
                    return;
                  }
                }),
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 500,
              color: Colors.blue[600],
              alignment: Alignment.center,
              child: _buildSuggestionDropdown(),
            )
          ],
        ));
  }

  Widget _buildSuggestionDropdown() {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("lib/data/index.json"),
      builder: (context, snapshot) {
        var wantedData = 'kitchen';
        var showData = json.decode(snapshot.data.toString());
        print(showData['inventory']['rooms'].contains(wantedData));
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: showData['inventory']['rooms'].length,
          itemBuilder: (BuildContext context, int index) {
            if (showData['inventory']['rooms'][index].contains(wantedData)) {
              return Text(showData['inventory']['rooms'][index]);
            }

            return
            // print("AAAAAAAAAA🦆🐱");
            //     print(foundData);
            //     return Text(if );
          },
        );
      },
    );
  }

  Widget _buildAdd() {
    return ElevatedButton(
        onPressed: () {}, child: const Icon(Icons.add_outlined));
  }

  List data = []; // names we get from API
  List filteredData = []; // names filtered by search text

  // void _getData() async {
  //   List tempList = [];
  //   for (int i = 0; i < response.data['results'].length; i++) {
  //     tempList.add(response.data['results'][i]);
  //   }

  //   setState(() {
  //     data = tempList;
  //     filteredData = data;
  //   });
  // }

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
