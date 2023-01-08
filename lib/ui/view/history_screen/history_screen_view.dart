import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:taupex/constants/dummy_data.dart';
import 'package:taupex/constants/monts.dart';
import 'package:taupex/models/chart.model.dart';
import 'package:taupex/ui/view/history_screen/history_screen_view_model.dart';
import 'package:intl/intl.dart';

part 'history_screen_mobile.dart';

class HistoryScreenView extends StatelessWidget {
  const HistoryScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HistoryScreenViewModel>.reactive(
        viewModelBuilder: () => HistoryScreenViewModel(),
        onModelReady: (model) {
          // Do Something on Model Ready
        },
        builder: (context, model, child) {
          return ScreenTypeLayout(
              mobile: _HistoryScreenMobile(
            viewModel: model,
          ));
        });
  }
}
