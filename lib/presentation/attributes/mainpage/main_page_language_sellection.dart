import 'package:flutter/material.dart';
import 'package:flutter_app_test/utils/config.dart';

class MainPageLanguageSelection extends StatefulWidget {
  final List<dynamic> listTile;
  final String title;
  final bool searchField;
  const MainPageLanguageSelection(
      {Key? key,
      required this.listTile,
      required this.title,
      this.searchField = false})
      : super(key: key);
  @override
  _MainPageLanguageSelectionState createState() =>
      _MainPageLanguageSelectionState();
}

class _MainPageLanguageSelectionState extends State<MainPageLanguageSelection> {
  late List<dynamic> listTile;
  bool _searchClearBtn = false;
  final TextEditingController _controllerFilter = TextEditingController();

  _MainPageLanguageSelectionState();

  Future<void> _onSearch(String term) async {
    setState(() {
      listTile = widget.listTile
          .where((dynamic item) =>
              item.toLowerCase().contains(term.toLowerCase()) as bool)
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      listTile = widget.listTile;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Theme.of(context).iconTheme.color,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 18,
              ),
          textAlign: TextAlign.left,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black45,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.5,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: List<Widget>.generate(listTile.length, (int i) {
                return Card(
                  color: Theme.of(context).backgroundColor,
                  elevation: 0.1,
                  margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    title: Text(
                      listTile[i] as String,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14,
                            fontWeight: Config.bold,
                          ),
                      textAlign: TextAlign.left,
                    ),
                    onTap: () {
                      Navigator.pop(context, listTile[i]);
                    },
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
