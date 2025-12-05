import 'package:flutter/material.dart';
import 'login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _language = 'Français';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB3D9D9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF5A7B8C)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Paramètres',
          style: TextStyle(
            color: Color(0xFF5A7B8C),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          
          // Profile Section
          _buildSectionTitle('Profil'),
          _buildSettingItem(
            icon: Icons.person_outline,
            title: 'Modifier le profil',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.lock_outline,
            title: 'Changer le mot de passe',
            onTap: () {},
          ),
          
          const SizedBox(height: 20),
          
          // Preferences Section
          _buildSectionTitle('Préférences'),
          _buildSwitchItem(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          _buildSwitchItem(
            icon: Icons.dark_mode_outlined,
            title: 'Mode sombre',
            value: _darkModeEnabled,
            onChanged: (value) {
              setState(() {
                _darkModeEnabled = value;
              });
            },
          ),
          _buildSettingItem(
            icon: Icons.language,
            title: 'Langue',
            trailing: Text(
              _language,
              style: const TextStyle(
                color: Color(0xFF7A7A7A),
                fontSize: 15,
              ),
            ),
            onTap: () {
              _showLanguageDialog();
            },
          ),
          
          const SizedBox(height: 20),
          
          // Support Section
          _buildSectionTitle('Support'),
          _buildSettingItem(
            icon: Icons.help_outline,
            title: 'Centre d\'aide',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.privacy_tip_outlined,
            title: 'Politique de confidentialité',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.description_outlined,
            title: 'Conditions d\'utilisation',
            onTap: () {},
          ),
          
          const SizedBox(height: 20),
          
          // About Section
          _buildSectionTitle('À propos'),
          _buildSettingItem(
            icon: Icons.info_outline,
            title: 'Version de l\'application',
            trailing: const Text(
              '1.0.0',
              style: TextStyle(
                color: Color(0xFF7A7A7A),
                fontSize: 15,
              ),
            ),
            onTap: () {},
          ),
          
          const SizedBox(height: 30),
          
          // Logout Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  _showLogoutDialog();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Se déconnecter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF5A7B8C),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFFB3D9D9),
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF333333),
          fontSize: 15,
        ),
      ),
      trailing: trailing ?? const Icon(
        Icons.arrow_forward_ios,
        color: Color(0xFFB0B0B0),
        size: 16,
      ),
      onTap: onTap,
    );
  }

  Widget _buildSwitchItem({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFFB3D9D9),
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF333333),
          fontSize: 15,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFFB3D9D9),
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choisir la langue'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLanguageOption('Français'),
              _buildLanguageOption('English'),
              _buildLanguageOption('العربية'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Annuler'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLanguageOption(String language) {
    return RadioListTile<String>(
      title: Text(language),
      value: language,
      groupValue: _language,
      activeColor: const Color(0xFFB3D9D9),
      onChanged: (String? value) {
        setState(() {
          _language = value!;
        });
        Navigator.of(context).pop();
      },
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Se déconnecter'),
          content: const Text('Êtes-vous sûr de vouloir vous déconnecter?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: const Text(
                'Se déconnecter',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}