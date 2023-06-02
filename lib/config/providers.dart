import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:mbti/features/auth/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:flutter_web_plugins/url_strategy.dart';

///
/// Infrastructure dependencies
///

final sharedPreferencesProvider =
    FutureProvider((ref) => SharedPreferences.getInstance());

final supabaseProvider = FutureProvider<supabase.Supabase>((ref) async {
  return supabase.Supabase.initialize(
    url: 'https://xruruyvwphgpkkjgqqlr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhydXJ1eXZ3cGhncGtramdxcWxyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODU0NTk0MzIsImV4cCI6MjAwMTAzNTQzMn0._ajrr3dwoHKr5JaoRGYwdgXR9NwGfI84PUmhGfLW_yI',
    authCallbackUrlHostname: 'login-callback',
    debug: kDebugMode,
  );
});

final supabaseClientProvider = Provider<supabase.SupabaseClient>(
  (ref) => ref.read(supabaseProvider).asData!.value.client,
);

///
/// Application dependencies
///

///
/// Presentation dependencies
///
///

Future<void> initializeProviders(ProviderContainer container) async {
  // 라우터 path를 사용하여 url을 구성합니다.
  usePathUrlStrategy();

  /// Core
  /// 초기화와 동시에 객체를 생성
  await container.read(sharedPreferencesProvider.future);
  await container.read(supabaseProvider.future);

  /// Auth
  container.read(authControllerProvider);
}
