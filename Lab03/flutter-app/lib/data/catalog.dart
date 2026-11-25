// Sample data from the dbestech course notes. Hotels use bundled illustrations.
const flights = <Map<String, dynamic>>[
  {
    'from': {'code': 'NYC', 'name': 'New York'},
    'to': {'code': 'LDN', 'name': 'London'},
    'flying_time': '8H 30M',
    'date': '1 MAY',
    'departure_time': '08:00 AM',
    'number': 23,
  },
  {
    'from': {'code': 'DK', 'name': 'Dhaka'},
    'to': {'code': 'SH', 'name': 'Shanghai'},
    'flying_time': '4H 20M',
    'date': '10 MAY',
    'departure_time': '09:00 AM',
    'number': 45,
  },
];

const hotels = <Map<String, dynamic>>[
  {
    'image': 'assets/images/open_space.png',
    'place': 'Open Space',
    'destination': 'London',
    'price': 25,
    'description':
        'A compact stay in London with an open lounge and large windows.',
  },
  {
    'image': 'assets/images/global_will.png',
    'place': 'Global Will',
    'destination': 'London',
    'price': 40,
    'description':
        'A quiet city hotel with a courtyard and a comfortable reading area.',
  },
  {
    'image': 'assets/images/tallest_building.png',
    'place': 'Tallest Building',
    'destination': 'Dubai',
    'price': 68,
    'description': 'A high-rise hotel with wide views over the Dubai skyline.',
  },
];
