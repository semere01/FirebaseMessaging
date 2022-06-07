import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../routes/router.gr.dart';
import '../auth.dart';
import 'widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool error = false;
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      // buildWhen: (previous, current) {
      //   if (current is AuthSuccess) {
      //     dispose();
      //   }
      //   return current is! AuthSuccess;
      // },
      builder: (context, state) {
        
        if (state is AuthSuccess) {
          context.router.replaceAll([ChatsListRoute()]);
        }

        return Scaffold(
            // appBar: AppBar(),
            body: Padding(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                child: Image(
                  height: 160,
                  width: 160,
                  image: AssetImage("assets/images/320_placeholder.png"),
                ),
                borderRadius: BorderRadius.circular(160),
              ),
              SizedBox(height: 20),
              StandardText("Username"),
              StandardInput(controller: _usernameController), //username input
              StandardText("Password"), // standard password
              StandardInput(controller: _passwordController), // password input
              error
                  ? Text(
                      "Error",
                      style: TextStyle(color: Colors.red),
                    )
                  : Container(),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(AuthLogin(
                      _usernameController.text, _passwordController.text));
                },
                child: Text("Sign In"),
              ),
              Text("Don't have an account?"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.router.popAndPush(SignUpRoute());
                    },
                    child:
                        Text("Sign up ", style: TextStyle(color: Colors.blue)),
                  ),
                  Text(
                    "for a new account.",
                    textAlign: TextAlign.center,
                    // style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              (state is AuthFailure)
                  ? Text(
                      state.errorMessage ?? "Error Occured",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    )
                  : Container(),
            ],
          ),
        ));
      },
    );
  }
}
