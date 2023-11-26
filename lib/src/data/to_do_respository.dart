import 'package:awesome_app/src/models/item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoRepository {
  Future saveTodo(List<ToDo> toDos) async {
    var prefs = await SharedPreferences.getInstance();
    List<String> newList = [];

    for (var toDo in toDos) {
      newList.add(toDo.text);
    }

    await prefs.setStringList('items', newList);
  }

  Future<List<ToDo>> getToDos() async {
    var prefs = await SharedPreferences.getInstance();
    var list = prefs.getStringList('items');

    if (list == null || list.isEmpty) {
      return [];
    }

    List<ToDo> toDos = [];

    for (var toDo in list) {
      toDos.add(ToDo(text: toDo));
    }

    return toDos;
  }
}
