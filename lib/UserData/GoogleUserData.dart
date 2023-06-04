class GoogleUserInfo {
  final String? uid;
  final String? userName;
  final String? userEmail;
  final String? userPhoneNumber;
  final String? userPhotoUrl;

  GoogleUserInfo({
    required this.uid,
    required this.userName,
    required this.userEmail,
    required this.userPhoneNumber,
    required this.userPhotoUrl,
  });

  factory GoogleUserInfo.fromJson(Map<String, dynamic> json) {
    return GoogleUserInfo(
      uid: json['UID'],
      userName: json['userName'],
      userEmail: json['userEmail'],
      userPhoneNumber: json['userPhoneNumber'],
      userPhotoUrl: json['userPhotoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'UID': uid,
      'userName': userName,
      'userEmail': userEmail,
      'userPhoneNumber': userPhoneNumber,
      'userPhotoUrl': userPhotoUrl,
    };
  }
}
