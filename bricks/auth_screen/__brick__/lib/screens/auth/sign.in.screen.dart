import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:{{package_name}}/screens/auth/sign.up.screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static const routeName = '/sign-in-screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlutterLogo(),
                    ),
                    TextFormField(
                      controller: _emailController,
                      style: Theme.of(context).textTheme.bodyText1,
                      validator: (value) =>
                      value!.isEmpty ? ("Email tidak boleh kosong") : null,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        labelText: ("Email"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: TextFormField(
                        obscureText: showPassword,
                        // maxLength: 12,
                        controller: _passwordController,
                        style: Theme.of(context).textTheme.bodyText1,
                        validator: (value) => value!.length < 6
                            ? ("password harus lebih 6 karakter")
                            : null,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          suffixIcon: IconButton(
                            icon: showPassword
                                ? Icon(
                              Icons.visibility,
                              color: Colors.grey,
                            )
                                : Icon(
                              Icons.visibility_off,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                          ),
                          labelText: ("Password"),
                        ),
                      ),
                    ),
                    // authProvider.status == Status.Registering
                    //     ? Center(
                    //         child: CircularProgressIndicator(),
                    //       )
                    //     :
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                          child: Text(
                            ("Masuk"),
                            style: Theme.of(context).textTheme.button,
                          ),
                          onPressed: () async {
                            // if (_formKey.currentState!.validate()) {
                            //   FocusScope.of(context)
                            //       .unfocus(); //to hide the keyboard - if any
                            //
                            //   UserModel userModel = await authProvider
                            //       .registerWithEmailAndPassword(
                            //           _emailController.text,
                            //           _passwordController.text);
                            //
                            //   if (userModel == null) {
                            //     _scaffoldKey.currentState!
                            //         .showSnackBar(SnackBar(
                            //       content: Text(
                            //           ("loginTxtErrorSignIn")),
                            //     ));
                            //   }
                            // }
                          }),
                    ),
                    // authProvider.status == Status.Registering
                    //     ? Center(
                    //         child: null,
                    //       )
                    //     :

                    Padding(
                      padding: const EdgeInsets.only(top: 48),
                      child: Center(
                          child: Text(
                            ("Belum punya akun?"),
                          )),
                    ),
                    // authProvider.status == Status.Registering
                    //     ? Center(
                    //         child: null,
                    //       )
                    //     :

                    TextButton(
                      child: Text(("Daftar")),
                      onPressed: () {
                        Get.offNamed(SignUpScreen.routeName);

                        // Navigator.of(context)
                        //     .pushReplacementNamed(Routes.login);
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}