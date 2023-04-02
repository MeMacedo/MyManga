import 'package:drag_and_drop_lists/drag_and_drop_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title = 'Drag & Drop ListView';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.red),
        home: const MainPage(),
      );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  late List<DragAndDropList> lists;

  @override
  void initState() {
    super.initState();

    lists = allLists.map(buildList).toList();
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color.fromARGB(255, 243, 242, 248);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(MyApp.title),
        centerTitle: true,
      ),
      body: DragAndDropLists(
        // lastItemTargetHeight: 50,
        // addLastItemTargetHeightToTop: true,
        // lastListTargetSize: 30,
        listPadding: const EdgeInsets.all(16),
        listInnerDecoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(10),
        ),
        children: lists,
        itemDivider:
            const Divider(thickness: 2, height: 2, color: backgroundColor),
        itemDecorationWhileDragging: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        listDragHandle: buildDragHandle(isList: true),
        itemDragHandle: buildDragHandle(),
        onItemReorder: onReorderListItem,
        onListReorder: onReorderList,
      ),
    );
  }

  DragHandle buildDragHandle({bool isList = false}) {
    final verticalAlignment = isList
        ? DragHandleVerticalAlignment.top
        : DragHandleVerticalAlignment.center;
    final color = isList ? Colors.blueGrey : Colors.black26;

    return DragHandle(
      verticalAlignment: verticalAlignment,
      child: Container(
        padding: const EdgeInsets.only(right: 10),
        child: Icon(Icons.menu, color: color),
      ),
    );
  }

  DragAndDropList buildList(DraggableList list) => DragAndDropList(
        header: Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            list.header,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        children: list.items
            .map((item) => DragAndDropItem(
                  child: ListTile(
                    leading: Image.network(
                      item.urlImage,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item.title),
                  ),
                ))
            .toList(),
      );

  void onReorderListItem(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    setState(() {
      final oldListItems = lists[oldListIndex].children;
      final newListItems = lists[newListIndex].children;

      final movedItem = oldListItems.removeAt(oldItemIndex);
      newListItems.insert(newItemIndex, movedItem);
    });
  }

  void onReorderList(
    int oldListIndex,
    int newListIndex,
  ) {
    setState(() {
      final movedList = lists.removeAt(oldListIndex);
      lists.insert(newListIndex, movedList);
    });
  }
}

class DraggableList {
  final String header;
  final List<DraggableListItem> items;

  const DraggableList({
    required this.header,
    required this.items,
  });
}

class DraggableListItem {
  final String title;
  final String urlImage;

  const DraggableListItem({
    required this.title,
    required this.urlImage,
  });
}

List<DraggableList> allLists = [
  const DraggableList(
    header: 'Best Fruits',
    items: [
      DraggableListItem(
        title: 'Orange',
        urlImage:
            'https://images.unsplash.com/photo-1582979512210-99b6a53386f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
      ),
      DraggableListItem(
        title: 'Apple',
        urlImage:
            'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3367&q=80',
      ),
      DraggableListItem(
        title: 'Blueberries',
        urlImage:
            'https://images.unsplash.com/photo-1595231776515-ddffb1f4eb73?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
      ),
    ],
  ),
  const DraggableList(
    header: 'Good Fruits',
    items: [
      DraggableListItem(
        title: 'Lemon',
        urlImage:
            'https://images.unsplash.com/photo-1590502593747-42a996133562?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=975&q=80',
      ),
      DraggableListItem(
        title: 'Melon',
        urlImage:
            'https://images.unsplash.com/photo-1571575173700-afb9492e6a50?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=976&q=80',
      ),
      DraggableListItem(
        title: 'Papaya',
        urlImage:
            'https://images.unsplash.com/photo-1617112848923-cc2234396a8d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1567&q=80',
      ),
    ],
  ),
  const DraggableList(
    header: 'Disliked Fruits',
    items: [
      DraggableListItem(
        title: 'Banana',
        urlImage:
            'https://images.unsplash.com/photo-1543218024-57a70143c369?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=975&q=80',
      ),
      DraggableListItem(
        title: 'Strawberries',
        urlImage:
            'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
      ),
      DraggableListItem(
        title: 'Grapefruit',
        urlImage:
            'https://images.unsplash.com/photo-1577234286642-fc512a5f8f11?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=975&q=80',
      ),
    ],
  ),
];
