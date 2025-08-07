import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../constants.dart';
import 'storage_service.dart';

class SupbaseStorageService implements StorageService {
  static late Supabase supabase;
  static initSupabase() async {
    supabase =
        await Supabase.initialize(url: kSupbaseUrl, anonKey: kSupabaseAnonKey);
  }

  @override
  Future<String> uploadFile(File file, String path) {
    // TODO: implement uploadFile
    throw UnimplementedError();
  }
}
