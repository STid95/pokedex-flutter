import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_app/constants.dart';

class PhysicalsInfos extends StatelessWidget {
  final String charaType;
  final String unity;
  final int chara;
  const PhysicalsInfos({
    Key? key,
    required this.charaType,
    required this.unity,
    required this.chara,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
            border: charaType == "height"
                ? const Border.symmetric(
                    vertical: BorderSide(color: Colors.grey, width: 0.6))
                : null),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset("assets/icons/$charaType.svg"),
                  Text("${(chara / 10).toString().replaceAll(".", ",")} $unity")
                ],
              ),
              const SizedBox(height: 10),
              Text(charaType.capitalize(),
                  style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ),
      ),
    );
  }
}
