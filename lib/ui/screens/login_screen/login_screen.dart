import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/login_bloc/login_bloc.dart';
import '../../../data/services/db_service.dart';
import '../../widgets/buttons/my_elevated_button.dart';
import '../../widgets/my_alert_dialog.dart';
import '../../widgets/my_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void loadUserData() async {
    final user = await DbService().getUser();
    if (user != null) {
      _usernameController.text = user['username'];
      _passwordController.text = user['password'];
    }
  }

  @override
  void initState() {
    loadUserData();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Image.asset(
          "assets/images/netflix_logo.png",
          height: 30.0,
        ),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            myAlertDialog(
              context: context,
              title: "Error",
              content: "Invalid username and/or password.",
            );
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: Container(
              height: 226.0,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MyTextFormField(
                    hintText: "Username",
                    obscureText: false,
                    textController: _usernameController,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  MyTextFormField(
                    hintText: "Password",
                    isPassword: true,
                    obscureText: true,
                    textController: _passwordController,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  MyElevatedButton(
                    label: "Sign In",
                    onPressed: () {
                      context.read<LoginBloc>().add(
                            DoLogin(
                              username: _usernameController.text,
                              password: _passwordController.text,
                            ),
                          );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
