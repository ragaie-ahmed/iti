import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti/Register/Data/Auth/auth_cubit.dart';
import 'package:iti/Register/Presentation/Screens/LogInScreen.dart';
import 'package:iti/Register/Presentation/Widget/CustomButton.dart';
import 'package:iti/Register/Presentation/Widget/CustomTextFormField.dart';

class RegisterScreens extends StatefulWidget {
  const RegisterScreens({super.key});

  @override
  State<RegisterScreens> createState() => _RegisterScreensState();
}

class _RegisterScreensState extends State<RegisterScreens> {
  TextEditingController emialController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  GlobalKey<FormState> formRegister = GlobalKey();

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
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Success Register"),
              backgroundColor: Colors.green,
            ));
          }
          else if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          return Form(
            key: formRegister,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .1,
                  ),
                  const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .09,
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
                      if (formRegister.currentState!.validate()) {
                        AuthCubit.get(context).register(
                          emailAddress: emialController.text,
                          password: passWordController.text,);
                      }
                    },
                    text: "Register",
                  ),
                   Padding(
                    padding: const EdgeInsets.all(13),
                    child: Row(
                      children: [
                        const Text(
                          "Have an account...!",
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const LogInScreens();
                            },));
                          },
                          child: const Text(
                            "LogIn",
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
