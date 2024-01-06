import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generators/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class JsonGenerator extends GeneratorForAnnotation<JsonGeneratorAnnotation> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);
    StringBuffer buffer = StringBuffer();
    buffer.writeln('class ${visitor.className} {');
    for (var i = 0; i < visitor.fileds.length; i++) {
      buffer.writeln(
          'final ${visitor.fileds.values.elementAt(i)} ${visitor.fileds.keys.elementAt(i)};');
    }
    buffer.writeln('const ${visitor.className} ({');
    for (var i = 0; i < visitor.fileds.length; i++) {
      buffer.writeln('required this.${visitor.fileds.keys.elementAt(i)},');
    }
    buffer.writeln(' Map<String, dynamic> toMap() {');
    buffer.writeln('return {');
    for (var i = 0; i < visitor.fileds.length; i++) {
      buffer.writeln(
          " ${visitor.fileds.keys.elementAt(i)}:${visitor.fileds.keys.elementAt(i)}");
    }
    buffer.writeln('};');
    buffer.writeln('}');
    buffer.writeln(
        'factory ${visitor.className}.fromMap(Map<String, dynamic> map) {');
    buffer.writeln('return ${visitor.className}(');
    for (var i = 0; i < visitor.fileds.length; i++) {
      buffer.writeln(
          " ${visitor.fileds.keys.elementAt(i)}:map['${visitor.fileds.keys.elementAt(i)}']");
    }
    buffer.writeln(');');
    buffer.writeln('}');
    buffer.writeln('${visitor.className} copyWith({');
    for (var i = 0; i < visitor.fileds.length; i++) {
      buffer.writeln(
          '${visitor.fileds.values.elementAt(i)}? ${visitor.fileds.keys.elementAt(i)},');
    }
    buffer.writeln('}) {');
    buffer.writeln('return ${visitor.className}{');
    for (var i = 0; i < visitor.fileds.length; i++) {
      buffer.writeln(
          '${visitor.fileds.keys.elementAt(i)}: ${visitor.fileds.keys.elementAt(i)}??this.${visitor.fileds.keys.elementAt(i)},');
    }
    buffer.writeln(');');
    buffer.writeln('}');

    buffer.writeln('}');

    return buffer.toString();
  }
}
