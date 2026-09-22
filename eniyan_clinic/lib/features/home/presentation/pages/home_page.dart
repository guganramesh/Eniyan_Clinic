import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
<<<<<<< HEAD
import '../../../profile/presentation/pages/profile_page.dart';
=======
import '../../../../shared/widgets/app_feedback.dart';
>>>>>>> b5e414ea975c2a622968eeaf6a966bd990b9358f
import '../../../../shared/widgets/app_logo.dart';
import '../../../appointments/presentation/pages/appointments_page.dart';
import '../../../facilities/presentation/pages/facilities_page.dart';
import '../../../blog/presentation/pages/blog_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';

const _homeDestinations = [
  _NavDestination(Icons.home_rounded, 'Home'),
  _NavDestination(Icons.calendar_month_outlined, 'Appointments'),
  _NavDestination(Icons.local_hospital_outlined, 'Facilities'),
  _NavDestination(Icons.menu_book_outlined, 'Blog'),
  _NavDestination(Icons.person_outline_rounded, 'Profile'),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isAppointments = _selectedIndex == 1;
    final isFacilities = _selectedIndex == 2;
    final isBlog = _selectedIndex == 3;
    final isProfile = _selectedIndex == 4;
    return Scaffold(
      backgroundColor: AppColors.background,
<<<<<<< HEAD
      appBar: _selectedIndex == 4
          ? _ProfileAppBar(onBack: () => setState(() => _selectedIndex = 0))
          : const _HomeAppBar(),
      body: _selectedIndex == 0
          ? const _DashboardContent()
          : _selectedIndex == 4
          ? const ProfilePage()
          : _PlaceholderContent(label: _destinations[_selectedIndex].label),
=======
      appBar: isAppointments
          ? AppointmentsAppBar(onBack: () => setState(() => _selectedIndex = 0))
          : isFacilities
          ? FacilitiesAppBar(onBack: () => setState(() => _selectedIndex = 0))
          : isBlog
          ? BlogAppBar(onBack: () => setState(() => _selectedIndex = 0))
          : isProfile
          ? const ProfileAppBar()
          : const _HomeAppBar(),
      body: _selectedIndex == 0
          ? const _DashboardContent()
          : isAppointments
          ? const AppointmentsPage()
          : isFacilities
          ? const FacilitiesPage()
          : isBlog
          ? const BlogPage()
          : isProfile
          ? const ProfilePage()
          : const _DashboardContent(),
      floatingActionButton: isAppointments
          ? FloatingActionButton.extended(
              onPressed: () => showAppMessage(
                context,
                'Choose a doctor to book an appointment.',
              ),
              backgroundColor: AppColors.blue,
              foregroundColor: AppColors.white,
              icon: const Icon(Icons.add_rounded),
              label: const Text('Book Appointment'),
            )
          : null,
>>>>>>> b5e414ea975c2a622968eeaf6a966bd990b9358f
      bottomNavigationBar: _ClinicNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}

class _ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _ProfileAppBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Size get preferredSize => const Size.fromHeight(58);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      elevation: 0,
      toolbarHeight: 58,
      leading: IconButton(
        onPressed: onBack,
        tooltip: 'Back',
        icon: const Icon(Icons.arrow_back_rounded, color: AppColors.blue),
      ),
      title: const Text(
        'Profile',
        style: TextStyle(
          color: AppColors.ink,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(
              onPressed: () {},
              tooltip: 'Notifications',
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: AppColors.blue,
                size: 23,
              ),
            ),
            Positioned(
              top: 6,
              right: 5,
              child: Container(
                width: 14,
                height: 14,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.red,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '3',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.only(left: 4, right: 16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.softBlue,
            borderRadius: BorderRadius.circular(11),
          ),
          child: const Text(
            'RK',
            style: TextStyle(
              color: AppColors.blue,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      automaticallyImplyLeading: false,
      toolbarHeight: 72,
      titleSpacing: 16,
      title: const Row(
        children: [
          SizedBox(
            width: 58,
            height: 60,
            child: Center(child: AppLogo(width: 52)),
          ),
          SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Eniyan Clinics',
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Healthy Kids  ·  Brighter Future',
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: const [
        _NotificationButton(),
        SizedBox(width: 8),
        _ProfileAvatar(),
        SizedBox(width: 16),
      ],
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          onPressed: () =>
              showAppMessage(context, 'You have 3 new notifications.'),
          tooltip: 'Notifications',
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: AppColors.blue,
            size: 30,
          ),
        ),
        Positioned(
          top: 5,
          right: 4,
          child: Container(
            width: 18,
            height: 18,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.red,
              shape: BoxShape.circle,
            ),
            child: const Text(
              '3',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.softBlue,
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Text(
        'RK',
        style: TextStyle(color: AppColors.blue, fontWeight: FontWeight.w800),
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 28, 22, 32),
      children: const [
        _GreetingHeader(),
        SizedBox(height: 18),
        _WelcomeHero(),
        SizedBox(height: 16),
        _ChildProfileCard(),
        SizedBox(height: 26),
        _SectionTitle(title: 'Quick Actions', actionLabel: 'See All'),
        SizedBox(height: 12),
        _QuickActionsGrid(),
        SizedBox(height: 28),
        _SectionTitle(title: 'Upcoming Appointment', actionLabel: 'See all'),
        SizedBox(height: 14),
        _AppointmentPreview(),
        SizedBox(height: 28),
        _SectionTitle(title: 'Child Health', actionLabel: 'Details'),
        SizedBox(height: 14),
        _HealthSummary(),
        SizedBox(height: 28),
        _SectionTitle(title: 'Growth Chart', actionLabel: 'Full chart'),
        SizedBox(height: 14),
        _GrowthCard(),
        SizedBox(height: 28),
        _SectionTitle(title: 'Child Care Services'),
        SizedBox(height: 14),
        _ServicesRow(),
        SizedBox(height: 28),
        _SectionTitle(title: 'Health Tips', actionLabel: 'View All'),
        SizedBox(height: 14),
        _HealthTips(),
      ],
    );
  }
}

class _GreetingHeader extends StatelessWidget {
  const _GreetingHeader();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Good Morning 👋',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
    );
  }
}

class _WelcomeHero extends StatelessWidget {
  const _WelcomeHero();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 138,
      padding: const EdgeInsets.fromLTRB(20, 18, 16, 18),
      decoration: BoxDecoration(
        color: AppColors.blueLight,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.blueBorder),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to\nEniyan Clinics',
                  style: TextStyle(
                    color: AppColors.ink,
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                    height: 1.05,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Your child's health, all in one place.",
                  style: TextStyle(color: AppColors.textBlueGray, fontSize: 13),
                ),
              ],
            ),
          ),
          Container(
            width: 92,
            height: 92,
            decoration: const BoxDecoration(
              color: AppColors.blueAvatar,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.child_care_rounded,
              color: AppColors.blue,
              size: 58,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChildProfileCard extends StatelessWidget {
  const _ChildProfileCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.blueBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: const BoxDecoration(
              color: AppColors.softBlue,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.face_rounded,
              color: AppColors.yellow,
              size: 44,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MY CHILD',
                  style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.1,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Arjun Kumar',
                  style: TextStyle(
                    color: AppColors.ink,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '6 Years · Height 118cm · Weight 22kg',
                  style: TextStyle(color: AppColors.gray, fontSize: 13),
                ),
                SizedBox(height: 8),
                Text(
                  'View Child Profile  →',
                  style: TextStyle(
                    color: AppColors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.blue),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, this.actionLabel});

  final String title;
  final String? actionLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.ink,
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        if (actionLabel != null)
          Text(
            actionLabel!,
            style: const TextStyle(
              color: AppColors.blue,
              fontWeight: FontWeight.w800,
            ),
          ),
      ],
    );
  }
}

class _QuickActionsGrid extends StatelessWidget {
  const _QuickActionsGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.25,
      children: const [
        _QuickAction(
          Icons.calendar_month_outlined,
          'Book Appointment',
          'Find the right care',
          AppColors.softBlue,
          AppColors.blue,
        ),
        _QuickAction(
          Icons.menu_book_outlined,
          'My Appointments',
          'Stay on track',
          AppColors.softGreen,
          AppColors.green,
        ),
        _QuickAction(
          Icons.show_chart_rounded,
          'Growth Chart',
          'See progress',
          AppColors.purpleSoft,
          AppColors.purple,
        ),
        _QuickAction(
          Icons.person_outline_rounded,
          'Child Profile',
          'All details',
          AppColors.orangeSoft,
          AppColors.orangeDark,
        ),
      ],
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction(
    this.icon,
    this.title,
    this.subtitle,
    this.color,
    this.iconColor,
  );

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 28),
          const Spacer(),
          Text(
            title,
            style: TextStyle(color: iconColor, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(color: AppColors.gray, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _AppointmentPreview extends StatelessWidget {
  const _AppointmentPreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: const Border(left: BorderSide(color: AppColors.blue, width: 5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.softBlue,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Text(
                  'DR',
                  style: TextStyle(
                    color: AppColors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Elamparithi',
                      style: TextStyle(
                        color: AppColors.ink,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Pediatrician & Neonatologist',
                      style: TextStyle(color: AppColors.gray, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const _StatusPill(),
            ],
          ),
          const SizedBox(height: 16),
          const Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              _AppointmentMeta(Icons.calendar_today_outlined, '18 Sep 2026'),
              _AppointmentMeta(Icons.schedule_outlined, '10:30 AM'),
              _AppointmentMeta(Icons.videocam_outlined, 'In-person'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              FilledButton(
                onPressed: () =>
                    showAppMessage(context, 'Appointment details opened.'),
                style: FilledButton.styleFrom(backgroundColor: AppColors.blue),
                child: const Text('View'),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: () =>
                    showAppMessage(context, 'Reschedule options opened.'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.blue,
                  side: const BorderSide(color: AppColors.blue),
                ),
                child: const Text('Reschedule'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.softGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Text(
          'Upcoming',
          style: TextStyle(
            color: AppColors.green,
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _AppointmentMeta extends StatelessWidget {
  const _AppointmentMeta(this.icon, this.label);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 16, color: AppColors.gray),
      const SizedBox(width: 5),
      Text(label, style: const TextStyle(color: AppColors.gray, fontSize: 13)),
    ],
  );
}

class _HealthSummary extends StatelessWidget {
  const _HealthSummary();

  @override
  Widget build(BuildContext context) => const Row(
    children: [
      Expanded(child: _HealthMetric('Height', '118cm')),
      SizedBox(width: 8),
      Expanded(child: _HealthMetric('Weight', '22kg')),
      SizedBox(width: 8),
      Expanded(child: _HealthMetric('Last Checkup', '05 Sep')),
      SizedBox(width: 8),
      Expanded(child: _HealthMetric('Next Visit', '18 Sep')),
    ],
  );
}

class _HealthMetric extends StatelessWidget {
  const _HealthMetric(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Container(
    height: 72,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: AppColors.gray, fontSize: 12),
        ),
        Text(
          value,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.ink,
            fontWeight: FontWeight.w800,
            fontSize: 13,
          ),
        ),
      ],
    ),
  );
}

class _GrowthCard extends StatelessWidget {
  const _GrowthCard();

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Arjun's height is tracking beautifully",
          style: TextStyle(color: AppColors.ink, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          width: double.infinity,
          child: CustomPaint(painter: _GrowthChartPainter()),
        ),
        const SizedBox(height: 8),
        const Text(
          'View Full Growth Chart  →',
          style: TextStyle(color: AppColors.blue, fontWeight: FontWeight.w800),
        ),
      ],
    ),
  );
}

class _GrowthChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()
      ..color = AppColors.blueBorderLight
      ..strokeWidth = 1;
    final line = Paint()
      ..color = AppColors.blue
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;
    for (var i = 0; i < 6; i++) {
      canvas.drawLine(
        Offset(0, i * size.height / 5),
        Offset(size.width, i * size.height / 5),
        grid,
      );
    }
    for (var i = 0; i < 8; i++) {
      canvas.drawLine(
        Offset(i * size.width / 7, 0),
        Offset(i * size.width / 7, size.height),
        grid,
      );
    }
    final path = Path()..moveTo(0, size.height * .72);
    path.cubicTo(
      size.width * .2,
      size.height * .62,
      size.width * .3,
      size.height * .54,
      size.width * .46,
      size.height * .34,
    );
    path.cubicTo(
      size.width * .64,
      size.height * .18,
      size.width * .8,
      size.height * .24,
      size.width,
      size.height * .1,
    );
    canvas.drawPath(path, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ServicesRow extends StatelessWidget {
  const _ServicesRow();

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 132,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        _ServiceCard(
          Icons.child_care_rounded,
          'Pediatrics',
          'Gentle everyday care',
          AppColors.softBlue,
          AppColors.blue,
        ),
        SizedBox(width: 12),
        _ServiceCard(
          Icons.favorite_border_rounded,
          'Neonatal Care',
          'Expert newborn support',
          AppColors.softGreen,
          AppColors.green,
        ),
        SizedBox(width: 12),
        _ServiceCard(
          Icons.show_chart_rounded,
          'Asthma',
          'Breathe easier',
          AppColors.purpleSoft,
          AppColors.purple,
        ),
      ],
    ),
  );
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard(
    this.icon,
    this.title,
    this.subtitle,
    this.color,
    this.iconColor,
  );

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) => Container(
    width: 178,
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(18),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: color,
          foregroundColor: iconColor,
          child: Icon(icon),
        ),
        const Spacer(),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.ink,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: AppColors.gray, fontSize: 13),
        ),
      ],
    ),
  );
}

class _HealthTips extends StatelessWidget {
  const _HealthTips();

  @override
  Widget build(BuildContext context) => const Row(
    children: [
      Expanded(
        child: _TipCard(
          'Nutrition',
          'Building a happy, healthy plate for your child',
          '12 Sep 2026',
          AppColors.blueLight,
        ),
      ),
      SizedBox(width: 12),
      Expanded(
        child: _TipCard(
          'Child Health',
          'The little rituals that make bedtime easier',
          '08 Sep 2026',
          AppColors.purpleLight,
        ),
      ),
    ],
  );
}

class _TipCard extends StatelessWidget {
  const _TipCard(this.category, this.title, this.date, this.color);

  final String category;
  final String title;
  final String date;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(18),
    ),
    clipBehavior: Clip.antiAlias,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: 62, color: color),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: const TextStyle(
                  color: AppColors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.ink,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                date,
                style: const TextStyle(color: AppColors.gray, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _ClinicNavigationBar extends StatelessWidget {
  const _ClinicNavigationBar({
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
      color: AppColors.white,
      border: Border(top: BorderSide(color: AppColors.borderLight)),
    ),
    child: SafeArea(
      top: false,
      child: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        elevation: 0,
        height: 76,
        indicatorColor: AppColors.softBlue,
        labelTextStyle: const WidgetStatePropertyAll(
          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        destinations: _homeDestinations
            .map(
              (destination) => NavigationDestination(
                icon: Icon(destination.icon),
                selectedIcon: Icon(destination.icon),
                label: destination.label,
              ),
            )
            .toList(),
      ),
    ),
  );
}

class _NavDestination {
  const _NavDestination(this.icon, this.label);

  final IconData icon;
  final String label;
}
