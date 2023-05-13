class GoogleUserInfo {
  final String? userName;
  final String? userEmail;
  final String? userPhoneNumber;
  final String? userPhotoUrl;

  GoogleUserInfo({
    required this.userName,
    required this.userEmail,
    required this.userPhoneNumber,
    required this.userPhotoUrl,
  });

  factory GoogleUserInfo.fromJson(Map<String, dynamic> json) {
    return GoogleUserInfo(
      userName: json['userName'],
      userEmail: json['userEmail'],
      userPhoneNumber: json['userPhone'],
      userPhotoUrl: json['userPhotoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userPhone': userPhoneNumber,
      'userPhotoUrl': userPhotoUrl,
    };
  }
}
