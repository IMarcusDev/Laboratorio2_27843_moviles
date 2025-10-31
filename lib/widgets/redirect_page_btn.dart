import 'package:flutter/material.dart';

class RedirectPageBtn extends StatefulWidget {
  final String text;
  final String path;

  const RedirectPageBtn({super.key, required this.text, required this.path});

  @override
  State<RedirectPageBtn> createState() => _RedirectPageBtnState();
}

class _RedirectPageBtnState extends State<RedirectPageBtn> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, widget.path),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(
              colors: _isHovered
                  ? [
                      theme.colorScheme.primary.withValues(),
                      theme.colorScheme.secondary.withValues(),
                    ]
                  : [
                      theme.colorScheme.primary.withValues(),
                      theme.colorScheme.secondary.withValues(),
                    ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary.withValues(),
                blurRadius: _isHovered ? 12 : 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedScale(
                scale: _isHovered ? 1.05 : 1.0,
                duration: const Duration(milliseconds: 150),
                child: Text(
                  widget.text,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              AnimatedSlide(
                offset: _isHovered ? const Offset(0.05, 0) : Offset.zero,
                duration: const Duration(milliseconds: 150),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
