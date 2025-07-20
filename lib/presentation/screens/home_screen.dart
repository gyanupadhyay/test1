import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test1/bloc/cubit/post_bloc.dart';
import 'package:test1/bloc/cubit/post_events.dart';
import 'package:test1/bloc/cubit/post_state.dart';
import 'package:test1/models/post_model.dart';
import 'package:test1/router/router_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            context.push(AppRouteNames.edit, extra: post);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context.read<PostBloc>().add(DeletePost(post.id!));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is PostError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No data'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRouteNames.add);
          // context.read<PostBloc>().add(
          //   CreatePost(Post(title: "New", body: "Post body", userId: 1)),
          // );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
