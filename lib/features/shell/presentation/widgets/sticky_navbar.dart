import 'dart:ui';
import 'package:flutter/material.dart';

class StickyNavbar extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onContact;
  final bool isMobile;

  const StickyNavbar({
    super.key,
    required this.onHome,
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onContact,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                border: Border.all(color: Colors.cyanAccent.withValues(alpha: 0.24)),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyanAccent.withValues(alpha: 0.12),
                    blurRadius: 18,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const _Brand(),
                  const Spacer(),
                  if (!isMobile) ...[
                    _NavItem(label: 'ပင်မ', onTap: onHome),
                    _NavItem(label: 'အကြောင်း', onTap: onAbout),
                    _NavItem(label: 'Skills', onTap: onSkills),
                    _NavItem(label: 'Projects', onTap: onProjects),
                    _NavItem(label: 'Contact', onTap: onContact),
                  ],
                  if (isMobile)
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        icon: const Icon(Icons.menu_rounded),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.bolt_rounded, color: Colors.cyanAccent),
        SizedBox(width: 10),
        Text(
          'Moe Kyaw Aung',
          style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.4),
        ),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: TextButton(
        onPressed: onTap,
        child: Text(label),
      ),
    );
  }
}
