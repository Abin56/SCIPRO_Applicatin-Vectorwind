import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';

class CircleAvatharImageSelectionWidget extends StatefulWidget {
  const CircleAvatharImageSelectionWidget({
    super.key,
  });

  @override
  State<CircleAvatharImageSelectionWidget> createState() => _CircleAvatharImageSelectionWidgetState();
}

class _CircleAvatharImageSelectionWidgetState extends State<CircleAvatharImageSelectionWidget> {
  bool isImageSelected = false;
  File? imageFile;
  _pickImagefromGallery() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          imageFile = File(pickedImage.path);
          isImageSelected = true;
        });
      } else {
        print('User didnt pick any image.');
      }
    } catch (e) {
      print(e.toString());
    }
  }
 
  _pickImagefromCamera() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        setState(() {
          imageFile = File(pickedImage.path);
          isImageSelected = true;
        });
      } else {
        print('User didnt pick any image.');
      }
    } catch (e) {
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          //bg img removed
          
          radius: 70.r,
          child: Stack(
            children: [
              InkWell(
                onTap: () async {},
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor:
                        const Color.fromARGB(255, 52, 50, 50),
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt_outlined),
                      color: Colors.white,
                      onPressed: () async {
                         showbottomsheetWidget(context);();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Future<void> showbottomsheetWidget(BuildContext context) {
    return showModalBottomSheet<void>(
         
          context: context,
          builder: (BuildContext context) {
           
            return  SizedBox(
              height: 200.h,
              child: Center(
                child: Column(
                  
                  children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.h),
                          child: const Icon(Icons.close),
                          
                        
                        ),
                      )
                    ],) ,
                     Padding(
                       padding:  EdgeInsets.only(top: 20.h),
                       child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap:(){
                               _pickImagefromGallery();
                            },
                            child: Column(
                              children: [
                                Icon(Icons.image,size: 40.h,),
                                GooglePoppinsWidgets(text: 'Gallery', fontsize: 19.sp)
                              ],
                            ),
                          ),

                     
                        GestureDetector(
                          onTap:(){_pickImagefromCamera();},
                          child: Column(
                            children: [
                              Icon(Icons.camera_alt_outlined,size: 40.h),
                              GooglePoppinsWidgets(text: 'Camera', fontsize: 19.sp)
                            ],
                          ),
                        ),
                       
                                             ],),
                     )
                  ],
                ),
              ),
            );
          },
        );
  }
}

