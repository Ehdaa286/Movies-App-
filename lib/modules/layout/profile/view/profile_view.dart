import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:route_movies_app/core/routes/pages_route_name.dart';
import 'package:route_movies_app/core/theme/color_palette.dart';
import 'package:route_movies_app/main.dart';
import 'package:route_movies_app/modules/layout/profile/view/widgets/history_widget.dart';
import 'package:route_movies_app/modules/layout/profile/view/widgets/wishlist_widget.dart';
import '../../../../core/widgets/custom_elevated_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final uid = FirebaseAuth.instance.currentUser!.uid;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorPalette.bgcolor,
        body: StreamBuilder<DocumentSnapshot>(
          stream:
              FirebaseFirestore.instance
                  .collection("users")
                  .doc(uid)
                  .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong"));
            }
            if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Center(child: Text("No user data found"));
            }

            final data = snapshot.data!.data() as Map<String, dynamic>? ?? {};
            String userName = data['name'] ?? 'Unknown';
            String? photoUrl = data['avatar'];

            return Column(
              children: [
                Container(
                  width: size.width,
                  color: ColorPalette.Textformfireldbg,
                  padding: const EdgeInsets.only(top: 40, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ✅ Row مع Flexible عشان منعملش overflow
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // صورة + اسم
                            Flexible(
                              flex: 2,
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child:
                                        photoUrl != null && photoUrl.isNotEmpty
                                            ? (photoUrl.startsWith("http")
                                                ? Image.network(
                                                  photoUrl,
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                )
                                                : Image.asset(
                                                  photoUrl,
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ))
                                            : Image.asset(
                                              "assets/images/profileImage.png",
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    userName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),

                            // Wish List
                            Expanded(
                              flex: 1,
                              child: StreamBuilder<QuerySnapshot>(
                                stream:
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(uid)
                                        .collection("favorites")
                                        .snapshots(),
                                builder: (context, snapshot) {
                                  final count = snapshot.data?.docs.length ?? 0;
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "$count",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      const Text(
                                        "Wish List",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),

                            // History
                            Expanded(
                              flex: 1,
                              child: StreamBuilder<QuerySnapshot>(
                                stream:
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(uid)
                                        .collection("history")
                                        .snapshots(),
                                builder: (context, snapshot) {
                                  final count = snapshot.data?.docs.length ?? 0;
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "$count",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      const Text(
                                        "History",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                height: 52,
                                child: CustomElevatedButton(
                                  title: 'Edit profile',
                                  titleSize: 18,
                                  bgColor: ColorPalette.primaryColor,
                                  titleColor: ColorPalette.black,
                                  borderRadius: 15,
                                  onTap: () {
                                    navigatorKey.currentState!.pushNamed(
                                      PagesRouteName.UpdateProfile,
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 52,
                                child: CustomElevatedButton(
                                  onTap: () {
                                    FirebaseAuth.instance.signOut();
                                    Navigator.pushReplacementNamed(
                                      context,
                                      PagesRouteName.signIn,
                                    );
                                  },
                                  title: 'Exit',
                                  titleSize: 18,
                                  titleColor: ColorPalette.white,
                                  bgColor: ColorPalette.red,
                                  suffixIcon: Icons.exit_to_app,
                                  borderRadius: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Tabs
                      TabBar(
                        indicatorColor: Colors.transparent,
                        labelColor: ColorPalette.primaryColor,
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            width: 4.0,
                            color: ColorPalette.primaryColor,
                          ),
                        ),
                        tabs: const [
                          Tab(
                            icon: Icon(
                              Icons.list,
                              color: ColorPalette.primaryColor,
                              size: 36,
                            ),
                            child: Text(
                              "Watch List",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Tab(
                            icon: Icon(
                              Icons.folder,
                              color: ColorPalette.primaryColor,
                              size: 36,
                            ),
                            child: Text(
                              "History",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: TabBarView(
                    children: const [
                      WishlistMoviesWidget(),
                      HistoryMoviesWidget(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
