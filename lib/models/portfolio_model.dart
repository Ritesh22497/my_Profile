import 'package:flutter/material.dart';

class AccentTheme {
  final String name;
  final Color primary;
  final Color secondary;

  const AccentTheme({
    required this.name,
    required this.primary,
    required this.secondary,
  });
}

class MockupCardData {
  final String title;
  final String subtitle;
  final String? badge;
  final IconData icon;
  final Color iconColor;
  final String? actionText;

  const MockupCardData({
    required this.title,
    required this.subtitle,
    this.badge,
    required this.icon,
    required this.iconColor,
    this.actionText,
  });
}

class AppScreenMockup {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color themeColor;
  final List<MockupCardData> cards;

  const AppScreenMockup({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.themeColor,
    required this.cards,
  });
}

class ProjectModel {
  final String id;
  final String title;
  final String category; // 'production', 'enterprise', 'media', 'tools', 'ecommerce'
  final String badge;
  final String icon;
  final String subtitle;
  final String description;
  final List<String> techStack;
  final List<String> highlights;
  final List<String>? keyFeatures;
  final String? playStoreUrl;
  final List<AppScreenMockup>? screenMockups;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.category,
    required this.badge,
    required this.icon,
    required this.subtitle,
    required this.description,
    required this.techStack,
    required this.highlights,
    this.keyFeatures,
    this.playStoreUrl,
    this.screenMockups,
  });
}

class ExperienceModel {
  final String company;
  final String role;
  final String period;
  final List<String> points;

  const ExperienceModel({
    required this.company,
    required this.role,
    required this.period,
    required this.points,
  });
}

class SkillCategoryModel {
  final String title;
  final String icon;
  final List<String> skills;

  const SkillCategoryModel({
    required this.title,
    required this.icon,
    required this.skills,
  });
}

class EducationModel {
  final String degree;
  final String institution;
  final String duration;
  final String icon;

  const EducationModel({
    required this.degree,
    required this.institution,
    required this.duration,
    required this.icon,
  });
}

class LanguageModel {
  final String name;
  final String level;

  const LanguageModel({
    required this.name,
    required this.level,
  });
}
