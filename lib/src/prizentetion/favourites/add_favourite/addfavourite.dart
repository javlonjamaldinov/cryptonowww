import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../ui/tabbar_code/tabbarcode.dart';

class AddFavourite extends StatelessWidget {
  const AddFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xff04091D),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff04091D),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
          ),
          title: Text(
            'Add Favourite',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: const Column(
          children: [
            Tabbarcode(),
            Expanded(
              child: TabBarView(
                children: [
                  NameDescriptionTab(),
                  AnotherTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NameDescriptionTab extends StatelessWidget {
  const NameDescriptionTab({super.key});

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
            child: Container(
              width: double.infinity,
              height: 8.h,
              decoration: BoxDecoration(
                color: const Color(0xffAAAAAA),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnotherTab extends StatelessWidget {
  const AnotherTab({super.key});

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
            child: Container(
              width: double.infinity,
              height: 8.h,
              decoration: BoxDecoration(
                color: const Color(0xffAAAAAA),
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
        ],
      ),
    );
  }
}
