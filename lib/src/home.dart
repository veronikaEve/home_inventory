import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _searchItem() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for an item ...',
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _addItem() {
    return ElevatedButton(
        onPressed: () {
    
        },
        child: const Icon(Icons.add_outlined));
  }
// void _getNames() async {
//   final response = await dio.get('https://swapi.co/api/people');
//   List tempList = new List();
//   for (int i = 0; i < response.data['results'].length; i++) {
//     tempList.add(response.data['results'][i]);
//   }

//   setState(() {
//     names = tempList;
//     filteredNames = names;
//   });
// }

// void _searchPressed() {
//   setState(() {
//     if (this._searchIcon.icon == Icons.search) {
//       this._searchIcon = new Icon(Icons.close);
//       this._appBarTitle = new TextField(
//         controller: _filter,
//         decoration: new InputDecoration(
//           prefixIcon: new Icon(Icons.search),
//           hintText: 'Search...'
//         ),
//       );
//     } else {
//       this._searchIcon = new Icon(Icons.search);
//       this._appBarTitle = new Text('Search Example');
//       filteredNames = names;
//       _filter.clear();
//     }
//   });
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
              _searchItem(),
              _addItem(),
            ],
          ),
        ));
  }
}
