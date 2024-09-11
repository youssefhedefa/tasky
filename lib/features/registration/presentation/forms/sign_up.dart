import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/components/custom_button.dart';
import 'package:tasky/core/components/custom_text_input_field.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';
import 'package:tasky/core/routing/routing_constances.dart';
import 'package:tasky/features/registration/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:tasky/features/registration/presentation/manager/sign_in_cubit/sign_in_states.dart';
import 'package:tasky/features/registration/presentation/widgets/experience_level.dart';
import 'package:tasky/features/registration/presentation/widgets/registration_footer.dart';
import 'package:tasky/features/registration/presentation/widgets/registration_view.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late Country country;
  double paddingBetweenWidgets = 15.0;
  bool isNotVisible = true;

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
          child: Form(
            key: context.read<SignUpCubit>().formKey,
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
                  validatorMessage: 'Name is required',
                  hintText: 'Name...',
                  controller: context.read<SignUpCubit>().nameController,
                ),
                SizedBox(height: paddingBetweenWidgets),
                CustomTextInputField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.phone,
                  validatorMessage: 'Phone is required',
                  hintText: '01023456789',
                  controller: context.read<SignUpCubit>().phoneController,
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
                  validatorMessage: 'Years of experience is required',
                  controller: context.read<SignUpCubit>().yearsController,
                ),
                SizedBox(height: paddingBetweenWidgets),
                ExperienceLevel(
                  label: 'Experience Level',
                  hintText: 'Select your experience level',
                  controller: context.read<SignUpCubit>().levelController,
                  menuItems: const [
                    'fresh',
                    'junior',
                    'midLevel',
                    'senior',
                    'teamLead',
                    'manager',
                    'director',
                    'executive',
                    'seniorExecutive',
                    'ceo',
                  ],
                  onSelected: (value) {
                    print(value);
                  },
                ),
                SizedBox(height: paddingBetweenWidgets),
                CustomTextInputField(
                  keyboardType: TextInputType.text,
                  hintText: 'Address...',
                  validatorMessage: 'Address is required',
                  controller: context.read<SignUpCubit>().addressController,
                ),
                SizedBox(height: paddingBetweenWidgets),
                CustomTextInputField(
                  keyboardType: TextInputType.text,
                  hintText: 'Password...',
                  validatorMessage: 'Password is required',
                  controller: context.read<SignUpCubit>().passwordController,
                  isObscure: isNotVisible,
                  suffixWidget: isNotVisible
                      ? IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isNotVisible = false;
                            });
                          },
                        )
                      : IconButton(
                          icon: const Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isNotVisible = true;
                            });
                          },
                        ),
                ),
                SizedBox(height: paddingBetweenWidgets),
                BlocConsumer<SignUpCubit,SignInState>(
                  builder: (context,state) {
                    if(state is SignInLoadingState){
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CustomButton(
                      onPressed: (){
                        signInAction();
                      },
                      child: Text(
                        'Sign In',
                        style: AppTextStyleHelper.font19BoldWhite,
                      ),
                    );
                  },
                  listener: (context,state){
                    if(state is SignInSuccessState){
                      Navigator.pushNamedAndRemoveUntil(context, AppRoutingConstances.home, (route) => false);
                    }
                    if(state is SignInErrorState){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
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

  signInAction(){
    if(context.read<SignUpCubit>().formKey.currentState!.validate()){
      context.read<SignUpCubit>().signInEmitted(
        name: context.read<SignUpCubit>().nameController.text,
        phone: country.phoneCode + context.read<SignUpCubit>().phoneController.text,
        years: num.tryParse(context.read<SignUpCubit>().yearsController.text) ?? 0,
        level: context.read<SignUpCubit>().levelController.text,
        address: context.read<SignUpCubit>().addressController.text,
        password: context.read<SignUpCubit>().passwordController.text,
      );
    }
  }

}
