import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/components/custom_button.dart';
import 'package:tasky/core/components/custom_text_input_field.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';
import 'package:tasky/core/routing/routing_constances.dart';
import 'package:tasky/features/resistration/presentation/widgets/experience_level.dart';
import 'package:tasky/features/resistration/presentation/widgets/registration_footer.dart';
import 'package:tasky/features/resistration/presentation/widgets/registration_view.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late Country country;
  double paddingBetweenWidgets = 15.0;

  @override
  void initState() {
    country = CountryParser.parseCountryCode('EG');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RegistrationView(
      form: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: AppTextStyleHelper.font24BoldBlack,
              ),
              SizedBox(height: paddingBetweenWidgets),
              CustomTextInputField(
                keyboardType: TextInputType.text,
                hintText: 'Name...',
                controller: TextEditingController(),
              ),
              SizedBox(height: paddingBetweenWidgets),
              CustomTextInputField(
                keyboardType: TextInputType.phone,
                hintText: '01023456789',
                controller: TextEditingController(),
                prefixWidget: GestureDetector(
                  onTap: showPicker,
                  child: Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: Text(
                      '${country.flagEmoji}  +${country.phoneCode}',
                      style: AppTextStyleHelper.font14BoldGrey,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: paddingBetweenWidgets),
              CustomTextInputField(
                keyboardType: TextInputType.number,
                hintText: 'Years of experience...',
                controller: TextEditingController(),
              ),
              SizedBox(height: paddingBetweenWidgets),
              ExperienceLevel(
                label: 'Experience Level',
                hintText: 'Select your experience level',
                menuItems: ['Beginner', 'Intermediate', 'Expert'],
                onSelected: (value) {
                  print(value);
                },
              ),
              SizedBox(height: paddingBetweenWidgets),
              CustomTextInputField(
                keyboardType: TextInputType.number,
                hintText: 'Address...',
                controller: TextEditingController(),
              ),
              SizedBox(height: paddingBetweenWidgets),
              CustomTextInputField(
                keyboardType: TextInputType.text,
                hintText: 'Password...',
                controller: TextEditingController(),
                suffixWidget: const Icon(Icons.remove_red_eye),
              ),
              SizedBox(height: paddingBetweenWidgets),
              CustomButton(
                onPressed: () {},
                child: Text(
                  'Sign In',
                  style: AppTextStyleHelper.font19BoldWhite,
                ),
              ),
              RegistrationFooter(
                notClickable: 'Already have any account?',
                clickable: 'Sign in',
                onPressed: () {
                  // navigate to sign up page
                  Navigator.pushNamed(context, AppRoutingConstances.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  showPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      countryListTheme: CountryListThemeData(
        flagSize: 30,
        inputDecoration: InputDecoration(
          hintText: 'Search',
          labelStyle: AppTextStyleHelper.font14BoldGrey,
          focusedBorder: searchInputBorder(),
          enabledBorder: searchInputBorder(),
        ),
        bottomSheetHeight: 450,
        textStyle: AppTextStyleHelper.font14BoldGrey,
        backgroundColor: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      onSelect: (Country country) {
        setState(() {
          this.country = country;
        });
      },
    );
  }

  OutlineInputBorder searchInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 2,
      ),
    );
  }
}
