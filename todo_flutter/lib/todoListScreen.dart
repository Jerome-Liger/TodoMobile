import 'package:flutter/material.dart';
import 'todoItem.dart';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TodoListScreenState createState() => new _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoItem> _todoItems = List();

  @override
  initState() {
    super.initState();
    // TODO use dynamic todo items
    _todoItems.add(TodoItem(id: 0, name: "Create First Todo", isComplete: true));
    _todoItems.add(TodoItem(id: 1, name: "Run a Marathon"));
    _todoItems.add(TodoItem(id: 2, name: "Create Todo_Flutter blog post"));
  }

  void _addTodoItem() {
    // TODO navigate to Create Todo Item Screen
  }

  void _updateTodoCompleteStatus(TodoItem item, bool newStatus) {
    final tempTodoItems = _todoItems;
    tempTodoItems.firstWhere((i) => i.id ==item.id).isComplete = newStatus;
    setState(() { _todoItems = tempTodoItems; });
    // TODO: Persist change
  }

  Widget _createTodoItemWidget(TodoItem item) {
    return ListTile(
      title: Text(item.name),
      trailing: Checkbox(
        value: item.isComplete,
        onChanged: (value) => _updateTodoCompleteStatus(item, value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _todoItems.sort();
    final todoItemWidgets = _todoItems.map(_createTodoItemWidget).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: todoItemWidgets,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodoItem,
        tooltip: 'Add Todo',
        child: Icon(Icons.add),
      ),
    );
  }
}