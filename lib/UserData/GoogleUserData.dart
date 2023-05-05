class GoogleUserInfo {
  String? userName;
  String? userEmail;
  String? userPhoneNumber;
  String? userPhotoUrl;

  GoogleUserInfo({
    required this.userName,
    required this.userEmail,
    this.userPhoneNumber,
    required this.userPhotoUrl,
  });
}
