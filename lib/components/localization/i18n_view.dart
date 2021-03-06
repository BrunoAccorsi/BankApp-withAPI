import 'package:bytebank/components/localization/i18n_cubit.dart';
import 'package:bytebank/components/localization/i18n_state.dart';
import 'package:bytebank/components/localization/i18nmessages.dart';
import 'package:bytebank/screens/progress_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef Widget I18NWidgetCreator(I18NMessages messages);

class I18NLoadingView extends StatelessWidget {
  final I18NWidgetCreator _creator;

  const I18NLoadingView(this._creator);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<I18NMessagesCubit, I18NMessagesState>(
        builder: (context, state) {
      if (state is InitI18NMessagesState || state is LoadingI18NMessagesState) {
        return ProgressView();
      }
      if (state is LoadedI18NMessagesState) {
        final messages = state.messages;
        return _creator.call(messages);
      }
      return ProgressView();
    });
  }
}
