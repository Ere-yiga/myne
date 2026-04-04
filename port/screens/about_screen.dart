import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../widgets/nav_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;

    return Scaffold(
      appBar: PortfolioNavBar(currentRoute: '/about'),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? 48 : 24,
                vertical: 48,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SectionHeader(title: 'About Me'),
                  const SizedBox(height: 32),
                  Text(
                    PortfolioData.bio,
                    style: const TextStyle(fontSize: 16, height: 1.8),
                  ),
                  const SizedBox(height: 48),
                  const _SectionHeader(title: 'Skills'),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: PortfolioData.skills
                        .map((skill) => _SkillChip(label: skill))
                        .toList(),
                  ),
                  const SizedBox(height: 48),
                  const _SectionHeader(title: 'Journey'),
                  const SizedBox(height: 24),
                  ...PortfolioData.timeline.map(
                    (item) => _TimelineItem(
                      year: item['year']!,
                      event: item['event']!,
                      detail: item['detail']!,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        Container(
          width: 48,
          height: 4,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: theme.colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String year;
  final String event;
  final String detail;

  const _TimelineItem(
      {required this.year, required this.event, required this.detail});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 64,
            child: Text(
              year,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.primary,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 6, right: 16),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colorScheme.primary,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16)),
                const SizedBox(height: 4),
                Text(
                  detail,
                  style: TextStyle(
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
