import 'package:arm_health/config/route.dart';
import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import '../config/asset.dart';
import '../config/color.dart';
import '../source/user_source.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController createpassword = TextEditingController();
  final formkey = GlobalKey<FormState>();
  signin(BuildContext context) {
    if (formkey.currentState!.validate()) {
      UserSource.signIn(email.text, createpassword.text).then((response) {
        if (response['success']) {
          DInfo.dialogSuccess(context, response['message']);
          DInfo.closeDialog(context, actionAfterClose: () {
            Navigator.pushNamed(context, RouteConfig.home);
          });
        } else {
          DInfo.toastError(response['message']);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetConfig.bg), fit: BoxFit.fill)),
      ),
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                AssetConfig.logo2,
                height: 165,
                width: 172,
              ),
            ),
            const Center(
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Color(0xFF013674),
                  fontSize: 32,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
                key: formkey,
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 30.0),
                      child: TextFormField(
                        controller: email,
                        validator: (value) =>
                            value == '' ? "Don't empty" : null,
                        decoration: InputDecoration(
                          // prefixIcon: const Icon(Icons.email),
                          filled: true,
                          fillColor: Colors.transparent,
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          hintText: 'E-mail Address',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 5),
                      child: TextFormField(
                        controller: createpassword,
                        validator: (value) =>
                            value == '' ? "Don't empty" : null,
                        obscureText: true,
                        decoration: InputDecoration(
                          // prefixIcon: const Icon(Icons.password),
                          filled: true,
                          fillColor: Colors.transparent,
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                        ),
                      )),
                ])),
            const Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                child: TextButton(
                    onPressed: null,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color(0xFF9CCFE8),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ))),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Colorconfig.secondary,
                  fixedSize: const Size(350, 50),
                ),
                onPressed: () {
                  signin(context);
                },
                child: const Text('Sign In'),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Colorconfig.tertiary,
                  fixedSize: const Size(350, 50),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RouteConfig.signup);
                },
                child: const Text('Sign Up'),
              ),
            ),
          ]),
    ]));
  }
}
