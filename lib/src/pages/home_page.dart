import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temp_noti/src/configs/route.dart' as custom_route;
import 'package:temp_noti/src/widgets/home/machinelist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  void _logout() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Logout!!'),
          content: const Text('ต้องการที่จะออกจากระบบ?'),
          actions: [
            TextButton(
              child: const Text('ยกเลิก'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
            TextButton(
              child:
                  const Text('ออกจากระบบ', style: TextStyle(color: Colors.red)),
              onPressed: () {
                SharedPreferences.getInstance().then((prefs) {
                  prefs.clear();
                  Navigator.of(dialogContext).pop();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    custom_route.Route.login,
                    (route) => false,
                  );
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')),
              );
            },
          ),
        ],
        title: const Text('Machine List'),
        automaticallyImplyLeading: false,
      ),
      body: const MachineList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _logout,
        tooltip: 'ลงชื่อออก',
        child: const Icon(Icons.logout),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
