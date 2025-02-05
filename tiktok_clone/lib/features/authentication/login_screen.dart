import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/authentication/email_screen.dart';
import 'package:tictok_clone/features/authentication/widgets/auth_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v80,
              Text(
                'Log in to TikTok',
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              Text(
                'Manage your account, check notifications, comment on videos, and more.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Sizes.size14,
                  color: Colors.black45,
                ),
              ),
              Gaps.v40,
              AuthButton(
                text: 'Use email & password',
                icon: FaIcon(
                  FontAwesomeIcons.user,
                ),
                onTap: () {

                },
              ),
              Gaps.v16,
              AuthButton(
                text: 'Continue with Facebook',
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                ),
                onTap: () {},
              ),
              Gaps.v16,
              AuthButton(
                text: 'Continue with Google',
                icon: FaIcon(
                  FontAwesomeIcons.google,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: Sizes.size60 * 2,
        child: BottomAppBar(
          color: Colors.grey.shade200,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                ),
                Gaps.h8,
                InkWell(
                  onTap: () => _onSignUpTap(context),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
