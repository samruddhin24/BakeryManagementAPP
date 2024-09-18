import 'dart:io';
import 'package:bakery_app/constants/constants.dart';
import 'package:bakery_app/screens/edit_profile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EditProfileImagePicker extends StatefulWidget {
  final File? selectedImage;
  final String defaultImage;
  final Function(File?) onImageSelected;

  const EditProfileImagePicker(
      {super.key,
      required this.selectedImage,
      required this.defaultImage,
      required this.onImageSelected});

  @override
  State<EditProfileImagePicker> createState() => _EditProfileImagePickerState();
}

class _EditProfileImagePickerState extends State<EditProfileImagePicker> {
  final EditProfileController controller = Get.find<EditProfileController>(tag: ControllerTags.editProfileController);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: widget.selectedImage != null
                ? FileImage(widget.selectedImage!)
                : AssetImage(widget.defaultImage) as ImageProvider,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheet(
                      onClosing: () {},
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.photo_library_outlined),
                              title: const Text(
                                'Pick photo from gallery',
                              ),
                              onTap: () async {
                                File? image = await controller.pickImageFromGallery();
                                widget.onImageSelected(image);
                                Get.back();
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.camera_alt_outlined),
                              title: const Text(
                                'Capture Photo',
                              ),
                              onTap: () async {
                                File? image = await controller.pickImageFromCamera();
                                widget.onImageSelected(image);
                                Get.back();
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.delete_outline),
                              title: const Text(
                                'Remove Image',
                              ),
                              onTap: () async {
                                widget.onImageSelected(null);
                                Get.back();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.darkGrey,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
