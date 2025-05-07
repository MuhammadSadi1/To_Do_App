import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<String> _tasks = [];
  TextEditingController taskController = TextEditingController();

  void _addTask() {
    if (taskController.text.trim().isNotEmpty) {
      setState(() {
        _tasks.add(taskController.text.trim());
        taskController.clear();
      });
    }
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('My Tasks'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: taskController,
                      decoration: const InputDecoration(
                        hintText: 'Enter a task',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _addTask,
                    icon: const Icon(Icons.add_circle, color: Colors.deepPurpleAccent),
                    tooltip: 'Add Task',
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _tasks.isEmpty
                  ? const Center(child: Text('No tasks yet. Add one!'))
                  : ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) => Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(_tasks[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                      onPressed: () => _deleteTask(index),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
