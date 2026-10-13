import 'package:flutter/material.dart';
import '../widgets/numeric_counter.dart';

class LaboratoryScreen extends StatelessWidget {
  const LaboratoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: NumericCounter(),
    );
  }
}