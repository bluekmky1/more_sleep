import 'package:envied/envied.dart';
part 'generated/env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'OPEN_DATA_PORTAL_SERVICE_KEY')
  static final String openDataPortalServiceKey = _Env.openDataPortalServiceKey;

  @EnviedField(varName: 'SUPABASE_ANON_KEY')
  static final String supabaseAnonKey = _Env.supabaseAnonKey;
}
