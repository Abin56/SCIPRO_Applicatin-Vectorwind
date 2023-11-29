import 'package:flutter/material.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';
import 'package:scipro_application/view/widgets/back_container/back_container.dart';

customShowDilogBox(
    {required BuildContext context,
    required String title,
    required List<Widget> children,
    String? actiontext,
    required bool doyouwantActionButton,
    void Function()? actiononTapfuction}) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GooglePoppinsWidgets(
                  text: title, fontsize: 13, fontWeight: FontWeight.w600),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: BackButtonContainerWidget(),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: children,
            ),
          ),
          actions: doyouwantActionButton == true
              ? <Widget>[
                  GestureDetector(
                    onTap: actiononTapfuction,
                    child: Container(
                      height: 40,
                      width: 250,
                      decoration: const BoxDecoration(
                        color: themeColorBlue,
                      ),
                      child: Center(
                        child: GooglePoppinsWidgets(
                            text: actiontext ?? 'ok',
                            color: cWhite,
                            fontsize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ]
              : null);
    },
  );
}
