import 'dart:io';

import 'package:path/path.dart';
import 'package:path/path.dart' as b;
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
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var result = await supabase.client.storage.from('images').upload(
          '$path/$fileName.$extensionName',
          file,
        );
    final String publicUrl = supabase.client.storage
        .from('images')
        .getPublicUrl('$path/$fileName.$extensionName');
    print(publicUrl);
    return publicUrl;
  }
}
