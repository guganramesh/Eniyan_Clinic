import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../profile_data.dart';
import 'child_profile_page.dart';
import 'growth_development_page.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({super.key, this.parent = currentParent});

  final ParentProfile parent;

  @override
  Widget build(BuildContext context) {
    return _ProfileSubpage(
      title: 'Personal Information',
      children: [
        _AvatarHeader(
          initials: parent.initials,
          title: parent.name,
          subtitle: 'Parent account',
        ),
        _InfoCard(
          title: 'Contact Details',
          children: [
            _DetailRow(Icons.phone_outlined, 'Phone number', parent.phone),
            _DetailRow(
              Icons.mail_outline_rounded,
              'Email address',
              parent.email,
            ),
            _DetailRow(Icons.location_on_outlined, 'Address', parent.address),
          ],
        ),
        _ActionButton(
          label: 'Edit Personal Information',
          icon: Icons.edit_outlined,
          onPressed: () => _showMessage(
            context,
            'Personal information editing will be available soon.',
          ),
        ),
      ],
    );
  }
}

class ChildInformationPage extends StatelessWidget {
  const ChildInformationPage({super.key, this.children = profileChildren});

  final List<ChildProfile> children;

  @override
  Widget build(BuildContext context) {
    return _ProfileSubpage(
      title: 'Child Information',
      children: [
        const _PageIntro(
          title: 'Your children',
          subtitle: 'Select a child to view their complete profile.',
        ),
        for (final child in children)
          _ChildListTile(child: child, onTap: () => _openChild(context, child)),
        _ActionButton(
          label: 'Add another child',
          icon: Icons.add_rounded,
          onPressed: () => _showMessage(
            context,
            'Add Child form is ready for your next child.',
          ),
        ),
      ],
    );
  }
}

class HealthRecordsPage extends StatelessWidget {
  const HealthRecordsPage({super.key, this.children = profileChildren});

  final List<ChildProfile> children;

  @override
  Widget build(BuildContext context) {
    return _ProfileSubpage(
      title: 'Health Records',
      children: [
        const _PageIntro(
          title: 'Choose a child',
          subtitle: 'View appointments, checkups, and vaccinations by child.',
        ),
        for (final child in children)
          _ChildListTile(
            child: child,
            trailing: '${child.records.length} records',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => HealthRecordsChildPage(child: child),
              ),
            ),
          ),
      ],
    );
  }
}

class HealthRecordsChildPage extends StatelessWidget {
  const HealthRecordsChildPage({super.key, required this.child});

  final ChildProfile child;

  @override
  Widget build(BuildContext context) {
    return _ProfileSubpage(
      title: '${child.name} · Records',
      children: [
        _AvatarHeader(
          initials: child.initials,
          title: child.name,
          subtitle: '${child.age} · ${child.gender}',
        ),
        _InfoCard(
          title: 'Recent Health Records',
          children: [
            for (var index = 0; index < child.records.length; index++)
              _TimelineRow(
                record: child.records[index],
                isLast: index == child.records.length - 1,
              ),
          ],
        ),
        _ActionButton(
          label: 'Book a checkup',
          icon: Icons.calendar_month_outlined,
          onPressed: () =>
              _showMessage(context, 'Appointment booking will open here.'),
        ),
      ],
    );
  }
}

class GrowthDevelopmentSelectionPage extends StatelessWidget {
  const GrowthDevelopmentSelectionPage({
    super.key,
    this.children = profileChildren,
  });

  final List<ChildProfile> children;

  @override
  Widget build(BuildContext context) {
    return _ProfileSubpage(
      title: 'Growth & Development',
      children: [
        const _PageIntro(
          title: 'Choose a child',
          subtitle: 'View growth measurements and development trends by child.',
        ),
        for (final child in children)
          _ChildListTile(
            child: child,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => GrowthDevelopmentPage(child: child),
              ),
            ),
          ),
      ],
    );
  }
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool appointmentAlerts = true;
  bool healthReminders = true;
  bool productUpdates = false;

  @override
  Widget build(BuildContext context) {
    return _ProfileSubpage(
      title: 'Notifications',
      children: [
        const _PageIntro(
          title: 'Stay up to date',
          subtitle: 'Choose which reminders you would like to receive.',
        ),
        _SwitchRow(
          title: 'Appointment reminders',
          value: appointmentAlerts,
          onChanged: (value) => setState(() => appointmentAlerts = value),
        ),
        _SwitchRow(
          title: 'Health reminders',
          value: healthReminders,
          onChanged: (value) => setState(() => healthReminders = value),
        ),
        _SwitchRow(
          title: 'Clinic updates',
          value: productUpdates,
          onChanged: (value) => setState(() => productUpdates = value),
        ),
      ],
    );
  }
}

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ProfileSubpage(
      title: 'Privacy',
      children: [
        _PageIntro(
          title: 'Your data, your control',
          subtitle:
              'We keep your family health information private and secure.',
        ),
        _InfoCard(
          title: 'Data and permissions',
          children: [
            _DetailRow(
              Icons.security_outlined,
              'Data protection',
              'Your information is encrypted and access controlled.',
            ),
            _DetailRow(
              Icons.download_outlined,
              'Download your data',
              'Request a copy of your account information.',
            ),
            _DetailRow(
              Icons.delete_outline_rounded,
              'Delete account',
              'Permanently remove your account and data.',
            ),
          ],
        ),
      ],
    );
  }
}

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _ProfileSubpage(
      title: 'Help & Support',
      children: [
        const _PageIntro(
          title: 'How can we help?',
          subtitle: 'Find answers or contact the Eniyan Clinics team.',
        ),
        _SupportAction(
          icon: Icons.help_outline_rounded,
          title: 'Frequently asked questions',
          onTap: () => _showMessage(context, 'FAQ support will open here.'),
        ),
        _SupportAction(
          icon: Icons.chat_bubble_outline_rounded,
          title: 'Chat with support',
          onTap: () => _showMessage(context, 'Support chat will open here.'),
        ),
        _SupportAction(
          icon: Icons.phone_outlined,
          title: 'Call the clinic',
          onTap: () =>
              _showMessage(context, 'Clinic contact options will open here.'),
        ),
      ],
    );
  }
}

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ProfileSubpage(
      title: 'Terms & Conditions',
      children: [
        _PageIntro(
          title: 'Eniyan Clinics terms',
          subtitle: 'Last updated 22 September 2026',
        ),
        _InfoCard(
          title: 'Using Eniyan Clinics',
          children: [
            _Paragraph(
              'Eniyan Clinics helps families manage child health information and appointments. Information shown in the app is provided for care coordination and does not replace professional medical advice.',
            ),
            _Paragraph(
              'Please keep your account details accurate and contact your healthcare provider for urgent or emergency concerns.',
            ),
          ],
        ),
      ],
    );
  }
}

class _ProfileSubpage extends StatelessWidget {
  const _ProfileSubpage({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.blue),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.ink,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
        children: [
          for (var index = 0; index < children.length; index++) ...[
            children[index],
            if (index < children.length - 1) const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _PageIntro extends StatelessWidget {
  const _PageIntro({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.ink,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(color: AppColors.gray, fontSize: 12),
        ),
      ],
    );
  }
}

class _AvatarHeader extends StatelessWidget {
  const _AvatarHeader({
    required this.initials,
    required this.title,
    required this.subtitle,
  });

  final String initials;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.blue,
            child: Text(
              initials,
              style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 13),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.ink,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: const TextStyle(color: AppColors.gray, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.ink,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow(this.icon, this.label, this.value);

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.blue, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: AppColors.gray, fontSize: 11),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
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

class _ChildListTile extends StatelessWidget {
  const _ChildListTile({
    required this.child,
    required this.onTap,
    this.trailing,
  });

  final ChildProfile child;
  final VoidCallback onTap;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.yellowSoft,
                child: Icon(Icons.face_rounded, color: AppColors.yellow),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      child.name,
                      style: const TextStyle(
                        color: AppColors.ink,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${child.age} · ${child.gender}',
                      style: const TextStyle(
                        color: AppColors.gray,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null)
                Text(
                  trailing!,
                  style: const TextStyle(color: AppColors.gray, fontSize: 10),
                ),
              const SizedBox(width: 6),
              const Icon(Icons.chevron_right_rounded, color: AppColors.ink),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({required this.record, required this.isLast});

  final HealthRecord record;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 18,
            child: Column(
              children: [
                Container(
                  width: 7,
                  height: 7,
                  margin: const EdgeInsets.only(top: 3),
                  decoration: const BoxDecoration(
                    color: AppColors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(width: 1, color: AppColors.blueBorder),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record.date,
                  style: const TextStyle(
                    color: AppColors.blue,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  record.title,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  record.provider,
                  style: const TextStyle(color: AppColors.gray, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(vertical: 13),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
      ),
    );
  }
}

class _SwitchRow extends StatelessWidget {
  const _SwitchRow({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.ink,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: AppColors.blue,
          ),
        ],
      ),
    );
  }
}

class _SupportAction extends StatelessWidget {
  const _SupportAction({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(13),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(13),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Icon(icon, color: AppColors.blue),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: AppColors.ink),
            ],
          ),
        ),
      ),
    );
  }
}

class _Paragraph extends StatelessWidget {
  const _Paragraph(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Text(
      text,
      style: const TextStyle(color: AppColors.gray, fontSize: 12, height: 1.5),
    ),
  );
}

void _openChild(BuildContext context, ChildProfile child) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (_) => ChildProfilePage(child: child)),
  );
}

void _showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
