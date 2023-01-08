import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:taupex/constants/dummy_data.dart';
import 'package:taupex/models/payment_datails.model.dart';
import 'package:taupex/ui/view/home_screen/home_screen_view_model.dart';
import 'package:intl/intl.dart';

part 'home_screen_mobile.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
        viewModelBuilder: () => HomeScreenViewModel(),
        onModelReady: (model) {
          // Do Something on Model Ready
        },
        builder: (context, model, child) {
          return ScreenTypeLayout(
              mobile: _HomeScreenMobile(
            viewModel: model,
          ));
        });
  }
}
