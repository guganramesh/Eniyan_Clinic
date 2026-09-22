import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/app_logo.dart';
import '../../../home/presentation/pages/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void _getStarted(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(24, 12, 24, 20),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: () => _getStarted(context),
            icon: const Icon(Icons.arrow_forward_rounded),
            label: const Text('Get started'),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.blue,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(vertical: 17),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Align(
                alignment: Alignment.centerLeft,
                child: AppLogo(width: 128),
              ),
              SizedBox(height: 36),
              _WelcomeMessage(),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeMessage extends StatelessWidget {
  const _WelcomeMessage();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A0051CE),
                blurRadius: 24,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Care that grows with your child',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.white,
                    fontSize: 20,
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: .16),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite_rounded,
                  color: AppColors.white,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'CHILD & FAMILY CARE',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.green,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Welcome to Eniyan Clinic',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontSize: 30, height: 1.1),
        ),
        const SizedBox(height: 16),
        Text(
          'A caring space for every child to grow healthy, happy, and strong.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 14),
        Text(
          'Connect with trusted care and keep your family’s health journey simple.',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.textBlueGray),
        ),
        const SizedBox(height: 28),
        const Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _TrustBadge(
              icon: Icons.verified_user_outlined,
              label: 'Trusted care',
            ),
            _TrustBadge(
              icon: Icons.family_restroom_rounded,
              label: 'Family first',
            ),
          ],
        ),
      ],
    );
  }
}

class _TrustBadge extends StatelessWidget {
  const _TrustBadge({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.borderLight),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 17, color: AppColors.green),
            const SizedBox(width: 7),
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.textBlueGray,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
