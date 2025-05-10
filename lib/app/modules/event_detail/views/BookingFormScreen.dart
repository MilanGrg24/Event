import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../dashboard/controllers/dashboard_controller.dart';
import '../../dashboard/views/dashboard_view.dart';

class BookingFormScreen extends StatefulWidget {
  final int eventId;

  const BookingFormScreen({super.key, required this.eventId});

  @override
  _BookingFormScreenState createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form controllers
  final _numberOfPeople = TextEditingController();
  final _bookingDate = TextEditingController();
  final _specialRequirements = TextEditingController();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _address1 = TextEditingController();
  final _address2 = TextEditingController();
  final _city = TextEditingController();
  final _state = TextEditingController();
  final _country = TextEditingController();
  final _postalCode = TextEditingController();
  final _phone = TextEditingController();

  bool _isLoading = false;

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Build the body, ensuring nullable fields are handled
    final body = {
      'event_id': widget.eventId.toString(),
      'number_of_people': _numberOfPeople.text,
      'booking_date': _bookingDate.text,
      'special_requirements':
          _specialRequirements.text.trim().isEmpty
              ? null
              : _specialRequirements.text.trim(),
      'name': _name.text,
      'email': _email.text,
      'address_line1': _address1.text,
      'address_line2':
          _address2.text.trim().isEmpty ? null : _address2.text.trim(),
      'city': _city.text,
      'state': _state.text,
      'country': _country.text,
      'postal_code': _postalCode.text,
      'phone': _phone.text.trim().isEmpty ? null : _phone.text.trim(),
    };

    try {
      // Retrieve the token from GetStorage
      final token = GetStorage().read('token');

      // Check if the token exists
      if (token == null) {
        Get.snackbar(
          'Error',
          'No valid token found. Please login again.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/bookings/create'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Include token in header
        },
        body: jsonEncode(body),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Fluttertoast.showToast(
          msg: "Event Booked Successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.deepPurple,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        Get.put(DashboardController());
        Get.offAll(() => DashboardView());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed: ${data['message'] ?? 'Unknown error'}'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Event', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField('Number of People', _numberOfPeople),
              SizedBox(height: 2.0),
              TextFormField(
                controller: _bookingDate,
                readOnly: true,
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    _bookingDate.text =
                        pickedDate.toIso8601String().split('T').first;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Booking Date',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_month, color: Colors.grey),
                ),
                validator:
                    (value) =>
                        (value == null || value.isEmpty)
                            ? 'Booking Date is required'
                            : null,
              ),

              _buildTextField(
                'Special Requirements',
                _specialRequirements,
                required: false,
              ),
              Divider(),
              _buildTextField('Name', _name),
              _buildTextField('Email', _email),
              _buildTextField('Address', _address1),
              _buildTextField('Address Line 2', _address2, required: false),
              _buildTextField('City', _city),
              _buildTextField('State', _state),
              _buildTextField('Country', _country),
              _buildTextField('Postal Code', _postalCode),
              _buildTextField('Phone', _phone, required: false),
              const SizedBox(height: 16),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Submit Booking',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    bool required = true,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (required && (value == null || value.isEmpty)) {
            return '$label is required';
          }

          // Custom validations
          if (label.contains('Email') &&
              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)) {
            return 'Enter a valid email';
          }

          if (label.contains('Booking Date') &&
              !RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value!)) {
            return 'Date must be in YYYY-MM-DD format';
          }

          if (label.contains('Number of People')) {
            final number = int.tryParse(value!);
            if (number == null || number < 1) {
              return 'Enter a valid number (minimum 1)';
            }
          }

          return null;
        },
      ),
    );
  }
}
