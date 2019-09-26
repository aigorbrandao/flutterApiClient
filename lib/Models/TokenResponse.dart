class TokenResponse {
  bool autenticated;
  String created;
  String expiration;
  String accessToken;
  String refreshToken;
  String message;

  TokenResponse(
      {this.autenticated,
      this.created,
      this.expiration,
      this.accessToken,
      this.refreshToken,
      this.message});

  TokenResponse.fromJson(Map<String, dynamic> json) {
    autenticated = json['autenticated'];
    created = json['created'];
    expiration = json['expiration'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autenticated'] = this.autenticated;
    data['created'] = this.created;
    data['expiration'] = this.expiration;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['message'] = this.message;
    return data;
  }
  
} 