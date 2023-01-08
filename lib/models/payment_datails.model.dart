class PaymentModel {
  late String id;
  late String title;
  late String issuedDate;
  late String dueDate;
  late String amount;
  late String description;
  late String category;

  PaymentModel({
    required this.id,
    required this.title,
    required this.issuedDate,
    required this.dueDate,
    required this.amount,
    required this.description,
    required this.category,
  });

  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    issuedDate = json['issuedDate'];
    dueDate = json['dueDate'];
    amount = json['amount'];
    description = json['description'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['issuedDate'] = issuedDate;
    data['dueDate'] = dueDate;
    data['amount'] = amount;
    data['description'] = description;
    data['category'] = category;
    return data;
  }
}
