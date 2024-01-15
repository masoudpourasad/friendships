import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key, required this.onPickImage});

  final void Function(File pickedImage) onPickImage;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;
  bool _isImagePickerActive = false;

  void _pickImage() async {
    if (_isImagePickerActive) {
      // If the image picker is already active, do nothing.
      return;
    }

    try {
      setState(() {
        _isImagePickerActive = true;
      });

      final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        maxWidth: 150,
      );

      if (pickedImage == null) {
        return;
      }

      setState(() {
        _pickedImageFile = File(pickedImage.path);
      });

      widget.onPickImage(_pickedImageFile!);
    } finally {
      setState(() {
        _isImagePickerActive = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage:
              _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon:
              Icon(Icons.image, color: Theme.of(context).copyWith().cardColor),
          label: Text(
            'Add Image',
            style: Theme.of(context).textTheme.copyWith().labelMedium,
          ),
        ),
      ],
    );
  }
}














// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class UserImagePicker extends StatefulWidget {
//   const UserImagePicker({super.key, required this.onPickImage});

//   final void Function(File pickedImage) onPickImage;

//   @override
//   State<UserImagePicker> createState() => _UserImagePickerState();
// }

// class _UserImagePickerState extends State<UserImagePicker> {
//   File? _pickedImageFile;

//   void _pickImage() async {
//     final pickedImage = await ImagePicker().pickImage(
//       source: ImageSource.camera,
//       imageQuality: 50,
//       maxWidth: 150,
//     );
//     if (pickedImage == null) {
//       return;
//     }

//     setState(() {
//       _pickedImageFile = File(pickedImage.path);
//     });

//     widget.onPickImage(_pickedImageFile!);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 40,
//           backgroundColor: Colors.grey,
//           foregroundImage:
//               _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
//         ),
//         TextButton.icon(
//           onPressed: _pickImage,
//           icon: const Icon(Icons.image),
//           label: Text(
//             'Add Image',
//             style: TextStyle(color: Theme.of(context).colorScheme.primary),
//           ),
//         ),
//       ],
//     );
//   }
// }
