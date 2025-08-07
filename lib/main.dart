import 'package:bloc/bloc.dart';
import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/helper_functions/on_generate_routes.dart';
import 'core/services/custom_bloc_observer.dart';
import 'features/dashboard/views/dashboard_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://hucrreuwmvhuvjbavxek.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh1Y3JyZXV3bXZodXZqYmF2eGVrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQ1NjAwMzcsImV4cCI6MjA3MDEzNjAzN30.9Rui9nsaiUNp6YuhSeg5Lt20Gl_DqSJMrVioAcSTaK4',
  );
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  CloudinaryContext.cloudinary =
      Cloudinary.fromCloudName(cloudName: 'dwgw0dluq');

  setupGetit();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.routeName,
    );
  }
}
