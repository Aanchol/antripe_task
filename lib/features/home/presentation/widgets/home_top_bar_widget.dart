import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';

class HomeTopBarWidget extends StatefulWidget {
  final int selectedTab;
  final ValueChanged<int> onTabSelect;
  final VoidCallback onSearchToggle;

  const HomeTopBarWidget({
    super.key,
    required this.selectedTab,
    required this.onTabSelect,
    required this.onSearchToggle,
  });

  @override
  State<HomeTopBarWidget> createState() => _HomeTopBarWidgetState();
}

class _HomeTopBarWidgetState extends State<HomeTopBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 16, 0),
      child: Row(
        children: [
          // Tabs
          TopTab(
            label: 'Contact',
            index: 0,
            //isSelected: selectedTab == 0,
            selectedIndex: widget.selectedTab,
            onSelect: (i) => widget.onTabSelect(i),
          ),
          const SizedBox(width: 20),
          TopTab(
            label: 'Recent',
            index: 1,
            selectedIndex: widget.selectedTab,
            onSelect: (i) => widget.onTabSelect(i),
          ),

          const Spacer(),

          IconButton(
            onPressed: widget.onSearchToggle,
            icon: Icon(
              Icons.search,
              size: 24,
              color:  AppColors.black,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          ),

          const SizedBox(width: 4),

          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 24,
              color: AppColors.black850,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          ),
        ],
      ),
    );
  }
}


class TopTab extends StatelessWidget {
  final String label;
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const TopTab({
    super.key,
    required this.label,
    required this.index,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onSelect(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.black850 : AppColors.grey,
            ),
          ),
          const SizedBox(height: 6),

          // Indicator bar
          Container(
            height: 2.5,
            width: label.length * 9.0,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}