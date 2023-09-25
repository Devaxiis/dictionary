import 'package:dictionary/library.dart';
import 'package:dictionary/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<User?>(
          initialData: null,
          stream: AuthService.auth.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.data != null) {
              return const HomeScreen();
            } else {
              return SignInPage();
            }
          },
        ),
      ),
    );
  }
}

