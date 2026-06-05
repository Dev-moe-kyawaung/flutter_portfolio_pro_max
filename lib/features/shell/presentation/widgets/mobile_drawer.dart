import 'package:flutter/material.dart';

class MobileDrawer extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onContact;

  const MobileDrawer({
    super.key,
    required this.onHome,
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF050816),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text('မီနူး', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),
            const SizedBox(height: 20),
            _item('ပင်မ', onHome),
            _item('အကြောင်း', onAbout),
            _item('Skills', onSkills),
            _item('Projects', onProjects),
            _item('Contact', onContact),
          ],
        ),
      ),
    );
  }

  Widget _item(String label, VoidCallback onTap) {
    return ListTile(
      title: Text(label),
      onTap: onTap,
      textColor: Colors.white,
      iconColor: Colors.cyanAccent,
      leading: const Icon(Icons.circle, size: 10),
    );
  }
}
