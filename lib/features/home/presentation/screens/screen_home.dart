import 'package:antripe_task/core/constants/app_color.dart';
import 'package:antripe_task/features/home/presentation/widgets/home_contact_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_debounce_widget.dart';
import '../../data/models/home_contact_list_model.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/home_add_contact_form_widget.dart';
import '../widgets/home_category_list_widget.dart';
import '../widgets/home_fab_widget.dart';
import '../widgets/home_search_bar_widget.dart';
import '../widgets/home_top_bar_widget.dart';

// Alphabet index letters
const List<String> _alphabetIndex = [
  '#',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
];

// ─── Contact Screen ───────────────────────────────────────────────────────────
class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int selectedTab = 0;
  int selectedCategory = 0;
  bool isSearchMode = false;
  String searchText = '';

  final CustomDebounceWidget _debouncer = CustomDebounceWidget();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(FetchContactList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isSearchMode
                    ?
                      // HomeSearchBarWidget(
                      //   onCancel: () {
                      //     setState(() => isSearchMode = false);
                      //   },
                      // )
                      HomeSearchBarWidget(
                        onCancel: () {
                          context.read<HomeBloc>().add(
                            SearchContactEvent(
                              query: '',
                              categoryIndex:
                                  selectedCategory, // current selected category
                            ),
                          );
                        },
                        onChanged: (value) {
                          _debouncer.run(() {
                            context.read<HomeBloc>().add(
                              SearchContactEvent(
                                query: value,
                                categoryIndex: selectedCategory,
                              ),
                            );
                          });
                        },
                      )
                    : HomeTopBarWidget(
                        selectedTab: selectedTab,
                        onTabSelect: (index) {
                          setState(() => selectedTab = index);
                        },
                        onSearchToggle: () {
                          setState(() => isSearchMode = true);
                        },
                      ),
                HomeCategoryListWidget(
                  selectedIndex: selectedCategory,
                  onSelect: (index) {
                    context.read<HomeBloc>().add(ChangeCategoryEvent(index));
                  },
                ),
                const SizedBox(height: 8),
                Expanded(child: HomeContactListWidget()),
              ],
            ),
            Positioned(
              right: 20,
              bottom: 24,
              child: HomeFABWidget(
                onTap: () {
                  HomeAddContactFormWidget.show(
                    context,
                    onSave: () {
                      Navigator.pop(context); // close the bottom sheet
                    },
                    onCancel: () {
                      Navigator.pop(context); // close the bottom sheet
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Alphabet Index ───────────────────────────────────────────────────────────
  Widget _buildAlphabetIndex() {
    return Positioned(
      right: 4,
      top: 0,
      bottom: 80,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _alphabetIndex.map((letter) {
            return GestureDetector(
              onTap: () {
                // scroll to section — wire up ScrollController if needed
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.2),
                child: Text(
                  letter,
                  style: TextStyle(
                    fontSize: 9.5,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
