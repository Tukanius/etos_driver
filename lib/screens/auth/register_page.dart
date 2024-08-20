import 'package:etos_driver/components/icons/back_icon.dart';
import 'package:etos_driver/components/ui/button.dart';
import 'package:etos_driver/components/ui/form_text_field.dart';
import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/models/user.dart';
import 'package:etos_driver/provider/user_provider.dart';
import 'package:etos_driver/screens/otp/otp_page.dart';
import 'package:etos_driver/utils/is_device_size.dart';
import 'package:etos_driver/widgets/register-number/letter.dart';
import 'package:etos_driver/widgets/register-number/letters.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = 'RegisterPage';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormBuilderState> fbkey = GlobalKey<FormBuilderState>();
  TextEditingController regnumController = TextEditingController();
  bool isVisible = true;
  bool isVisible1 = true;
  bool isLoading = false;
  String? email = 'ttuka0721@gmail.com';

  List<String> letters = [
    CYRILLIC_ALPHABETS_LIST[0],
    CYRILLIC_ALPHABETS_LIST[0]
  ];
  String registerNo = "";

  onSubmit() async {
    if (fbkey.currentState!.saveAndValidate()) {
      setState(() {
        isLoading = true;
      });
      try {
        User data = User.fromJson(fbkey.currentState!.value);
        data.registerNo =
            '${letters.join()}${fbkey.currentState?.value["registerNo"]}';
        await Provider.of<UserProvider>(context, listen: false).register(data);
        setState(() {
          isLoading = false;
        });
        // ignore: use_build_context_synchronously
        await Navigator.of(context).pushNamed(
          OtpVerifyPage.routeName,
          arguments: OtpVerifyPageArguments(email: data.email!),
        );
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }
  }

  void onChangeLetter(String item, index) {
    Navigator.pop(context);
    setState(() {
      letters[index] = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: backgroundColor,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: backgroundColor,
              automaticallyImplyLeading: false,
              leading: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ActionButton(
                  onClick: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: black,
                    size: 20,
                  ),
                ),
              ),
              centerTitle: true,
              title: Text(
                'Бүртгүүлэх',
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FormBuilder(
                      key: fbkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormTextField(
                            name: "lastname",
                            labelText: "Овог",
                            hintText: "Овог",
                            filled: true,
                            fillColor: white,
                            textColor: black,
                            labelColor: black,
                            bgColor: Colors.transparent,
                            validator: FormBuilderValidators.compose([
                              (value) {
                                return isValidCryllic(
                                    value.toString(), context);
                              }
                            ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FormTextField(
                            name: "firstname",
                            labelText: "Нэр",
                            hintText: "Нэр",
                            filled: true,
                            fillColor: white,
                            textColor: black,
                            labelColor: black,
                            bgColor: Colors.transparent,
                            validator: FormBuilderValidators.compose([
                              (value) {
                                return isValidCryllic(
                                    value.toString(), context);
                              }
                            ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FormTextField(
                            name: "email",
                            labelText: "И-мэйл",
                            hintText: "И-мэйл",
                            filled: true,
                            fillColor: white,
                            textColor: black,
                            labelColor: black,
                            bgColor: Colors.transparent,
                            validator: FormBuilderValidators.compose([
                              (value) {
                                return validateEmail(value.toString(), context);
                              }
                            ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FormTextField(
                            name: "phone",
                            labelText: "Утасны дугаар",
                            hintText: "Утасны дугаар",
                            filled: true,
                            fillColor: white,
                            textColor: black,
                            labelColor: black,
                            bgColor: Colors.transparent,
                            validator: FormBuilderValidators.compose([
                              (value) {
                                return validatePhone(value.toString(), context);
                              }
                            ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FormTextField(
                            name: "password",
                            labelText: "Нууц үг",
                            hintText: "Нууц үг",
                            filled: true,
                            fillColor: white,
                            textColor: black,
                            labelColor: black,
                            obscureText: isVisible,
                            bgColor: Colors.transparent,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: 'Заавал бөглөнө үү.',
                              ),
                            ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FormTextField(
                            name: "passwordVerify",
                            labelText: "Нууц үг давтах",
                            hintText: "Нууц үг давтах",
                            filled: true,
                            fillColor: white,
                            textColor: black,
                            labelColor: black,
                            obscureText: isVisible1,
                            bgColor: Colors.transparent,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: "Нууц үгээ давтан оруулна уу"),
                              (value) {
                                if (fbkey.currentState?.fields['password']
                                        ?.value !=
                                    value) {
                                  return 'Оруулсан нууц үгтэй таарахгүй байна';
                                }
                                return null;
                              }
                            ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Регистрийн дугаар",
                              style: TextStyle(
                                fontSize: 12,
                                color: black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          FormBuilderField(
                            autovalidateMode: AutovalidateMode.disabled,
                            name: "registerNo",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Заавал бөглөнө үү'),
                              (dynamic value) => value.toString() != ""
                                  ? (validateStructure(
                                          letters.join(), value.toString())
                                      ? null
                                      : "Регистрийн дугаараа оруулна уу!")
                                  : null,
                            ]),
                            builder: (FormFieldState<dynamic> field) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none),
                                  errorText: field.errorText,
                                  fillColor: white,
                                  filled: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 15),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 0.0),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      RegisterLetters(
                                        width: DeviceSize.width(3, context),
                                        height: DeviceSize.height(90, context),
                                        oneTitle: "Регистер сонгох",
                                        hideOnPressed: false,
                                        title: letters[0],
                                        backgroundColor: white,
                                        textColor:
                                            Theme.of(context).iconTheme.color,
                                        length: CYRILLIC_ALPHABETS_LIST.length,
                                        itemBuilder: (ctx, i) => RegisterLetter(
                                          text: CYRILLIC_ALPHABETS_LIST[i],
                                          onPressed: () {
                                            onChangeLetter(
                                                CYRILLIC_ALPHABETS_LIST[i], 0);
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      RegisterLetters(
                                        width: DeviceSize.width(3, context),
                                        height: DeviceSize.height(90, context),
                                        title: letters[1],
                                        oneTitle: "Регистер сонгох",
                                        hideOnPressed: false,
                                        backgroundColor:
                                            Theme.of(context).splashColor,
                                        textColor:
                                            Theme.of(context).iconTheme.color,
                                        length: CYRILLIC_ALPHABETS_LIST.length,
                                        itemBuilder: (ctx, i) => RegisterLetter(
                                          text: CYRILLIC_ALPHABETS_LIST[i],
                                          onPressed: () {
                                            onChangeLetter(
                                                CYRILLIC_ALPHABETS_LIST[i], 1);
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: FormTextField(
                                          textColor:
                                              Theme.of(context).iconTheme.color,
                                          onChange: (value) {
                                            setState(() {
                                              registerNo = value!;
                                            });
                                            // ignore: invalid_use_of_protected_member
                                            field.setValue(value);
                                          },
                                          filled: true,
                                          fillColor: white,
                                          controller: regnumController,
                                          name: 'registerNumber',
                                          hintText: 'Регистрийн дугаар',
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9]'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Button(
                      isLoading: isLoading,
                      labelText: "Бүртгүүлэх",
                      color: colorBlue,
                      onPress: onSubmit,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String? isValidCryllic(String name, BuildContext context) {
  String pattern = r'(^[а-яА-ЯӨөҮүЁёӨө -]+$)';
  RegExp isValidName = RegExp(pattern);
  if (name.isEmpty) {
    return "Заавар оруулна";
  } else {
    if (!isValidName.hasMatch(name)) {
      return "Зөвхөн крилл үсэг ашиглана";
    } else {
      return null;
    }
  }
}

String? validatePhone(String value, context) {
  RegExp regex = RegExp(r'[(9|8]{1}[0-9]{7}$');
  if (value.isEmpty) {
    return 'Утасны дугаараа оруулна уу';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Утасны дугаараа шалгана уу';
    } else {
      return null;
    }
  }
}

String? validateEmail(String value, context) {
  RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (value.isEmpty) {
    return 'И-мэйлээ оруулна уу';
  } else {
    if (!regex.hasMatch(value)) {
      return 'И-мэйл буруу байна';
    } else {
      return null;
    }
  }
}

bool validateStructure(String value, String number) {
  if (number.length < 8) return false;
  if (isNumeric(number)) {
    return true;
  }
  return true;
}

bool isNumeric(String s) {
  if (s.isEmpty) {
    return false;
  }

  return !int.parse(s).isNaN;
}
