
import 'package:flutter/material.dart';
import 'package:rcubed/themes/rcubed_theme.dart';

class EnterpriseApplications extends StatelessWidget{
  const EnterpriseApplications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top:50),
      child: Column(
        verticalDirection: VerticalDirection.up,
        children: [
          const _ExpansionTile(title: "Enterprise Analysis", description: info),
          const _ExpansionTile(title: "Corporate Performance Management", description: info),
          const _ExpansionTile(title: "Enterprise Resource Planning", description: info),
          const _ExpansionTile(title: "Master Data Governance", description: info),
          const _ExpansionTile(title: "System Diagnostic & Strategy", description: info),
          const _ExpansionTile(title: "System Select", description: info),
          const _ExpansionTile(title: "Summary", description: info, initiallyExpanded: true,),

          //Divider(color: Colors.black, thickness: 2,),
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: Container(height: 50, child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Center(
                child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(offset: const Offset(0,5), blurRadius: 10, color: Colors.black.withOpacity(0.6))],
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      color: RCubedTheme.offPrimary,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 3, bottom: 3),
                      child: Text(heading, style: TextStyle(color: Colors.white, fontSize: 25),),
                    ),
                ),
              ),
            ),
              alignment: Alignment.centerLeft,
            ),
          ),
        ],
      ),
    );
  }
}

const heading = "Enterprise Applications";

const info = ''' 
  R-CUBED provides solutions across the end-to-end application journey. We maximize potential by shaping your digital strategy with deliberate
  execution that fuels transformation and maximizes potential.
 ''';


class _ExpansionTile extends StatelessWidget{
  final String title, description;
  final bool initiallyExpanded;
  const _ExpansionTile({required this.title, required this.description, this.initiallyExpanded=false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      elevation: 5,
      color: Colors.transparent,
      child: ExpansionTile(
        title: Text(title),
        initiallyExpanded: initiallyExpanded,
        collapsedIconColor: Colors.grey,
        collapsedTextColor: Colors.white,
        collapsedBackgroundColor: Palette.darkGrey.withOpacity(0.95),
        backgroundColor: Colors.white.withOpacity(0.95),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(description, style: const TextStyle(color: Colors.black,),),
          )
        ],
      ),
    );
  }

}