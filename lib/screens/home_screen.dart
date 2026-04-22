import 'dart:ui';

import 'package:ai_skincare/core/constents.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<String> tabs = ["All", "Acne", "Dry", "Oily", "Sensitive"];

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

              Expanded(
                child: Container(
                  padding: EdgeInsets.all(defaultPadding),
                  constraints: BoxConstraints(maxHeight: 400),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kammi Botanical\nGlow serum",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.all(defaultPadding),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.favorite, color: Colors.red),
                          ),
                        ],
                      ),
                      Spacer(),

                      Stack(
                        children: [
                          /// BLUR LAYER WITH GRADIENT
                          Positioned.fill(
                            child: ClipRect(
                              child: ShaderMask(
                                shaderCallback: (rect) {
                                  return const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.transparent,
                                      Colors.black54,
                                      Colors.black,
                                    ],
                                    stops: [0.0, 0.6, 0.8, 1.0],
                                  ).createShader(rect);
                                },
                                blendMode: BlendMode.dstIn,
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 18,
                                    sigmaY: 18,
                                  ),
                                  child: Container(
                                    color: Colors.white.withValues(alpha: 0.08),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          /// CONTENT (NOT AFFECTED BY BLUR MASK)
                          /// GLASS BUTTON
                          SizedBox(
                            width: double.infinity,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.4),
                                  width: 1.2,
                                ),
                                color: Colors.white.withValues(alpha: 0.15),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Kammi Serum Price",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),

                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        "48rs",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
