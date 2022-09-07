import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/pages/home/what_we_do/what_we_do.dart';
import 'package:rcubed/providers/custom_appbar_provider.dart';

import '../../themes/rcubed_theme.dart';

class CustomAppbar extends StatelessWidget{
  final String title;
  final List<Widget> menuButtons;
  final Widget body;
  final GlobalKey navBarHeightKey;
  final GlobalKey<NestedScrollViewState> nestedScrollKey;

  const CustomAppbar(
      {
        required this.title,
        required this.navBarHeightKey,
        required this.nestedScrollKey,
        required this.menuButtons,
        required this.body,
        Key? key,
      }) : super(key: key);

  double getHeight(BuildContext context){
    //listen(context); -------------------------------------------------
    //return Provider.of<CustomAppBarProvider>(context, listen: false).updateHeight(this);
    return 0;
  }

  void listen(BuildContext context){
    WidgetsBinding.instance.addPostFrameCallback((_) {
        nestedScrollKey.currentState!.outerController.addListener(() {
            Provider.of<CustomAppBarProvider>(context, listen: false).isExpanded(this);
        });
    });
  }

  void scrollToIndex(GlobalKey key){
    nestedScrollKey.currentState!.innerController.position.ensureVisible(key.currentContext!.findRenderObject()!, duration: const Duration(seconds: 1), alignment: 0);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NestedScrollView(
        key: nestedScrollKey,
        headerSliverBuilder: (context, innerBoxScrolled){
          return [
            SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverSafeArea(
                  sliver: SliverAppBar(
                    title: Center(child: Text(title, style: const TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold))),
                    pinned: true,
                    forceElevated: true,
                    elevation: 5,
                    backgroundColor: Colors.white,
                    expandedHeight: Provider.of<CustomAppBarProvider>(context).updateHeight(this),
                    actions: [Container()],
                    flexibleSpace: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Container(
                        decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.white, Palette.offWhite], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                        child: Align(
                          key: navBarHeightKey,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: kToolbarHeight+10),
                                child: Divider(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Wrap(
                                  alignment: WrapAlignment.spaceEvenly,
                                  children: menuButtons,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            )
          ];
        },
        body: Stack(
          children: [
            body,
            // IgnorePointer(
            //   child: AnimatedOpacity(
            //     opacity: Provider.of<CustomAppBarProvider>(context).isExpanded(this)? 1:0,
            //     duration: const Duration(milliseconds: 400),
            //     child: Container(color: Colors.black.withOpacity(0.6),),
            //   ),
            // ),
          ],
        ),
    );
  }

}

class MenuButton extends StatelessWidget{
  final String title;
  final Function(GlobalKey) scrollToIndex;
  final GlobalKey pageKey;
  const MenuButton({required this.title, required this.pageKey, required this.scrollToIndex, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        onTap: (){
          scrollToIndex(pageKey);
        },
        child: SizedBox(
            width: 200,
            height: 50,
            child: Center(
                child: Text(title,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold), )
            )
        )
    );
  }
}