; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
;
; This file is licensed under the Apache License v2.0 with LLVM Exceptions.
; See https://llvm.org/LICENSE.txt for license information.
; SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
;
; (c) Copyright 2023-2024 Advanced Micro Devices, Inc. or its affiliates
; RUN: llc -mtriple=aie --issue-limit=1 < %s | FileCheck %s

define void @foo(i32 %a, i32 *%b, i1 zeroext %c) {
; CHECK-LABEL: foo:
; CHECK:         .p2align 4
; CHECK-NEXT:  // %bb.0:
; CHECK-NEXT:    lda r13, [p0]
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    eq r13, r13, r6
; CHECK-NEXT:    bnez r13, .LBB0_12
; CHECK-NEXT:    nop // Delay Slot 5
; CHECK-NEXT:    nop // Delay Slot 4
; CHECK-NEXT:    nop // Delay Slot 3
; CHECK-NEXT:    nop // Delay Slot 2
; CHECK-NEXT:    nop // Delay Slot 1
; CHECK-NEXT:  .LBB0_1: // %test2
; CHECK-NEXT:    // Label of block must be emitted
; CHECK-NEXT:    lda r13, [p0]
; CHECK-NEXT:    mov r12, p0
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    ne r13, r13, r6
; CHECK-NEXT:    bnez r13, .LBB0_12
; CHECK-NEXT:    nop // Delay Slot 5
; CHECK-NEXT:    nop // Delay Slot 4
; CHECK-NEXT:    nop // Delay Slot 3
; CHECK-NEXT:    nop // Delay Slot 2
; CHECK-NEXT:    nop // Delay Slot 1
; CHECK-NEXT:  .LBB0_2: // %test3
; CHECK-NEXT:    // Label of block must be emitted
; CHECK-NEXT:    mov p0, r12
; CHECK-NEXT:    lda r13, [p0]
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    lt r13, r13, r6
; CHECK-NEXT:    bnez r13, .LBB0_12
; CHECK-NEXT:    nop // Delay Slot 5
; CHECK-NEXT:    nop // Delay Slot 4
; CHECK-NEXT:    nop // Delay Slot 3
; CHECK-NEXT:    nop // Delay Slot 2
; CHECK-NEXT:    nop // Delay Slot 1
; CHECK-NEXT:  .LBB0_3: // %test4
; CHECK-NEXT:    // Label of block must be emitted
; CHECK-NEXT:    mov p0, r12
; CHECK-NEXT:    lda r13, [p0]
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    ge r13, r13, r6
; CHECK-NEXT:    bnez r13, .LBB0_12
; CHECK-NEXT:    nop // Delay Slot 5
; CHECK-NEXT:    nop // Delay Slot 4
; CHECK-NEXT:    nop // Delay Slot 3
; CHECK-NEXT:    nop // Delay Slot 2
; CHECK-NEXT:    nop // Delay Slot 1
; CHECK-NEXT:  .LBB0_4: // %test5
; CHECK-NEXT:    // Label of block must be emitted
; CHECK-NEXT:    mov p0, r12
; CHECK-NEXT:    lda r13, [p0]
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    ltu r13, r13, r6
; CHECK-NEXT:    bnez r13, .LBB0_12
; CHECK-NEXT:    nop // Delay Slot 5
; CHECK-NEXT:    nop // Delay Slot 4
; CHECK-NEXT:    nop // Delay Slot 3
; CHECK-NEXT:    nop // Delay Slot 2
; CHECK-NEXT:    nop // Delay Slot 1
; CHECK-NEXT:  .LBB0_5: // %test6
; CHECK-NEXT:    // Label of block must be emitted
; CHECK-NEXT:    mov p0, r12
; CHECK-NEXT:    lda r13, [p0]
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    geu r13, r13, r6
; CHECK-NEXT:    bnez r13, .LBB0_12
; CHECK-NEXT:    nop // Delay Slot 5
; CHECK-NEXT:    nop // Delay Slot 4
; CHECK-NEXT:    nop // Delay Slot 3
; CHECK-NEXT:    nop // Delay Slot 2
; CHECK-NEXT:    nop // Delay Slot 1
; CHECK-NEXT:  .LBB0_6: // %test7
; CHECK-NEXT:    // Label of block must be emitted
; CHECK-NEXT:    mov p0, r12
; CHECK-NEXT:    lda r13, [p0]
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    lt r13, r6, r13
; CHECK-NEXT:    bnez r13, .LBB0_12
; CHECK-NEXT:    nop // Delay Slot 5
; CHECK-NEXT:    nop // Delay Slot 4
; CHECK-NEXT:    nop // Delay Slot 3
; CHECK-NEXT:    nop // Delay Slot 2
; CHECK-NEXT:    nop // Delay Slot 1
; CHECK-NEXT:  .LBB0_7: // %test8
; CHECK-NEXT:    // Label of block must be emitted
; CHECK-NEXT:    mov p0, r12
; CHECK-NEXT:    lda r13, [p0]
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    ge r13, r6, r13
; CHECK-NEXT:    bnez r13, .LBB0_12
; CHECK-NEXT:    nop // Delay Slot 5
; CHECK-NEXT:    nop // Delay Slot 4
; CHECK-NEXT:    nop // Delay Slot 3
; CHECK-NEXT:    nop // Delay Slot 2
; CHECK-NEXT:    nop // Delay Slot 1
; CHECK-NEXT:  .LBB0_8: // %test9
; CHECK-NEXT:    // Label of block must be emitted
; CHECK-NEXT:    mov p0, r12
; CHECK-NEXT:    lda r13, [p0]
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    ltu r13, r6, r13
; CHECK-NEXT:    bnez r13, .LBB0_12
; CHECK-NEXT:    nop // Delay Slot 5
; CHECK-NEXT:    nop // Delay Slot 4
; CHECK-NEXT:    nop // Delay Slot 3
; CHECK-NEXT:    nop // Delay Slot 2
; CHECK-NEXT:    nop // Delay Slot 1
; CHECK-NEXT:  .LBB0_9: // %test10
; CHECK-NEXT:    // Label of block must be emitted
; CHECK-NEXT:    mov p0, r12
; CHECK-NEXT:    lda r13, [p0]
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    geu r13, r6, r13
; CHECK-NEXT:    bnez r13, .LBB0_12
; CHECK-NEXT:    nop // Delay Slot 5
; CHECK-NEXT:    nop // Delay Slot 4
; CHECK-NEXT:    nop // Delay Slot 3
; CHECK-NEXT:    nop // Delay Slot 2
; CHECK-NEXT:    nop // Delay Slot 1
; CHECK-NEXT:  .LBB0_10: // %test11
; CHECK-NEXT:    // Label of block must be emitted
; CHECK-NEXT:    mov p0, r12
; CHECK-NEXT:    lda r13, [p0]
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    bnez r7, .LBB0_12
; CHECK-NEXT:    nop // Delay Slot 5
; CHECK-NEXT:    nop // Delay Slot 4
; CHECK-NEXT:    nop // Delay Slot 3
; CHECK-NEXT:    nop // Delay Slot 2
; CHECK-NEXT:    nop // Delay Slot 1
; CHECK-NEXT:  .LBB0_11: // %test12
; CHECK-NEXT:    // Label of block must be emitted
; CHECK-NEXT:    mov p0, r12
; CHECK-NEXT:    lda r12, [p0]
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    .p2align 4
; CHECK-NEXT:  .LBB0_12: // %end
; CHECK-NEXT:    // Label of block must be emitted
; CHECK-NEXT:    ret lr
; CHECK-NEXT:    nop // Delay Slot 5
; CHECK-NEXT:    nop // Delay Slot 4
; CHECK-NEXT:    nop // Delay Slot 3
; CHECK-NEXT:    nop // Delay Slot 2
; CHECK-NEXT:    nop // Delay Slot 1
  %val1 = load volatile i32, i32* %b
  %tst1 = icmp eq i32 %val1, %a
  br i1 %tst1, label %end, label %test2

test2:
  %val2 = load volatile i32, i32* %b
  %tst2 = icmp ne i32 %val2, %a
  br i1 %tst2, label %end, label %test3

test3:
  %val3 = load volatile i32, i32* %b
  %tst3 = icmp slt i32 %val3, %a
  br i1 %tst3, label %end, label %test4

test4:
  %val4 = load volatile i32, i32* %b
  %tst4 = icmp sge i32 %val4, %a
  br i1 %tst4, label %end, label %test5

test5:
  %val5 = load volatile i32, i32* %b
  %tst5 = icmp ult i32 %val5, %a
  br i1 %tst5, label %end, label %test6

test6:
  %val6 = load volatile i32, i32* %b
  %tst6 = icmp uge i32 %val6, %a
  br i1 %tst6, label %end, label %test7

; Check for condition codes that don't have a matching instruction

test7:
  %val7 = load volatile i32, i32* %b
  %tst7 = icmp sgt i32 %val7, %a
  br i1 %tst7, label %end, label %test8

test8:
  %val8 = load volatile i32, i32* %b
  %tst8 = icmp sle i32 %val8, %a
  br i1 %tst8, label %end, label %test9

test9:
  %val9 = load volatile i32, i32* %b
  %tst9 = icmp ugt i32 %val9, %a
  br i1 %tst9, label %end, label %test10

test10:
  %val10 = load volatile i32, i32* %b
  %tst10 = icmp ule i32 %val10, %a
  br i1 %tst10, label %end, label %test11

; Check the case of a branch where the condition was generated in another
; function

test11:
  %val11 = load volatile i32, i32* %b
  br i1 %c, label %end, label %test12

test12:
  %val12 = load volatile i32, i32* %b
  br label %end

end:
  ret void
}

@buf0 = external global [64 x i32]
@buf1 = external global [64 x i32]
@buf2 = external global [64 x i32]

define void @loopWithMul() {
; CHECK-LABEL: loopWithMul:
; CHECK:         .p2align 4
; CHECK-NEXT:  // %bb.0:
; CHECK-NEXT:    mov.u20 r12, #0
; CHECK-NEXT:    mov.u20 r13, #1
; CHECK-NEXT:    mov.u20 p0, #2
; CHECK-NEXT:    mov.u20 r14, #buf0
; CHECK-NEXT:    mov.u20 r5, #buf1
; CHECK-NEXT:    mov.u20 r6, #buf2
; CHECK-NEXT:    mov r7, r12
; CHECK-NEXT:    mov r8, r12
; CHECK-NEXT:    .p2align 4
; CHECK-NEXT:  .LBB1_1: // =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    // Label of block must be emitted
; CHECK-NEXT:    eq r0, r8, r12
; CHECK-NEXT:    lt r9, r12, r8
; CHECK-NEXT:    ltu r1, r13, r7
; CHECK-NEXT:    ite_nez r9, r1, r9, r0
; CHECK-NEXT:    bnez r9, .LBB1_3
; CHECK-NEXT:    nop // Delay Slot 5
; CHECK-NEXT:    nop // Delay Slot 4
; CHECK-NEXT:    nop // Delay Slot 3
; CHECK-NEXT:    nop // Delay Slot 2
; CHECK-NEXT:    nop // Delay Slot 1
; CHECK-NEXT:  .LBB1_2: // in Loop: Header=BB1_1 Depth=1
; CHECK-NEXT:    // Label of block must be emitted
; CHECK-NEXT:    mov r9, p0
; CHECK-NEXT:    lshl r9, r7, r9
; CHECK-NEXT:    add r1, r5, r9
; CHECK-NEXT:    mov p1, r1
; CHECK-NEXT:    add r0, r14, r9
; CHECK-NEXT:    lda r1, [p1]
; CHECK-NEXT:    mov p1, r0
; CHECK-NEXT:    lda r0, [p1]
; CHECK-NEXT:    add r9, r6, r9
; CHECK-NEXT:    add r7, r7, #1
; CHECK-NEXT:    mov p1, r9
; CHECK-NEXT:    eq r9, r7, r12
; CHECK-NEXT:    nop
; CHECK-NEXT:    add r8, r8, r9
; CHECK-NEXT:    nop
; CHECK-NEXT:    mul r0, r0, r1
; CHECK-NEXT:    nop
; CHECK-NEXT:    nop
; CHECK-NEXT:    st r0, [p1]
; CHECK-NEXT:    j .LBB1_1
; CHECK-NEXT:    nop // Delay Slot 5
; CHECK-NEXT:    nop // Delay Slot 4
; CHECK-NEXT:    nop // Delay Slot 3
; CHECK-NEXT:    nop // Delay Slot 2
; CHECK-NEXT:    nop // Delay Slot 1
; CHECK-NEXT:    .p2align 4
; CHECK-NEXT:  .LBB1_3: // Label of block must be emitted
; CHECK-NEXT:    ret lr
; CHECK-NEXT:    nop // Delay Slot 5
; CHECK-NEXT:    nop // Delay Slot 4
; CHECK-NEXT:    nop // Delay Slot 3
; CHECK-NEXT:    nop // Delay Slot 2
; CHECK-NEXT:    nop // Delay Slot 1
0:
  br label %1
1:
  %r3 = phi i64 [ %r12, %2 ], [ 0, %0 ]
  %r4 = icmp slt i64 %r3, 2
  br i1 %r4, label %2, label %3

2:                                                ; preds = %2
  %r6 = getelementptr i32, i32* getelementptr inbounds ([64 x i32], [64 x i32] * @buf0, i64 0, i64 0), i64 %r3
  %r7 = load i32, i32* %r6, align 4
  %r8 = getelementptr i32, i32* getelementptr inbounds ([64 x i32], [64 x i32] * @buf1, i64 0, i64 0), i64 %r3
  %r9 = load i32, i32* %r8, align 4
  %r10 = mul i32 %r7, %r9
  %r11 = getelementptr i32, i32* getelementptr inbounds ([64 x i32], [64 x i32] * @buf2, i64 0, i64 0), i64 %r3
  store i32 %r10, i32* %r11, align 4
  %r12 = add i64 %r3, 1
  br label %1

3:
  ret void
}
