import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';
import 'package:j2d/src/j2d_code_gen.dart';
import 'package:path/path.dart' as p;

Builder j2dBuilder(BuilderOptions options) => J2DBuilder();

class J2DBuilder extends Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;
    var gen = inputId.addExtension('.dart');

    final jsonData = await buildStep.readAsString(inputId);
    final jsonDecoded = json.decode(jsonData);
    final fileName = p.basename(inputId.path);
    // await buildStep.writeAsString(
    //   gen,
    //   '/** Test Detail Items **/',
    // );

    await buildStep.writeAsString(
      gen,
      J2DCodeGen(fileName).gen(jsonDecoded),
    );
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        '.json': ['.json.dart']
      };
}
