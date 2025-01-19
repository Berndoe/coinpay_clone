import 'package:coinpay/widgets/back_button.dart';
import 'package:coinpay/widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../commons.dart';
import '../../utils/constants.dart';

class NumberAuthentication extends StatefulWidget {
  const NumberAuthentication({super.key});

  @override
  State<NumberAuthentication> createState() => _NumberAuthenticationState();
}

class _NumberAuthenticationState extends State<NumberAuthentication> {
  late bool _isButtonActive = false;
  late bool _isFull = true;

  TextStyle? createStyle(Color color) {
    ThemeData theme = Theme.of(context);
    return theme.textTheme.headlineMedium?.copyWith(color: color);
  }

  @override
  Widget build(BuildContext context) {
    final otpTextStyles = List.generate(
      6,
      (_) => createStyle(kAppDefaultColor),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: backIcon(context),
        bottom: progressBar(0.1),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Confirm your phone',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'We send 6 digits code to +880 1720 84 57 57',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  OtpTextField(
                    numberOfFields: 6,
                    enabledBorderColor:
                        _isFull ? Colors.grey : kAppDefaultColor,
                    cursorColor: kAppDefaultColor,
                    showFieldAsBox: false,
                    borderWidth: 2.0,
                    textStyle: const TextStyle(fontSize: 8),
                    styles: otpTextStyles,

                    onCodeChanged: (String code) {
                      _isFull = false;
                    },
                    //runs when every text field is filled
                    onSubmit: (String verificationCode) {
                      setState(() {
                        _isButtonActive = true;
                      });
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  )
                ],
              ),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        fontSize: 16),
                    text: 'Didn\'t get a code? ',
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Resend',
                        style: TextStyle(
                          color: kAppDefaultColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: DefaultButton(
        padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.3)),
        text: 'Verify your Number',
        isActive: _isButtonActive,
        onPressed: () {
          Navigator.pushNamed(context, '/residence');
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
