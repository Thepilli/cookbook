import 'package:cookbook/animated_app/screens/onboarding_screen/componenets/sign_in_form.dart';
import 'package:cookbook/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<Object?> customSignInDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  return showGeneralDialog(
    barrierLabel: 'Sign in',
    barrierDismissible: true,
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) => Center(
      child: Container(
        height: 620,
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.94),
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            clipBehavior: Clip
                .none, //allows partially overflowing components to be still visible - and counts as a outside touch for dismissability
            children: [
              Column(
                children: [
                  Text(
                    'Sign in',
                    style: appstyle(34, Colors.black, FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SignInForm(),
                  const Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 2,
                      )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text('OR'),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 2,
                      )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Sign up with Email, Apple ID, or Google',
                      style: appstyle(15, Colors.black, FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: SvgPicture.asset(
                              'assets/animated_app/icons/email_box.svg',
                              height: 64,
                              width: 64,
                            )),
                        IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: SvgPicture.asset(
                              'assets/animated_app/icons/apple_box.svg',
                              height: 64,
                              width: 64,
                            )),
                        IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: SvgPicture.asset(
                              'assets/animated_app/icons/google_box.svg',
                              height: 64,
                              width: 64,
                            )),
                      ],
                    ),
                  )
                ],
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: -50,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  ).then(onClosed);
}
