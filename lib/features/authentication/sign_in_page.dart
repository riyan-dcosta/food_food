import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_food/data/authentication/app_auth.dart';
import 'package:food_food/features/authentication/components/input_label_field.dart';
import 'package:food_food/features/authentication/sign_up_page.dart';
import 'package:food_food/features/common/app_constants.dart';
import 'package:food_food/features/common/app_snackbar/app_snackbar.dart';
import 'package:food_food/features/common/components/elevated_container.dart';
import 'package:food_food/features/common/navigation/app_navigation.dart';
import 'package:food_food/features/dashboard/dashboard_page.dart';
import 'package:food_food/utils/extensions/layout_space_extension.dart';

import '../common/components/ez_scaffold.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final emailController = TextEditingController(text: "rdriyan@gmail.com");
  final passwordController = TextEditingController(text: "12345678");

  @override
  Widget build(BuildContext context) {
    return EzScaffold(
      // appBar: EzAppBar(
      //     automaticallyImplyLeading: false,
      //     title: "Signup Page",
      //     actions: []),
      body: Padding(
        padding: defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.lock,
                    size: 48,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  SizedBox(height: 30,),
                  InputLabelField(
                    label: "Email",
                    textController: emailController,
                    // onChanged: (value) => ref
                    //     .watch(usernameControllerProvider.notifier)
                    //     .onChanged(value),
                  ),
                  InputLabelField(
                    label: "Password",
                    isPassword: true,
                    textController: passwordController,
                    // onChanged: (value) => ref
                    //     .watch(passwordControllerProvider.notifier)
                    //     .onChanged(value),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final resp = await FirebaseAuthImpl(ref: ref).signIn(
                          emailAddress: emailController.text,
                          password: passwordController.text,
                        );
                        resp.when(
                          success: () {
                            ShowToast(message: "Success", context: context)
                                .showSuccess();
                            pushAndRemoveUntilCurrentPage(
                                context: context, newPage: DashboardPage());
                          },
                          failure: (message) =>
                              ShowToast(message: message, context: context)
                                  .showError(),
                        );
                      },
                      child: const Text("LogIn")),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: "New User? ",
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Register Here",
                            style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            mouseCursor: SystemMouseCursors.click,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                pushPage(
                                    context: context,
                                    newPage: const SignUpPage());
                              },
                          )
                        ],
                      ),
                    ),
                  )
                ].spaceVertical(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
