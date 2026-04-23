import 'dart:ui';

import 'package:ai_skincare/core/constents.dart';
import 'package:ai_skincare/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<String> tabs = ["All", "Acne", "Dry", "Oily", "Sensitive"];
  PageController _controller = PageController(viewportFraction: 0.75);
  double currentPage = 0;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TOP APPBAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.asset("assets/icons/hamburger.png", width: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 8,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.asset(
                          "assets/icons/notification.png",
                          width: 20,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/woman.jpg",
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: defaultPadding),

              // BIG TEXT
              Text(
                "Understand Your\nSkin with AI",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: defaultPadding),

              // PROGRESS
              Container(
                padding: EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  color: Color(0xffE8FFE0),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(defaultPadding),
                      decoration: BoxDecoration(
                        color: Color(0xffDBF0D4),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Image.asset("assets/icons/leaf.png", width: 30),
                    ),
                    SizedBox(width: defaultPadding),
                    Text(
                      "Daily Routine",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Spacer(),

                    // CIRCLE PROGRESS
                    SizedBox(
                      width: 65,
                      height: 65,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // 🔹 Outer soft circle
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffE8FFE0),
                            ),
                          ),

                          // 🔹 Progress circle with spacing
                          SizedBox(
                            width: 65,
                            height: 65,
                            child: CircularProgressIndicator(
                              value: 0.8,
                              strokeWidth: 6,
                              strokeCap: StrokeCap.round,
                              backgroundColor: Colors.transparent,
                              valueColor: AlwaysStoppedAnimation(
                                Color(0xff4caf50),
                              ),
                            ),
                          ),

                          // 🔹 Inner circle (creates spacing effect)
                          Container(
                            width: 50,
                            height: 50,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 5,
                                color: Color(0xffDBF0D4),
                              ),
                              color: Colors.transparent,
                            ),
                          ),

                          // 🔹 Percentage text
                          Text(
                            "40%",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: defaultPadding),

              // HORIZONTAL TABS
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tabs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: _buildTab(
                        tabs[index],
                        isSelected: selectedIndex == index,
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: defaultPadding),
              SizedBox(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ProductCard(
                      image: "assets/images/prod_1.jpg",
                      title: "Kammi Botanical\nGlow Serum",
                      price: "₹48",
                    ),
                    ProductCard(
                      image: "assets/images/prod_2.jpg",
                      title: "Skin1004\nMadagascar",
                      price: "₹65",
                    ),
                    ProductCard(
                      image: "assets/images/prod_1.jpg",
                      title: "Vitamin C\nBright Serum",
                      price: "₹72",
                    ),
                  ],
                ),
              ),

              SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title, {bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
