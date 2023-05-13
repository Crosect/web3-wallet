import 'package:injectable/injectable.dart';
import 'package:wallet_proxy_pattern/wallet/other/domain/repository/wallet_repository.dart';

@Injectable(as: WalletRepository)
class WalletRepoImpl extends WalletRepository {
  @override
  Future<String> wcConnect() {
    // TODO: implement wcConnect
    throw UnimplementedError();
  }

  @override
  Future<int> getChainId() {
    // TODO: implement getChainId
    throw UnimplementedError();
  }

  @override
  Future<String> signMessage({String? param}) {
    // TODO: implement signMessage
    throw UnimplementedError();
  }

  @override
  Future<String> sendTransaction(
      {String? to,
      String? from,
      BigInt? value,
      BigInt? gasLimit,
      BigInt? gasPrice,
      int? nounce,
      String? data,
      BigInt? maxFeePerGas,
      BigInt? maxPriorityFeePerGas}) {
    // TODO: implement sendTransaction
    throw UnimplementedError();
  }
}
