import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti/Register/Data/Auth/auth_cubit.dart';
import 'package:iti/Register/Presentation/Widget/CustomButton.dart';
import 'package:iti/Register/Presentation/Widget/CustomTextFormField.dart';

class LogInScreens extends StatefulWidget {
  const LogInScreens({super.key});

  @override
  State<LogInScreens> createState() => _LogInScreensState();
}

class _LogInScreensState extends State<LogInScreens> {
  TextEditingController emialController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  GlobalKey<FormState> formLogIn = GlobalKey();

  @override
  void dispose() {
    emialController.dispose();
    passWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SuccessLogIn) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Success LogIn"),
              backgroundColor: Colors.green,
            ));
          } else if (state is ErrorLogIn) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.green,
            ));
          }
        },
        builder: (context, state) {
          return Form(
            key: formLogIn,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "LogIn",
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .09,
                  ),
                  Textformfield(
                    isObsecure: false,
                    controller: emialController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "Please enter correct email";
                      }
                      return null;
                    },
                    lableText: "email",
                    prefixIco: Icons.email,
                    suffixIcon: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  Textformfield(
                    isObsecure: true,
                    controller: passWordController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "Please enter correct passWord";
                      }
                      return null;
                    },
                    lableText: "passWord",
                    prefixIco: Icons.password,
                    suffixIcon: Icons.visibility,
                  ),
                  ButtonText(
                    ontap: () {
                      if (formLogIn.currentState!.validate()) {
                        AuthCubit.get(context).logIn(
                          email: emialController.text,
                          passWord: passWordController.text,
                        );
                      }
                    },
                    text: "LogIn",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: Row(
                      children: [
                        const Text(
                          "Don,t Have an account...!",
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
