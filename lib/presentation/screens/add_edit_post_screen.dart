import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/bloc/cubit/post_bloc.dart';
import 'package:test1/bloc/cubit/post_events.dart';
import 'package:test1/models/post_model.dart';

class AddEditPostScreen extends StatefulWidget {
  final Post? post; // If null => Add, else => Edit

  const AddEditPostScreen({super.key, this.post});

  @override
  State<AddEditPostScreen> createState() => _AddEditPostScreenState();
}

class _AddEditPostScreenState extends State<AddEditPostScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _bodyController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.post?.title ?? '');
    _bodyController = TextEditingController(text: widget.post?.body ?? '');
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final post = Post(
        id: widget.post?.id,
        title: _titleController.text,
        body: _bodyController.text,
        userId: widget.post?.userId ?? 1, // fixed user for this mock
      );

      final bloc = context.read<PostBloc>();

      if (widget.post == null) {
        bloc.add(CreatePost(post));
      } else {
        bloc.add(UpdatePost(post));
      }

      Navigator.pop(context); // Go back to Home
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.post != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit Post' : 'Add Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) =>
                    value!.isEmpty ? 'Title is required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _bodyController,
                decoration: const InputDecoration(labelText: 'Body'),
                validator: (value) =>
                    value!.isEmpty ? 'Body is required' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _handleSubmit,
                child: Text(isEditing ? 'Update' : 'Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
