import 'package:genzeh911/provider/auth_provider.dart';
import 'package:genzeh911/provider/edit_profile.dart';
import 'package:genzeh911/provider/page_view_provider.dart';
import 'package:provider/provider.dart';

var providers = [
  //New
  ChangeNotifierProvider<AuthProvider>(
    create: ((context) => AuthProvider()),
  ),

  ChangeNotifierProvider<PageViewProvider>(
    create: ((context) => PageViewProvider()),
  ),

  ChangeNotifierProvider<EditProfileProvider>(
    create: ((context) => EditProfileProvider()),
  ),
];
