import 'package:flutter/material.dart';
import '../controller/task_controller.dart';
import '../models/task.dart';
import '../widget/mssv_banner.dart';
import '../widget/task_tile.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});
  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  final _controller = TaskController();
  List<Task> _tasks = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final list = await _controller.fetchTasks();
      setState(() {
        _tasks = list;
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Loi: $e')));
      }
    }
  }

  Future<void> _delete(Task task) async {
    try {
      final ok = await _controller.deleteTask(task.id);
      if (ok) {
        setState(() => _tasks.removeWhere((t) => t.id == task.id));
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Da xoa task #${task.id}'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Xoa that bai: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bai 5 - Delete Task'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const MssvBanner(),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (_, i) {
                      final t = _tasks[i];
                      return Dismissible(
                        key: ValueKey(t.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (_) => _delete(t),
                        child: TaskTile(task: t, onDelete: () => _delete(t)),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
