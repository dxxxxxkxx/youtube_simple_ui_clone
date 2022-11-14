import 'package:flutter/material.dart';

import '../screens/main_screen.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String _appName = 'YouTube';
  final String _appLogoSrc = 'assets/images/logos/youtube.png';

  final List<Icon> _icons = const [
    Icon(Icons.ondemand_video),
    Icon(Icons.search),
    Icon(Icons.menu)
  ];

  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0.0,
      titleSpacing: 0.0,
      title: GestureDetector(
        onTap: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
          (route) => false,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(_appLogoSrc, width: 32.0, fit: BoxFit.contain),
            ),
            Text(_appName, style: const TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: _icons[0]),
        IconButton(onPressed: () {}, icon: _icons[1]),
        IconButton(onPressed: () {}, icon: _icons[2]),
      ],
    );
  }
}
