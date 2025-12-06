import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/challenge.dart';
import '../storage/hive_storage.dart';

class ChallengeDetailPage extends StatefulWidget {
  final Challenge challenge;

  const ChallengeDetailPage({super.key, required this.challenge});

  @override
  State<ChallengeDetailPage> createState() => _ChallengeDetailPageState();
}

class _ChallengeDetailPageState extends State<ChallengeDetailPage> {
  File? imageFile;

  @override
  void initState() {
    super.initState();

    final progress = HiveStorage.loadProgress();
    final savedPath = progress.photos[widget.challenge.id];

    if (savedPath != null && savedPath.isNotEmpty) {
      imageFile = File(savedPath);
    }
  }

  Future<void> takePhoto() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 900,
      maxHeight: 900,
      imageQuality: 80,
    );

    if (picked == null) return;

    setState(() {
      imageFile = File(picked.path);
    });

    final progress = HiveStorage.loadProgress();

    // Update XP and completion
    if (!widget.challenge.completed) {
      widget.challenge.completed = true;
      progress.completedChallenges.add(widget.challenge.id);
      progress.xp += 50;
    }

    progress.photos[widget.challenge.id] = picked.path;

    HiveStorage.saveProgress(progress);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Challenge completed! +50 XP")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.challenge;

    return Scaffold(
      appBar: AppBar(
        title: Text(c.title),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(c.icon, style: const TextStyle(fontSize: 70)),
            const SizedBox(height: 20),

            Text(
              c.title,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 15),

            Chip(
              label: Text(c.difficulty),
              backgroundColor: Colors.red.withOpacity(.15),
              labelStyle: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),

            Text(
              c.description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            if (imageFile != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.file(
                  imageFile!,
                  height: 260,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

            const Spacer(),

            // Take photo button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: takePhoto,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  imageFile == null ? "Take Photo & Complete" : "Retake Photo",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}