import 'package:flutter/material.dart';
import 'package:hostel_app/ui/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

import '../../../data/dto/auth_dto.dart';
import '../../../viewmodels/auth_view_model.dart';

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
            decoration: const InputDecoration(hintText: "Username"),
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
                      return ElevatedButton(
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
                        child: const Text(
                          "Login",
                          style: TextStyle(fontFamily: 'inter'),
                        ),
                      );
                    },
                  );
          },
        )
      ],
    ),
  );
}
