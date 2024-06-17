import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/cach.dart';
import 'package:gluco/features/auth/data/auth.dart';
import 'package:gluco/features/social/presentation/manager/get_posts/social_cubit.dart';
import 'package:gluco/features/social/presentation/view/add_post_screen.dart';

class SocialView extends StatelessWidget {
  const SocialView({super.key, required this.auth});
  final Auth auth;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Facebook-like Posts'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  cubit.getPosts();
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
          body: state is GetSocialLoaded
              ? const Center(child: CircularProgressIndicator())
              : state is GetSocialError
                  ? const Center(child: Text('Error loading posts'))
                  : ListView.builder(
                      itemCount: cubit.socialModel?.length ?? 0,
                      itemBuilder: (context, index) {
                        final post = cubit.socialModel![index];
                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
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
                                          auth.username ?? 'Unknown User',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          post.createdAt?.toString() ??
                                              'Unknown',
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  post.content ?? 'No Content',
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                              Icons.thumb_up_alt_outlined),
                                          onPressed: () async {
                                            await ChachHelper.incrementLikes(
                                                postId: post.id.toString());
                                          },
                                        ),
                                        FutureBuilder<int>(
                                          future: ChachHelper.getLikes(
                                                  postId: post.id.toString())
                                              .then((value) => value ?? 0),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Text('Loading...');
                                            }
                                            if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            }
                                            return Text('${snapshot.data}');
                                          },
                                        ),
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
        );
      },
    );
  }
}
