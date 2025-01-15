import 'package:coinpay/utils/constants.dart';
import 'package:coinpay/widgets/reusable_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/authentication_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonActive = false;

  @override
  void initState() {
    _numberController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
    super.initState();
  }

  @override
  void dispose() {
    _numberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonActive = _numberController.text.length == 10 &&
          _passwordController.text.length > 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Log in to Coinpay',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Enter your registered mobile number to log in.',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              Authentication(
                numberController: _numberController,
                passwordController: _passwordController,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                'Forgot password?',
                style: TextStyle(color: kAppDefaultColor),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: DefaultButton(
          isActive: _isButtonActive,
          onPressed: () {
            Navigator.pushNamed(context, '/welcome');
          },
          text: 'Log in'),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
