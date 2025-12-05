import 'package:flutter/material.dart';
import 'chatbot_screen.dart';
import 'settings_screen.dart';
import 'sos_screen.dart';
import 'diagrams_screen.dart';
import 'contacts_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with menu and settings icons
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Color(0xFFB3D9D9),
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: Color(0xFFB3D9D9),
                      size: 28,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const SettingsScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Three cards section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: _buildCard(
                      context,
                      'Écout\nImmédiat',
                      const Color(0xFFB3D9D9),
                      () {
                        // CHANGED: Now opens chatbot
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const ChatbotScreen()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildCard(
                      context,
                      'Votre\nAssistant',
                      const Color(0xFFE5A5C5),
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const ContactsScreen()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildCard(
                      context,
                      'Votre\nScore',
                      const Color(0xFFB8A5D6),
                      () {
                        // CHANGED: Now opens diagrams screen
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const DiagramsScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            // SOS Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // CHANGED: Now opens SOS screen instead of dialog
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SOSScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD0D0D0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'SOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
            
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String text, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}