// import 'package:flutter/material.dart';
// import 'package:voting_app/poll_management.dart';

// class UserSearch extends StatefulWidget {
//   const UserSearch({super.key});

//   @override
//   State<StatefulWidget> createState() => UserSearchState();
// }

// class UserSearchState extends State<UserSearch> {
//   late List<bool> _selections;

//   @override
//   void initState() {
//     super.initState();
//     _selections = List.generate(2, (index) => index == 0);
//   }

//   void _updateSelection(int index) {
//     setState(() {
//       _selections = List.generate(2, (i) => i == index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: <Widget>[
//         ToggleButtons(
//           isSelected: _selections,
//           onPressed: (index) {
//             _updateSelection(index);
//           },
//           children: const [
//             Text('Following'),
//             Text('Browse')
//           ]
//         ),
//         const TextField(
//           decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: 'Enter Poll Code...',
//               suffixIcon: Icon(Icons.add)
//           )
//         ),
//         PollThumbnailManager().pollFollowing()
//       ])
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserSearch extends StatefulWidget {
  const UserSearch({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserSearchState();
}

class UserSearchState extends State<UserSearch> {
  late List<bool> _selections;
  List<String> _searchResults = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selections = List.generate(2, (index) => index == 0);
  }

  void _updateSelection(int index) {
    setState(() {
      _selections = List.generate(2, (i) => i == index);
    });
  }

  Future<void> _search(String query) async {
    final response = await http.get(Uri.parse('http://127.0.0.1/:5000/${_selections[0] ? 'following' : 'browse'}?query=$query'));
    if (response.statusCode == 200) {
      setState(() {
        _searchResults = jsonDecode(response.body).cast<String>();
      });
    } else {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ToggleButtons(
            isSelected: _selections,
            onPressed: (index) {
              _updateSelection(index);
            },
            children: const [
              Text('Following'),
              Text('Browse')
            ]
          ),
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Search Query...',
              suffixIcon: Icon(Icons.search),
            ),
            onSubmitted: _search,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_searchResults[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
