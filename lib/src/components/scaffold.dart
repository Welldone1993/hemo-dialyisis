import 'package:flutter/material.dart';

import '../infrastructure/utils/constants.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.pageTitle,
    required this.body,
    this.onBackTap,
    this.showEndDrawer,
    this.resizeToAvoidBottomInset,
  });

  final String pageTitle;
  final bool? showEndDrawer;
  final bool? resizeToAvoidBottomInset;
  final Function()? onBackTap;
  final Widget body;

  @override
  Widget build(BuildContext context) => Scaffold(
        endDrawer: showEndDrawer ?? false ? _endDrawerWidget() : null,
        appBar: _appBar(),
        body: _body(),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      );

  Widget _endDrawerWidget() => const Drawer(
        backgroundColor: Constants.backgroundColor,
        child: Placeholder(),
      );

  AppBar _appBar() => AppBar(
        backgroundColor: Constants.appBarColor,
        automaticallyImplyLeading: false,
        leading: onBackTap != null
            ? IconButton(
                onPressed: onBackTap!,
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )
            : null,
        actions: [if (showEndDrawer ?? false) _endDrawerBuilder()],
        title: Text(
          pageTitle,
          style: Constants.boldTextStyle,
        ),
        centerTitle: true,
      );

  Widget _endDrawerBuilder() => Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      );

  Widget _body() => _mainBody();

  Widget _mainBody() => DecoratedBox(
        decoration: const BoxDecoration(
          color: Constants.backgroundColor,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) => Align(
            alignment: Alignment.topCenter,
            child: body,
          ),
        ),
      );
}
