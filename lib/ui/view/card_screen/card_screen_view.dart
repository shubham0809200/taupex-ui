import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:taupex/ui/view/card_screen/card_screen_view_model.dart';

part 'card_screen_mobile.dart';

class CardScreenView extends StatelessWidget {
  const CardScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardScreenViewModel>.reactive(
        viewModelBuilder: () => CardScreenViewModel(),
        onModelReady: (model) {
          // Do Something on Model Ready
        },
        builder: (context, model, child) {
          return ScreenTypeLayout(
              mobile: _CardScreenMobile(
            viewModel: model,
          ));
        });
  }
}
