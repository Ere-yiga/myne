import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../widgets/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 700;

    return Scaffold(
      appBar: PortfolioNavBar(currentRoute: '/'),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isWide ? 48 : 24,
              vertical: 48,
            ),
            child: isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: _HeroText(theme: theme)),
                      const SizedBox(width: 64),
                      _AvatarWidget(size: 200),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _AvatarWidget(size: 140),
                      const SizedBox(height: 32),
                      _HeroText(theme: theme),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  final ThemeData theme;
  const _HeroText({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Hi, I\'m',
          style: TextStyle(
            fontSize: 20,
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          PortfolioData.name,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w800,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          PortfolioData.title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          PortfolioData.tagline,
          style: const TextStyle(fontSize: 16, height: 1.6),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/projects'),
              child: const Text('View Projects'),
            ),
            OutlinedButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/contact'),
              child: const Text('Get In Touch'),
            ),
          ],
        ),
      ],
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  final double size;
  const _AvatarWidget({required this.size});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (PortfolioData.profileImageUrl != null) {
      return CircleAvatar(
        radius: size / 2,
        backgroundImage: NetworkImage(PortfolioData.profileImageUrl!),
      );
    }

    // Initials fallback
    final initials = PortfolioData.name
        .split(' ')
        .map((w) => w.isNotEmpty ? w[0] : '')
        .take(2)
        .join();

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.secondary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          initials,
          style: TextStyle(
            fontSize: size * 0.35,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
