// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// RUN: %{not} %{carbon-run-parser}
// CHECK:STDOUT: [
// CHECK:STDOUT:   {kind: 'VariableIntroducer', text: 'var'},
// CHECK:STDOUT:     {kind: 'DeclaredName', text: 'x'},
// CHECK:STDOUT:       {kind: 'StructLiteralOrStructTypeLiteralStart', text: '{'},
// CHECK:STDOUT:           {kind: 'DesignatedName', text: 'a'},
// CHECK:STDOUT:         {kind: 'StructFieldDesignator', text: '.', subtree_size: 2},
// CHECK:STDOUT:         {kind: 'Literal', text: 'i32'},
// CHECK:STDOUT:       {kind: 'StructFieldType', text: ':', subtree_size: 4},
// CHECK:STDOUT:       {kind: 'StructComma', text: ','},
// CHECK:STDOUT:       {kind: 'StructFieldUnknown', text: ',', has_error: yes},
// CHECK:STDOUT:       {kind: 'StructComma', text: ','},
// CHECK:STDOUT:     {kind: 'StructTypeLiteral', text: '}', subtree_size: 9},
// CHECK:STDOUT:   {kind: 'PatternBinding', text: ':', subtree_size: 11},
// CHECK:STDOUT:       {kind: 'StructLiteralOrStructTypeLiteralStart', text: '{'},
// CHECK:STDOUT:     {kind: 'StructLiteral', text: '}', subtree_size: 2},
// CHECK:STDOUT:   {kind: 'VariableInitializer', text: '=', subtree_size: 3},
// CHECK:STDOUT: {kind: 'VariableDeclaration', text: ';', subtree_size: 16},
// CHECK:STDOUT: {kind: 'FileEnd', text: ''},
// CHECK:STDOUT: ]

// CHECK:STDERR: {{.*}}/toolchain/parser/testdata/struct/fail_comma_repeat_in_type.carbon:[[@LINE+1]]:17: Expected `.field: type`.
var x: {.a: i32,,} = {};
