import 'package:antripe_task/core/constants/style_constants.dart';
import 'package:antripe_task/core/utils/state_status.dart';
import 'package:antripe_task/core/widgets/custom_space.dart';
import 'package:antripe_task/core/widgets/measurement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/empty_contact_widget.dart';
import '../../data/models/home_contact_list_model.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomeContactListWidget extends StatelessWidget {
  const HomeContactListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
      previous.filteredContacts != current.filteredContacts,
      builder: (context, state) {
        if(state.stateStatus == StateStatus.loading)
          {
            return Center(child: CircularProgressIndicator());
          }
        if (state.filteredContacts.isEmpty) {
          return EmptyContactWidget();
        }
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: state.filteredContacts.length,
          itemBuilder: (context, index) {
            final contact = state.filteredContacts[index];
            final isLast = index == state.filteredContacts.length - 1;

            return ContactTile(contact: contact, showDivider: !isLast);
          },
        );
      },
    );
  }
}

class ContactTile extends StatelessWidget {
  final ContactsListData contact;
  final bool showDivider;

  const ContactTile({
    super.key,
    required this.contact,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            measurement.margin(16),
            measurement.margin(10),
            measurement.margin(40),
            measurement.margin(10),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: measurement.margin(26),
                backgroundImage: NetworkImage(contact.avatarUrl ?? ""),
                backgroundColor: AppColors.black30,
              ),
              customSpace(width: measurement.margin(14)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                      text: contact.name ?? "",
                      textStyle: TextStyle(
                        fontSize: AppFontSize.largeTextSize,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black850,
                        height: 1.2,
                      ),
                    ),
                    customSpace(height: measurement.margin(3)),
                    customText(
                      text: contact.phone ?? "",
                      textStyle: TextStyle(
                        fontSize: AppFontSize.mediumTextSize,
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
            height: measurement.margin(1),
            thickness: 0.6,
            color: AppColors.black30,
            indent: 70,
            endIndent: 0,
          ),
      ],
    );
  }
}
