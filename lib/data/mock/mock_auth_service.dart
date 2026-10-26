/// Backend gelene kadar kullanılan sahte kimlik doğrulama servisi.
/// Her istek kısa bir gecikmeden sonra başarılı döner.
class MockAuthService {
  const MockAuthService();

  static const _latency = Duration(milliseconds: 900);

  Future<void> signIn({required String email, required String password}) =>
      Future.delayed(_latency);

  Future<void> signUp({required String email, required String password}) =>
      Future.delayed(_latency);

  Future<void> signInWithProvider(AuthProvider provider) =>
      Future.delayed(_latency);

  Future<void> sendPasswordReset(String email) => Future.delayed(_latency);
}

enum AuthProvider { google, apple }
