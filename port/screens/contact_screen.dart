import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/portfolio_data.dart';
import '../widgets/nav_bar.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isWide = MediaQuery.of(context).size.width > 700;

    return Scaffold(
      appBar: PortfolioNavBar(currentRoute: '/contact'),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? 48 : 24,
                vertical: 48,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Get In Touch',
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
                  const SizedBox(height: 16),
                  Text(
                    'I\'m currently open to new opportunities. '
                    'Whether you have a question or just want to say hi, '
                    'my inbox is always open!',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.7,
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Email card
                  _ContactTile(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: PortfolioData.email,
                    onTap: () {
                      Clipboard.setData(
                          ClipboardData(text: PortfolioData.email));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Email copied!')),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  _ContactTile(
                    icon: Icons.code_rounded,
                    label: 'GitHub',
                    value: PortfolioData.github,
                    onTap: () {
                      // TODO: launchUrl(Uri.parse(PortfolioData.github));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(PortfolioData.github)),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  _ContactTile(
                    icon: Icons.work_outline_rounded,
                    label: 'LinkedIn',
                    value: PortfolioData.linkedin,
                    onTap: () {
                      // TODO: launchUrl(Uri.parse(PortfolioData.linkedin));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(PortfolioData.linkedin)),
                      );
                    },
                  ),
                  const SizedBox(height: 48),
                  Center(
                    child: FilledButton.icon(
                      onPressed: () {
                        Clipboard.setData(
                            ClipboardData(text: PortfolioData.email));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Email copied to clipboard!')),
                        );
                      },
                      icon: const Icon(Icons.mail_outline_rounded),
                      label: const Text('Say Hello'),
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

class _ContactTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  const _ContactTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.colorScheme.outline.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon,
                  color: theme.colorScheme.primary, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5)),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded,
                size: 14,
                color: theme.colorScheme.onSurface.withOpacity(0.3)),
          ],
        ),
      ),
    );
  }
}
