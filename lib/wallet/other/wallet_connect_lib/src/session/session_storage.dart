import 'package:wallet_proxy_pattern/wallet/other/wallet_connect_lib/src/session/wallet_connect_session.dart';

abstract class SessionStorage {
  Future store(WalletConnectSession session);

  Future<WalletConnectSession?> getSession();

  Future removeSession();
}
