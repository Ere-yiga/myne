import 'package:flutter/material.dart';

class PortfolioNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentRoute;

  const PortfolioNavBar({super.key, required this.currentRoute});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;
    final theme = Theme.of(context);

    return AppBar(
      title: GestureDetector(
        onTap: () => Navigator.pushReplacementNamed(context, '/'),
        child: Text(
          'YN.', // Change to your initials
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 22,
            color: theme.colorScheme.primary,
          ),
        ),
      ),
      actions: isWide
          ? [
              _NavItem(label: 'Home', route: '/', current: currentRoute),
              _NavItem(label: 'About', route: '/about', current: currentRoute),
              _NavItem(
                  label: 'Projects',
                  route: '/projects',
                  current: currentRoute),
              _NavItem(
                  label: 'Contact', route: '/contact', current: currentRoute),
              const SizedBox(width: 16),
            ]
          : [
              _MobileMenuButton(currentRoute: currentRoute),
              const SizedBox(width: 8),
            ],
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final String route;
  final String current;

  const _NavItem(
      {required this.label, required this.route, required this.current});

  @override
  Widget build(BuildContext context) {
    final isActive = current == route;
    final theme = Theme.of(context);

    return TextButton(
      onPressed: () {
        if (!isActive) Navigator.pushReplacementNamed(context, route);
      },
      child: Text(
        label,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
          color: isActive
              ? theme.colorScheme.primary
              : theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}

class _MobileMenuButton extends StatelessWidget {
  final String currentRoute;

  const _MobileMenuButton({required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.menu),
      onSelected: (route) {
        if (route != currentRoute) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
      itemBuilder: (_) => const [
        PopupMenuItem(value: '/', child: Text('Home')),
        PopupMenuItem(value: '/about', child: Text('About')),
        PopupMenuItem(value: '/projects', child: Text('Projects')),
        PopupMenuItem(value: '/contact', child: Text('Contact')),
      ],
    );
  }
}
