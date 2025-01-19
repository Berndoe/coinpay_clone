import 'package:coinpay/commons.dart';
import 'package:flutter/material.dart';

import '../../widgets/back_button.dart';
import '../../widgets/reusable_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: backIcon(context),
        bottom: progressBar(100),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Image.asset('assets/images/welcome.jpg'),
            const Text(
              'Congratulations!\n Welcome to Coinpay',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'We are happy to have you. It\'s time to send, receive\n and track your expense.',
                style: TextStyle(
                    color: Colors.grey.shade600, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: DefaultButton(
        isActive: true,
        text: 'Continue',
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
      ),
    );
  }
}
