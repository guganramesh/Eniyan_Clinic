class ParentProfile {
  const ParentProfile({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });

  final String name;
  final String phone;
  final String email;
  final String address;

  String get initials => name
      .split(' ')
      .where((part) => part.isNotEmpty)
      .take(2)
      .map((part) => part[0])
      .join()
      .toUpperCase();
}

class ChildProfile {
  const ChildProfile({
    required this.name,
    required this.dateOfBirth,
    this.age = 'Not added',
    required this.gender,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.lastUpdated,
    required this.records,
  });

  final String name;
  final String dateOfBirth;
  final String age;
  final String gender;
  final String bloodGroup;
  final String height;
  final String weight;
  final String lastUpdated;
  final List<HealthRecord> records;

  String get initials => name.split(' ').map((part) => part[0]).join();
}

class HealthRecord {
  const HealthRecord(this.date, this.title, this.provider);

  final String date;
  final String title;
  final String provider;
}

const currentParent = ParentProfile(
  name: 'Rajesh Kumar',
  phone: '+91 98765 43210',
  email: 'rajesh.kumar@email.com',
  address: '24, Lake View Road, Chennai',
);

const profileChildren = [
  ChildProfile(
    name: 'Arjun Kumar',
    dateOfBirth: '14 Mar 2020',
    age: '6 Years',
    gender: 'Male',
    bloodGroup: 'O+',
    height: '118cm',
    weight: '22kg',
    lastUpdated: '05 Sep 2026',
    records: [
      HealthRecord('05 Sep 2026', 'Routine Checkup', 'Dr. Elamparithi'),
      HealthRecord('18 Aug 2026', 'Vaccination', 'Eniyan Clinics'),
      HealthRecord('12 Jun 2026', 'Growth Review', 'Dr. Elamparithi'),
    ],
  ),
  ChildProfile(
    name: 'Ananya Kumar',
    dateOfBirth: '21 Nov 2022',
    age: '3 Years',
    gender: 'Female',
    bloodGroup: 'A+',
    height: '94cm',
    weight: '14kg',
    lastUpdated: '02 Sep 2026',
    records: [
      HealthRecord('02 Sep 2026', 'Routine Checkup', 'Dr. Elamparithi'),
      HealthRecord('21 Jul 2026', 'Vaccination', 'Eniyan Clinics'),
    ],
  ),
];
