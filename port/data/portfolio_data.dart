// ============================================================
//  YOUR DATA — Edit everything in this file!
// ============================================================

class PortfolioData {
  // ── Personal Info ──────────────────────────────────────────
  static const String name = 'Your Name';
  static const String title = 'Flutter Developer';
  static const String tagline = 'I build beautiful, cross-platform apps.';
  static const String bio =
      'I\'m a passionate developer based in Lagos, Nigeria. '
      'I love crafting clean UI and learning new technologies. '
      'Currently exploring Flutter and mobile development.';

  static const String email = 'you@email.com';
  static const String github = 'https://github.com/yourusername';
  static const String linkedin = 'https://linkedin.com/in/yourprofile';
  static const String twitter = 'https://twitter.com/yourhandle';

  // Optional: URL to your profile photo
  // If null, initials avatar will be shown instead
  static const String? profileImageUrl = null;

  // ── Skills ─────────────────────────────────────────────────
  static const List<String> skills = [
    'Flutter',
    'Dart',
    'Firebase',
    'REST APIs',
    'Git & GitHub',
    'UI/UX Design',
    'State Management',
    'Responsive Design',
  ];

  // ── Projects ───────────────────────────────────────────────
  static const List<Map<String, String>> projects = [
    {
      'title': 'Todo App',
      'description':
          'A clean, minimal todo app with local storage. My first Flutter project!',
      'tech': 'Flutter • SharedPreferences',
      'github': 'https://github.com/yourusername/todo-app',
      'demo': '', // Leave empty if no live demo
    },
    {
      'title': 'Project Two',
      'description': 'Description of your second project goes here.',
      'tech': 'Flutter • Firebase',
      'github': 'https://github.com/yourusername/project-two',
      'demo': '',
    },
    {
      'title': 'Project Three',
      'description': 'Description of your third project goes here.',
      'tech': 'Flutter • REST API',
      'github': 'https://github.com/yourusername/project-three',
      'demo': 'https://yourapp.web.app',
    },
  ];

  // ── Timeline / Experience (optional section) ───────────────
  static const List<Map<String, String>> timeline = [
    {
      'year': '2025',
      'event': 'Started learning Flutter',
      'detail': 'Built my first todo app and fell in love with Dart.',
    },
    {
      'year': '2025',
      'event': 'Open to opportunities',
      'detail': 'Looking for internships and junior Flutter developer roles.',
    },
  ];
}
