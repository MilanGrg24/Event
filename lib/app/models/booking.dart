class Booking {
  final int id;
  final String bookingNumber;
  final int totalAmount;
  final String bookingDate;
  final Event event;
  final CustomerAddress customerAddress;

  Booking({
    required this.id,
    required this.bookingNumber,
    required this.totalAmount,
    required this.bookingDate,
    required this.event,
    required this.customerAddress,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      bookingNumber: json['booking_number'],
      totalAmount: json['total_amount'],
      bookingDate: json['booking_date'],
      event: Event.fromJson(json['event']),
      customerAddress: CustomerAddress.fromJson(json['customer_address']),
    );
  }
}

class Event {
  final String title;
  final String imageUrl;

  Event({required this.title, required this.imageUrl});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      imageUrl: json['image_url'],
    );
  }
}

class CustomerAddress {
  final String city;

  CustomerAddress({required this.city});

  factory CustomerAddress.fromJson(Map<String, dynamic> json) {
    return CustomerAddress(
      city: json['city'],
    );
  }
}
