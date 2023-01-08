import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:taupex/ui/view/page_selector/page_selector_view_model.dart';

part 'page_selector_mobile.dart';

class PageSelectorView extends StatelessWidget {
  const PageSelectorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PageSelectorViewModel>.reactive(
        viewModelBuilder: () => PageSelectorViewModel(),
        onModelReady: (model) {
          // Do Something on Model Ready
        },
        builder: (context, model, child) {
          return ScreenTypeLayout(
              mobile: _PageSelectorMobile(
            viewModel: model,
          ));
        });
  }
}
