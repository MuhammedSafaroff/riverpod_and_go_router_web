import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/colors/app_colors.dart';
import '../../common/constant/constants.dart';
import '../../model/drawer_item_model.dart';

final providerNavigationIndex = StateProvider.autoDispose((_) => "tasks/1");

class AppDrawer extends HookConsumerWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUrl = ref.watch(providerNavigationIndex);
    return ColoredBox(
      color: AppColors.darkBlue,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 64),
        itemCount: navigationBarItems.length,
        itemBuilder: (context, index) => _DrawerListItem(
          item: navigationBarItems[index],
          url: currentUrl,
          onTap: (p0) {
            context.go('/$p0');
            ref.read(providerNavigationIndex.notifier).state = p0;
          },
        ),
        separatorBuilder: (context, index) => const Divider(
          color: AppColors.lightBlue,
          height: 1,
          endIndent: 16,
          indent: 16,
        ),
      ),
    );
  }
}

class _DrawerListItem extends StatelessWidget {
  const _DrawerListItem({
    Key? key,
    required this.item,
    required this.url,
    this.onTap,
  }) : super(key: key);
  final DrawerItem item;
  final String url;
  final void Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Material(
        color: url == item.url ? AppColors.yellowColor : AppColors.darkBlue,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () => onTap!(item.url),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              item.name,
              style: const TextStyle(
                color: AppColors.lightTextColor,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
