import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final Provider<SupabaseClient> supabaseServiceProvider =
    Provider<SupabaseClient>(
  (Ref ref) => Supabase.instance.client,
);
