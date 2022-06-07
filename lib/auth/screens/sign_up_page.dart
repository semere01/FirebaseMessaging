import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messaging_bloc/auth/bloc/auth_bloc.dart';
import 'package:messaging_bloc/auth/bloc/bloc.dart';
import 'package:messaging_bloc/routes/router.gr.dart';
import 'package:provider/provider.dart';

import 'widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool error = false;
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      // buildWhen: (previous, current) {
      //   if (current is AuthSuccess) {
      //     dispose();
      //   }
      //   return (current is! AuthSuccess) && (previous is! AuthSuccess);
      // },
      builder: (context, state) {
        if (state is AuthSuccess) {
          context.router.replaceAll([ChatsListRoute()]);
        }
        return Scaffold(
          // appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.only(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  child: const Image(
                    height: 160,
                    width: 160,
                    image:
                        const AssetImage("assets/images/320_placeholder.png"),
                  ),
                  borderRadius: BorderRadius.circular(160),
                ),
                StandardText("Username"),
                StandardInput(controller: _usernameController),
                StandardText("Password"), // standard password
                StandardInput(
                  controller: _passwordController,
                  obscureText: true,
                ),
                StandardText("Confirm Password"), // standard password
                StandardInput(
                  controller: _confirmPasswordController,
                  obscureText: true,
                ),
                BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                  if (state is AuthLoading) {
                    return const ElevatedButton(
                      onPressed: null,
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is AuthSuccess) {
                    print(
                        "Authenticate successful for user : ${state.username}");
                  }
                  if (state is AuthFailure) {
                    Column(children: [
                      Text(
                        'error occured',
                        style: TextStyle(color: Colors.red),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(AuthCreate(
                              _usernameController.text,
                              _passwordController.text,
                              _confirmPasswordController.text));
                        },
                        child: const Text("Sign Up"),
                      ),
                    ]);
                  }
                  return ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(AuthCreate(
                          _usernameController.text,
                          _passwordController.text,
                          _confirmPasswordController.text));
                    },
                    child: const Text("Sign Up"),
                  );
                }),
                Text("Already have an account?"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Text(
                        "Sign in ",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        context.router.popAndPush(SignInRoute());
                      },
                    ),
                    Text(
                      "with your existing account",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                (state is AuthFailure)
                    ? Text(
                        "\n${state.errorMessage ?? "Error Occured"}",
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }

  void submitSignUp() async {
    //   await context
    //       .read<AuthProvider>()
    //       .firebaseAuthInstance
    //       ?.createUserWithEmailAndPassword(email: username, password: password);

    //   context.router.popUntil(
    //     (Route route) => (route.settings.name == "AuthGatePage"),
    //   );
    // } catch (e) {
    //   setState(() {
    //     error = true;
    //     errorMessage = e.toString();
    //   });
    // }
    // context
    //     .read<AuthProvider>()
    //     .firebaseAuthInstance
    //     ?.createUserWithEmailAndPassword(email: username, password: password)
    //     .catchError((e) {
    //   setState(() {
    //     error = true;
    //     errorMessage = e.code;
    //   });
    // }).whenComplete(
    //   () => {
    //     context.router.popUntil(
    //       (Route route) => (route.settings.name == "AuthGatePage"),
    //     )
    //   },
    // );
  }
}
