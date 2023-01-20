import 'package:flutter/material.dart';

import 'package:practice/constants/globalvariable.dart';
import 'package:practice/feautures/auth/services/auth_services.dart';

import '../../../comman/Widgets/custom_button.dart';
import '../../../comman/Widgets/custom_textfeild.dart';

enum Auth {
  signin,
  sginup,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const String routename = "/auth-screen ";

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.sginup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final AuthService authservice = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authservice.signUpUser(
        context: context,
        email: _emailController.text,
        name: _nameController.text,
        password: _passwordController.text);
  }

  void signInuser() {
     authservice.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalVariables.greyBackgroundCOlor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              ListTile(
                tileColor: _auth == Auth.sginup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Create Account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.sginup,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
              ),
              if (_auth == Auth.sginup)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          CustomTextfeild(
                            controller: _nameController,
                            hintText: "Name",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextfeild(
                            controller: _emailController,
                            hintText: "Email",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextfeild(
                            controller: _passwordController,
                            hintText: "Password",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                              text: 'Sign-Up',
                              onTap: () {
                                if (_signUpFormKey.currentState!.validate()) {
                                  signUpUser();
                                }
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Sign-In.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signin,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          CustomTextfeild(
                            controller: _emailController,
                            hintText: "Email",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextfeild(
                            controller: _passwordController,
                            hintText: "Password",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                              text: 'Sign-In',
                              onTap: () {
                                if (_signInFormKey.currentState!.validate()) {
                                  signInuser();
                                }
                              })
                        ],
                      )),
                ),
            ],
          ),
        )));
  }
}
