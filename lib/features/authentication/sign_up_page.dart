import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_food/data/authentication/app_auth.dart';
import 'package:food_food/data/users/app_users.dart';
import 'package:food_food/features/authentication/sign_in_page.dart';
import 'package:food_food/features/common/app_snackbar/app_snackbar.dart';
import 'package:food_food/utils/extensions/layout_space_extension.dart';

import '../common/app_constants.dart';
import '../common/components/elevated_container.dart';
import '../common/components/ez_app_bar.dart';
import '../common/components/ez_scaffold.dart';
import '../common/navigation/app_navigation.dart';
import '../dashboard/dashboard_page.dart';
import 'components/input_label_field.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final usernameController = TextEditingController(text: "riyan");
  final emailController = TextEditingController(text: "rdriyan@gmail.com");
  final passwordController = TextEditingController(text: "123456");

  @override
  Widget build(BuildContext context) {
    return EzScaffold(
      appBar: EzAppBar(
          automaticallyImplyLeading: false, title: "Signup Page", actions: []),
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
                      "SignUp",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InputLabelField(
                    label: "Username",
                    textController: usernameController,
                    // onChanged: (value) => ref
                    //     .watch(usernameControllerProvider.notifier)
                    //     .onChanged(value),
                  ),
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
                        final resp = await FirebaseAuthImpl(ref: ref).signUp(
                            emailAddress: emailController.text,
                            password: passwordController.text);
                        resp.when(
                          success: () {
                            AppUsersImpl(ref: ref).addUser(
                                username: usernameController.text,
                                email: emailController.text);

                            pushAndRemoveUntilCurrentPage(
                                context: context,
                                newPage: const DashboardPage());
                            ShowToast(message: "Success", context: context)
                                .showSuccess();
                          },
                          failure: (message) =>
                              ShowToast(message: message, context: context)
                                  .showError(),
                        );
                      },
                      child: const Text("Register")),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: "Already a User? ",
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "SignIn Here",
                            style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            mouseCursor: SystemMouseCursors.click,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                pushAndRemoveUntilCurrentPage(
                                    context: context, newPage: SignInPage());
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
