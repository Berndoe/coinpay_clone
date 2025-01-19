import 'package:coinpay/commons.dart';
import 'package:coinpay/widgets/back_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../widgets/reusable_button.dart';

class EmailSetup extends StatelessWidget {
  EmailSetup({super.key});

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: backIcon(context),
        bottom: progressBar(0.2),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Add your email',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'This info needs to be accurate with your ID\n document.',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Email',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  labelText: 'name@example.com',
                  hintText: 'name@example.com',
                  labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  border: kTextFieldBorder,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: DefaultButton(
          isActive: EmailValidator.validate(_emailController.text),
          text: 'Continue',
          onPressed: () {}),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
