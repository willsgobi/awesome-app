import 'package:awesome_app/src/data/to_do_respository.dart';
import 'package:awesome_app/src/models/item_model.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final repository = ToDoRepository();
  @observable
  ObservableList<ToDo> toDos = ObservableList<ToDo>.of([]);

  @action
  getToDos() async {
    var newList = await repository.getToDos();
    toDos = newList.asObservable();
  }

  @action
  addToDo(String text) {
    var toDo = ToDo(text: text);
    toDos.add(toDo);
    updateToDo();
  }

  @action
  deleteToDo(int index) {
    var toDo = toDos.elementAt(index);
    toDos.remove(toDo);
    updateToDo();
  }

  @action
  edit(String toDo, int index) {
    toDos[index] = ToDo(text: toDo);
    updateToDo();
  }

  updateToDo() async {
    await repository.saveTodo(toDos);
  }
}
