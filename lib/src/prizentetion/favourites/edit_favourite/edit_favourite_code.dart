
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditFavouriteCode extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController linkController;
  final bool isCopied;
  final Function(String) copyToClipboard;

  const EditFavouriteCode({
    super.key,
    required this.nameController,
    required this.linkController,
    required this.isCopied,
    required this.copyToClipboard,
  });

  @override
  Widget build(BuildContext context) {
    final bool isFormValid =
        nameController.text.isNotEmpty && linkController.text.isNotEmpty;

    return Padding(
      padding: EdgeInsets.all(15.sp),
      child: Column(
        children: [
          _buildTextField(
            controller: nameController,
            hintText: "Name",
          ),
          SizedBox(height: 2.h),
          _buildTextField(
            controller: linkController,
            hintText: "Link",
            suffixIcon: GestureDetector(
              onTap: () => copyToClipboard(linkController.text),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  'assets/svg/svg59.svg',
                  color: const Color(0xff4674FF),
                ),
              ),
            ),
          ),
          const Spacer(),
          if (isCopied) _buildCopyConfirmation(),
          SizedBox(height: 3.h),
          _buildSaveButton(context, isFormValid),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xff0A1336),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white54,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }

  Widget _buildCopyConfirmation() {
    return Container(
      height: 5.h,
      width: 70.w,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/svg60.svg',
            height: 2.h,
            width: 2.w,
          ),
          SizedBox(width: 2.w),
          Text(
            "Address copied successfully",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context, bool isFormValid) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.sp),
      child: ElevatedButton(
        onPressed: isFormValid
            ? () {
                Navigator.pop(context, {
                  'name': nameController.text,
                  'link': linkController.text,
                });
              }
            : null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return const Color(0xffAAAAAA);
            }
            return const Color(0xff4674FF);
          }),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          minimumSize: WidgetStateProperty.all<Size>(
            Size(double.infinity, 8.h),
          ),
        ),
        child: Text(
          'Save Changes',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
