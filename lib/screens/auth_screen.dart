import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:today_app/screens/tasks_screen.dart';
import 'package:today_app/services/local_auth_service.dart';

class AuthScreen extends StatefulWidget {
  static String id = '/';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool authenticated = false;
  void auth() async {
    final authenticate = await LocalAuth.authenticate();
    setState(() {
      authenticated = authenticate;
      if (authenticated == true) {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (toTaskScreenContext, a1, a2) => TasksScreen(),
            settings: RouteSettings(name: TasksScreen.id),
            transitionsBuilder: (toReportContext, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: const Duration(milliseconds: 300),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    auth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        auth();
      },
      child: Container(
        height: 80,
        width: 80,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
            color: Colors.black26),
        child: Center(child: const Icon(Icons.face, size: 75)),
      ),
    );
  }
}
