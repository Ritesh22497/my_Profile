import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
import '../models/portfolio_model.dart';

class PortfolioController extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  PortfolioController() {
    scrollController.addListener(_onScroll);
  }

  // Accent Themes
  static const List<AccentTheme> accentThemes = [
    AccentTheme(
      name: "Cyber Cyan",
      primary: Color(0xFF00D2FF),
      secondary: Color(0xFF7928CA),
    ),
    AccentTheme(
      name: "Electric Violet",
      primary: Color(0xFFA855F7),
      secondary: Color(0xFFEC4899),
    ),
    AccentTheme(
      name: "Emerald Matrix",
      primary: Color(0xFF10B981),
      secondary: Color(0xFF06B6D4),
    ),
    AccentTheme(
      name: "Sunset Amber",
      primary: Color(0xFFF59E0B),
      secondary: Color(0xFFEF4444),
    ),
  ];

  int _selectedThemeIndex = 0;
  int get selectedThemeIndex => _selectedThemeIndex;
  AccentTheme get currentTheme => accentThemes[_selectedThemeIndex];
  Color get accentColor => currentTheme.primary;
  Color get secondaryColor => currentTheme.secondary;

  void setThemeIndex(int index) {
    if (index >= 0 && index < accentThemes.length && _selectedThemeIndex != index) {
      _selectedThemeIndex = index;
      notifyListeners();
    }
  }

  // Scroll Progress & Back to Top
  double _scrollProgress = 0.0;
  bool _showBackToTop = false;

  double get scrollProgress => _scrollProgress;
  bool get showBackToTop => _showBackToTop;

  void _onScroll() {
    if (!scrollController.hasClients) return;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    final progress = maxScroll > 0 ? (currentScroll / maxScroll).clamp(0.0, 1.0) : 0.0;
    final show = currentScroll > 280;

    if (progress != _scrollProgress || show != _showBackToTop) {
      _scrollProgress = progress;
      _showBackToTop = show;
      notifyListeners();
    }
  }

  void scrollToTop() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  // Section Keys for smooth scrolling
  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  // Project Category Filter & Search
  String _selectedCategory = "all";
  String get selectedCategory => _selectedCategory;

  String _searchQuery = "";
  String get searchQuery => _searchQuery;

  List<ProjectModel> get filteredProjects {
    return PortfolioData.projects.where((p) {
      final matchesCategory = _selectedCategory == "all" || p.category == _selectedCategory;
      if (!matchesCategory) return false;

      if (_searchQuery.trim().isEmpty) return true;

      final q = _searchQuery.toLowerCase().trim();
      final inTitle = p.title.toLowerCase().contains(q);
      final inSubtitle = p.subtitle.toLowerCase().contains(q);
      final inDescription = p.description.toLowerCase().contains(q);
      final inTech = p.techStack.any((t) => t.toLowerCase().contains(q));
      final inFeatures = p.keyFeatures?.any((f) => f.toLowerCase().contains(q)) ?? false;

      return inTitle || inSubtitle || inDescription || inTech || inFeatures;
    }).toList();
  }

  void setCategory(String category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      notifyListeners();
    }
  }

  void setSearchQuery(String query) {
    if (_searchQuery != query) {
      _searchQuery = query;
      notifyListeners();
    }
  }

  void clearSearch() {
    if (_searchQuery.isNotEmpty) {
      _searchQuery = "";
      notifyListeners();
    }
  }

  // Smooth Scroll to Section
  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  // External URL Launching
  Future<void> launchUrlString(String url, {void Function(String)? onError}) async {
    try {
      final uri = Uri.parse(url);
      final isHttp = uri.scheme == 'http' || uri.scheme == 'https';

      bool launched = false;
      try {
        launched = await launchUrl(
          uri,
          mode: isHttp ? LaunchMode.externalApplication : LaunchMode.platformDefault,
          webOnlyWindowName: isHttp ? '_blank' : null,
        );
      } catch (_) {}

      if (!launched) {
        try {
          launched = await launchUrl(
            uri,
            mode: LaunchMode.platformDefault,
            webOnlyWindowName: isHttp ? '_blank' : null,
          );
        } catch (_) {}
      }

      if (!launched) {
        await launchUrl(uri);
      }
    } catch (e) {
      debugPrint("Error opening link $url: $e");
      onError?.call("Could not open link: $url");
    }
  }

  void openWhatsApp() => launchUrlString(PortfolioData.whatsappUrl);
  void openLinkedIn() => launchUrlString(PortfolioData.linkedinUrl);
  void openGitHub() => launchUrlString(PortfolioData.githubUrl);
  void callPrimaryPhone() => launchUrlString("tel:${PortfolioData.phonePrimary.replaceAll(' ', '')}");
  void callSecondaryPhone() => launchUrlString("tel:${PortfolioData.phoneSecondary.replaceAll(' ', '')}");

  void sendEmail() {
    launchUrlString(
      "mailto:${PortfolioData.email}",
      onError: (_) {
        launchUrlString("https://mail.google.com/mail/?view=cm&fs=1&to=${PortfolioData.email}");
      },
    );
  }

  // Clipboard Copy with feedback callback
  void copyText(String text, String label, {void Function(String)? onSuccess}) {
    Clipboard.setData(ClipboardData(text: text));
    onSuccess?.call("✓ Copied $label to clipboard!");
  }

  // Contact Form Submission
  void submitContactMessage({
    required String name,
    required String email,
    required String message,
    required void Function(String) onResult,
  }) {
    if (name.trim().isEmpty || email.trim().isEmpty || message.trim().isEmpty) {
      onResult("Please fill in all fields before sending.");
      return;
    }

    final mailto = Uri(
      scheme: 'mailto',
      path: PortfolioData.email,
      queryParameters: {
        'subject': 'Portfolio Inquiry from $name',
        'body': 'From: $name\nEmail: $email\n\n$message',
      },
    );

    launchUrlString(mailto.toString());
    onResult("Opening your mail client to send message!");
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }
}
