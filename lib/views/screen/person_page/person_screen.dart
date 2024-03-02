import 'package:bds_nv/my_theme.dart';
import 'package:bds_nv/views/screen/member_detail.dart';
import 'package:bds_nv/views/screen/ownerList.dart';
import 'package:bds_nv/views/screen/rented_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: MyTheme.light_grey,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TabBar(
                            unselectedLabelColor: MyTheme.font_grey,
                            labelColor: MyTheme.white,
                            indicatorColor: Colors.white,
                            controller: _tabcontroller,
                            indicatorWeight: 2,
                            indicator: BoxDecoration(
                                color: MyTheme.accent_color,
                                borderRadius: BorderRadius.circular(20)),
                            tabs: [
                              Tab(
                                text: "Người thuê",
                              ),
                              Tab(
                                text: "Quản trị",
                              ),
                              Tab(
                                text: "Chủ nhà",
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(controller: _tabcontroller, children: [
                  RentedDetailScreen(),
                  MemberDetailScreen(),
                  OwnerListScreen()
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
