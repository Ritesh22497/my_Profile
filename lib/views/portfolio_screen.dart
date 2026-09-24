import 'package:flutter/material.dart';
import '../controllers/portfolio_controller.dart';
import 'widgets/particles_background.dart';
import 'widgets/scroll_progress_button.dart';
import 'components/drawer_view.dart';
import 'components/navbar_view.dart';
import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/education_section.dart';
import 'sections/experience_section.dart';
import 'sections/footer_section.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late final PortfolioController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PortfolioController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final topInset = MediaQuery.of(context).padding.top;

    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        return Scaffold(
          drawer: !isDesktop ? DrawerView(controller: _controller) : null,
          body: ParticlesBackground(
            child: Stack(
              children: [
                // Scrollable Content Layer
                SingleChildScrollView(
                  controller: _controller.scrollController,
                  child: Column(
                    children: [
                      // Dynamic Navbar clearance accounting for SafeArea top status bar
                      SizedBox(height: isDesktop ? 85 : (topInset + 64)),
                      HeroSection(controller: _controller),
                      AboutSection(controller: _controller),
                      SkillsSection(controller: _controller),
                      ExperienceSection(controller: _controller),
                      ProjectsSection(controller: _controller),
                      EducationSection(controller: _controller),
                      ContactSection(controller: _controller),
                      FooterSection(controller: _controller),
                    ],
                  ),
                ),

                // Top Sticky Glass Navbar
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: NavbarView(controller: _controller),
                ),

                // Bottom-Right Floating Back-to-Top with Circular Progress
                ScrollProgressButton(controller: _controller),
              ],
            ),
          ),
        );
      },
    );
  }
}
