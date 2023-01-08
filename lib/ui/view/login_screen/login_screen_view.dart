import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:taupex/services/firebase_auth_service.dart';
import 'package:taupex/ui/view/login_screen/login_screen_view_model.dart';
import 'package:taupex/ui/widgets/build_tab.dart';
import 'package:taupex/ui/widgets/sign_in_button.dart';

part 'login_screen_mobile.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginScreenViewModel>.reactive(
        viewModelBuilder: () => LoginScreenViewModel(),
        onModelReady: (model) {
          // Do Something on Model Ready
        },
        builder: (context, model, child) {
          return ScreenTypeLayout(
              mobile: _LoginScreenMobile(
            viewModel: model,
          ));
        });
  }
}
