import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyOrdersWidget extends StatelessWidget {
  const EmptyOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.data_saver_on, size: 120.sp, color: Colors.brown),
          SizedBox(height: 16.h),
          Text(
            'No pending orders yet\nAll caught up!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54, fontSize: 20.sp),
          ),
        ],
      ),
    );
  }
}
