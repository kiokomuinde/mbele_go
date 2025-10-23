import 'package:flutter/material.dart';
import 'package:mbele_go/theme/colors.dart';

class CustomNavbar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDesktop;
  const CustomNavbar({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MbeleColors.backgroundLight.withOpacity(0.95),
      elevation: 2,
      toolbarHeight: 80,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.directions_car_filled, color: MbeleColors.primaryOrange, size: 30),
          const SizedBox(width: 8),
          const Text(
            'MbeleGo Cars',
            style: TextStyle(
              color: MbeleColors.textDark,
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
          ),
        ],
      ),
      actions: isDesktop ? [
        _AppBarButton(title: 'Buy Cars', onPressed: () {}),
        _AppBarButton(title: 'Sell Vehicle', onPressed: () {}),
        _AppBarButton(title: 'Financing', onPressed: () {}),
        const SizedBox(width: 20),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
          child: FilledButton(
            onPressed: () {
              // Action: Firebase Auth for user/dealer login
            },
            style: FilledButton.styleFrom(
              backgroundColor: MbeleColors.highlightPink,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text(
              'Sign In',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 20),
      ] : [
        IconButton(
          icon: const Icon(Icons.menu, color: MbeleColors.textDark),
          onPressed: () {
            // Mobile Menu Drawer logic
          },
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const _AppBarButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          color: MbeleColors.textDark,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}