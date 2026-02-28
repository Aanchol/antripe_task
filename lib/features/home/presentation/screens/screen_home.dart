import 'package:antripe_task/core/constants/app_color.dart';
import 'package:antripe_task/core/widgets/measurement.dart';
import 'package:antripe_task/features/home/presentation/widgets/home_contact_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_debounce_widget.dart';
import '../../../../core/widgets/custom_space.dart';
import '../../data/models/home_contact_list_model.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/home_add_contact_form_widget.dart';
import '../widgets/home_category_list_widget.dart';
import '../widgets/home_fab_widget.dart';
import '../widgets/home_search_bar_widget.dart';
import '../widgets/home_top_bar_widget.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final CustomDebounceWidget debouncer = CustomDebounceWidget();

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(FetchContactList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (prev, curr) => prev.isSearchMode != curr.isSearchMode,
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    state.isSearchMode
                        ? HomeSearchBarWidget(
                      onCancel: () {
                        context.read<HomeBloc>().add(
                          ToggleSearchModeEvent(false),
                        );
                      },
                      onChanged: (value) {
                        debouncer.run(() {
                          context.read<HomeBloc>().add(
                            SearchContactEvent(value),
                          );
                        });
                      },
                    )
                        : HomeTopBarWidget(
                      onSearchToggle: () {
                        context.read<HomeBloc>().add(
                          ToggleSearchModeEvent(true),
                        );
                      },
                    ),
                    HomeCategoryListWidget(
                      onSelect: (index) {
                        context.read<HomeBloc>().add(
                          ChangeCategoryEvent(index),
                        );
                      },
                    ),
                    customSpace(height: measurement.margin(8)),
                    const Expanded(child: HomeContactListWidget()),
                  ],
                ),
                Positioned(
                  right: measurement.margin(20),
                  bottom: measurement.margin(24),
                  child: HomeFABWidget(
                    onTap: () {
                      HomeAddContactFormWidget.show(
                        context,
                        onSave: () => Navigator.pop(context),
                        onCancel: () => Navigator.pop(context),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
