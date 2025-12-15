import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header avec profil utilisateur
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nom Utilisateur',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Navigation principale
            ListTile(
              leading: Icon(Ionicons.home_outline, color: Colors.amber),
              title: Text('Accueil', style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                print('Accueil clicked');
              },
            ),
            ListTile(
              leading: Icon(Ionicons.compass_outline, color: Colors.blue),
              title: Text('Explorer', style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                print('Explorer clicked');
              },
            ),
            ListTile(
              leading: Icon(Ionicons.airplane_outline, color: Colors.blue),
              title: Text('Mes Voyages', style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                print('Voyages clicked');
              },
            ),
            ListTile(
              leading: Icon(Ionicons.bookmark_outline, color: Colors.blue),
              title: Text('Favoris', style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                print('Favoris clicked');
              },
            ),
            Divider(height: 20, thickness: 1),

            // 1️⃣ Account Section
            _buildSectionHeader('👤 Account'),
            _buildDrawerItem(
              icon: Icons.person_outline,
              title: 'My Profile',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/myprofile');
              },
            ),
            _buildDrawerItem(
              icon: Icons.edit_outlined,
              title: 'Edit Profile',
              onTap: () {
                Navigator.pop(context);
                // Navigation vers Edit Profile
              },
            ),
            Divider(height: 20, thickness: 1),

            // 2️⃣ Social Section
            _buildSectionHeader('👥 Social'),
            _buildDrawerItem(
              icon: Icons.group_outlined,
              title: 'My Friends',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/myfriends');
              },
            ),
            _buildDrawerItem(
              icon: Icons.local_activity_outlined,
              title: 'Activities',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/activities');
              },
            ),
            Divider(height: 20, thickness: 1),

            // 3️⃣ App Settings Section
            _buildSectionHeader('🛠️ App Settings'),
            _buildDrawerItem(
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTap: () {
                Navigator.pop(context);
                print('Settings clicked');
              },
            ),
            _buildDrawerItem(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              onTap: () {
                Navigator.pop(context);
                print('Notifications clicked');
              },
            ),
            _buildDrawerItem(
              icon: Icons.language_outlined,
              title: 'Language',
              onTap: () {
                Navigator.pop(context);
                _showLanguageDialog(context);
              },
            ),
            Divider(height: 20, thickness: 1),

            // 4️⃣ About Section
            _buildSectionHeader('ℹ️ About'),
            _buildDrawerItem(
              icon: Icons.info_outline,
              title: 'About TRIPLY',
              onTap: () {
                Navigator.pop(context);
                _showAboutDialog(context);
              },
            ),
            _buildDrawerItem(
              icon: Icons.help_outline,
              title: 'Help / Support',
              onTap: () {
                Navigator.pop(context);
                print('Help clicked');
              },
            ),
            Divider(height: 20, thickness: 1),

            // 5️⃣ Actions Section
            _buildSectionHeader('🔐 Actions'),
            _buildDrawerItem(
              icon: Icons.logout,
              title: 'Logout',
              textColor: Colors.red,
              onTap: () {
                Navigator.pop(context);
                _showLogoutDialog(context);
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? Colors.grey[700]),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: textColor ?? Colors.black87,
        ),
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('English'),
                onTap: () {
                  Navigator.pop(context);
                  // Changer la langue en anglais
                },
              ),
              ListTile(
                title: Text('Français'),
                onTap: () {
                  Navigator.pop(context);
                  // Changer la langue en français
                },
              ),
              ListTile(
                title: Text('Español'),
                onTap: () {
                  Navigator.pop(context);
                  // Changer la langue en espagnol
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('About TRIPLY'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TRIPLY',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Version 1.0.0'),
              SizedBox(height: 16),
              Text(
                'Your ultimate travel companion for discovering and sharing amazing trips around the world.',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Logique de déconnexion
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}