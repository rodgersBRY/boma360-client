import 'package:client/config/constants.dart';
import 'package:client/config/routes.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/presentation/widgets/auth/account_span.dart';
import 'package:client/presentation/widgets/buttons.dart';
import 'package:client/presentation/widgets/input_field.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              right: 10.0,
              top: screenWidth / 5,
              child: SizedBox(
                width: screenWidth / 4,
                child: Image.asset(kFarmOutlineImage),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              width: screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.primary,
                    radius: 70,
                    child: CircleAvatar(
                      backgroundColor: AppColors.background,
                      radius: 40,
                      child: Image.asset(
                        kCowLogoImage,
                        width: screenHeight,
                        height: screenHeight,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'Welcome Back',
                    style: textTheme.headlineLarge?.copyWith(fontSize: 35.0),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'Manage your cattle with ease',
                    style: textTheme.headlineMedium?.copyWith(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(kDefaultRadius),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email or Phone', style: textTheme.labelLarge),
                        const SizedBox(height: 10.0),
                        InputField(
                          hintText: 'Email or Phone',
                          suffixIcon: Icons.person,
                        ),
                        const SizedBox(height: 15.0),
                        Text('Password', style: textTheme.labelLarge),
                        const SizedBox(height: 10.0),
                        InputField(
                          hintText: 'Enter your password',
                          suffixIcon: Icons.visibility_off,
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot Password?',
                              style: textTheme.headlineSmall?.copyWith(
                                color: AppColors.secondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                        MyElevatedButton(
                          textTheme: textTheme,
                          label: 'Sign In',
                        ),
                        const SizedBox(height: 25.0),
                        Row(
                          children: [
                            Expanded(
                              child: Container(color: Colors.grey, height: 1.0),
                            ),
                            const SizedBox(width: 20.0),
                            Text('or'),
                            const SizedBox(width: 20.0),
                            Expanded(
                              child: Container(color: Colors.grey, height: 1.0),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                        SizedBox(
                          width: screenWidth,
                          height: 60.0,
                          child: OutlinedButton.icon(
                            icon: Icon(Icons.golf_course),
                            onPressed: () {},
                            label: Text('Continue with Google'),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                  AccountSpan(
                    textTheme: textTheme,
                    prefixText: 'Don\'t have',
                    suffixText: 'Sign Up',
                    route: AppRoutes.kRegister,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
