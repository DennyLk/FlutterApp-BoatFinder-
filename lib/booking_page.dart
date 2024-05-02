import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  final String? imageName;
  final String? name;
  final String? type;
  final String? capacity;
  final String? length;
  final String? power;
  final String? year;

  const BookingPage({
    super.key,
    this.imageName,
    this.name,
    this.type,
    this.capacity,
    this.length,
    this.power,
    this.year,
  });

  @override
  // ignore: library_private_types_in_public_api
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? _fromDate;
  DateTime? _toDate;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd'); // Set date format

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Booking Details',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF63B1FF)),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 8,
                color: const Color(
                    0xFF63B1FF), // Light blue shade for card background
                child: Column(
                  children: [
                    if (widget.imageName != null)
                      Image.asset('assets/${widget.imageName!}',
                          fit: BoxFit.cover),
                    if (widget.name != null &&
                        widget.type != null &&
                        widget.capacity != null &&
                        widget.length != null &&
                        widget.power != null &&
                        widget.year != null)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.name != null)
                              Text('Boat Name: ${widget.name}',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            if (widget.type != null)
                              Text('Type: ${widget.type}',
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            if (widget.capacity != null)
                              Text('Capacity: ${widget.capacity}',
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            if (widget.length != null)
                              Text('Length: ${widget.length}',
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            if (widget.power != null)
                              Text('Power: ${widget.power}',
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            if (widget.year != null)
                              Text('Year: ${widget.year}',
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white)),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              if (_fromDate != null && _toDate != null)
                Text(
                  'Selected Dates: From ${dateFormat.format(_fromDate!)} to ${dateFormat.format(_toDate!)}',
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
              const SizedBox(height: 26),
              ElevatedButton(
                onPressed: () async {
                  _fromDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2025),
                  );

                  if (_fromDate != null) {
                    _toDate = await showDatePicker(
                      // ignore: use_build_context_synchronously
                      context: context,
                      initialDate: _fromDate!,
                      firstDate: _fromDate!,
                      lastDate: DateTime(2025),
                    );
                  }

                  setState(() {});
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                ),
                child: const Text('Select Dates',
                    style: TextStyle(fontSize: 20, color: Colors.blue)),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Booking Confirmation'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (widget.name != null)
                                    Text('Boat Name: ${widget.name}'),
                                  if (widget.type != null)
                                    Text('Type: ${widget.type}'),
                                  if (widget.capacity != null)
                                    Text('Capacity: ${widget.capacity}'),
                                  if (widget.length != null)
                                    Text('Length: ${widget.length}'),
                                  if (widget.power != null)
                                    Text('Power: ${widget.power}'),
                                  if (widget.year != null)
                                    Text('Year: ${widget.year}'),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email: ${_emailController.text}'),
                                  Text('Phone: ${_phoneController.text}'),
                                  Text(
                                      'From: ${dateFormat.format(_fromDate!)}'),
                                  Text(
                                      'To     : ${dateFormat.format(_toDate!)}'),
                                  const SizedBox(height: 15),
                                  const Text(
                                    'You have booked your boat!',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'A receipt has been sent to your email',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close dialog
                              Navigator.pop(context); // Return to home screen
                            },
                            child: const Text('Continue'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                ),
                child: const Text('Confirm',
                    style: TextStyle(fontSize: 20, color: Colors.blue)),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
