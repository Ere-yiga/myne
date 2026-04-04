import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../widgets/nav_bar.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;

    return Scaffold(
      appBar: PortfolioNavBar(currentRoute: '/projects'),
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
                  _sectionHeader(context),
                  const SizedBox(height: 32),
                  isWide
                      ? _WideProjectsGrid()
                      : _NarrowProjectsList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Projects',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
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
        const SizedBox(height: 12),
        Text(
          'Things I have built',
          style: TextStyle(
            fontSize: 16,
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}

class _WideProjectsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 380,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.1,
      ),
      itemCount: PortfolioData.projects.length,
      itemBuilder: (_, i) =>
          _ProjectCard(project: PortfolioData.projects[i]),
    );
  }
}

class _NarrowProjectsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: PortfolioData.projects
          .map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _ProjectCard(project: p),
              ))
          .toList(),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Map<String, String> project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.folder_rounded,
                    color: theme.colorScheme.primary,
                    size: 22,
                  ),
                ),
                const Spacer(),
                if (project['github']?.isNotEmpty == true)
                  IconButton(
                    tooltip: 'View on GitHub',
                    icon: const Icon(Icons.code_rounded, size: 20),
                    onPressed: () {
                      // TODO: Use url_launcher package
                      // launchUrl(Uri.parse(project['github']!));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'GitHub: ${project['github']}')),
                      );
                    },
                  ),
                if (project['demo']?.isNotEmpty == true)
                  IconButton(
                    tooltip: 'Live Demo',
                    icon: const Icon(Icons.open_in_new_rounded, size: 20),
                    onPressed: () {
                      // TODO: Use url_launcher package
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('Demo: ${project['demo']}')),
                      );
                    },
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              project['title']!,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                project['description']!,
                style: TextStyle(
                  fontSize: 14,
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              project['tech']!,
              style: TextStyle(
                fontSize: 12,
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
