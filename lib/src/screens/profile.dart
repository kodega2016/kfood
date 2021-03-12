import 'package:flutter/material.dart';
import 'package:kfood/src/screens/login.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Version:1.0.0", textAlign: TextAlign.center),
            Text("Developed By:kodega", textAlign: TextAlign.center),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.grey[400],
              offset: Offset(0.5, 0.4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/29916949?s=460&u=f854682a6880c61418e25f122e0a7f904e97190b&v=4'),
              ),
              title: Text('Khadga Bahadur Shrestha'),
              subtitle: Text('khadgalovecoding2016@gmail.com'),
            ),
            Divider(),
            ListTile(
              title: Text('Notifications'),
              leading: Icon(Icons.notifications_none_outlined),
              trailing: Switch(
                value: false,
                onChanged: (val) {},
              ),
            ),
            ListTile(
              title: Text('Delivery Address'),
              leading: Icon(Icons.place_outlined),
            ),
            ListTile(
              title: Text('Recent Orders'),
              leading: Icon(Icons.receipt_outlined),
            ),
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.info_outline),
            ),
            ListTile(
              title: Text('Sign Out'),
              leading: Icon(Icons.exit_to_app_outlined),
              onTap: () async {
                final _isLogout = await KLoader.confirm(
                  context: context,
                  title: 'Are you sure to logout?',
                  content: 'You will be logged out from the application.',
                );
                print(_isLogout);
              },
            ),
          ],
        ),
      ),
    );
  }
}
