class UserInfoDetails {
  UserInfoDetails(
      this.token, this.displayName, this.email, this.photoUrl, this.uid);

  /// The provider identifier.
  final String? token;

  /// The provider’s user ID for the user.
  final String? uid;

  /// The name of the user.
  final String? displayName;

  /// The URL of the user’s profile photo.
  final String? photoUrl;

  /// The user’s email address.
  final String? email;
}