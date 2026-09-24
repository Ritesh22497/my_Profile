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
      highlights: [
        "Integrated short-form videos and full-length video streaming with caching.",
        "Architected state management using Provider and ChangeNotifier.",
        "Firebase Cloud Messaging (FCM) integration for real-time breaking news alerts.",
        "Razorpay payment gateway workflows for premium reading subscriptions.",
        "Responsive reusable UI components with seamless Dark/Light Mode support.",
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
