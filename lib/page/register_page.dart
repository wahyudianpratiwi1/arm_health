import 'package:arm_health/config/color.dart';
import 'package:arm_health/config/route.dart';
import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import '../config/asset.dart';
import '../source/user_source.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController createpassword = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  final formkey = GlobalKey<FormState>();

  String get fullnametext => fullname.text;
  String get emailtext => email.text;
  String get createpasswordtext => createpassword.text;
  String get confirmpasswordtext => confirmpassword.text;

  signup(BuildContext context) {
    if (formkey.currentState!.validate()) {
      if (createpasswordtext == confirmpasswordtext) {
        UserSource.signup(fullnametext, emailtext, createpasswordtext,
                confirmpasswordtext)
            .then((response) {
          if (response['success']) {
            DInfo.dialogSuccess(context, response['message']);
            DInfo.closeDialog(context, actionAfterClose: () {
              Navigator.pushNamed(context, RouteConfig.signin);
            });
          } else {
            DInfo.toastError(response['message']);
          }
        });
      } else {
        DInfo.toastError('Password not match');
      }
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
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Please Register',
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
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 30),
                      child: TextFormField(
                        controller: fullname,
                        validator: (value) =>
                            value == '' ? "Don't empty" : null,
                        decoration: InputDecoration(
                          // prefixIcon: const Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.transparent,
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          hintText: 'Full Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colorconfig.primary)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                        ),
                      )),
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
                          hintText: 'E-mail',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colorconfig.primary)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 30),
                      child: TextFormField(
                        controller: createpassword,
                        obscureText: true,
                        validator: (value) =>
                            value == '' ? "Don't empty" : null,
                        decoration: InputDecoration(
                          // prefixIcon: const Icon(Icons.password),
                          filled: true,
                          fillColor: Colors.transparent,
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          hintText: 'Create Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colorconfig.primary)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 30),
                      child: TextFormField(
                        controller: confirmpassword,
                        obscureText: true,
                        validator: (value) =>
                            value == '' ? "Don't empty" : null,
                        decoration: InputDecoration(
                          // prefixIcon: Icon(Icons.password),
                          filled: true,
                          fillColor: Colors.transparent,
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          hintText: 'Confirm Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colorconfig.primary)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                        ),
                      )),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Colorconfig.secondary,
                      fixedSize: const Size(350, 50),
                    ),
                    onPressed: () {
                      signup(context);
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ]),
    ]));
  }
}
