import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/portfolio_data.dart';
import '../widgets/glass_card.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/section_header.dart';

class ContactSection extends StatefulWidget {
  final PortfolioController controller;

  const ContactSection({super.key, required this.controller});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _showSnackbar(String msg, {bool isSuccess = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
        backgroundColor: isSuccess ? const Color(0xFF10B981) : const Color(0xFFEF4444),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _onSubmit() {
    widget.controller.submitContactMessage(
      name: _nameController.text,
      email: _emailController.text,
      message: _messageController.text,
      onResult: (msg) {
        final isSuccess = msg.contains("Opening");
        _showSnackbar(msg, isSuccess: isSuccess);
        if (isSuccess) {
          _nameController.clear();
          _emailController.clear();
          _messageController.clear();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      key: widget.controller.contactKey,
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: isMobile ? 32 : 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const SectionHeader(
                badge: "Get In Touch",
                title: "Let's Build Something Exceptional",
                subtitle:
                    "Have a mobile app idea or looking for a Senior Flutter Developer for your team? Let's connect!",
              ),
              const SizedBox(height: 36),
              isMobile
                  ? Column(
                      children: [
                        _buildContactInfoCards(),
                        const SizedBox(height: 24),
                        _buildContactForm(),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 5, child: _buildContactInfoCards()),
                        const SizedBox(width: 32),
                        Expanded(flex: 5, child: _buildContactForm()),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfoCards() {
    return Column(
      children: [
        _contactCard(
          icon: "✉️",
          title: "Email Address",
          value: PortfolioData.email,
          onCopy: () => widget.controller.copyText(
            PortfolioData.email,
            "Email",
            onSuccess: (msg) => _showSnackbar(msg),
          ),
          onTap: () => widget.controller.sendEmail(),
        ),
        const SizedBox(height: 14),
        _contactCard(
          icon: "📞",
          title: "Primary Phone & WhatsApp",
          value: PortfolioData.phonePrimary,
          onCopy: () => widget.controller.copyText(
            PortfolioData.phonePrimary,
            "Phone",
            onSuccess: (msg) => _showSnackbar(msg),
          ),
          onTap: () => widget.controller.callPrimaryPhone(),
        ),
        const SizedBox(height: 14),
        _contactCard(
          icon: "📱",
          title: "Alternative Contact",
          value: PortfolioData.phoneSecondary,
          onCopy: () => widget.controller.copyText(
            PortfolioData.phoneSecondary,
            "Phone",
            onSuccess: (msg) => _showSnackbar(msg),
          ),
          onTap: () => widget.controller.callSecondaryPhone(),
        ),
        const SizedBox(height: 18),

        // Direct Action Buttons
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => widget.controller.openWhatsApp(),
                icon: const Text("💬"),
                label: const Text("WhatsApp"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF25D366),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => widget.controller.openLinkedIn(),
                icon: const Icon(Icons.work_rounded, size: 16),
                label: const Text("LinkedIn"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFF0077B5)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => widget.controller.openGitHub(),
                icon: const Icon(Icons.code_rounded, size: 16),
                label: const Text("GitHub"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _contactCard({
    required String icon,
    required String title,
    required String value,
    required VoidCallback onCopy,
    required VoidCallback onTap,
  }) {
    return GlassCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 22)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xFF94A3B8),
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.copy_rounded, size: 18, color: Color(0xFF00D2FF)),
            onPressed: onCopy,
            tooltip: "Copy",
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return GlassCard(
      padding: const EdgeInsets.all(26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Send a Direct Message",
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 18),
          _inputField("Your Name", _nameController, "Enter your full name"),
          const SizedBox(height: 14),
          _inputField("Your Email", _emailController, "name@example.com"),
          const SizedBox(height: 14),
          _inputField(
            "Project Details / Message",
            _messageController,
            "Tell me about your app idea or timeline...",
            maxLines: 4,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _onSubmit,
              icon: const Icon(Icons.send_rounded, size: 18),
              label: const Text("Send Message"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00D2FF),
                foregroundColor: const Color(0xFF050B14),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                textStyle: GoogleFonts.inter(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputField(
    String label,
    TextEditingController controller,
    String hint, {
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF94A3B8),
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: GoogleFonts.inter(fontSize: 14, color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              fontSize: 13,
              color: const Color(0xFF64748B),
            ),
            filled: true,
            fillColor: const Color(0xFF0A0F1D).withValues(alpha: 0.6),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFF00D2FF),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
