import 'package:flutter/material.dart';
import 'package:hostel_app/ui/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

import '../../../data/dto/auth_dto.dart';
import '../../../viewmodels/auth_view_model.dart';
import 'build_login_button.dart';

Widget buildBody(
  TextEditingController userNameController,
  TextEditingController passwordController,
) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Login Panel',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: TextFormField(
            controller: userNameController,
            decoration: const InputDecoration(hintText: "Email"),
            textAlign: TextAlign.start,
            // maxLines: 1,
            // maxLength: 20,
            keyboardType: TextInputType.name,
          ),
        ),
        const SizedBox(height: 20),
        Consumer<convenient>(builder: (context, authViewModel, _) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                // focusedBorder: InputBorder.all,
              ),
              textAlign: TextAlign.start,
              // maxLines: 1,
              // maxLength: 20,
              keyboardType: TextInputType.name,
              obscureText: authViewModel.isObscure,
            ),
          );
        }),
        const SizedBox(height: 20),
        Consumer<convenient>(
          builder: (context, authViewModel, _) {
            return authViewModel.isLoading
                ? const CircularProgressIndicator.adaptive()
                : Consumer<convenient>(
                    builder: (context, authState, _) {
                      return BuildLoginButton(
                        // onLongPress: () => authState.toggleObscureness(),
                        onLongPress: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardScreen()),
                        ),
                        onPressed: () async => await authViewModel.login(
                          context,
                          AuthDto(
                            email: userNameController.text,
                            password: passwordController.text,
                          ),
                        ),
                        text: 'Login',
                      );
                    },
                  );
          },
        )
      ],
    ),
  );
}
