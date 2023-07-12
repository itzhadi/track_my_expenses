// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemModel on _ItemModel, Store {
  late final _$descriptionAtom =
      Atom(name: '_ItemModel.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$amountAtom = Atom(name: '_ItemModel.amount', context: context);

  @override
  String? get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(String? value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  late final _$dateAtom = Atom(name: '_ItemModel.date', context: context);

  @override
  DateTime? get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime? value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$isExpenseAtom =
      Atom(name: '_ItemModel.isExpense', context: context);

  @override
  bool? get isExpense {
    _$isExpenseAtom.reportRead();
    return super.isExpense;
  }

  @override
  set isExpense(bool? value) {
    _$isExpenseAtom.reportWrite(value, super.isExpense, () {
      super.isExpense = value;
    });
  }

  @override
  String toString() {
    return '''
description: ${description},
amount: ${amount},
date: ${date},
isExpense: ${isExpense}
    ''';
  }
}
