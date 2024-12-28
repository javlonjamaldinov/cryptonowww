import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../prizentation.dart';

class Addfavourite extends StatefulWidget {
  const Addfavourite({super.key});

  @override
  _AddfavouriteState createState() => _AddfavouriteState();
}

class _AddfavouriteState extends State<Addfavourite> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  bool _isNameFilled = false;
  bool _isAddressFilled = false;
  bool _isLinkFilled = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(
        () => setState(() => _isNameFilled = _nameController.text.isNotEmpty));
    _addressController.addListener(() =>
        setState(() => _isAddressFilled = _addressController.text.isNotEmpty));
    _linkController.addListener(
        () => setState(() => _isLinkFilled = _linkController.text.isNotEmpty));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xff04091D),
        appBar: AppBar(
          backgroundColor: const Color(0xff04091D),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:
                const Icon(Icons.arrow_back_ios_new_sharp, color: Colors.white),
          ),
          title: Text(
            'Add Favourite',
            style: TextStyle(
                color: Colors.white,
                fontSize: 19.sp,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: const TabSelector(),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Addfavorite2(
                    nameController: _nameController,
                    addressController: _addressController,
                    isButtonEnabled: _isNameFilled && _isAddressFilled,
                  ),
                  Addfavorite2(
                    nameController: _nameController,
                    linkController: _linkController,
                    isButtonEnabled: _isNameFilled && _isLinkFilled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabSelector extends StatelessWidget {
  const TabSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      decoration: BoxDecoration(
        color: const Color(0xff121829),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: TabBar(
          dividerHeight: 0,
          indicator: BoxDecoration(
            color: const Color(0xff4664FF),
            borderRadius: BorderRadius.circular(25),
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svg/svg56.svg'),
                  SizedBox(width: 2.w),
                  Text('Exchanger', style: TextStyle(fontSize: 14.sp)),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svg/svg55.svg'),
                  SizedBox(width: 2.w),
                  Text('User', style: TextStyle(fontSize: 14.sp)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
