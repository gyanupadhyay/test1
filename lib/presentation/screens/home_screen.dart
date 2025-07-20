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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('GetPosts'),
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<PostCubit, PostState>(
            builder: (context, state) {
              if (state is PostLoading) {
                return const CircularProgressIndicator();
              } else if (state is PostSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: state.postModelList.length,
                        itemBuilder: (context, index) {
                          final post = state.postModelList[index];
                          return ListTile(
                            leading: Text(post.userId.toString()),
                            title: Text(post.title),
                            subtitle: Text(post.body),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else if (state is PostError) {
                return Center(child: Text(state.error));
              } else {
                return const Text("Something Went Wrong.");
              }
            },
          ),
        ),
      ),
    );
  }
}
