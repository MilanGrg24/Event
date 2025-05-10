import 'user_model.dart';

class LoginResponse {
  final bool? status;
  final String message;
  final User user;
  final String? token;
  final String? tokenType;
  final int? expiresIn;

  LoginResponse({
    this.status,
    required this.message,
    required this.user,
    this.token,
    this.tokenType,
    this.expiresIn,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      message: json['message'],
      user: User.fromJson(json['data']['user']),
      token: json['data']['token'],
      tokenType: json['data']['token_type'],
      expiresIn: json['data']['expires_in'],
    );
  }
}
