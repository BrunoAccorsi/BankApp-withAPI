import 'package:bytebank/components/localization/i18N_container.dart';
import 'package:bytebank/models/name_model.dart';
import 'package:bytebank/screens/dashboard/dashboard_view.dart';
import 'package:bytebank/screens/dashboard/dashboard_i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardContainer extends StatelessWidget {
  const DashboardContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NameCubit('Bruno'),
      child: I18NLoadingConteiner(
        viewKey: "dashboard",
        creator: (messages) => DashBoardView(DashBoardLazyViewI18N(messages)),
      ),
    );
  }
}
