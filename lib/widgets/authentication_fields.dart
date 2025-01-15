import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../commons.dart';

class Authentication extends StatelessWidget {
  final TextEditingController numberController;
  final TextEditingController passwordController;

  const Authentication(
      {super.key,
      required this.numberController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Phone',
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Flag(Flags.bangladesh), // Flag widget
                            ),
                            Text(
                              "+880",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[800]),
                            ),
                          ],
                        ),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                          // Adjust vertical alignment
                        ),
                        border: kTextFieldBorder,
                      ),
                      keyboardType: TextInputType.phone),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: TextFormField(
                    controller: numberController,
                    decoration: InputDecoration(
                      labelText: 'Mobile number',
                      labelStyle: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      hintText: 'Mobile number',
                      hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      border: kTextFieldBorder,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Password',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    // Ensures the field size remains constant
                    horizontal: 16,
                  ),
                  prefixIcon: const Icon(LineAwesome.lock_solid),
                  hintText: '••••••••',
                  hintStyle: TextStyle(
                      color: Colors.grey[400],
                      letterSpacing: 2,
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                  prefixIconColor: Colors.grey,
                  suffixIcon: const Icon(Bootstrap.eye),
                  suffixIconColor: Colors.grey,
                  border: kTextFieldBorder,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
