import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_color.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomeTopBarWidget extends StatelessWidget {
  final VoidCallback onSearchToggle;
  const HomeTopBarWidget({super.key, required this.onSearchToggle});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, curr) => prev.selectedTab != curr.selectedTab,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 16, 0),
          child: Row(
            children: [
              TopTab(
                label: 'Contact',
                index: 0,
                selectedIndex: state.selectedTab,
                onSelect: (i) =>
                    context.read<HomeBloc>().add(ChangeTabEvent(i)),
              ),
              const SizedBox(width: 20),
              TopTab(
                label: 'Recent',
                index: 1,
                selectedIndex: state.selectedTab,
                onSelect: (i) =>
                    context.read<HomeBloc>().add(ChangeTabEvent(i)),
              ),
              const Spacer(),
              IconButton(
                onPressed: onSearchToggle,
                icon: const Icon(Icons.search, size: 24),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu, size: 24),
              ),
            ],
          ),
        );
      },
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