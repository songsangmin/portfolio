import 'package:flutter/material.dart';

/// 스크롤 위치에 따라 자식 위젯을 뷰포트 진입 시 페이드 인, 이탈 시 페이드 아웃합니다.
class ScrollFadeWrapper extends StatefulWidget {
  const ScrollFadeWrapper({
    Key? key,
    required this.scrollController,
    required this.scrollContentKey,
    required this.child,
    this.animationDuration = const Duration(milliseconds: 180),
  }) : super(key: key);

  final ScrollController scrollController;
  final GlobalKey scrollContentKey;
  final Widget child;
  final Duration animationDuration;

  @override
  State<ScrollFadeWrapper> createState() => _ScrollFadeWrapperState();
}

class _ScrollFadeWrapperState extends State<ScrollFadeWrapper> {
  final GlobalKey _childKey = GlobalKey();
  // 기본 1.0으로 두어 레이아웃 전에도 콘텐츠가 보이게 함 (애니메이션은 스크롤 시 적용)
  double _opacity = 1.0;
  bool _listenerAttached = false;
  bool _updateScheduled = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _listenerAttached) return;
      _listenerAttached = true;
      widget.scrollController.addListener(_onScroll);
      _updateOpacity();
    });
  }

  @override
  void dispose() {
    if (_listenerAttached) {
      widget.scrollController.removeListener(_onScroll);
    }
    super.dispose();
  }

  void _onScroll() {
    // 프레임당 한 번만 갱신해서 무한 setState 방지
    if (_updateScheduled) return;
    _updateScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateScheduled = false;
      if (mounted) _updateOpacity();
    });
  }

  void _updateOpacity() {
    if (!mounted) return;
    final contentBox = widget.scrollContentKey.currentContext?.findRenderObject() as RenderBox?;
    if (contentBox == null || !contentBox.hasSize) return;

    final childBox = _childKey.currentContext?.findRenderObject() as RenderBox?;
    if (childBox == null || !childBox.hasSize) return;

    final scrollOffset = widget.scrollController.offset;
    final viewportHeight = widget.scrollController.position.viewportDimension;

    try {
      final childOffset = childBox.localToGlobal(Offset.zero, ancestor: contentBox);
      final cardY = childOffset.dy;
      final cardHeight = childBox.size.height;

      final viewportTop = scrollOffset;
      final viewportBottom = scrollOffset + viewportHeight;
      final cardTop = cardY;
      final cardBottom = cardY + cardHeight;

      final visibleTop = cardTop.clamp(viewportTop, viewportBottom);
      final visibleBottom = cardBottom.clamp(viewportTop, viewportBottom);
      final visibleHeight = (visibleBottom - visibleTop).clamp(0.0, cardHeight);
      final opacity = (visibleHeight / cardHeight).clamp(0.0, 1.0);

      if ((_opacity - opacity).abs() > 0.02 && mounted) {
        setState(() => _opacity = opacity);
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: widget.animationDuration,
      opacity: _opacity.clamp(0.0, 1.0),
      child: Container(
        key: _childKey,
        child: widget.child,
      ),
    );
  }
}
