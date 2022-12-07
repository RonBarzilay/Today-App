import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class LocalAuth {
  // We would like to keep this class with a private properties
  // for max privacy
  static final _auth = LocalAuthentication();

  // _canAuthenticate is a private function
  // it checks whether user can use Biometrics || his device supported
  static Future<bool> _canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
  static Future<bool> authenticate() async {
    try {
      // if user not able to Authenticate, return false
      if (!await _canAuthenticate()) return false;
      return await _auth.authenticate(
        localizedReason: 'Authenticate to access Today',
        authMessages: const [
          AndroidAuthMessages(
              signInTitle: 'Sign In', cancelButton: 'No, thanks'),
          IOSAuthMessages(cancelButton: 'No, thanks')
        ],
        options: const AuthenticationOptions(
            useErrorDialogs: true, stickyAuth: true),
      );
    } catch (e) {
      print('erroe: $e');
      return false;
    }
  }
}
