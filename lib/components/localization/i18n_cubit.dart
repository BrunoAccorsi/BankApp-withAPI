import 'package:bytebank/components/localization/i18n_state.dart';
import 'package:bytebank/components/localization/i18nmessages.dart';
import 'package:bytebank/webAPI/webClients/i18n_webClient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';

class I18NMessagesCubit extends Cubit<I18NMessagesState> {
  final LocalStorage storage =
      new LocalStorage('local_unsecure_version_1.json');

  final String _viewKey;

  I18NMessagesCubit(this._viewKey) : super(InitI18NMessagesState());

  void reload(I18NWebClient client) async {
    emit(LoadingI18NMessagesState());
    await storage.ready;
    final items = storage.getItem(_viewKey);
    if (items != null) {
      emit(LoadedI18NMessagesState(I18NMessages(items)));
      return;
    }

    final messages = await client.getAll();
    saveAndRefresh(messages);
  }

  void saveAndRefresh(Map<String, dynamic> messages) {
    storage.setItem(_viewKey, messages);
    emit(LoadedI18NMessagesState(I18NMessages(messages)));
  }
}
