import 'package:antripe_task/core/widgets/custom_space.dart';
import 'package:antripe_task/core/widgets/measurement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/utils/state_status.dart';
import '../../../../core/widgets/custom_text.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
class HomeCategoryListWidget extends StatelessWidget {
  final ValueChanged<int> onSelect;

  const HomeCategoryListWidget({
    super.key,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, curr) =>
      prev.selectedCategory != curr.selectedCategory ||
          prev.contactListModel != curr.contactListModel,
      builder: (context, state) {
        if(state.stateStatus == StateStatus.loading)
        {
          return Center(child: CircularProgressIndicator());
        }
        final categories =
            state.contactListModel?.contactData?.categories ?? [];
        final selectedIndex = state.selectedCategory;

        return SizedBox(
          height: measurement.margin(90),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding:  EdgeInsets.fromLTRB(measurement.margin(16), measurement.margin(14), measurement.margin(16), measurement.margin(0)),
            itemCount: categories.length,
            itemBuilder: (_, i) {
              final isSelected = selectedIndex == i;
              final imagePath = _getCategoryImage(categories[i].name);

              return GestureDetector(
                onTap: () => onSelect(i),
                child: Container(
                  width: measurement.margin(64),
                  margin: EdgeInsets.only(right: measurement.margin(8)),
                  child: Column(
                    children: [
                      Container(
                        width: measurement.margin(54),
                        height: measurement.margin(54),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.transparent,
                            width: measurement.margin(2.5),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(measurement.margin(2.0)),
                          child: CircleAvatar(
                            radius: measurement.margin(24),
                            backgroundImage: AssetImage(imagePath),
                            backgroundColor: AppColors.greyLight,
                          ),
                        ),
                      ),
                      customSpace(height: measurement.margin(5)),
                      customText(
                        text: categories[i].name ?? '',
                        textStyle: TextStyle(
                          fontSize: 11,
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.grey,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
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