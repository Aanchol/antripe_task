import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_color.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomeCategoryListWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const HomeCategoryListWidget({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final categories = state.contactListModel
            ?.contactData
            ?.categories ?? [];

        return SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            itemCount: categories.length,
            itemBuilder: (_, i) {
              final imagePath = _getCategoryImage(categories[i].name);
              return GestureDetector(
                onTap:() => onSelect(i),
                child: Container(
                  width: 64,
                  margin: const EdgeInsets.only(right: 8),
                  child: Column(
                    children: [
                      Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedIndex == i ? AppColors.primary : Colors.transparent,
                            width: 2.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(imagePath),
                            backgroundColor: AppColors.greyLight,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        categories[i].name ?? '',
                        style: TextStyle(
                          fontSize: 11,
                          color: selectedIndex == i ? AppColors.primary : AppColors.grey,
                          fontWeight:
                          selectedIndex == i ? FontWeight.w600 : FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
  String _getCategoryImage(String? name) {
    switch (name) {
      case 'Family':
        return "assets/images/png/family.png";
      case 'Friends':
        return "assets/images/png/friends.png";
      case 'Work':
        return "assets/images/png/colleague.png";
      case 'Clients':
        return "assets/images/png/colleague.png";
      case 'VIP':
        return "assets/images/png/relative.png";
      case 'Blocked':
        return "assets/images/png/relative.png";
      default:
        return "assets/images/png/family.png";
    }
  }
}