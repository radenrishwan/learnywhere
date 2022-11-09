import 'package:flutter/material.dart';
import 'package:uts/screens/login_screen.dart';
import 'package:uts/utils/constant.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 120,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Row(
                children: const [
                  FlutterLogo(
                    size: 40,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Learnywhere',
                    style: TextStyle(
                      fontSize: kMediumTextSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            title: const Text('Account'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: kPrimaryColor,
            ),
            title: const Text('Settings'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
          const Divider(height: 4),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: kPrimaryColor,
            ),
            title: const Text('Logout'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.cancel,
              color: kPrimaryColor,
            ),
            title: const Text('Close'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
