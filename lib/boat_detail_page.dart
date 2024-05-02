import 'package:flutter/material.dart';
import 'booking_page.dart'; // Ensure you import the BookingPage

class BoatDetailPage extends StatelessWidget {
  const BoatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', height: 40),
        centerTitle: true,
        backgroundColor: const Color(0xFF63B1FF),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          BoatCard(
            imageName: '/boat.png',
            name: 'Serenity',
            type: 'Sailboat',
            capacity: '6 People',
            length: '6 meters',
            power: '600 Hp',
            year: '2010',
            onBook: () => _navigateToBooking(context, '/boat.png', 'Serenity',
                'Sailboat', '6 People', '6 meters', '600 Hp', '2010'),
          ),
          BoatCard(
            imageName: '/boat.png',
            name: 'Freedom',
            type: 'Speedboat',
            capacity: '4 People',
            length: '4 meters',
            power: '350 Hp',
            year: '2015',
            onBook: () => _navigateToBooking(context, '/boat.png', 'Freedom',
                'Speedboat', '4 People', '4 meters', '350 Hp', '2015'),
          ),
          BoatCard(
            imageName: '/boat.png',
            name: 'Horizon',
            type: 'Yacht',
            capacity: '12 People',
            length: '16 meters',
            power: '1500 Hp',
            year: '2018',
            onBook: () => _navigateToBooking(context, '/boat.png', 'Horizon',
                'Yacht', '12 People', '16 meters', '1500 Hp', '2018'),
          ),
        ],
      ),
    );
  }

  void _navigateToBooking(BuildContext context, String imageName, String name,
      String type, String capacity, String length, String power, String year) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingPage(
          imageName: imageName,
          name: name,
          type: type,
          capacity: capacity,
          length: length,
          power: power,
          year: year,
        ),
      ),
    );
  }
}

class BoatCard extends StatelessWidget {
  final String imageName;
  final String name;
  final String type;
  final String capacity;
  final String length;
  final String power;
  final String year;
  final VoidCallback onBook;

  const BoatCard({
    super.key,
    required this.imageName,
    required this.name,
    required this.type,
    required this.capacity,
    required this.length,
    required this.power,
    required this.year,
    required this.onBook,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.all(10.0),
      clipBehavior: Clip.antiAlias,
      child: Container(
        color: const Color(0xFF63B1FF), // Light blue shade as card background
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/$imageName", fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Boat Name: $name',
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 16),
                  Text('Type: $type',
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                  Text('Capacity: $capacity',
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                  Text('Length$length',
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                  Text('Power: $power',
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                  Text('Year: $year',
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                ],
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => onBook(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                  ),
                  child: const Text('Book Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
