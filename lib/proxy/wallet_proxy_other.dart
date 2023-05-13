import 'package:wallet_proxy_pattern/proxy/wallet_proxy_interface.dart';
import 'package:wallet_proxy_pattern/wallet/other/data/repo_impl/wallet_repo_impl.dart';
import 'package:wallet_proxy_pattern/wallet/other/domain/repository/wallet_repository.dart';

class WalletProxyOther implements WalletProxy {
  late final WalletRepository repository;

  WalletProxyOther() {
    repository = WalletRepoImpl();
  }

  /// Only Web
  @override
  Future<String> requestConnect() {
    throw UnsupportedError('No support for desktop/mobile');
  }

  @override
  Future<String> wcConnect() => repository.wcConnect();

  /// Only Web
  @override
  Future requestETH() async {
    throw UnsupportedError('No support for desktop/mobile');
  }

  @override
  Future<String> signMessage({String? param}) =>
      repository.signMessage(param: param);

  @override
  Future<String> sendTransaction({
    String? to,
    String? from,
    BigInt? value,
    BigInt? gasLimit,
    BigInt? gasPrice,
    int? nounce,
    String? data,
    BigInt? maxFeePerGas,
    BigInt? maxPriorityFeePerGas,
  }) =>
      repository.sendTransaction(
        from: from,
        to: to,
        value: value,
        gasLimit: gasLimit,
        gasPrice: gasPrice,
        nounce: nounce,
        data: data,
        maxFeePerGas: maxFeePerGas,
        maxPriorityFeePerGas: maxPriorityFeePerGas,
      );

  @override
  Future statusTransaction() async {
    // TODO: implement statusTransaction
  }

  @override
  Future<int> getChainId() {
    // TODO: implement getChainId
    throw UnimplementedError();
  }

  /// Only Web
  @override
  Future<void> autoAddChain() {
    throw UnsupportedError('No support for desktop/mobile');
  }

  /// Only Web
  @override
  dynamic onAccountsChanged(void Function(List<String> accounts) listener) {
    throw UnsupportedError('No support for desktop/mobile');
  }

  /// Only Web
  @override
  dynamic onChainChanged(void Function(int chainId) listener) {
    throw UnsupportedError('No support for desktop/mobile');
  }
}

WalletProxy getWalletProxy() => WalletProxyOther();
