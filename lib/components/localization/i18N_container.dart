import 'package:bytebank/components/localization/i18n_cubit.dart';
import 'package:bytebank/components/localization/i18n_view.dart';
import 'package:bytebank/webAPI/webClients/i18n_webClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class I18NLoadingConteiner extends StatelessWidget {
  late I18NWidgetCreator creator;
  late String viewKey;

  I18NLoadingConteiner({
    required I18NWidgetCreator creator,
    required String viewKey,
  }) {
    this.creator = creator;
    this.viewKey = viewKey;
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<I18NMessagesCubit>(
      create: (BuildContext context) {
        final cubit = I18NMessagesCubit(this.viewKey);
        cubit.reload(I18NWebClient(this.viewKey));
        return cubit;
      },
      child: I18NLoadingView(this.creator),
    );
  }
}
