import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/bloc/cubit/post_cubit.dart';
import 'package:test1/bloc/cubit/post_state.dart';

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

    // Add scroll listener for pagination
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
    return ListView.separated(
      controller: _scrollController,
      itemCount: posts.length + (isPaginating ? 1 : 0),
      separatorBuilder: (_, __) => Divider(),
      itemBuilder: (context, index) {
        if (index == posts.length && isPaginating) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final post = posts[index];
        return ListTile(
          leading: Text(post.userId.toString()),
          title: Text(post.title),
          subtitle: Text(post.body),
        );
      },
    );
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
            } else if (state is PostLoaded || state is PostPaginating) {
              final posts = (state as PostLoaded).posts;
              final isPaginating = state is PostPaginating;
              return _buildList(posts, isPaginating);
            } else if (state is PostError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text("Unexpected state."));
            }
          },
        ),
      ),
    );
  }
}
