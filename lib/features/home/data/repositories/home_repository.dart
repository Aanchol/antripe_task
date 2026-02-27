import 'package:antripe_task/features/home/data/providers/home_providers.dart';

import '../models/home_contact_list_model.dart';

class HomeRepository {
  final HomeContactProvider contactProvider;

  HomeRepository({required this.contactProvider});

  Future<HomeContactListModel> fetchHomeContactList() async {
    return await contactProvider.fetchContacts();
  }
}