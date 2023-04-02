import 'package:app_tesrt/models/manga.dart';
import 'package:app_tesrt/views/add_manga/add_manga_page.dart';
import 'package:app_tesrt/views/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  late Widget body;
  late bool isLoading;
  final _readingLists = <DragAndDropList>[];
  final _categories = ['Lendo', 'Favoritos', 'Lista de Desejos'];
  final _mangas = <DragAndDropItem>[];
  final _url = Uri.https(
      'readinglist-app-d7cb6-default-rtdb.firebaseio.com', '/mangas.json');

  @override
  void initState() {
    super.initState();
    _getMangas('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
        automaticallyImplyLeading: false,
      ),
      body: (isLoading)
          ? const Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(0, 0, 0, 0.70),
              ),
            )
          : body,
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.black54,
        ),
        backgroundColor: const Color.fromRGBO(255, 235, 169, 1),
        onPressed: () {
          Route route =
              MaterialPageRoute(builder: (context) => const AddMidiaPage());
          Navigator.push(context, route).then(_getMangas);
        },
      ),
    );
  }

  FutureOr _getMangas(response) async {
    setState(() {
      isLoading = true;
    });
    _mangas.clear();
    _readingLists.clear();
    final response = await http.get(_url);
    final map = json.decode(response.body);

    if (map is Map) {
      final newMap = map.values.toList();

      List<DragAndDropItem> favorites = newMap
          .where((value) => value['isFavorite'] == true)
          .map((value) =>
              DragAndDropItem(child: Manga(value['title']).toListTile()))
          .toList();

      List<DragAndDropItem> reading = newMap
          .where((value) => value['isReading'] == true)
          .map((value) =>
              DragAndDropItem(child: Manga(value['title']).toListTile()))
          .toList();
      List<DragAndDropItem> wishlist = newMap
          .where((value) {
            return (value['isFavorite'] == false) &
                (value['isReading'] == false);
          })
          .map((value) =>
              DragAndDropItem(child: Manga(value['title']).toListTile()))
          .toList();

      for (String category in _categories) {
        if (category == 'Favoritos') {
          _readingLists.add(
            DragAndDropList(
              header: ListTile(
                title: Text(
                  category,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Color.fromRGBO(0, 0, 0, 0.80),
                      fontWeight: FontWeight.bold),
                ),
              ),
              children: favorites,
            ),
          );
        } else if (category == 'Lendo') {
          _readingLists.add(
            DragAndDropList(
              header: ListTile(
                title: Text(
                  category,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Color.fromRGBO(0, 0, 0, 0.80),
                      fontWeight: FontWeight.bold),
                ),
              ),
              children: reading,
            ),
          );
        } else {
          _readingLists.add(
            DragAndDropList(
              header: ListTile(
                title: Text(
                  category,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Color.fromRGBO(0, 0, 0, 0.80),
                      fontWeight: FontWeight.bold),
                ),
              ),
              children: wishlist,
            ),
          );
        }
      }

      setState(() {
        isLoading = false;
        body = DragAndDropLists(
          children: _readingLists,
          onItemReorder: onReorderListItem,
          onListReorder: onReorderList,
          listPadding: const EdgeInsets.all(16),
          listDecoration: BoxDecoration(
              color: const Color.fromRGBO(218, 216, 209, 0.3),
              borderRadius: BorderRadius.circular(10)),
          listInnerDecoration: BoxDecoration(
              color: const Color.fromRGBO(255, 250, 232, 0.7),
              borderRadius: BorderRadius.circular(10)),
          itemDivider: const Divider(
            height: 7,
          ),
        );
      });
    } else {
      setState(() {
        isLoading = false;
        body = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'A fim de ler alguma coisa?',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.70),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inconsolata',
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
            )
          ],
        );
        return;
      });
    }
  }

  void onReorderListItem(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    setState(() {
      final oldListItems = _readingLists[oldListIndex].children;
      final newListItems = _readingLists[newListIndex].children;

      final movedItem = oldListItems.removeAt(oldItemIndex);
      newListItems.insert(newItemIndex, movedItem);
    });
  }

  void onReorderList(
    int oldListIndex,
    int newListIndex,
  ) {
    setState(() {
      final movedList = _readingLists.removeAt(oldListIndex);
      _readingLists.insert(newListIndex, movedList);
    });
  }
}
