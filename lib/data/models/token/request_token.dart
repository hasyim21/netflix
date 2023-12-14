import 'dart:convert';

import 'package:equatable/equatable.dart';

class Token extends Equatable {
  final bool? success;
  final String? expiresAt;
  final String? requestToken;

  const Token({
    this.success,
    this.expiresAt,
    this.requestToken,
  });

  factory Token.fromRawJson(String str) => Token.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        success: json["success"],
        expiresAt: json["expires_at"],
        requestToken: json["request_token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "expires_at": expiresAt,
        "request_token": requestToken,
      };

  @override
  List<Object?> get props => [success, expiresAt, requestToken];

  @override
  String toString() =>
      'RequestToken(success: $success, expiresAt: $expiresAt, requestToken: $requestToken)';
}
