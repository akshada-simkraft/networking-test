import 'authentication_data.dart';

class AuthenticationResponse {
  bool success;
  AuthenticationData? authenticationData;
  AuthenticationResponse({required this.success, this.authenticationData});
}
