import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemo_dialysis/src/infrastructure/routes/route_names.dart';

import '../infrastructure/utils/constants.dart';
import 'button_with_icon.dart';
import 'text_button.dart';

class CustomScaffold extends StatefulWidget {
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
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  bool showMenu = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: showMenu ? _appBarWithBorder(context) : _appBarBody(context),
        body: _body(),
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        floatingActionButton: widget.hasFloatingActionButton!
            ? CustomButtonWithIcon(
                icon: CupertinoIcons.speaker_2_fill,
                action: () {
                  //   TODO: action in mute button
                },
                color: Constants.whiteColor,
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      );

  PreferredSizeWidget _appBarWithBorder(final BuildContext context) =>
      PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
          ),
          child: _appBarBody(context),
        ),
      );

  AppBar _appBarBody(BuildContext context) => AppBar(
        toolbarHeight: 100,
        backgroundColor: Constants.backgroundColor,
        automaticallyImplyLeading: false,
        leadingWidth: Constants.width(context, fraction: 2),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              widget.action1 ?? const SizedBox.shrink(),
              Constants.mediumHorizontalSpacer,
              widget.action2 ?? const SizedBox.shrink(),
              Constants.mediumHorizontalSpacer,
              widget.action3 ?? const SizedBox.shrink(),
            ],
          ),
        ),
        actions: [
          if (showMenu) ..._appBarMenuItems(),
          CustomButtonWithIcon(
            icon: Icons.menu,
            action: () async {
              await Future.delayed(
                const Duration(
                  milliseconds: 150,
                ),
              );
              setState(() {
                showMenu = !showMenu;
              });
            },
          ),
        ],
        centerTitle: true,
      );

  List<Widget> _appBarMenuItems() => [
        _appBarMenu(
          action: () {},
          text: 'درمان',
        ),
        _appBarMenu(
          action: () {},
          text: 'پشتیبانی',
        ),
        _appBarMenu(
          action: () {},
          text: 'خدمات پرستاری',
        ),
        _appBarMenu(
          action: () {},
          text: 'مشاوره پزشک',
        ),
        _appBarMenu(
          action: () => Get.toNamed(HemoDialysisRouteNames.storePage.uri),
          text: 'فروشگاه',
        ),
      ];

  Widget _appBarMenu({
    required final void Function() action,
    required final text,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Constants.mediumSpace,
        ),
        child: CustomTextButton(
          action: action,
          text: text,
          style: const TextStyle(
            color: Constants.buttonSecondaryColor,
            fontFamily: Constants.iranSansFont,
            fontWeight: FontWeight.w300,
          ),
        ),
      );

  Widget _body() => DecoratedBox(
        decoration: const BoxDecoration(
          color: Constants.backgroundColor,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) => Center(
            child: SizedBox(
              height: constraints.maxHeight * 0.90,
              width: constraints.maxWidth * 0.95,
              child: widget.body,
            ),
          ),
        ),
      );
}
