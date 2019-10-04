import 'package:parse_server_sdk/parse_server_sdk.dart';

const keyParseApplicationId = 'MT3Q1e8fK5nWxhs6yMdo9iemy4L1GHERQi4sLp1g';
const keyParseServerUrl = 'https://parseapi.back4app.com/';
const keyParseMasterKey = '13rhn99A7kwqerKuEzzgMFRrDn8AB5B5hM67zMvP';

Future<void> initParse() async {
  // Initialize parse
  await Parse().initialize(
    keyParseApplicationId,
    keyParseServerUrl,
    masterKey: keyParseMasterKey,
    debug: true,
    coreStore: await initCoreStore(),
  );

  // Check server is healthy and live - Debug is on in this instance so check logs for result
  final ParseResponse response = await Parse().healthCheck();
  return response;
}

/// Available options:
/// SharedPreferences - Not secure but will work with older versions of SDK - CoreStoreSharedPrefsImpl
/// Sembast - NoSQL DB - Has security - CoreStoreSembastImpl
Future<CoreStore> initCoreStore() async {
  //return CoreStoreSembastImp.getInstance();
  return CoreStoreSharedPrefsImp.getInstance();
}
