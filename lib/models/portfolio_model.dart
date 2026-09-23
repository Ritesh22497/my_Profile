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
