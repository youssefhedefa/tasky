import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/components/custom_button.dart';
import 'package:tasky/core/components/custom_text_input_field.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';
import 'package:tasky/core/routing/routing_constances.dart';
import 'package:tasky/features/registration/presentation/manager/log_in_cubit/log_in_cubit.dart';
import 'package:tasky/features/registration/presentation/manager/log_in_cubit/log_in_state.dart';
import 'package:tasky/features/registration/presentation/widgets/registration_footer.dart';
import 'package:tasky/features/registration/presentation/widgets/registration_view.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  late Country country;
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
        child: Form(
          key: context.read<LogInCubit>().formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: AppTextStyleHelper.font24BoldBlack,
              ),
              const SizedBox(height: 24),
              CustomTextInputField(
                keyboardType: TextInputType.phone,
                hintText: '01023456789',
                validatorMessage: 'Phone is required',
                controller: context.read<LogInCubit>().phoneController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                  FilteringTextInputFormatter.digitsOnly,
                ],
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
              const SizedBox(height: 20),
              CustomTextInputField(
                keyboardType: TextInputType.text,
                hintText: 'Password...',
                validatorMessage: 'Password is required',
                controller: context.read<LogInCubit>().passwordController,
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
              const SizedBox(height: 20),
              BlocConsumer<LogInCubit,LogInState>(
                builder: (context,state) {
                  if(state is LogInLoadingState){
                    return const Center(child: CircularProgressIndicator());
                  }
                  return CustomButton(
                    onPressed: () {
                      logInAction();
                    },
                    child: Text(
                      'Sign In',
                      style: AppTextStyleHelper.font19BoldWhite,
                    ),
                  );
                },
                listener: (context,state){
                  if(state is LogInSuccessState){
                    //Navigator.pushNamed(context, AppRoutingConstances.onboarding);
                  }
                  if(state is LogInErrorState){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
              ),
              RegistrationFooter(
                notClickable: 'Don\'t have an account?',
                clickable: 'Sign Up here',
                onPressed: () {
                  // navigate to sign up page
                  Navigator.pushNamed(context, AppRoutingConstances.signup);
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

  logInAction(){
    if(context.read<LogInCubit>().formKey.currentState!.validate()){
      context.read<LogInCubit>().logInEmitted(
          phone: country.phoneCode + context.read<LogInCubit>().phoneController.text,
          password: context.read<LogInCubit>().passwordController.text,
      );
    }
  }

}
