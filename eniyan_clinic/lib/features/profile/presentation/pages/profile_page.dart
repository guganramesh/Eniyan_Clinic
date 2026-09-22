import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/app_feedback.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(58);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      toolbarHeight: 58,
      title: const Text(
        'My Profile',
        style: TextStyle(color: AppColors.ink, fontSize: 19),
      ),
      actions: [
        IconButton(
          onPressed: () => showAppMessage(context, 'Profile settings opened.'),
          tooltip: 'Settings',
          icon: const Icon(Icons.settings_outlined, color: AppColors.blue),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 110),
      children: [
        Center(
          child: Container(
            width: 86,
            height: 86,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.softBlue,
              shape: BoxShape.circle,
            ),
            child: const Text(
              'RK',
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),
        const Center(
          child: Text(
            'Ravi Kumar',
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 6),
        const Center(
          child: Text(
            'ravi@example.com',
            style: TextStyle(color: AppColors.gray),
          ),
        ),
        const SizedBox(height: 28),
        _ProfileOption(
          icon: Icons.person_outline_rounded,
          title: 'Personal details',
          onTap: () => showAppMessage(context, 'Personal details opened.'),
        ),
        _ProfileOption(
          icon: Icons.family_restroom_rounded,
          title: 'Manage children',
          onTap: () => showAppMessage(context, 'Manage children opened.'),
        ),
        _ProfileOption(
          icon: Icons.notifications_none_rounded,
          title: 'Notifications',
          onTap: () =>
              showAppMessage(context, 'Notification preferences opened.'),
        ),
        _ProfileOption(
          icon: Icons.help_outline_rounded,
          title: 'Help and support',
          onTap: () => showAppMessage(context, 'Help and support opened.'),
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () => showAppMessage(context, 'You have been logged out.'),
          icon: const Icon(Icons.logout_rounded),
          label: const Text('Log out'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.red,
            side: const BorderSide(color: AppColors.red),
            minimumSize: const Size.fromHeight(52),
          ),
        ),
      ],
    );
  }
}

class _ProfileOption extends StatelessWidget {
  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: AppColors.softBlue,
          foregroundColor: AppColors.blue,
          child: Icon(icon),
        ),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}
