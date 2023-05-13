abstract class WalletActionRepoOther{
  Future<String> createWallet({String? param});
  Future<String> connectWalletConnect({String? param});
  Future<String> importPrivateKey({String? param});
  Future<String> importSeedPhrase({String? param});
  Future<String> getAccount({String? param});
  Future<String> estimateGas({String? param});
  Future<String> sendTransaction({String? param});
  Future<String> sendStatusTransaction({String? param});
  Future<String> getBalance({String? param});
  Future<String> getToken({String? param});
}