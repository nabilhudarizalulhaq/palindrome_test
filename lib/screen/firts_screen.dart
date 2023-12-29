import 'package:flutter/material.dart';
import 'package:test_suitemedia/widget/globals.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController palindromeController = TextEditingController();
  String resultMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: purple),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 142),
                    height: 116,
                    width: 116,
                    decoration: BoxDecoration(
                        color: transparans,
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(
                      Icons.group_add,
                      color: white,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 51,
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            TextField(
                              controller: nameController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Name',
                                contentPadding: EdgeInsets.all(12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            TextField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Palindrome',
                                contentPadding: EdgeInsets.all(12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextButton(
                          onPressed: () {
                            bool isPalindrome =
                                checkPalindrome(nameController.text);
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Result'),
                                content: Text(isPalindrome
                                    ? 'isPalindrome'
                                    : 'not palindrome'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text(
                            'CHECK',
                            style: whiteTextStyle.copyWith(
                              fontSize: 21,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/second_screen');
                          },
                          child: Text(
                            'NEXT',
                            style: whiteTextStyle.copyWith(
                              fontSize: 21,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool checkPalindrome(String text) {
    String reversed = text.split('').reversed.join('');
    return text == reversed;
  }
}
