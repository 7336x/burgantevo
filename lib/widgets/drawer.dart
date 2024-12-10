import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              color: const Color.fromARGB(255, 56, 155, 255),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/logo.png', 
                      width: 80, 
                      height: 85,
                      fit: BoxFit.cover, 
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Burgan Tevo',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Welcome!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          
          Expanded(
            child: ListView(
              children: [
                _buildDrawerItem(
                  context,
                  icon: Icons.home,
                  label: 'Home',
                  onTap: () {
                    Navigator.pop(context); 
                    Navigator.pushNamed(context, '/home'); 
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.login,
                  label: 'Sign In',
                  onTap: () {
                    Navigator.pop(context); 
                    Navigator.pushNamed(
                        context, '/sign-in'); 
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.app_registration,
                  label: 'Sign Up',
                  onTap: () {
                    Navigator.pop(context); 
                    Navigator.pushNamed(
                        context, '/sign-up'); 
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.logout,
                  label: 'Sign Out',
                  onTap: () {
                    Navigator.pop(context); 
                    Navigator.pushNamed(context,
                        '/sign-out'); 
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange), 
      title: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}
