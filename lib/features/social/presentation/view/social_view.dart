// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:gluco/core/widgets/constants.dart';
// import 'package:gluco/features/social/presentation/manager/update_cubit/update_posts_cubit.dart';
// import 'package:intl/intl.dart';
// import 'package:gluco/core/helper/cach.dart';
// import 'package:gluco/features/auth/data/auth.dart';
// import 'package:gluco/features/social/presentation/manager/get_posts/social_cubit.dart';
// import 'package:gluco/features/social/presentation/view/add_post_screen.dart';

// class SocialView extends StatefulWidget {
//   const SocialView({super.key, required this.auth});
//   final Auth auth;

//   @override
//   // ignore: library_private_types_in_public_api
//   _SocialViewState createState() => _SocialViewState();
// }

// class _SocialViewState extends State<SocialView> {
//   Map<String, bool> likeStatus = {};
//   Map<String, int> likeCounts = {};

//   @override
//   void initState() {
//     super.initState();
//     _initializeLikeData();
//   }

//   Future<void> _initializeLikeData() async {
//     var cubit = SocialCubit.get(context);
//     cubit.getPosts();
//     // اجلب المشاركات قبل الوصول إلى بيانات الإعجابات
//     if (cubit.socialModel != null) {
//       for (var post in cubit.socialModel!) {
//         String postId = post.id.toString();
//         likeStatus[postId] =
//             await ChachHelper.getLikeStatus(postId: postId) ?? false;
//         likeCounts[postId] = await ChachHelper.getLikes(postId: postId) ?? 0;
//       }
//       setState(() {});
//     }
//   }

//   Future<void> _toggleLike(String postId) async {
//     bool currentStatus = likeStatus[postId] ?? false;
//     int currentCount = likeCounts[postId] ?? 0;

//     setState(() {
//       likeStatus[postId] = !currentStatus;
//       likeCounts[postId] = currentStatus ? currentCount - 1 : currentCount + 1;
//     });

//     await ChachHelper.toggleLike(postId: postId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SocialCubit, SocialState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         var cubit = SocialCubit.get(context);
//         return BlocConsumer<UpdatePostsCubit, UpdatePostsState>(
//           listener: (context, state) {
//             if (state is UpdatePostsSuccess) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('تم التعديل بنجاح')),
//               );
//               SocialCubit.get(context).getPosts();
//             } else if (state is UpdatePostsFailure) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text(state.errMessage)),
//               );
//             }
//           },
//           builder: (context, state) {
//             return Scaffold(
//               appBar: AppBar(
//                 title: const Text('Social Gluco'),
//                 actions: [
//                   IconButton(
//                     icon: const Icon(Icons.refresh),
//                     onPressed: () {
//                       cubit.getPosts();
//                       _initializeLikeData();
//                     },
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.add),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => AddPostScreen(),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//               body: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 100,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 15,
//                         itemBuilder: (context, index) {
//                           return const Column(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 10),
//                                 child: CircleAvatar(
//                                   radius: 35,
//                                 ),
//                               ),
//                               Text('data'),
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     state is GetSocialLoaded
//                         ? const Center(child: CircularProgressIndicator())
//                         : state is GetSocialError
//                             ? const Center(child: Text('Error loading posts'))
//                             : ListView.builder(
//                                 shrinkWrap: true,
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 itemCount: cubit.socialModel?.length ?? 0,
//                                 itemBuilder: (context, index) {
//                                   final post = cubit.socialModel![index];
//                                   String postId = post.id.toString();
//                                   bool isLiked = likeStatus[postId] ?? false;
//                                   int likeCount = likeCounts[postId] ?? 0;

//                                   return Container(
//                                     decoration: const BoxDecoration(
//                                       color: kPrimaryLightColor,
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(10)),
//                                     ),
//                                     height: MediaQuery.of(context).size.height *
//                                         0.3,
//                                     margin: const EdgeInsets.all(8.0),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(16.0),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               const CircleAvatar(
//                                                 backgroundImage: NetworkImage(
//                                                   'https://via.placeholder.com/150',
//                                                 ),
//                                                 radius: 20,
//                                               ),
//                                               const SizedBox(width: 10),
//                                               Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     widget.auth.username ??
//                                                         'Unknown User',
//                                                     style: const TextStyle(
//                                                         color: Colors.white,
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                   Text(
//                                                     post.createdAt != null
//                                                         ? DateFormat(
//                                                                 'yyyy-MM-dd – kk:mm')
//                                                             .format(
//                                                                 post.createdAt!)
//                                                         : 'Unknown',
//                                                     style: const TextStyle(
//                                                         color: Colors.white,
//                                                         fontSize: 12),
//                                                   ),
//                                                 ],
//                                               ),
//                                               const Spacer(),
//                                               PopupMenuButton<int>(
//                                                 icon: const Icon(
//                                                     FontAwesomeIcons.ellipsis),
//                                                 onSelected: (value) {
//                                                   if (value == 1) {
//                                                     // منطق التعديل
//                                                     _showEditDialog(
//                                                         context,
//                                                         post.id.toString(),
//                                                         post.content);
//                                                   } else if (value == 2) {
//                                                     // منطق الحذف
//                                                     print('حذف');
//                                                   }
//                                                 },
//                                                 itemBuilder: (context) => [
//                                                   const PopupMenuItem(
//                                                     value: 1,
//                                                     child: Row(
//                                                       children: [
//                                                         Icon(Icons.edit,
//                                                             color:
//                                                                 Colors.black),
//                                                         SizedBox(width: 8),
//                                                         Text('تعديل'),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   const PopupMenuItem(
//                                                     value: 2,
//                                                     child: Row(
//                                                       children: [
//                                                         Icon(Icons.delete,
//                                                             color: Colors.red),
//                                                         SizedBox(width: 8),
//                                                         Text('حذف'),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                           const SizedBox(height: 10),
//                                           Text(
//                                             post.content ?? 'No Content',
//                                             style:
//                                                 const TextStyle(fontSize: 18),
//                                             overflow: TextOverflow.ellipsis,
//                                             maxLines: 4,
//                                           ),
//                                           const Spacer(),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   IconButton(
//                                                     icon: Icon(
//                                                       isLiked
//                                                           ? Icons.thumb_up
//                                                           : Icons
//                                                               .thumb_up_alt_outlined,
//                                                     ),
//                                                     onPressed: () {
//                                                       _toggleLike(postId);
//                                                     },
//                                                   ),
//                                                   Text('$likeCount'),
//                                                 ],
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   IconButton(
//                                                     icon: const Icon(
//                                                         Icons.comment_outlined),
//                                                     onPressed: () {
//                                                       // Logic for commenting on the post
//                                                     },
//                                                   ),
//                                                   const Text('Comment'),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// void _showEditDialog(
//     BuildContext context, String postId, String? currentContent) {
//   TextEditingController contentController =
//       TextEditingController(text: currentContent);

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('تعديل المحتوى'),
//         content: TextField(
//           controller: contentController,
//           maxLines: 4,
//           decoration: const InputDecoration(hintText: "اكتب المحتوى هنا"),
//         ),
//         actions: [
//           TextButton(
//             child: const Text('إلغاء'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             child: const Text('تأكيد'),
//             onPressed: () {
//               if (contentController.text.isNotEmpty) {
//                 UpdatePostsCubit.get(context).updatePost(
//                   content: contentController.text,
//                   postId: postId,
//                 );
//                 Navigator.of(context).pop();
//               }
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gluco/core/widgets/constants.dart';
import 'package:gluco/features/social/presentation/manager/update_cubit/update_posts_cubit.dart';
import 'package:intl/intl.dart';
import 'package:gluco/core/helper/cach.dart';
import 'package:gluco/features/auth/data/auth.dart';
import 'package:gluco/features/social/presentation/manager/get_posts/social_cubit.dart';
import 'package:gluco/features/social/presentation/view/add_post_screen.dart';

class SocialView extends StatefulWidget {
  const SocialView({super.key, required this.auth});
  final Auth auth;

  @override
  // ignore: library_private_types_in_public_api
  _SocialViewState createState() => _SocialViewState();
}

class _SocialViewState extends State<SocialView> {
  Map<String, bool> likeStatus = {};
  Map<String, int> likeCounts = {};

  @override
  void initState() {
    super.initState();
    _initializeLikeData();
  }

  Future<void> _initializeLikeData() async {
    var cubit = SocialCubit.get(context);
    await cubit.getPosts(); // تأكد من أن هذه الدالة تنتظر إكمال جلب المشاركات
    if (cubit.socialModel != null) {
      for (var post in cubit.socialModel!) {
        String postId = post.id.toString();
        likeStatus[postId] =
            await ChachHelper.getLikeStatus(postId: postId) ?? false;
        likeCounts[postId] = await ChachHelper.getLikes(postId: postId) ?? 0;
      }
      setState(() {});
    }
  }

  Future<void> _toggleLike(String postId) async {
    bool currentStatus = likeStatus[postId] ?? false;
    int currentCount = likeCounts[postId] ?? 0;

    setState(() {
      likeStatus[postId] = !currentStatus;
      likeCounts[postId] = currentStatus ? currentCount - 1 : currentCount + 1;
    });

    await ChachHelper.toggleLike(postId: postId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return BlocConsumer<UpdatePostsCubit, UpdatePostsState>(
          listener: (context, state) {
            if (state is UpdatePostsSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم التعديل بنجاح')),
              );
              cubit.getPosts();
              _initializeLikeData();
            } else if (state is UpdatePostsFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errMessage)),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Social Gluco'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      cubit.getPosts();
                      _initializeLikeData();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddPostScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    if (state is GetSocialLoaded)
                      const Center(child: CircularProgressIndicator())
                    else if (state is GetSocialError)
                      const Center(child: Text('Error loading posts'))
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cubit.socialModel?.length ?? 0,
                        itemBuilder: (context, index) {
                          final post = cubit.socialModel![index];
                          String postId = post.id.toString();
                          bool isLiked = likeStatus[postId] ?? false;
                          int likeCount = likeCounts[postId] ?? 0;

                          return Container(
                            decoration: const BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            height: MediaQuery.of(context).size.height * 0.3,
                            margin: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          'https://via.placeholder.com/150',
                                        ),
                                        radius: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.auth.username ??
                                                'Unknown User',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            post.createdAt != null
                                                ? DateFormat(
                                                        'yyyy-MM-dd – kk:mm')
                                                    .format(post.createdAt!)
                                                : 'Unknown',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      PopupMenuButton<int>(
                                        icon: const Icon(
                                            FontAwesomeIcons.ellipsis),
                                        onSelected: (value) {
                                          if (value == 1) {
                                            _showEditDialog(
                                                context,
                                                post.id.toString(),
                                                post.content);
                                          } else if (value == 2) {
                                            // منطق الحذف
                                            print('حذف');
                                          }
                                        },
                                        itemBuilder: (context) => [
                                          const PopupMenuItem(
                                            value: 1,
                                            child: Row(
                                              children: [
                                                Icon(Icons.edit,
                                                    color: Colors.black),
                                                SizedBox(width: 8),
                                                Text('تعديل'),
                                              ],
                                            ),
                                          ),
                                          const PopupMenuItem(
                                            value: 2,
                                            child: Row(
                                              children: [
                                                Icon(Icons.delete,
                                                    color: Colors.red),
                                                SizedBox(width: 8),
                                                Text('حذف'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    post.content ?? 'No Content',
                                    style: const TextStyle(fontSize: 18),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              isLiked
                                                  ? Icons.thumb_up
                                                  : Icons.thumb_up_alt_outlined,
                                            ),
                                            onPressed: () {
                                              _toggleLike(postId);
                                            },
                                          ),
                                          Text('$likeCount'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                                Icons.comment_outlined),
                                            onPressed: () {
                                              // Logic for commenting on the post
                                            },
                                          ),
                                          const Text('Comment'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

void _showEditDialog(
    BuildContext context, String postId, String? currentContent) {
  TextEditingController contentController =
      TextEditingController(text: currentContent);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('تعديل المحتوى'),
        content: TextField(
          controller: contentController,
          maxLines: 4,
          decoration: const InputDecoration(hintText: "اكتب المحتوى هنا"),
        ),
        actions: [
          TextButton(
            child: const Text('إلغاء'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('تأكيد'),
            onPressed: () {
              if (contentController.text.isNotEmpty) {
                UpdatePostsCubit.get(context).updatePost(
                  content: contentController.text,
                  postId: postId,
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}
