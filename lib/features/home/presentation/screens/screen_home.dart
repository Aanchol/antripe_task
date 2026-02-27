
import 'package:antripe_task/core/constants/app_color.dart';
import 'package:antripe_task/features/home/presentation/widgets/home_contact_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/home_contact_list_model.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/home_category_list_widget.dart';
import '../widgets/home_search_bar_widget.dart';
import '../widgets/home_top_bar_widget.dart';

// Alphabet index letters
const List<String> _alphabetIndex = [
  '#', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
  'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S',
  'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
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
                    ? HomeSearchBarWidget(
                  onCancel: () {
                    setState(() => isSearchMode = false);
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
                Expanded(
                  child: HomeContactListWidget(),
                ),
              ],
            ),

            // Alphabet index on right
            _buildAlphabetIndex(),

            // FAB
            Positioned(
              right: 20,
              bottom: 24,
              child: _buildFAB(),
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
                  style:  TextStyle(
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

  // ── FAB ──────────────────────────────────────────────────────────────────────
  Widget _buildFAB() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 56,
        height: 56,
        decoration:  BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0x401A8C6A),
              blurRadius: 16,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}

