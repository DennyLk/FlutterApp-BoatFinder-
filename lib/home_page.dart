import 'package:flutter/material.dart';
import 'boat_detail_page.dart'; // Make sure to import the page you are navigating to
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', height: 40), // Logo as AppBar title
        centerTitle: true,
        backgroundColor:
            const Color(0xFF63B1FF), // Set background color of AppBar
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 60),
                const Text(
                  'Welcome to BoatRent!',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Your premier app for finding and booking the boat you want.',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Image.asset('assets/logo.png',
                    width: 400), // Another full width image
                const SizedBox(height: 50),
                const Text(
                  'Whether you want to enjoy a leisurely sail or need a boat for a fishing trip, we have you covered.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset('assets/sun.png', width: 100), // Smaller image
                    Image.asset('assets/wave.png', width: 100), // Smaller image
                    Image.asset('assets/boat.png', width: 100), // Smaller image
                  ],
                ),
                const SizedBox(height: 50),
                const Text(
                  'Explore options, find detailed information, and book your perfect boating experience.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BoatDetailPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    foregroundColor: Colors.white, // Text color
                    padding:
                        const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
                  ),
                  child: const Text(
                    'View Boats',
                    style: TextStyle(
                      fontSize: 20, // Increased font size for the button text
                      fontWeight: FontWeight.bold, // Making the text bold
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // It says the map is not supported by my macOS
                // SizedBox(
                //   height:
                //       300, // Adjust the height of the map container as needed
                //   child: GoogleMap(
                //     initialCameraPosition: const CameraPosition(
                //       target: LatLng(37.42796133580664, -122.085749655962),
                //       zoom: 14,
                //     ),
                //     markers: {
                //       const Marker(
                //         markerId: MarkerId('marker_1'),
                //         position: LatLng(37.42796133580664, -122.085749655962),
                //         infoWindow: InfoWindow(title: 'Marker 1'),
                //       ),
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
