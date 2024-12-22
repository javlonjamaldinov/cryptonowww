import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NameDescriptionTab extends StatefulWidget {
  const NameDescriptionTab({super.key});

  @override
  _NameDescriptionTabState createState() => _NameDescriptionTabState();
}

class _NameDescriptionTabState extends State<NameDescriptionTab> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool _isFormValid = false;

  void _validateForm() {
    setState(() {
      _isFormValid = _nameController.text.isNotEmpty &&
          _descriptionController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _onAddFavourite() {
    if (_isFormValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Favourite added: ${_nameController.text}',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please fill in all fields',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: TextStyle(color: Colors.white54, fontSize: 14.sp),
          ),
          SizedBox(height: 1.h),
          TextField(
            controller: _nameController,
            onChanged: (value) => _validateForm(),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xff0A1336),
              hintText: 'Enter name',
              hintStyle: TextStyle(
                color: Colors.white54,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            'Description',
            style: TextStyle(color: Colors.white54, fontSize: 14.sp),
          ),
          SizedBox(height: 2.h),
          TextField(
            controller: _descriptionController,
            onChanged: (value) => _validateForm(),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xff0A1336),
              hintText: 'Address here',
              hintStyle: TextStyle(
                color: Colors.white54,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const Spacer(),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.only(bottom: 20.sp),
            child: GestureDetector(
              onTap: _onAddFavourite,
              child: Container(
                width: double.infinity,
                height: 8.h,
                decoration: BoxDecoration(
                  color: _isFormValid ? Colors.green : const Color(0xffAAAAAA),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    'Add favourite',
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
