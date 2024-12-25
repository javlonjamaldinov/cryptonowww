
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class addfavorite2 extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController? addressController;
  final TextEditingController? linkController;
  final bool isButtonEnabled;

  const addfavorite2({
    required this.nameController,
    this.addressController,
    this.linkController,
    required this.isButtonEnabled,
    super.key,
  });

  Widget _buildTextField(
      String label, TextEditingController controller, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              color: Colors.white54,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 1.h),
        TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xff0A1336),
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.white54,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  const BorderSide(color: Color(0xff4664FF), width: 2.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddButton(bool isEnabled) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Container(
        width: double.infinity,
        height: 8.h,
        decoration: BoxDecoration(
          color: isEnabled ? const Color(0xff4664FF) : const Color(0xffAAAAAA),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            'Add Favourite',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField('Name', nameController, 'Name here'),
          SizedBox(height: 2.h),
          if (addressController != null)
            _buildTextField('Address', addressController!, 'Address here'),
          if (linkController != null)
            _buildTextField('Link', linkController!, 'Link here'),
          const Spacer(),
          _buildAddButton(isButtonEnabled),
        ],
      ),
    );
  }
}
