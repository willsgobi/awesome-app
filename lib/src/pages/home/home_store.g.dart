// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$toDosAtom = Atom(name: '_HomeStore.toDos', context: context);

  @override
  ObservableList<ToDo> get toDos {
    _$toDosAtom.reportRead();
    return super.toDos;
  }

  @override
  set toDos(ObservableList<ToDo> value) {
    _$toDosAtom.reportWrite(value, super.toDos, () {
      super.toDos = value;
    });
  }

  late final _$getToDosAsyncAction =
      AsyncAction('_HomeStore.getToDos', context: context);

  @override
  Future getToDos() {
    return _$getToDosAsyncAction.run(() => super.getToDos());
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  dynamic addToDo(String text) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.addToDo');
    try {
      return super.addToDo(text);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteToDo(int index) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.deleteToDo');
    try {
      return super.deleteToDo(index);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic edit(String toDo, int index) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.edit');
    try {
      return super.edit(toDo, index);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
toDos: ${toDos}
    ''';
  }
}
