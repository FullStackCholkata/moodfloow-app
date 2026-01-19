import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_flow/src/features/mood/data/mood_repository.dart';
import '../../domain/entities/mood.dart';
import '../widgets/mood_selector.dart';
import '../../../../core/widgets/mood_flow_app_bar.dart';

class MoodFlowScreen extends ConsumerStatefulWidget {
  const MoodFlowScreen({super.key});

  @override
  ConsumerState<MoodFlowScreen> createState() => _MoodFlowScreenState();
}

class _MoodFlowScreenState extends ConsumerState<MoodFlowScreen> {
  // The ground truth for the selected mood.
  Mood? selectedMood;
  final TextEditingController _moodDescriptionController =
      TextEditingController();

  void selectMood(Mood mood) {
    setState(() {
      selectedMood = mood;
    });
  }

  @override
  void dispose() {
    _moodDescriptionController.dispose();
    super.dispose();
  }

  void submitMoodEntry() async{
    if(selectedMood == null) {
      // Show an alert dialog if no mood is selected
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('No Mood Selected'),
          content: Text('Please select a mood before submitting.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    final moodIndex = selectedMood!.index;
    final description = _moodDescriptionController.text.isEmpty
        ? null
        : _moodDescriptionController.text;

    await ref.read(moodRepositoryProvider).addMood(moodIndex, description);

    // Clear the selection and description after submission
    setState(() {
      selectedMood = null;
      _moodDescriptionController.clear();
    });

    print('Mood entry submitted: MoodIndex=$moodIndex, Description=$description');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: Column(
        children: [
          // Custom app bar
          const MoodFlowAppBar(),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: const Text(
                    'It is time for your daily mood check-in!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 20.0),
                  child: const Text(
                    'How are you feeling today?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // We pass down the currently selected mood and the callback to update it.
                MoodSelector(
                  selectedMood: selectedMood,
                  onMoodSelected: selectMood,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: _moodDescriptionController,
                    minLines: 2,
                    maxLines: 2,
                    maxLength: 256,
                    decoration: InputDecoration(
                      labelText: 'Describe your day',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: submitMoodEntry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[600],
                    foregroundColor: Colors.brown[800],
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
