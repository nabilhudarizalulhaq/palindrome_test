import 'package:flutter/material.dart';
import 'package:test_suitemedia/models/model.dart';
import 'package:test_suitemedia/service/users.dart';
import 'package:test_suitemedia/widget/globals.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<Users> users = [];
  bool isLoading = true;

  void fetchUser() async {
    final result = await UserService.fetchUsers();
    users = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'Thrid Screen',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left_rounded,
            color: purple,
            size: 50,
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final list = users[index];
                return Card(
                  color: white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(list.avatar),
                    ),
                    title: Text('${list.firstName} ${list.lastName}'),
                    subtitle: Text(list.email),
                  ),
                );
              },
            ),
    );
  }
}
