import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../../core/widgets/cyber_frame.dart';
import '../../../../core/widgets/gradient_text.dart';
import '../../../../core/widgets/glow_button.dart';
import '../widgets/rotating_avatar_ring.dart';
import '../widgets/typing_roles.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entrance = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  )..forward();

  @override
  void dispose() {
    _entrance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 980;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 28),
      child: AnimatedBuilder(
        animation: _entrance,
        builder: (context, child) {
          final t = Curves.easeOutCubic.transform(_entrance.value);
          return Opacity(
            opacity: t,
            child: Transform.translate(
              offset: Offset(0, 42 * (1 - t)),
              child: child,
            ),
          );
        },
        child: CyberFrame(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(isWide ? 34 : 22),
            child: isWide
                ? Row(
                    children: [
                      Expanded(child: _HeroCopy(isWide: true)),
                      const SizedBox(width: 26),
                      const Expanded(child: _HeroVisual()),
                    ],
                  )
                : Column(
                    children: [
                      _HeroCopy(isWide: false),
                      const SizedBox(height: 26),
                      const _HeroVisual(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  final bool isWide;
  const _HeroCopy({required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _TagLine(),
        const SizedBox(height: 18),
        const GradientText(
          'မိုးကျော်အောင် · Moe Kyaw Aung',
          gradient: LinearGradient(
            colors: [Colors.cyanAccent, Colors.pinkAccent, Colors.yellowAccent],
          ),
          style: TextStyle(
            fontSize: 54,
            height: 1.02,
            fontWeight: FontWeight.w900,
            letterSpacing: -1.0,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Senior Android Developer',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Tachileik, Myanmar 🇲🇲  ↔  Bangkok, Thailand 🇹🇭',
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        const SizedBox(height: 18),
        const TypingRoles(
          roles: [
            'Senior Android Developer',
            'Flutter & Jetpack Compose Builder',
            'Cybersecurity Learner',
            'AI / ML Explorer',
          ],
        ),
        const SizedBox(height: 18),
        const Text(
          'I design premium mobile and web experiences with clean architecture, sharp visuals, and smooth motion.',
          style: TextStyle(
            color: Colors.white60,
            fontSize: 16,
            height: 1.65,
          ),
        ),
        const SizedBox(height: 24),
        const _StatsRow(),
        const SizedBox(height: 24),
        const _ActionRow(),
        const SizedBox(height: 18),
        const _SocialRow(),
      ],
    );
  }
}

class _HeroVisual extends StatelessWidget {
  const _HeroVisual();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotatingAvatarRing(),
          SizedBox(height: 18),
          Text(
            'Code with culture. Build with purpose.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white60,
              fontSize: 15,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _TagLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.cyanAccent.withValues(alpha: 0.35)),
        color: Colors.cyanAccent.withValues(alpha: 0.08),
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withValues(alpha: 0.18),
            blurRadius: 18,
          ),
        ],
      ),
      child: const Text(
        'Portfolio · Flutter Pro Max Version',
        style: TextStyle(
          color: Colors.cyanAccent,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      runSpacing: 14,
      children: const [
        _StatCard(value: '82+', label: 'Certificates'),
        _StatCard(value: '16', label: 'Social Links'),
        _StatCard(value: '40+', label: 'Tech Domains'),
      ],
    );
  }
}

class _StatCard extends StatefulWidget {
  final String value;
  final String label;
  const _StatCard({required this.value, required this.label});

  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..forward();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = Curves.easeOut.transform(_controller.value);
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, 12 * (1 - t)),
            child: child,
          ),
        );
      },
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white12),
          color: Colors.white.withValues(alpha: 0.03),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.value,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.label,
              style: const TextStyle(color: Colors.white60),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      runSpacing: 14,
      children: [
        GlowButton(
          label: 'View Projects',
          icon: Icons.dashboard_rounded,
          onPressed: () {},
        ),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.download_rounded),
          label: const Text('Download Resume'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.cyanAccent),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ],
    );
  }
}

class _SocialRow extends StatelessWidget {
  const _SocialRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _SocialChip(label: 'GitHub', url: 'https://github.com/Dev-moe-kyawaung', icon: Icons.code_rounded),
        _SocialChip(label: 'LinkedIn', url: 'https://www.linkedin.com/in/moe-kyaw-aung-2653093a1', icon: Icons.work_rounded),
        _SocialChip(label: 'YouTube', url: 'https://www.youtube.com/channel/UCuTXUguZb4xjeL2nX8WJG', icon: Icons.play_circle_fill_rounded),
        _SocialChip(label: 'Gravatar', url: 'https://gravatar.com/moekyawaung2026', icon: Icons.account_circle_rounded),
      ],
    );
  }
}

class _SocialChip extends StatelessWidget {
  final String label;
  final String url;
  final IconData icon;

  const _SocialChip({
    required this.label,
    required this.url,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white24),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
