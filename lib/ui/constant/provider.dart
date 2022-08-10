
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:student_management/api/repositories/authentication_repositories.dart';


class AppProviders {
  //The providers for dependency injection and state management are to added here
  //as the app will use MultiProvider
  static final providers = <SingleChildWidget>[
    //format for registering providers:
    ListenableProvider(create: (_) => AuthProvider()),
  
   
  ];
}