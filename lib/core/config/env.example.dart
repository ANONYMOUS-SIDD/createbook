/// Environment configuration TEMPLATE.
///
/// Copy this file to `env.dart` and fill in your actual credentials:
///   cp lib/core/config/env.example.dart lib/core/config/env.dart
///
/// Get your Supabase credentials from:
///   https://supabase.com/dashboard/project/_/settings/api
///
/// ⚠️  `env.dart` is gitignored — it must NEVER be committed.
class Env {
  static const String supabaseUrl = 'YOUR_SUPABASE_URL_HERE';
  static const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY_HERE';
}
