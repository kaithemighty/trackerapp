import 'package:flutter/material.dart';

class LandingPageTile extends StatefulWidget {
  final String title;
  final double progress;

  const LandingPageTile({
    super.key,
    required this.title,
    required this.progress
    });

  @override
  State<LandingPageTile> createState() => _LandingPageTileState();
}

class _LandingPageTileState extends State<LandingPageTile> {
  bool isDataViewing = true;

  void enterSelectedPage() {
    setState(() {
      isDataViewing = !isDataViewing;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //insert method for switching to the page corresponding
      //to the tile the user clicked on here, in the onTap: ----
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: isDataViewing 
            ? Theme.of(context).colorScheme.primary 
            : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Title Text
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                backgroundColor: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 20), //space between text and progress
            //Circular Progress Indicator
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: CircularProgressIndicator(
                      value: widget.progress.toDouble(),
                      strokeWidth: 6.0,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Center(
                    child: Text(
                      '${(widget.progress * 100).toInt()}%',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}