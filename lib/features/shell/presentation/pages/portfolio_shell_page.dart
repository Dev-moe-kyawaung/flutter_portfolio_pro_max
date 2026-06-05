import 'package:flutter/material.dart';
import '../../../about/presentation/pages/about_section.dart';
import '../../../contact/presentation/pages/contact_section.dart';
import '../../../hero/presentation/pages/hero_section.dart';
import '../../../projects/presentation/pages/projects_section.dart';
import '../../../services/presentation/pages/services_section.dart';
import '../../../skills/presentation/pages/skills_section.dart';
import '../widgets/mobile_drawer.dart';
import '../widgets/scroll_progress_glow.dart';
import '../widgets/sticky_navbar.dart';

class PortfolioShellPage extends StatefulWidget {
  const PortfolioShellPage({super.key});

  @override
  State<PortfolioShellPage> createState() => _PortfolioShellPageState();
}

class _PortfolioShellPageState extends State<PortfolioShellPage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (!_scrollController.hasClients) return;
      final max = _scrollController.position.maxScrollExtent;
      final value = max <= 0 ? 0.0 : (_scrollController.offset / max).clamp(0.0, 1.0);
      if (value != _progress) {
        setState(() => _progress = value);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx != null) {
      await Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
        alignment: 0.05,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: isMobile
          ? SafeArea(
              child: MobileDrawer(
                onHome: () {
                  Navigator.pop(context);
                  _scrollTo(_heroKey);
                },
                onAbout: () {
                  Navigator.pop(context);
                  _scrollTo(_aboutKey);
                },
                onSkills: () {
                  Navigator.pop(context);
                  _scrollTo(_skillsKey);
                },
                onProjects: () {
                  Navigator.pop(context);
                  _scrollTo(_projectsKey);
                },
                onContact: () {
                  Navigator.pop(context);
                  _scrollTo(_contactKey);
                },
              ),
            )
          : null,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: StickyNavbar(
                  onHome: () => _scrollTo(_heroKey),
                  onAbout: () => _scrollTo(_aboutKey),
                  onSkills: () => _scrollTo(_skillsKey),
                  onProjects: () => _scrollTo(_projectsKey),
                  onContact: () => _scrollTo(_contactKey),
                  isMobile: isMobile,
                ),
              ),
              SliverToBoxAdapter(key: _heroKey, child: const HeroSection()),
              SliverToBoxAdapter(key: _aboutKey, child: const AboutSection()),
              SliverToBoxAdapter(key: _skillsKey, child: const SkillsSection()),
              SliverToBoxAdapter(key: _projectsKey, child: const ProjectsSection()),
              SliverToBoxAdapter(key: _contactKey, child: const ContactSection()),
              const SliverToBoxAdapter(child: SizedBox(height: 120)),
            ],
          ),
          ScrollProgressGlow(progress: _progress),
        ],
      ),
    );
  }
}
