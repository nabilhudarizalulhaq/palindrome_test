import 'package:flutter/material.dart';
import 'package:test_suitemedia/models/model.dart';
import 'package:test_suitemedia/service/users.dart';
import 'package:test_suitemedia/widget/globals.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _ScondScreenState();
}

class _ScondScreenState extends State<SecondScreen> {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 21,
        ),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/third_screen');
          },
          child: Text(
            'Choose a User',
            style: whiteTextStyle.copyWith(
              fontSize: 21,
              fontWeight: semiBold,
            ),
          ),
        ),
      ),
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'Second Screen',
          style: blackTextStyle.copyWith(
            fontSize: 27,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          itemCount: users.length,
          itemBuilder: (context, index) {
            final list = users[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/third_screen');
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  color: white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${list.firstName} ${list.lastName}',
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
