import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hemo_dialysis/src/components/icon_button.dart';

import '../infrastructure/utils/constants.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.onBackTap,
    this.showEndDrawer,
    this.resizeToAvoidBottomInset,
    this.action1,
    this.action2,
    this.action3,
    this.hasFloatingActionButton = false,
  });

  final bool? showEndDrawer;
  final bool? hasFloatingActionButton;
  final bool? resizeToAvoidBottomInset;
  final Function()? onBackTap;
  final Widget body;
  final Widget? action1;
  final Widget? action2;
  final Widget? action3;

  @override
  Widget build(BuildContext context) => Scaffold(
        endDrawer: showEndDrawer ?? false ? _endDrawerWidget() : null,
        appBar: _appBar(context),
        body: _body(),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        floatingActionButton: hasFloatingActionButton!
            ? CustomIconButton(
                icon: CupertinoIcons.speaker_2_fill,
                action: () {
                  //   TODO: action in mute button
                },
                color: Constants.whiteColor,
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      );

  Widget _endDrawerWidget() => const Drawer(
        backgroundColor: Constants.backgroundColor,
        child: Placeholder(),
      );

  AppBar _appBar(final BuildContext context) => AppBar(
        toolbarHeight: 100,
        backgroundColor: Constants.backgroundColor,
        automaticallyImplyLeading: false,
        leadingWidth: MediaQuery.of(context).size.width / 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              action1 ?? const SizedBox.shrink(),
              Constants.mediumHorizontalSpacer,
              action2 ?? const SizedBox.shrink(),
              Constants.mediumHorizontalSpacer,
              action3 ?? const SizedBox.shrink(),
            ],
          ),
        ),
        actions: [if (showEndDrawer ?? false) _endDrawerBuilder()],
        centerTitle: true,
      );

  Widget _endDrawerBuilder() => Builder(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(
            Constants.xLargeSpace,
          ),
          child: CustomIconButton(
            icon: Icons.menu,
            action: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
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
