import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test1/bloc/cubit/post_cubit.dart';
import 'package:test1/bloc/cubit/post_state.dart';
import 'package:test1/router/router_constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<PostCubit>().fetchMorePosts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildList(List posts, bool isPaginating) {
    if (posts.isEmpty) {
      return const Center(child: Text("No posts found."));
    }

    return ListView.separated(
      controller: _scrollController,
      itemCount: posts.length + (isPaginating ? 1 : 0),
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        if (index == posts.length && isPaginating) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final post = posts[index];
        return ListTile(
          onTap: () => context.push(AppRouteNames.postDetail, extra: post),
          leading: Text(post.userId.toString()),
          title: Text(post.title),
          subtitle: Text(post.body),
        );
      },
    );
  }

  Future<void> _onRefresh() async {
    await context.read<PostCubit>().fetchInitialPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text('GetPosts'),
      ),
      body: SafeArea(
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is PostLoaded || state is PostPaginating) {
              final posts = (state as PostLoaded).posts;
              final isPaginating = state is PostPaginating;

              return RefreshIndicator(
                onRefresh: _onRefresh,
                child: _buildList(posts, isPaginating),
              );
            }

            if (state is PostError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        context.read<PostCubit>().fetchInitialPosts();
                      },
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
