class Event {
  final int id;
  final String title;
  final String? slug;
  final int? eventCategoryId;
  final String description;
  final String imageUrl;
  final String? imagePublicId;
  final double price;
  final String country;
  final int? status;
  final String startDate;
  final String? endDate;
  final int totalSpace;
  final String? createdAt;
  final String? updatedAt;
  final Category category;

  Event({
    required this.id,
    required this.title,
    this.slug,
    this.eventCategoryId,
    required this.description,
    required this.imageUrl,
    this.imagePublicId,
    required this.price,
    required this.country,
    this.status,
    required this.startDate,
    this.endDate,
    required this.totalSpace,
    this.createdAt,
    this.updatedAt,
    required this.category,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      eventCategoryId: json['event_category_id'],
      description: json['description'],
      imageUrl: json['image_url'],
      imagePublicId: json['image_public_id'],
      price: (json['price'] as num).toDouble(),
      country: json['country'],
      status: json['status'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      totalSpace: json['total_space'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      category: Category.fromJson(json['category']),
    );
  }
}

class Category {
  final int id;
  final String title;

  Category({required this.id, required this.title});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json['id'], title: json['title']);
  }
}
