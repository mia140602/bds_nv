import 'package:bds_nv/my_theme.dart';
import 'package:bds_nv/views/screen/leave_request_list.dart';
import 'package:bds_nv/views/screen/salary_detail.dart';
import 'package:bds_nv/views/screen/salary_report.dart';
import 'package:bds_nv/views/screen/visitor_report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.light_grey.withOpacity(0.3),
      appBar: buildAppBar(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return LeaveRequestScreen();
                    }));
                  },
                  child: buildProfileItem1(
                      title: "Đơn xin nghỉ",
                      des: "Xem danh sách đơn xin nghỉ",
                      imgpath: "leave.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return SalaryDetailScreen();
                    }));
                  },
                  child: buildProfileItem1(
                      title: "Bảng kê lương",
                      des: "Xem chi tiết về lương",
                      imgpath: "money.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  child: ExpansionTile(
                    title: buildProfileItem1(
                        title: "Báo cáo",
                        des: "Truy cập và tạo báo cáo",
                        imgpath: "report.png"),
                    children: [
                      ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: MyTheme.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Image.asset(
                                        "assets/report_icon.png",
                                        width: 30,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Báo cáo lương"),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  size: 34,
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SalaryReportScreen();
                            }));
                          }),
                      ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: MyTheme.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Image.asset(
                                        "assets/report_visitor.png",
                                        width: 30,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Báo cáo khách"),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  size: 34,
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return VisitorReportScreen();
                            }));
                          }),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: buildProfileItem1(
                    title: "Thông tin cá nhân/Đăng xuất",
                    des: "Thông tin và đăng xuất tài khoản",
                    imgpath: "profile.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem({required String title, required Icon icon}) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: icon),
          Padding(
            padding: EdgeInsets.all(4),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: MyTheme.light_grey.withOpacity(0.3),
      automaticallyImplyLeading: false,
      title: Text(
        "Tài khoản",
        style: TextStyle(
            fontSize: 18,
            color: MyTheme.dark_font_grey,
            fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      elevation: 0.0,
      titleSpacing: 0,
    );
  }

  Widget buildProfileItem1(
      {required String title, required String des, required String imgpath}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: MyTheme.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                des,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: MyTheme.font_grey),
              )
            ],
          ),
          Image.asset("assets/" + imgpath),
        ],
      ),
    );
  }
}
