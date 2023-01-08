import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:taupex/core/route_constants.dart';
import 'package:taupex/ui/view/profile_screen/profile_screen_view_model.dart';

part 'profile_screen_mobile.dart';

class ProfileScreenView extends StatelessWidget {
  const ProfileScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileScreenViewModel>.reactive(
        viewModelBuilder: () => ProfileScreenViewModel(),
        onModelReady: (model) {
          // Do Something on Model Ready
        },
        builder: (context, model, child) {
          return ScreenTypeLayout(
              mobile: _ProfileScreenMobile(
            viewModel: model,
          ));
        });
  }
}
