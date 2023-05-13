abstract class WalletRepository {
  Future<String> wcConnect();

  Future<int> getChainId();

  Future<String> signMessage({String? param});

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
  });
}
