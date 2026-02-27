import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_color.dart';
import '../../data/models/home_contact_list_model.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomeContactListWidget extends StatelessWidget {
  const HomeContactListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
      previous.selectedCategory != current.selectedCategory ||
          previous.contactListModel != current.contactListModel,
      builder: (context, state) {
        final categories =
            state.contactListModel?.contactData?.categories ?? [];

        final contacts =
            state.contactListModel?.contactData?.contacts ?? [];

        if (categories.isEmpty) {
          return const Center(child: Text("No categories"));
        }

        if (contacts.isEmpty) {
          return const Center(child: Text("No contacts available"));
        }

        final selectedCategory = categories[state.selectedCategory];

        List<ContactsListData> filteredContacts;

        if (selectedCategory.id == "all") {
          filteredContacts = contacts;
        } else {
          filteredContacts = contacts
              .where((contact) =>
          contact.categoryId == selectedCategory.id)
              .toList();
        }

        if (filteredContacts.isEmpty) {
          return const Center(
            child: Text("No contacts in this category"),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: filteredContacts.length,
          itemBuilder: (context, index) {
            final contact = filteredContacts[index];
            final isLast = index == filteredContacts.length - 1;

            return _ContactTile(
              contact: contact,
              showDivider: !isLast,
            );
          },
        );
      },
    );
  }
}

class _ContactTile extends StatelessWidget {
  final ContactsListData contact;
  final bool showDivider;

  const _ContactTile({
    required this.contact,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 40, 10),
          child: Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 26,
                backgroundImage: NetworkImage(contact.avatarUrl??""),
                backgroundColor: AppColors.black30,
              ),
              const SizedBox(width: 14),
              // Name + Phone
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact.name ?? "",
                      style:  TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black850,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      contact.phone ?? "",
                      style:  TextStyle(
                        fontSize: 13.5,
                        color: AppColors.black400,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
           Divider(
            height: 1,
            thickness: 0.6,
            color: AppColors.black30,
            indent: 70, // aligns with text, not avatar
            endIndent: 0,
          ),
      ],
    );
  }
}