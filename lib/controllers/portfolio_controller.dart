import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
import '../models/portfolio_model.dart';

class PortfolioController extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  // Section Keys for smooth scrolling
  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  // Project Category Filter
  String _selectedCategory = "all";
  String get selectedCategory => _selectedCategory;

  List<ProjectModel> get filteredProjects {
    if (_selectedCategory == "all") {
      return PortfolioData.projects;
    }
    return PortfolioData.projects
        .where((p) => p.category == _selectedCategory)
        .toList();
  }

  void setCategory(String category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
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
    final uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        onError?.call("Could not open link: $url");
      }
    } catch (e) {
      onError?.call("Error opening link: $e");
    }
  }

  void openWhatsApp() => launchUrlString(PortfolioData.whatsappUrl);
  void openLinkedIn() => launchUrlString(PortfolioData.linkedinUrl);
  void openGitHub() => launchUrlString(PortfolioData.githubUrl);
  void callPrimaryPhone() => launchUrlString("tel:${PortfolioData.phonePrimary}");
  void callSecondaryPhone() => launchUrlString("tel:${PortfolioData.phoneSecondary}");
  void sendEmail() => launchUrlString("mailto:${PortfolioData.email}");

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
    scrollController.dispose();
    super.dispose();
  }
}
