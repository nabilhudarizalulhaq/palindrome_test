import 'package:flutter/material.dart';
import 'package:test_suitemedia/widget/globals.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _ScondScreenState();
}

class _ScondScreenState extends State<SecondScreen> {
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
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: reguler,
              ),
            ),
            const SizedBox(
              height: 0.0,
            ),
            Text(
              'John Doe',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
