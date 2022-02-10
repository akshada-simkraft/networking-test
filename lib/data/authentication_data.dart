//what has to be send by server program should have it
//in this case jwt is a token which is sent by server so it has to be there
class AuthenticationData {
  String jwtToken;

  AuthenticationData(this.jwtToken);

  factory AuthenticationData.fromJson(Map<String, dynamic> map) {
    return AuthenticationData(map["jwtToken"]);
  }
}
