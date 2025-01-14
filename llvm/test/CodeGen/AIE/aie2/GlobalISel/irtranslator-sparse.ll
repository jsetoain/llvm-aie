; NOTE: Assertions have been autogenerated by utils/update_mir_test_checks.py UTC_ARGS: --print-fixed-stack
;
; This file is licensed under the Apache License v2.0 with LLVM Exceptions.
; See https://llvm.org/LICENSE.txt for license information.
; SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
;
; (c) Copyright 2024 Advanced Micro Devices, Inc. or its affiliates

; RUN: llc -mtriple=aie2 -O0 -stop-after=irtranslator -global-isel -verify-machineinstrs %s -o - 2>&1 | FileCheck %s

%struct.v128int8_sparse = type <{ <64 x i8>, i128 }>
%struct.v128uint8_sparse = type <{ <64 x i8>, i128 }>
%struct.v64int16_sparse = type <{ <32 x i16>, i128 }>
%struct.v64uint16_sparse = type <{ <32 x i16>, i128 }>
%struct.v256int4_sparse = type <{ <64 x i8>, i128 }>
%struct.v256uint4_sparse = type <{ <64 x i8>, i128 }>
%struct.v64bfloat16_sparse = type <{ <32 x bfloat>, i128 }>

; Tests returning and passing sparse vector arguments along with 128 mask types and 512 vector types.
define %struct.v64bfloat16_sparse @pass_ret_sparse_vec_mask(<64 x i8> %vec1, <16 x i32> %vec2, <32 x i16> %vec3, i128 %mask, %struct.v128int8_sparse alignstack(32) %a, %struct.v64bfloat16_sparse alignstack(32) %b) {
  ; CHECK-LABEL: name: pass_ret_sparse_vec_mask
  ; CHECK: fixedStack:
  ; CHECK: bb.1.entry:
  ; CHECK-NEXT:   liveins: $q1, $q2, $q3, $x1, $x2, $x3, $x4, $x6
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[COPY:%[0-9]+]]:_(<64 x s8>) = COPY $x2
  ; CHECK-NEXT:   [[COPY1:%[0-9]+]]:_(<16 x s32>) = COPY $x4
  ; CHECK-NEXT:   [[COPY2:%[0-9]+]]:_(<32 x s16>) = COPY $x6
  ; CHECK-NEXT:   [[COPY3:%[0-9]+]]:_(s128) = COPY $q2
  ; CHECK-NEXT:   [[COPY4:%[0-9]+]]:_(<64 x s8>) = COPY $x1
  ; CHECK-NEXT:   [[COPY5:%[0-9]+]]:_(s128) = COPY $q1
  ; CHECK-NEXT:   [[COPY6:%[0-9]+]]:_(<32 x s16>) = COPY $x3
  ; CHECK-NEXT:   [[COPY7:%[0-9]+]]:_(s128) = COPY $q3
  ; CHECK-NEXT:   $x0 = COPY [[COPY6]](<32 x s16>)
  ; CHECK-NEXT:   $q0 = COPY [[COPY7]](s128)
  ; CHECK-NEXT:   PseudoRET implicit $lr, implicit $x0, implicit $q0
entry:
  ret %struct.v64bfloat16_sparse %b
}


define %struct.v64bfloat16_sparse @pass_ret_sparse_mask(i128 %mask1, i128 %mask2, %struct.v128int8_sparse alignstack(32) %a, %struct.v64bfloat16_sparse alignstack(32) %b) {
  ; CHECK-LABEL: name: pass_ret_sparse_mask
  ; CHECK: fixedStack:
  ; CHECK-NEXT:   - { id: 0, type: default, offset: -96, size: 16, alignment: 32, stack-id: default, 
  ; CHECK-NEXT:       isImmutable: true, isAliased: false, callee-saved-register: '', callee-saved-restored: true, 
  ; CHECK-NEXT:       debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  ; CHECK-NEXT:   - { id: 1, type: default, offset: -64, size: 64, alignment: 32, stack-id: default, 
  ; CHECK-NEXT:       isImmutable: true, isAliased: false, callee-saved-register: '', callee-saved-restored: true, 
  ; CHECK-NEXT:       debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  ; CHECK: bb.1.entry:
  ; CHECK-NEXT:   liveins: $q1, $q2, $q3, $x3
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[COPY:%[0-9]+]]:_(s128) = COPY $q2
  ; CHECK-NEXT:   [[COPY1:%[0-9]+]]:_(s128) = COPY $q1
  ; CHECK-NEXT:   [[COPY2:%[0-9]+]]:_(<64 x s8>) = COPY $x3
  ; CHECK-NEXT:   [[COPY3:%[0-9]+]]:_(s128) = COPY $q3
  ; CHECK-NEXT:   [[FRAME_INDEX:%[0-9]+]]:_(p0) = G_FRAME_INDEX %fixed-stack.1
  ; CHECK-NEXT:   [[LOAD:%[0-9]+]]:_(<32 x s16>) = G_LOAD [[FRAME_INDEX]](p0) :: (invariant load (<32 x s16>) from %fixed-stack.1, align 32)
  ; CHECK-NEXT:   [[FRAME_INDEX1:%[0-9]+]]:_(p0) = G_FRAME_INDEX %fixed-stack.0
  ; CHECK-NEXT:   [[LOAD1:%[0-9]+]]:_(s128) = G_LOAD [[FRAME_INDEX1]](p0) :: (invariant load (s128) from %fixed-stack.0, align 32)
  ; CHECK-NEXT:   $x0 = COPY [[LOAD]](<32 x s16>)
  ; CHECK-NEXT:   $q0 = COPY [[LOAD1]](s128)
  ; CHECK-NEXT:   PseudoRET implicit $lr, implicit $x0, implicit $q0
entry:
  ret %struct.v64bfloat16_sparse %b
}
