import 'package:flutter/material.dart';
import 'chatbot_screen.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final TextEditingController _searchController = TextEditingController();

  // List of contacts
  final List<ContactItem> _contacts = [
    ContactItem(
      name: 'Dr. Sarah Martin',
      specialty: 'Psychologue',
      contact: 'Clinique',
    ),
    ContactItem(
      name: 'Dr. Jean Dupont',
      specialty: 'Psychiatre',
      contact: 'Hôpital Central',
    ),
    ContactItem(
      name: 'Dr. Marie Laurent',
      specialty: 'Thérapeute',
      contact: 'Cabinet Privé',
    ),
    ContactItem(
      name: 'Dr. Ahmed Ben Ali',
      specialty: 'Psychologue',
      contact: 'Centre Médical',
    ),
    ContactItem(
      name: 'Dr. Fatma Mansour',
      specialty: 'Psychiatre',
      contact: 'Clinique Spécialisée',
    ),
    ContactItem(
      name: 'Dr. Pierre Dubois',
      specialty: 'Thérapeute',
      contact: 'Cabinet de Santé',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFE5A5C5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Contacts',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          
          // Grid of contacts
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  return _buildContactCard(_contacts[index]);
                },
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Search bar at bottom
          Container(
            color: const Color(0xFFE5A5C5),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Rechercher..',
                        hintStyle: TextStyle(
                          color: Color(0xFFB0B0B0),
                          fontSize: 15,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    // Search functionality
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(ContactItem contact) {
    return GestureDetector(
      onTap: () {
        // Open chat with this contact
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ChatbotScreen(contactName: contact.name),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE5A5C5).withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // User icon in white circle
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person_outline,
                size: 35,
                color: Color(0xFF5A5A5A),
              ),
            ),
            const SizedBox(height: 8),
            
            // Name
            Text(
              contact.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF333333),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 2),
            
            // Specialty
            Text(
              contact.specialty,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF666666),
                fontSize: 10,
              ),
            ),
            
            // Contact info
            Text(
              contact.contact,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF666666),
                fontSize: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Contact data model
class ContactItem {
  final String name;
  final String specialty;
  final String contact;

  ContactItem({
    required this.name,
    required this.specialty,
    required this.contact,
  });
}