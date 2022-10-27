import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Juste un instant, je cherche...",
              style: Theme.of(context).textTheme.headline6),
          const Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
                height: 200, width: 200, child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
