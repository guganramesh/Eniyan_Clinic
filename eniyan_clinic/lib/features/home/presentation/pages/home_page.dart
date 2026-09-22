import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/app_logo.dart';
import '../../../../shared/widgets/section_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const AppLogo(width: 92),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Notifications',
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
        children: [
          Text('Good morning,', style: Theme.of(context).textTheme.bodyLarge),
          Text(
            'Welcome to Eniyan Clinic',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),
          const _WelcomeCard(),
          const SizedBox(height: 28),
          const SectionHeader(title: 'Quick actions'),
          const SizedBox(height: 12),
          const Row(
            children: [
              Expanded(
                child: _ActionTile(
                  icon: Icons.calendar_month_rounded,
                  label: 'Book an appointment',
                  color: AppColors.softBlue,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _ActionTile(
                  icon: Icons.medical_information_outlined,
                  label: 'View health records',
                  color: AppColors.softGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Expanded(
              child: Text(
                'Every child deserves care that helps them thrive.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Icon(
              Icons.favorite_rounded,
              color: Colors.white.withValues(alpha: .9),
              size: 48,
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: color,
              foregroundColor: AppColors.ink,
              child: Icon(icon),
            ),
            const SizedBox(height: 16),
            Text(label, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
