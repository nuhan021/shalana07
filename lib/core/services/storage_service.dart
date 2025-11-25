import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // Constants for preference keys
  static const String _tokenKey = 'token';
  static const String _refreshTokenKey = 'refreshToken';
  static const String _idKey = 'userId';
  static const String _currentAvatar = 'avatarId';
  static const String _isFirstTime = 'isFirstTime';
  static const String _role = 'role';

  // Singleton instance for SharedPreferences
  static SharedPreferences? _preferences;

  // Initialize SharedPreferences (call this during app startup)
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Check if a token exists in local storage
  static bool hasToken() {
    final token = _preferences?.getString(_tokenKey);
    return token != null;
  }

  static bool hasRefreshToken() {
    final refreshToken = _preferences?.getString(_refreshTokenKey);
    return refreshToken != null;
  }

  static bool isFirstTimer() {
    final isFirstTime = _preferences?.getBool(_isFirstTime);
    return isFirstTime ?? true;
  }

  static void setFirstTimer() {
    _preferences?.setBool(_isFirstTime, false);
  }

  static Future<void> setRole(String role) async {
    _preferences?.setString(_role, role);
  }

  // Save the token and user ID to local storage
  static Future<void> saveToken(String token, String id) async {
    await _preferences?.setString(_tokenKey, token);
    await _preferences?.setString(_idKey, id);
  }


  static Future<void> saveRefreshToken(String refreshToken, String id) async {
    await _preferences?.setString(_refreshTokenKey, refreshToken);
    await _preferences?.setString(_idKey, id);
  }

  // Remove the token and user ID from local storage (for logout)
  static Future<void> logoutUser() async {
    await _preferences?.remove(_tokenKey);
    await _preferences?.remove(_idKey);
    await _preferences?.remove(_refreshTokenKey);
    await _preferences?.remove(_role);
    // Navigate to the login screen
    // Get.offAllNamed('/login');
  }

  static Future<void> saveCurrentAvatar(String currentAvatarIndex) async {
    await _preferences?.setString(_currentAvatar, currentAvatarIndex);
  }

  // getter for avatar index
  static String? get getCurrentAvatar => _preferences?.getString(_currentAvatar);

  // Getter for user ID
  static String? get userId => _preferences?.getString(_idKey);

  // Getter for token
  static String? get token => _preferences?.getString(_tokenKey);

  static String? get refreshToken => _preferences?.getString(_refreshTokenKey);


  static Future<String> role() async {
    return _preferences?.getString(_role) ?? '';
  }
}


