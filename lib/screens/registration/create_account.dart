import 'package:flutter/material.dart';

import '../../commons.dart';
import '../../utils/constants.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: progressBar(0.08),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Image.asset('assets/images/account_creation.jpg'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            const Text(
              'Create your',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, height: 1),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Coinpay account',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Coinpay is a powerful tool that allows you to easily',
              style:
                  TextStyle(color: Colors.black45, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const Text(
              'send, receive, and track all your transactions',
              style:
                  TextStyle(color: Colors.black45, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  side: WidgetStateProperty.all<BorderSide>(
                      const BorderSide(color: kAppDefaultColor)),
                  padding: getButtonPadding(context),
                  backgroundColor:
                      WidgetStateProperty.all<Color>(kAppDefaultColor)),
              child: const Text(
                'Sign up',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/registration');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  side: WidgetStateProperty.all<BorderSide>(
                      const BorderSide(color: kAppDefaultColor, width: 2)),
                  padding: getButtonPadding(context),
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.white)),
              child: const Text(
                'Log in',
                style: TextStyle(
                    color: kAppDefaultColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    fontSize: 16),
                text: 'By continuing you accept our \n',
                children: <TextSpan>[
                  TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(
                          color: kAppDefaultColor,
                          decoration: TextDecoration.underline)),
                  TextSpan(text: ' and '),
                  TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: kAppDefaultColor,
                        decoration: TextDecoration.underline,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
