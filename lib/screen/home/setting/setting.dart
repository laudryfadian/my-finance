// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.purple[800],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text("Profile"),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.logout,
        //       size: 24.0,
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 110.0,
              ),
              width: MediaQuery.of(context).size.width,
              color: Colors.purple[800],
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        "https://image.cnbcfm.com/api/v1/image/107241090-1684160036619-gettyimages-1255019394-AFP_33F44YL.jpeg?v=1685596344"),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                        ),
                        Text(
                          "udry kun",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 12.0,
                  ),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Change Password",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: _oldPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Old Password',
                        ),
                      ),
                      TextField(
                        controller: _newPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'New Password',
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green, // Background color
                        ),
                        onPressed: () {},
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
