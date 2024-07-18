import 'package:flutter/material.dart';
import 'package:myhost_app/pages/configs/app_setting.dart';
import 'package:myhost_app/pages/configs/network_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;

  @override
  void dispose() {
    // TODO: implement dispose
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _showLoginFailedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Login Failed"),
          content: Text("Please try again!"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                usernameController.clear();
                passwordController.clear();
                Navigator.of(context).pop(); // ปิด popup
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 160,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: const Icon(Icons.account_circle),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: double.infinity, // ทำให้ปุ่มยืดเต็มความกว้าง
                    child: ElevatedButton(
                      onPressed: () async {
                        final username = usernameController.text;
                        final password = passwordController.text;
                        final message = await ServiceNetwork()
                            .validateUserLoginDio(username, password);

                        if (message.toString() != 'failed') {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString(AppSetting.usernameSetting, username);
                          prefs.setString(AppSetting.passwordSetting, password);
                          Navigator.pushNamed(context, 'home');
                        } else {
                          _showLoginFailedDialog(context); // แสดง popup ถ้า login ไม่สำเร็จ
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
