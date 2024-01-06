import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/element.dart';

class ModelVisitor extends SimpleElementVisitor<void> {
  String className = '';
  Map fileds = {};
  @override
  void visitConstructorElement(ConstructorElement element) {
    final returntype = element.returnType.toString();
    className = returntype.replaceFirst('*', '');
  }

  @override
  void visitFieldElement(FieldElement element) {
    fileds[element.name] = element.type.toString().replaceFirst('*', '');
  }
}
