sealed class AppEnv {
  static const baseUrl = String.fromEnvironment('baseUrl');
  static const connectTimeout =
      int.fromEnvironment('connectTimeout', defaultValue: 10000);
  static const receiveTimeout =
      int.fromEnvironment('receiveTimeout', defaultValue: 30000);
}
