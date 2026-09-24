import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardSimulator extends StatefulWidget {
  final String projectId;
  final Color accentColor;

  const DashboardSimulator({
    super.key,
    required this.projectId,
    required this.accentColor,
  });

  @override
  State<DashboardSimulator> createState() => _DashboardSimulatorState();
}

class _DashboardSimulatorState extends State<DashboardSimulator> {
  // As Pujari Ji Simulator State
  int _totalPooja = 148;
  int _pendingPooja = 12;
  int _confirmedPooja = 133;
  double _totalEarnings = 342850.0;
  double _availablePayout = 22850.0;
  String _statusMessage = "";
  Color _statusColor = const Color(0xFF10B981);

  final List<Map<String, dynamic>> _requests = [
    {
      "id": 1,
      "pooja": "Satyanarayan Katha",
      "devotee": "Sharma Ji",
      "location": "Gomti Nagar, Lucknow",
      "time": "28 Sep, 10:00 AM",
      "amount": 2100.0,
      "mode": "Offline Home Pooja",
    },
    {
      "id": 2,
      "pooja": "Rudrabhishek & Havan",
      "devotee": "Verma Ji",
      "location": "Aliganj, Lucknow",
      "time": "01 Oct, 08:30 AM",
      "amount": 3500.0,
      "mode": "Offline Pooja",
    },
    {
      "id": 3,
      "pooja": "Navagraha Shanti",
      "devotee": "Mishra Ji",
      "location": "Online Video Call (Agora)",
      "time": "Today, 06:00 PM",
      "amount": 1500.0,
      "mode": "Online Video RTC",
    },
  ];

  // Pujari Ji Devotee Booking State
  String _bookingMode = "Offline";
  String _selectedCeremony = "Satyanarayan Katha";
  double _baseCeremonyPrice = 2100.0;
  bool _includeSamagri = true;
  bool _isBookingConfirmed = false;

  void _acceptRequest(int index) {
    final item = _requests[index];
    setState(() {
      _confirmedPooja++;
      _pendingPooja--;
      _totalPooja++;
      _totalEarnings += item['amount'];
      _availablePayout += item['amount'];
      _statusMessage =
          "✓ Accepted ${item['pooja']} from ${item['devotee']}! Added to your schedule & earnings.";
      _statusColor = const Color(0xFF10B981);
      _requests.removeAt(index);
    });
  }

  void _declineRequest(int index) {
    final item = _requests[index];
    setState(() {
      _statusMessage = "✕ Declined ${item['pooja']} request.";
      _statusColor = const Color(0xFFEF4444);
      _requests.removeAt(index);
    });
  }

  void _simulatePayout() {
    if (_availablePayout <= 0) {
      setState(() {
        _statusMessage = "No balance available for withdrawal right now.";
        _statusColor = const Color(0xFFF59E0B);
      });
      return;
    }
    final withdrawn = _availablePayout;
    setState(() {
      _availablePayout = 0.0;
      _statusMessage =
          "✓ ₹${withdrawn.toStringAsFixed(0)} IMPS payout initiated to verified bank account (A/C **4581)!";
      _statusColor = const Color(0xFF10B981);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isAsPujari = widget.projectId == "as-pujari-ji";

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: widget.accentColor.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Simulator Header Bar
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: widget.accentColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("⚡", style: TextStyle(fontSize: 13)),
                    const SizedBox(width: 6),
                    Text(
                      isAsPujari
                          ? "LIVE PRIEST DASHBOARD SIMULATOR"
                          : "LIVE DEVOTEE BOOKING SIMULATOR",
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.8,
                        color: widget.accentColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        color: Color(0xFF10B981),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Interactive",
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF10B981),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Feedback Status Banner
          if (_statusMessage.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: _statusColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: _statusColor.withValues(alpha: 0.4)),
              ),
              child: Row(
                children: [
                  Icon(
                    _statusColor == const Color(0xFF10B981)
                        ? Icons.check_circle_outline_rounded
                        : Icons.info_outline_rounded,
                    size: 16,
                    color: _statusColor,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _statusMessage,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: _statusColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          if (isAsPujari) ...[
            // PRIEST METRICS GRID
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _metricCard(
                  "Total Pooja",
                  "$_totalPooja",
                  Icons.temple_hindu_rounded,
                  const Color(0xFF00D2FF),
                  actionText: "+1 Completed",
                  onAction: () {
                    setState(() {
                      _totalPooja++;
                      _statusMessage = "✓ Total Pooja count incremented!";
                      _statusColor = const Color(0xFF00D2FF);
                    });
                  },
                ),
                _metricCard(
                  "Pending Pooja",
                  "$_pendingPooja",
                  Icons.schedule_rounded,
                  const Color(0xFFF59E0B),
                ),
                _metricCard(
                  "Pooja Requests",
                  "${_requests.length}",
                  Icons.notification_important_rounded,
                  const Color(0xFFA855F7),
                ),
                _metricCard(
                  "Confirmed Pooja",
                  "$_confirmedPooja",
                  Icons.verified_rounded,
                  const Color(0xFF10B981),
                ),
                _metricCard(
                  "Total Money",
                  "₹${_totalEarnings.toStringAsFixed(0)}",
                  Icons.account_balance_wallet_rounded,
                  const Color(0xFF10B981),
                  subtitle: "Avail: ₹${_availablePayout.toStringAsFixed(0)}",
                  actionText: "Withdraw",
                  onAction: _simulatePayout,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // INCOMING DEVOTEE REQUESTS
            Text(
              "Pending Pooja Requests (Click Accept/Decline)",
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            if (_requests.isEmpty)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "All pending requests handled! Great job Pujari Ji 🙏",
                    style: GoogleFonts.inter(fontSize: 12, color: Colors.white70),
                  ),
                ),
              )
            else
              ..._requests.asMap().entries.map((entry) {
                final idx = entry.key;
                final r = entry.value;

                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: widget.accentColor.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          r['mode'].contains("Online")
                              ? Icons.videocam_rounded
                              : Icons.temple_hindu_rounded,
                          size: 18,
                          color: widget.accentColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${r['pooja']} (${r['devotee']})",
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${r['time']} • ${r['location']} • ₹${r['amount'].toStringAsFixed(0)}",
                              style: GoogleFonts.inter(
                                fontSize: 11.5,
                                color: const Color(0xFF94A3B8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        tooltip: "Accept Request",
                        icon: const Icon(
                          Icons.check_circle_rounded,
                          color: Color(0xFF10B981),
                          size: 26,
                        ),
                        onPressed: () => _acceptRequest(idx),
                      ),
                      IconButton(
                        tooltip: "Decline Request",
                        icon: const Icon(
                          Icons.cancel_rounded,
                          color: Color(0xFFEF4444),
                          size: 26,
                        ),
                        onPressed: () => _declineRequest(idx),
                      ),
                    ],
                  ),
                );
              }),
          ] else ...[
            // PUJARI JI DEVOTEE SIMULATOR
            Text(
              "Select Ritual Mode & Ceremony",
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _modeButton(
                  "Offline (Doorstep)",
                  Icons.home_work_rounded,
                  _bookingMode == "Offline",
                  () => setState(() => _bookingMode = "Offline"),
                ),
                const SizedBox(width: 10),
                _modeButton(
                  "Online Video (Agora)",
                  Icons.videocam_rounded,
                  _bookingMode == "Online",
                  () => setState(() => _bookingMode = "Online"),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Ceremony Selector Chips
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _ceremonyChip("Satyanarayan Katha", 2100.0),
                _ceremonyChip("Rudrabhishek & Havan", 3100.0),
                _ceremonyChip("Griha Pravesh Pooja", 5100.0),
                _ceremonyChip("Kathavachak Discourse", 7500.0),
              ],
            ),
            const SizedBox(height: 12),

            // Samagri Kit Checkbox
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              activeColor: widget.accentColor,
              title: Text(
                "Include Complete Pure Samagri Kit (+₹450, Free Delivery)",
                style: GoogleFonts.inter(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
              ),
              subtitle: Text(
                "41 items • Haridwar Gangajal, Havan Kund, Incense & A2 Ghee",
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: const Color(0xFF94A3B8),
                ),
              ),
              value: _includeSamagri,
              onChanged: (val) => setState(() => _includeSamagri = val ?? true),
            ),
            const Divider(color: Colors.white12),

            // Panchang Muhurat Note
            Row(
              children: [
                const Icon(Icons.wb_sunny_rounded, size: 16, color: Color(0xFFF59E0B)),
                const SizedBox(width: 6),
                Text(
                  "Next Shubh Muhurat: Today Abhijit Muhurat (11:45 AM)",
                  style: GoogleFonts.inter(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFF59E0B),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Total Price & Book Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Estimated Dakshina",
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                    Text(
                      "₹${(_baseCeremonyPrice + (_includeSamagri ? 450 : 0)).toStringAsFixed(0)}",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: widget.accentColor,
                      ),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _isBookingConfirmed = true;
                      _statusMessage =
                          "✓ Booking confirmed for $_selectedCeremony ($_bookingMode)! Verified Pandit Ji assigned with live tracking.";
                      _statusColor = const Color(0xFF10B981);
                    });
                  },
                  icon: const Icon(Icons.check_circle_outline, size: 18),
                  label: Text(
                    _isBookingConfirmed ? "Book Again" : "Simulate Booking",
                    style: GoogleFonts.inter(fontWeight: FontWeight.w700),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.accentColor,
                    foregroundColor: const Color(0xFF0F172A),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _modeButton(String title, IconData icon, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? widget.accentColor.withValues(alpha: 0.18)
                : const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? widget.accentColor : Colors.white12,
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: isSelected ? widget.accentColor : Colors.white60,
              ),
              const SizedBox(width: 6),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ceremonyChip(String name, double price) {
    final isSelected = _selectedCeremony == name;

    return ChoiceChip(
      label: Text("$name (₹${price.toStringAsFixed(0)})"),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedCeremony = name;
            _baseCeremonyPrice = price;
          });
        }
      },
      selectedColor: widget.accentColor.withValues(alpha: 0.25),
      backgroundColor: const Color(0xFF1E293B),
      labelStyle: GoogleFonts.inter(
        fontSize: 11.5,
        fontWeight: FontWeight.w600,
        color: isSelected ? widget.accentColor : Colors.white70,
      ),
      side: BorderSide(
        color: isSelected ? widget.accentColor : Colors.white12,
      ),
    );
  }

  Widget _metricCard(
    String label,
    String value,
    IconData icon,
    Color color, {
    String? subtitle,
    String? actionText,
    VoidCallback? onAction,
  }) {
    return Container(
      width: 145,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: 18, color: color),
              if (actionText != null && onAction != null)
                InkWell(
                  onTap: onAction,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      actionText,
                      style: GoogleFonts.inter(
                        fontSize: 9.5,
                        fontWeight: FontWeight.w700,
                        color: color,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF94A3B8),
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 3),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: 10,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
