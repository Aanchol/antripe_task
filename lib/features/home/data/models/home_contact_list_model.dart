class HomeContactListModel {
  String? status;
  String? message;
  ContactData? contactData;

  HomeContactListModel({this.status, this.message, this.contactData});

  HomeContactListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    contactData = json['data'] != null ? ContactData.fromJson(json['data']) : null;
  }
}

class ContactData {
  List<Categories>? categories;
  List<ContactsListData>? contacts;

  ContactData({this.categories, this.contacts});

  ContactData.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['contacts'] != null) {
      contacts = <ContactsListData>[];
      json['contacts'].forEach((v) {
        contacts!.add(ContactsListData.fromJson(v));
      });
    }
  }
}

class Categories {
  String? id;
  String? name;

  Categories({this.id, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class ContactsListData {
  String? id;
  bool? isEmpty;
  String? name;
  String? phone;
  String? categoryId;
  String? avatarUrl;
  String? subtitle;
  String? status;
  String? createdAt;

  ContactsListData(
      {this.id,
        this.isEmpty,
        this.name,
        this.phone,
        this.categoryId,
        this.avatarUrl,
        this.subtitle,
        this.status,
        this.createdAt});

  ContactsListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isEmpty = json['isEmpty'];
    name = json['name'];
    phone = json['phone'];
    categoryId = json['categoryId'];
    avatarUrl = json['avatarUrl'];
    subtitle = json['subtitle'];
    status = json['status'];
    createdAt = json['createdAt'];
  }
}
