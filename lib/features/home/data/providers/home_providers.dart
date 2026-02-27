import 'package:dio/dio.dart';
import '../models/home_contact_list_model.dart';

class HomeContactProvider {
  final Dio dio;

  HomeContactProvider({required this.dio});

  Future<HomeContactListModel> fetchContacts() async {
    final response = await dio.get("https://api.antripe.com/v1/contact/api.json");

    return HomeContactListModel.fromJson(response.data);
  }
}