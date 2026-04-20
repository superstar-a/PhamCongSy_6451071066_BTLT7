import 'package:flutter/material.dart';
import '../controller/user_controller.dart';
import '../models/user.dart';
import '../widget/mssv_banner.dart';
import '../widget/user_tile.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});
  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  late Future<List<User>> _future;
  final _controller = UserController();

  @override
  void initState() {
    super.initState();
    _future = _controller.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bai 1 - Fetch User List'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const MssvBanner(),
          Expanded(
            child: FutureBuilder<List<User>>(
              future: _future,
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snap.hasError) {
                  return Center(child: Text('Loi: ${snap.error}'));
                }
                final users = snap.data ?? [];
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (_, i) => UserTile(user: users[i]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
