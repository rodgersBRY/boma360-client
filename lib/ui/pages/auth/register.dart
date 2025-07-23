import 'package:client/config/constants.dart';
import 'package:client/config/routes.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/data/user_roles.dart';
import 'package:client/ui/pages/auth/auth_controller.dart';
import 'package:client/ui/widgets/auth/account_span.dart';
import 'package:client/ui/widgets/buttons.dart';
import 'package:client/ui/widgets/dropdown_field.dart';
import 'package:client/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find();

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
              child: ListView(
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
                  Center(
                    child: Text(
                      'Join CattleCare',
                      style: textTheme.headlineLarge?.copyWith(fontSize: 35.0),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Center(
                    child: Text(
                      'Start Managing your cattle today',
                      style: textTheme.headlineMedium?.copyWith(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                        Text('Full Name', style: textTheme.labelLarge),
                        const SizedBox(height: 10.0),
                        InputField(
                          hintText: 'Enter your full name',
                          suffixIcon: Icon(
                            Icons.person,
                            color: AppColors.danger.withValues(alpha: .5),
                          ),
                          textController: controller.nameTextController,
                          inputType: TextInputType.name,
                        ),
                        const SizedBox(height: 15.0),
                        Text('Phone Number', style: textTheme.labelLarge),
                        const SizedBox(height: 10.0),
                        InputField(
                          hintText: 'Enter your phone number',
                          suffixIcon: Icon(
                            Icons.call,
                            color: AppColors.danger.withValues(alpha: .5),
                          ),
                          inputType: TextInputType.phone,
                          textController: controller.phoneTextController,
                        ),
                        const SizedBox(height: 15.0),
                        Text('Email Address', style: textTheme.labelLarge),
                        const SizedBox(height: 10.0),
                        InputField(
                          hintText: 'Enter your email',
                          suffixIcon: Icon(
                            Icons.email,
                            color: AppColors.danger.withValues(alpha: .5),
                          ),
                          inputType: TextInputType.emailAddress,
                          textController: controller.emailTextController,
                        ),
                        const SizedBox(height: 15.0),
                        Text('Your Role', style: textTheme.labelLarge),
                        const SizedBox(height: 10.0),
                        MyDropDownWidget(
                          hint: 'Select a role',
                          itemList:
                              kUserRoles.map((String role) {
                                return DropdownMenuItem<String>(
                                  value: role,
                                  child: Text(role),
                                );
                              }).toList(),
                          errorText: 'Please select a role',
                          onChanged: (String? value) {
                            controller.roleTextController.text = value ?? '';
                          },
                        ),
                        const SizedBox(height: 15.0),
                        Text('Password', style: textTheme.labelLarge),
                        const SizedBox(height: 10.0),
                        Obx(
                          () => InputField(
                            hintText: 'Create a password',
                            suffixIcon: Icon(
                              controller.obscureConfirmPass.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,

                              color: AppColors.danger.withValues(alpha: .5),
                            ),
                            obscureText: controller.obscurePass.value,
                            textController: controller.passwordTextController,
                            onPressed: controller.togglePasswordVisibility,
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        Text('Confirm Password', style: textTheme.labelLarge),
                        const SizedBox(height: 10.0),
                        Obx(
                          () => InputField(
                            hintText: 'Confirm your password',
                            suffixIcon: Icon(
                              controller.obscureConfirmPass.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,

                              color: AppColors.danger.withValues(alpha: .5),
                            ),
                            obscureText: controller.obscureConfirmPass.value,
                            textController:
                                controller.confirmPasswordTextController,
                            onPressed:
                                controller.toggleConfirmPasswordVisibility,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Obx(
                                  () => Checkbox(
                                    checkColor: AppColors.white,
                                    activeColor: AppColors.primary,
                                    value:
                                        controller.acceptedTermsOfService.value,
                                    onChanged: (bool? val) {
                                      controller.acceptedTermsOfService.value =
                                          val!;
                                    },
                                  ),
                                ),
                                Text('I agree to the '),
                                Text(
                                  'Terms of Service',
                                  style: textTheme.headlineSmall?.copyWith(
                                    color: AppColors.secondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                        Obx(
                          () => MyElevatedButton(
                            label: Text('Create Account'),
                            loading: controller.isLoading.value,
                            onPressed:
                                controller.isLoading.isTrue
                                    ? () {}
                                    : () async => await controller.register(),
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        Center(
                          child: AccountSpan(
                            textTheme: textTheme,
                            prefixText: 'Already have',
                            suffixText: 'Sign In',
                            route: AppRoutes.kLogin,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    height: 130,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(kDefaultRadius),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage(kFarmerImage),
                            ),
                            const SizedBox(width: 20.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Trusted by farmers',
                                  style: textTheme.headlineMedium,
                                ),
                                Text(
                                  'across the country',
                                  style: textTheme.headlineSmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: screenWidth,
                          height: 130,
                          color: AppColors.white.withValues(alpha: .4),
                        ),
                      ],
                    ),
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
