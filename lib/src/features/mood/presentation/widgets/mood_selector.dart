import 'package:flutter/material.dart';
import '../../domain/entities/mood.dart';

// A widget that allows users to select their mood.
class MoodSelector extends StatelessWidget {
  // We receive the ground truth for the selected mood and a callback to update it.
  final Mood? selectedMood;
  final Function(Mood) onMoodSelected;

  const MoodSelector({
    super.key,
    required this.selectedMood,
    required this.onMoodSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MoodBox(
          mood: Mood.veryBad,
          icon: Icons.sentiment_very_dissatisfied,
          isSelected: selectedMood == Mood.veryBad,
          onClick: () => onMoodSelected(Mood.veryBad),
        ),
        SizedBox(width: 5),
        MoodBox(
          mood: Mood.bad,
          icon: Icons.sentiment_very_dissatisfied,
          isSelected: selectedMood == Mood.bad,
          onClick: () => onMoodSelected(Mood.bad),
        ),
        SizedBox(width: 5),
        MoodBox(
          mood: Mood.neutral,
          icon: Icons.sentiment_neutral,
          isSelected: selectedMood == Mood.neutral,
          onClick: () => onMoodSelected(Mood.neutral),
        ),
        SizedBox(width: 5),
        MoodBox(
          mood: Mood.good,
          icon: Icons.sentiment_satisfied,
          isSelected: selectedMood == Mood.good,
          onClick: () => onMoodSelected(Mood.good),
        ),
        SizedBox(width: 5),
        MoodBox(
          mood: Mood.veryGood,
          icon: Icons.sentiment_very_satisfied,
          isSelected: selectedMood == Mood.veryGood,
          onClick: () => onMoodSelected(Mood.veryGood),
        ),
      ],
    );
  }
}

// The actual box that the user clicks on to select a mood.
class MoodBox extends StatelessWidget {
  // We receive the current mood, its icon, whether it's selected, and the click handler.
  final Mood mood;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onClick;
  String _moodString = '';

  MoodBox({
    super.key,
    required this.mood,
    required this.icon,
    required this.isSelected,
    required this.onClick,
  });

// A helper function to convert the enum to a string for display.
  void _handleEnum() {
    switch (mood) {
      case Mood.veryBad:
        _moodString = 'Very bad';
        break;
      case Mood.bad:
        _moodString = 'Bad';
        break;
      case Mood.neutral:
        _moodString = 'Neutral';
        break;
      case Mood.good:
        _moodString = 'Good';
        break;
      case Mood.veryGood:
        _moodString = 'Very good';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _handleEnum();
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Colors.yellow[600]
            : Colors.yellow[300], // handle selected state
        foregroundColor: Colors.brown[800],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.all(8),
        fixedSize: Size(74, 65),
        elevation: isSelected ? 5 : 2, // handle selected state
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Icon(icon, size: 28),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 4),
            child: Text(
              _moodString,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
