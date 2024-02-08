import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/common/utils/toast.dart';
import 'package:whats_app_clone/common/widgets/custom_button.dart';
import 'package:whats_app_clone/config/theme/app_colors.dart';
import 'package:whats_app_clone/config/theme/app_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();

  static Country _selectedFilteredDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode("98");
  String _countryCode = _selectedFilteredDialogCountry.phoneCode;

  String _phoneNumber = "";

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Text(
                      "Verify your phone number",
                      style: robotoBold.copyWith(
                        fontSize: 20,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "WhatsApp Clone will send you SMS message (carrier charges may apply) to verify your phone number. Enter the country code and phone number",
                    textAlign: TextAlign.center,
                    style: robotoRegular.copyWith(fontSize: 15),
                  ),
                  const SizedBox(height: 30),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                    onTap: _openFilteredCountryPickerDialog,
                    title: _buildDialogItem(_selectedFilteredDialogCountry),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1.50,
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                        width: 80,
                        height: 42,
                        alignment: Alignment.center,
                        child: Text(_selectedFilteredDialogCountry.phoneCode),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: const EdgeInsets.only(top: 1.5),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: colorScheme.primary, width: 1.5))),
                          child: TextField(
                            controller: _phoneController,
                            decoration: const InputDecoration(
                              hintText: "Phone Number",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomButton(
              title: "Next",
              onTap: () {
                _submitVerifyPhoneNumber(context);
              },
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  _submitVerifyPhoneNumber(context) {
    if (_phoneController.text.isNotEmpty) {
      _phoneNumber = "+$_countryCode${_phoneController.text}";
      print("phoneNumber $_phoneNumber");
    } else {
      CustomToast.showToastError(context, "Please enter your phone number");
    }
  }

  _openFilteredCountryPickerDialog() {
    showDialog(
      context: context,
      builder: (_) => CountryPickerDialog(
        titlePadding: const EdgeInsets.all(8.0),
        searchCursorColor: AppColorsDark.primary,
        searchInputDecoration: const InputDecoration(
          hintText: "Search",
        ),
        isSearchable: true,
        title: const Text(
          "Select your phone code",
        ),
        onValuePicked: (Country country) {
          setState(() {
            _selectedFilteredDialogCountry = country;
            _countryCode = country.phoneCode;
          });
        },
        itemBuilder: _buildDialogItem,
      ),
    );
  }

  Widget _buildDialogItem(Country country) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CountryPickerUtils.getDefaultFlagImage(country),
          Text(" +${country.phoneCode}"),
          Expanded(
              child: Text(
            " ${country.name}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
          const Spacer(),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}
