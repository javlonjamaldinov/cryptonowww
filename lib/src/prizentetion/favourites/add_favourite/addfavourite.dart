import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddFavourite extends StatefulWidget {
  const AddFavourite({super.key});

  @override
  State<AddFavourite> createState() => _AddFavouriteState();
}

class _AddFavouriteState extends State<AddFavourite>
    with SingleTickerProviderStateMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController linkController = TextEditingController();

  late TabController _tabController;

  bool get isButtonEnabled =>
      nameController.text.isNotEmpty && linkController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    nameController.addListener(() => setState(() {}));
    linkController.addListener(() => setState(() {}));
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    nameController.dispose();
    linkController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff04091D),
      appBar: AppBar(
        backgroundColor: const Color(0xff04091D),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Colors.white),
        ),
        title: Text('Add Favourite',
            style: TextStyle(
                color: Colors.white,
                fontSize: 19.sp,
                fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Container(
              height: 8.h,
              decoration: BoxDecoration(
                color: const Color(0xff121829),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: TabBar(
                  controller: _tabController,
                  dividerHeight: 0,
                  indicator: BoxDecoration(
                    color: const Color(0xff4664FF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    _buildTab('Exchanger', 'assets/svg/svg56.svg'),
                    _buildTab('User', 'assets/svg/svg55.svg'),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildForm(),
                _buildForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, String iconPath) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath),
          SizedBox(width: 2.w),
          Text(title, style: TextStyle(fontSize: 14.sp)),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 1.h),
          _buildTextField(nameController, 'Name here'),
          SizedBox(height: 2.h),
          Text(
            'Address',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 1.h),
          _buildTextField(linkController, 'address here'),
          const Spacer(),
          GestureDetector(
            onTap: isButtonEnabled
                ? () => Navigator.pop(context, {
                      'name': nameController.text,
                      'link': linkController.text,
                      'type': _tabController.index == 0 ? 'Exchanger' : 'User',
                    })
                : null,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.sp),
              child: Container(
                width: double.infinity,
                height: 8.h,
                decoration: BoxDecoration(
                  color: isButtonEnabled
                      ? const Color(0xff4664FF)
                      : const Color(0xffAAAAAA),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text('Add Favourite',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
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
      ),
    );
  }
}
