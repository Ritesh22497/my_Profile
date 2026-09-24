import 'package:flutter/material.dart';
import 'portfolio_model.dart';

class PortfolioData {
  static const String name = "Ritesh Sharma";
  static const String title = "Senior Flutter Developer";
  static const String experienceYears = "3+";
  static const String location = "Lucknow, Uttar Pradesh, India";
  static const String phonePrimary = "+91 6387971226";
  static const String phoneSecondary = "+91 9889885431";
  static const String email = "riteshthakur22497@gmail.com";
  static const String linkedinUrl = "https://www.linkedin.com/in/ritesh-sharma-flutter/";
  static const String githubUrl = "https://github.com/Ritesh22497";
  static const String whatsappUrl = "https://wa.me/916387971226?text=Hi%20Ritesh,%20saw%20your%20Flutter%20portfolio!";

  static const String summary =
      "Flutter Developer with 3+ years of professional experience building production-ready cross-platform mobile applications. "
      "Hands-on experience with Flutter, Dart, Provider/Riverpod, REST APIs, Firebase, SQLite, JWT authentication, Razorpay, Agora SDK, "
      "Google Maps, push notifications, and Git/GitHub. Delivered 10+ production applications across spiritual services, HRMS, real estate, "
      "e-commerce, branding, and recruitment domains. Strong in responsive UI development, API integration, state management, "
      "local/offline data, third-party SDK integration, debugging, performance optimization, and Agile delivery.";

  static const List<SkillCategoryModel> skillCategories = [
    SkillCategoryModel(
      title: "Core Development",
      icon: "📱",
      skills: [
        "Flutter SDK",
        "Dart Language",
        "Cross-Platform (iOS & Android)",
        "Responsive UI",
        "Custom Widgets",
        "Material 3 & Cupertino",
      ],
    ),
    SkillCategoryModel(
      title: "Architecture & State",
      icon: "🏗️",
      skills: [
        "Riverpod",
        "Provider",
        "ChangeNotifier",
        "MVVM Architecture",
        "MVC Architecture",
        "Reusable Components",
      ],
    ),
    SkillCategoryModel(
      title: "Backend & APIs",
      icon: "☁️",
      skills: [
        "REST APIs",
        "JSON Serialization",
        "Firebase Authentication",
        "Cloud Firestore",
        "JWT Authentication",
        "Cloud Messaging (FCM)",
      ],
    ),
    SkillCategoryModel(
      title: "Database & Storage",
      icon: "🗄️",
      skills: [
        "SQLite (sqflite)",
        "Local Storage",
        "Offline-First Architecture",
        "Data Caching",
        "ACID Transactions",
      ],
    ),
    SkillCategoryModel(
      title: "SDKs & Integrations",
      icon: "🔌",
      skills: [
        "Agora SDK (Audio/Video)",
        "Razorpay Payments",
        "Google Maps API",
        "Geolocation & Geofencing",
        "Push Notifications",
        "Video Player & Streaming",
      ],
    ),
    SkillCategoryModel(
      title: "Tools & Engineering",
      icon: "🛠️",
      skills: [
        "Git & GitHub",
        "Agile / Scrum Delivery",
        "CustomPainter 2D Canvas",
        "DevTools Profiling",
        "Performance Optimization",
        "HTML5 / CSS3",
      ],
    ),
  ];

  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      company: "Weblord Infotech",
      role: "Flutter Developer",
      period: "22 Jan 2024 – Present",
      points: [
        "Develop and maintain cross-platform Flutter applications using Dart and Provider-based state management for active production releases.",
        "Integrate REST APIs and Firebase services for authentication, real-time data, application workflows, notifications, and cloud-backed features.",
        "Implement Razorpay payment workflows and third-party SDK integrations while handling API states, errors, loading states, and production debugging.",
        "Build reusable and responsive UI components and collaborate with team members on feature delivery, issue resolution, and release readiness.",
        "Mentor junior developers and contribute to code reviews, debugging, and maintaining development quality.",
      ],
    ),
    ExperienceModel(
      company: "Hindtech IT Solution",
      role: "Flutter Developer",
      period: "22 Mar 2023 – 22 Jan 2024",
      points: [
        "Developed 5+ production Flutter applications using Dart, SQLite, REST APIs, and local storage.",
        "Implemented offline functionality and local data handling to improve usability when network connectivity was limited.",
        "Optimized application performance, contributing to an approximately 30% improvement according to project experience.",
        "Participated in Agile sprints covering feature development, bug fixing, testing, integration, and production issue resolution.",
      ],
    ),
    ExperienceModel(
      company: "Papaya Coders Pvt. Ltd.",
      role: "Junior Flutter Developer",
      period: "Earlier Career Experience",
      points: [
        "Assisted in Flutter application development, UI implementation, feature development, debugging, and learning production mobile development practices.",
      ],
    ),
  ];

  static const List<ProjectModel> projects = [
    ProjectModel(
      id: "eminent-news",
      title: "Eminent News (TEN)",
      category: "production",
      badge: "News & Media",
      icon: "📰",
      subtitle: "News & Current Affairs Platform",
      description:
          "Production-ready news application with dynamic feeds, short-form video reels, community polls, multilingual localization, and Razorpay subscriptions.",
      techStack: [
        "Flutter",
        "Dart",
        "Provider",
        "REST APIs",
        "Firebase FCM",
        "Razorpay",
        "Video Player",
        "Localization"
      ],
      keyFeatures: [
        "Breaking News Feed with Category Filters & Bookmarks",
        "Short-Form News Video Reels with Smooth Swiping",
        "Interactive Community Polls & Real-time Public Opinion",
        "Multilingual Regional Support (Hindi, English, etc.)",
        "Real-Time FCM Push Notifications for Urgent Headlines",
        "Razorpay Premium Subscription & Ad-free Reading Mode",
        "Offline Article Reading & Audio News Narration"
      ],
      highlights: [
        "Integrated short-form videos and full-length video streaming with caching.",
        "Architected state management using Provider and ChangeNotifier.",
        "Firebase Cloud Messaging (FCM) integration for real-time breaking news alerts.",
        "Razorpay payment gateway workflows for premium reading subscriptions.",
        "Responsive reusable UI components with seamless Dark/Light Mode support.",
      ],
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.theeminentnews.app",
      screenMockups: [
        AppScreenMockup(
          title: "Breaking News & Live Headlines",
          subtitle: "Curated Feeds with Category Pills & Instant Alerts",
          icon: Icons.newspaper_rounded,
          themeColor: Color(0xFFEF4444),
          cards: [
            MockupCardData(
              title: "Global Tech Summit 2026 Keynote",
              subtitle: "AI Breakthroughs announced today in generative robotics",
              badge: "TOP STORY",
              icon: Icons.flash_on_rounded,
              iconColor: Color(0xFFEF4444),
              actionText: "Read Article • 3 min",
            ),
            MockupCardData(
              title: "Economy & Markets Weekly Wrap",
              subtitle: "Stock indices reach all-time high amidst tech boom",
              badge: "MARKETS",
              icon: Icons.trending_up_rounded,
              iconColor: Color(0xFF10B981),
              actionText: "Bookmark",
            ),
          ],
        ),
        AppScreenMockup(
          title: "Shorts & Video News Reels",
          subtitle: "Vertical 60-Second Video Bites with Audio Controls",
          icon: Icons.play_circle_fill_rounded,
          themeColor: Color(0xFF8B5CF6),
          cards: [
            MockupCardData(
              title: "60-Second Explainer: Space Exploration",
              subtitle: "New lunar habitat base missions detailed by NASA",
              badge: "VIDEO REEL",
              icon: Icons.movie_filter_rounded,
              iconColor: Color(0xFF8B5CF6),
              actionText: "Watch Reel",
            ),
            MockupCardData(
              title: "Community Poll: Clean Energy Transition",
              subtitle: "Vote now • Over 12,450 opinions registered today",
              badge: "LIVE POLL",
              icon: Icons.how_to_vote_rounded,
              iconColor: Color(0xFF00D2FF),
              actionText: "Cast Vote",
            ),
          ],
        ),
      ],
    ),
    ProjectModel(
      id: "pujari-ji",
      title: "Pujari Ji",
      category: "media",
      badge: "Spiritual Tech",
      icon: "🕉️",
      subtitle: "Spiritual Services, Pooja Booking, Astrology & Panchang",
      description:
          "Comprehensive spiritual tech platform connecting devotees with verified pandits. Features online/offline Pooja bookings, Kathavachak bookings for discourses, event poojas, Kundali analysis, temple services, upcoming pooja tracking, authentic pooja samagri e-commerce, and live Hindu Panchang.",
      techStack: [
        "Flutter",
        "Dart",
        "Firebase & Firestore",
        "Razorpay",
        "Agora RTC SDK",
        "Riverpod",
        "Google Maps API",
        "Panchang API",
        "Cloud Messaging (FCM)"
      ],
      keyFeatures: [
        "Offline Pooja Booking (Home & Venue with Pandit Ji)",
        "Online Pooja Booking (Live Video Rituals via Agora)",
        "Kathavachak Booking (Bhagwat, Ram Katha & Pravachan)",
        "Event Pooja Booking (Weddings, Griha Pravesh, Yagyas)",
        "Kundali & Astrology (Matching, Horoscope & Dosha Analysis)",
        "Upcoming Pooja Tracker (Live Schedules & Timely Reminders)",
        "Temple Services (Darshan Booking, Archana & Prasad Seva)",
        "Pooja Material / Samagri (E-Commerce Store & Doorstep Delivery)",
        "Daily Panchang (Tithi, Shubh Muhurat, Rahukaal & Choghadiya)"
      ],
      highlights: [
        "Engineered multi-mode booking system supporting Offline Poojas, Online Video Poojas, Event Poojas, and specialized Kathavachaks.",
        "Built interactive Daily Panchang module displaying Tithi, Shubh Muhurat, Nakshatra, and Choghadiya calculations.",
        "Integrated Kundali matching, astrological chart generation, and live consultation with verified astrologers.",
        "Developed Upcoming Pooja dashboard enabling devotees to track scheduled rituals, view muhurat timings, and receive FCM push alerts.",
        "Integrated Temple Services module offering virtual darshan booking, special archana, and holy prasad delivery.",
        "Implemented E-Commerce store for authentic Pooja Samagri kits with seamless Razorpay payment gateway checkout.",
        "Real-time 1-on-1 audio/video consultations and remote pooja ceremonies powered by Agora RTC SDK.",
      ],
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.app.pujari_ji",
      screenMockups: [
        AppScreenMockup(
          title: "Devotee Home & Pooja Booking",
          subtitle: "Offline & Online Ritual Booking with Verified Pandits",
          icon: Icons.temple_hindu_rounded,
          themeColor: Color(0xFFFF9933),
          cards: [
            MockupCardData(
              title: "Online Video Pooja (Agora RTC)",
              subtitle: "Live 1-on-1 Sankalp & Rudrabhishek ceremony",
              badge: "LIVE STREAM",
              icon: Icons.video_call_rounded,
              iconColor: Color(0xFF00D2FF),
              actionText: "Book Now (₹1,501)",
            ),
            MockupCardData(
              title: "Offline Home Pooja (Lucknow)",
              subtitle: "Pandit Ji at your doorstep with verified credentials",
              badge: "DOORSTEP",
              icon: Icons.home_work_rounded,
              iconColor: Color(0xFFFF9933),
              actionText: "Select Muhurat",
            ),
            MockupCardData(
              title: "Kathavachak Booking",
              subtitle: "Shrimad Bhagwat & Ram Katha by revered Acharyas",
              badge: "DISCOURSE",
              icon: Icons.record_voice_over_rounded,
              iconColor: Color(0xFFA855F7),
              actionText: "Check Slots",
            ),
          ],
        ),
        AppScreenMockup(
          title: "Daily Hindu Panchang & Muhurat",
          subtitle: "Live Tithi, Shubh Muhurat, Nakshatra & Rahukaal",
          icon: Icons.wb_sunny_rounded,
          themeColor: Color(0xFFF59E0B),
          cards: [
            MockupCardData(
              title: "Today's Tithi & Nakshatra",
              subtitle: "Shukla Paksha Dashami • Rohini Nakshatra",
              badge: "AUSPICIOUS",
              icon: Icons.auto_awesome_rounded,
              iconColor: Color(0xFFF59E0B),
            ),
            MockupCardData(
              title: "Abhijit Shubh Muhurat",
              subtitle: "11:45 AM - 12:35 PM (Best for New Beginnings)",
              badge: "RECOMMENDED",
              icon: Icons.access_time_filled_rounded,
              iconColor: Color(0xFF10B981),
            ),
            MockupCardData(
              title: "Rahukaal Alert",
              subtitle: "03:15 PM - 04:45 PM (Avoid starting new tasks)",
              badge: "INASPICIOUS",
              icon: Icons.warning_amber_rounded,
              iconColor: Color(0xFFEF4444),
            ),
          ],
        ),
        AppScreenMockup(
          title: "Pooja Samagri E-Commerce Store",
          subtitle: "Pure Ritual Kits & Sacred Offerings Delivered",
          icon: Icons.shopping_bag_rounded,
          themeColor: Color(0xFF10B981),
          cards: [
            MockupCardData(
              title: "Complete Havan Samagri Kit",
              subtitle: "41 Pure Ingredients, Dry Coconut & Havan Kund",
              badge: "BESTSELLER",
              icon: Icons.local_fire_department_rounded,
              iconColor: Color(0xFFF97316),
              actionText: "Add to Cart (₹599)",
            ),
            MockupCardData(
              title: "Gangajal & Cow Ghee (A2)",
              subtitle: "Sourced from Haridwar • 100% Certified Pure",
              badge: "CERTIFIED",
              icon: Icons.water_drop_rounded,
              iconColor: Color(0xFF00D2FF),
              actionText: "Add to Cart (₹249)",
            ),
          ],
        ),
      ],
    ),
    ProjectModel(
      id: "day-2-day-post",
      title: "Day 2 Day Post",
      category: "tools",
      badge: "Branding Tool",
      icon: "🎨",
      subtitle: "Business Branding & Poster Maker",
      description:
          "Creative design application for generating business posters and marketing materials with 500+ templates and CustomPainter editing canvas.",
      techStack: [
        "Flutter",
        "CustomPainter",
        "Image Processing",
        "Canvas 2D",
        "UI/UX",
        "Social Sharing"
      ],
      highlights: [
        "Custom multi-layer graphic editor using low-level CustomPainter engine.",
        "Real-time drag-and-drop, gesture resizing, filters, and text effects.",
        "Optimized 60 FPS canvas rendering without frame drops.",
        "500+ pre-built festival, branding, and promotional vector templates.",
        "High-definition bitmap export and direct social media sharing.",
      ],
    ),
    ProjectModel(
      id: "as-pujari-ji",
      title: "As Pujari Ji",
      category: "enterprise",
      badge: "B2B Vendor Portal",
      icon: "🤝",
      subtitle: "Priest & Astrologer Vendor Management Portal",
      description:
          "Dedicated B2B vendor management application empowering priests, kathavachaks, and astrologers to manage bookings and earnings. Features a real-time Priest Dashboard with Total Pooja, Pending Pooja, Pending Pooja Requests, Confirmed Pooja, and Total Money/Earnings metrics.",
      techStack: [
        "Flutter",
        "Dart",
        "Provider & Riverpod",
        "Firebase Auth",
        "Cloud Firestore",
        "Cloud Messaging (FCM)",
        "Agora RTC SDK",
        "REST APIs"
      ],
      keyFeatures: [
        "Total Pooja Counter (Lifetime completed & executed ceremonies)",
        "Pending Pooja Tracker (In-progress & scheduled poojas)",
        "Pending Pooja Requests (Real-time incoming devotee leads with Accept/Reject)",
        "Confirmed Pooja List (Verified bookings & ceremony details)",
        "Total Money / Earnings (Revenue dashboard, payouts & transaction records)",
        "Live Availability & Muhurat Slot Calendar",
        "Online Pooja Live Conducting Interface (Agora SDK)",
        "Service Rate Card & Travel Distance Radius Settings"
      ],
      highlights: [
        "Architected real-time Priest Dashboard showcasing Total Pooja, Pending Pooja, Pending Pooja Requests, Confirmed Pooja, and Total Money / Earnings.",
        "Engineered instant FCM push notifications alerting priests whenever a devotee books an offline/online pooja or kathavachak session.",
        "Built one-tap Accept/Reject workflow for incoming Pending Pooja Requests with real-time Firestore synchronization.",
        "Designed detailed Earnings & Revenue dashboard showing total earnings, payout history, and bank transfer records.",
        "Implemented dynamic Priest Calendar to manage available dates, auspicious muhurats, and travel service radius.",
        "Integrated Agora video room initialization allowing priests to host and conduct live online poojas directly within the app.",
      ],
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.app.aspujariji",
      screenMockups: [
        AppScreenMockup(
          title: "Priest Real-Time Dashboard",
          subtitle: "Business Overview, Active Bookings & Revenue",
          icon: Icons.dashboard_rounded,
          themeColor: Color(0xFF00D2FF),
          cards: [
            MockupCardData(
              title: "Total Pooja: 148",
              subtitle: "133 Completed • 12 In-Progress • 3 Pending Leads",
              badge: "OVERVIEW",
              icon: Icons.event_available_rounded,
              iconColor: Color(0xFF00D2FF),
            ),
            MockupCardData(
              title: "Total Revenue: ₹3,42,850",
              subtitle: "Withdrawn: ₹3,20,000 • Available Balance: ₹22,850",
              badge: "FINANCES",
              icon: Icons.account_balance_wallet_rounded,
              iconColor: Color(0xFF10B981),
              actionText: "Withdraw",
            ),
          ],
        ),
        AppScreenMockup(
          title: "Pending Pooja Requests",
          subtitle: "Review Incoming Devotee Bookings with 1-Tap Action",
          icon: Icons.notification_important_rounded,
          themeColor: Color(0xFFA855F7),
          cards: [
            MockupCardData(
              title: "Satyanarayan Katha (Sharma Ji)",
              subtitle: "28 Sep, 10:00 AM • Gomti Nagar, Lucknow • ₹2,100",
              badge: "NEW REQUEST",
              icon: Icons.person_pin_circle_rounded,
              iconColor: Color(0xFFA855F7),
              actionText: "Accept / Decline",
            ),
            MockupCardData(
              title: "Griha Pravesh Pooja (Verma Ji)",
              subtitle: "02 Oct, 07:30 AM • Aliganj, Lucknow • ₹5,100",
              badge: "HIGH VALUE",
              icon: Icons.home_rounded,
              iconColor: Color(0xFFFF9933),
              actionText: "Accept / Decline",
            ),
          ],
        ),
        AppScreenMockup(
          title: "Live Online Pooja Conducting Room",
          subtitle: "Agora RTC Video Room with Audio/Video Controls",
          icon: Icons.videocam_rounded,
          themeColor: Color(0xFF10B981),
          cards: [
            MockupCardData(
              title: "Live Ritual Streaming",
              subtitle: "Full HD Video, Echo Cancellation, Devotee Cam",
              badge: "RTC ACTIVE",
              icon: Icons.camera_front_rounded,
              iconColor: Color(0xFF10B981),
              actionText: "Start Session",
            ),
            MockupCardData(
              title: "Mantra & Shloka Teleprompter",
              subtitle: "On-screen Vedic verses for accurate recitations",
              badge: "TOOLKIT",
              icon: Icons.menu_book_rounded,
              iconColor: Color(0xFFF59E0B),
            ),
          ],
        ),
      ],
    ),
    ProjectModel(
      id: "hrms",
      title: "HRMS Enterprise Suite",
      category: "enterprise",
      badge: "Enterprise HRMS",
      icon: "🏢",
      subtitle: "Human Resource Management System",
      description:
          "Enterprise HR automation application featuring biometric attendance with GPS geofencing, punch-in/out tracking, automated payroll, and JWT security.",
      techStack: [
        "Flutter",
        "JWT Authentication",
        "Payroll Logic",
        "Geolocation",
        "Biometrics",
        "Local DB"
      ],
      highlights: [
        "Biometric authentication with GPS geofencing perimeter verification.",
        "Punch-in and punch-out tracking with shift and leave management.",
        "Automated payroll processing logic and role-based access control.",
      ],
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.payroll_project.rashmi_hrms",
      screenMockups: [
        AppScreenMockup(
          title: "Biometric & Geofence Punch",
          subtitle: "GPS Geofenced Punch-in with Biometric Validation",
          icon: Icons.fingerprint_rounded,
          themeColor: Color(0xFF00D2FF),
          cards: [
            MockupCardData(
              title: "Office Geofence: In Perimeter",
              subtitle: "Verified inside Lucknow HQ (Radius 50m)",
              badge: "GPS VERIFIED",
              icon: Icons.location_on_rounded,
              iconColor: Color(0xFF10B981),
              actionText: "Punch Out",
            ),
            MockupCardData(
              title: "Shift Timer: 06h 42m elapsed",
              subtitle: "Shift 09:30 AM - 06:30 PM • 98.4% Punctuality",
              badge: "ON TRACK",
              icon: Icons.timer_rounded,
              iconColor: Color(0xFF00D2FF),
            ),
          ],
        ),
        AppScreenMockup(
          title: "Payroll & Salary Slips",
          subtitle: "Automated Salary Computation with PDF Download",
          icon: Icons.payments_rounded,
          themeColor: Color(0xFF10B981),
          cards: [
            MockupCardData(
              title: "Monthly Salary Slip",
              subtitle: "Net Payable: Computed with PF, Tax & Allowances",
              badge: "CONFIRMED",
              icon: Icons.receipt_long_rounded,
              iconColor: Color(0xFF10B981),
              actionText: "Download PDF",
            ),
          ],
        ),
      ],
    ),
    ProjectModel(
      id: "housing-magic-cp",
      title: "Housing Magic CP",
      category: "production",
      badge: "Real Estate",
      icon: "🏡",
      subtitle: "Real Estate Marketplace",
      description:
          "Real-estate marketplace connecting buyers, sellers, and renters with property discovery, Google Maps integration, and interactive microsites.",
      techStack: [
        "Flutter",
        "Real Estate API",
        "Google Maps Integration",
        "Lead Management"
      ],
      highlights: [
        "Interactive property discovery with advanced spatial filters.",
        "Google Maps integration with custom pins and microsites.",
        "Personalized lead management for channel partners.",
      ],
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.housingmagic.cp",
      screenMockups: [
        AppScreenMockup(
          title: "Property Discovery & Map Pins",
          subtitle: "Explore Real Estate with Spatial Filters & Microsites",
          icon: Icons.map_rounded,
          themeColor: Color(0xFF10B981),
          cards: [
            MockupCardData(
              title: "Luxury 3BHK Greens Apartment",
              subtitle: "₹85 Lakhs • Gomti Nagar Extension • Ready to Move",
              badge: "VERIFIED",
              icon: Icons.apartment_rounded,
              iconColor: Color(0xFF10B981),
              actionText: "Book Visit",
            ),
            MockupCardData(
              title: "Channel Partner Lead Pipeline",
              subtitle: "24 Active Buyer Leads • 5 Visits Scheduled this week",
              badge: "HIGH CONV",
              icon: Icons.people_alt_rounded,
              iconColor: Color(0xFF00D2FF),
            ),
          ],
        ),
      ],
    ),
    ProjectModel(
      id: "global-job-mg",
      title: "Global Job MG",
      category: "enterprise",
      badge: "Job Portal",
      icon: "🌍",
      subtitle: "International Job & Placement Portal",
      description:
          "International recruitment platform for overseas job placement workflows, application tracking, mobile resume-builder, and interview scheduling.",
      techStack: [
        "Flutter",
        "REST API",
        "Job Management System",
        "PDF Generator"
      ],
      highlights: [
        "Interactive mobile resume-builder with PDF generation.",
        "End-to-end overseas job application tracking and candidate profiling.",
        "Interview slot scheduling and status notifications.",
      ],
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.mgheewala_job_portal",
      screenMockups: [
        AppScreenMockup(
          title: "Overseas Recruitment & Applications",
          subtitle: "International Job Listings & Candidate Tracking",
          icon: Icons.public_rounded,
          themeColor: Color(0xFFA855F7),
          cards: [
            MockupCardData(
              title: "Senior Civil Engineer (Dubai, UAE)",
              subtitle: "Tax-free salary package • Free Visa & Accommodation",
              badge: "URGENT",
              icon: Icons.work_rounded,
              iconColor: Color(0xFFA855F7),
              actionText: "Apply Now",
            ),
            MockupCardData(
              title: "Mobile Resume Builder & PDF",
              subtitle: "ATS-optimized international format CV generator",
              badge: "ATS READY",
              icon: Icons.picture_as_pdf_rounded,
              iconColor: Color(0xFFF59E0B),
              actionText: "Generate CV",
            ),
          ],
        ),
      ],
    ),
    ProjectModel(
      id: "e-shop",
      title: "E-Shop Full E-Commerce",
      category: "ecommerce",
      badge: "E-Commerce",
      icon: "🛍️",
      subtitle: "Mobile Shopping Application",
      description:
          "Full-featured e-commerce application covering product-oriented mobile flows, persistent shopping cart, and seamless checkout.",
      techStack: ["Flutter", "REST APIs", "Local Storage", "Payment Gateway"],
      highlights: [
        "Smooth product catalog browsing with instant local caching.",
        "Persistent cart and favorites with SQLite & local storage.",
      ],
    ),
    ProjectModel(
      id: "sqlite-crud",
      title: "SQLite CRUD Manager",
      category: "tools",
      badge: "Offline First",
      icon: "💾",
      subtitle: "Local Database Architecture",
      description:
          "Local database application demonstrating ACID transactions, schema migrations, and structured offline data handling in Flutter.",
      techStack: ["Flutter", "SQLite", "sqflite", "Offline Sync"],
      highlights: [
        "Demonstrates offline-first architecture with transactional reliability.",
        "Optimized query indexing and schema version migrations.",
      ],
    ),
    ProjectModel(
      id: "live-chat-app",
      title: "Live Chat Application",
      category: "media",
      badge: "Real-time Chat",
      icon: "💬",
      subtitle: "Instant Communication Flow",
      description:
          "Real-time mobile chat app focused on socket communication, instant messaging workflows, read receipts, and media attachments.",
      techStack: ["Flutter", "Real-time Communication", "WebSockets", "Firebase"],
      highlights: [
        "Low-latency real-time two-way messaging.",
        "Typing indicators, message status, and local caching.",
      ],
    ),
    ProjectModel(
      id: "it-support",
      title: "24ITSupport.com Mobile",
      category: "enterprise",
      badge: "IT Solutions",
      icon: "💻",
      subtitle: "IT Support Platform",
      description:
          "Mobile application for IT-solutions platform covering ticket escalations, service requests, and diagnostic communication flows.",
      techStack: ["Flutter", "API Integration", "UI/UX", "Push Notifications"],
      highlights: [
        "Mobile-first service desk with instant status updates.",
        "Clean, accessible UI design system.",
      ],
    ),
  ];

  static const List<EducationModel> educations = [
    EducationModel(
      degree: "B.Tech in Computer Science and Engineering",
      institution: "Sagar Institute of Technology & Management, Barabanki, UP",
      duration: "Aug 2021 – Sep 2024",
      icon: "🏛️",
    ),
    EducationModel(
      degree: "Diploma in Computer Science Engineering",
      institution: "Government Polytechnic Aadmapur Tarabganj, Gonda, UP",
      duration: "Aug 2017 – Sep 2020",
      icon: "📜",
    ),
  ];

  static const List<LanguageModel> languages = [
    LanguageModel(name: "Hindi", level: "Native"),
    LanguageModel(name: "English", level: "Proficient"),
  ];
}
