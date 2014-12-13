; ModuleID = 'aha.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i32 (i32, i32, i32)*, i32, i32, [3 x i32], i8*, i8*, i8* }
%struct.anon.0 = type { i32, [3 x i32] }

@debug = constant i32 0, align 4
@counters = constant i32 1, align 4
@trialx = global [17 x i32] [i32 1, i32 0, i32 -1, i32 -2147483648, i32 2147483647, i32 -2147483647, i32 2147483646, i32 19088743, i32 -1985229329, i32 -2, i32 2, i32 -3, i32 3, i32 -64, i32 64, i32 -5, i32 -31415], align 16
@dummy1 = global [7 x i32] [i32 0, i32 -1, i32 1, i32 -2147483648, i32 -2, i32 2, i32 3], align 16
@dummy2 = global [4 x i32] [i32 1, i32 2, i32 30, i32 31], align 16
@unacceptable = common global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c"neg\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"-(\00", align 1
@.str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str3 = private unnamed_addr constant [4 x i8] c"not\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"~(\00", align 1
@.str5 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@.str7 = private unnamed_addr constant [4 x i8] c" + \00", align 1
@.str8 = private unnamed_addr constant [4 x i8] c"sub\00", align 1
@.str9 = private unnamed_addr constant [4 x i8] c" - \00", align 1
@.str10 = private unnamed_addr constant [4 x i8] c"mul\00", align 1
@.str11 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str12 = private unnamed_addr constant [4 x i8] c"div\00", align 1
@.str13 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@.str14 = private unnamed_addr constant [5 x i8] c"divu\00", align 1
@.str15 = private unnamed_addr constant [5 x i8] c" /u \00", align 1
@.str16 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@.str17 = private unnamed_addr constant [4 x i8] c" & \00", align 1
@.str18 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@.str19 = private unnamed_addr constant [4 x i8] c" | \00", align 1
@.str20 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@.str21 = private unnamed_addr constant [4 x i8] c" ^ \00", align 1
@.str22 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@.str23 = private unnamed_addr constant [5 x i8] c" << \00", align 1
@.str24 = private unnamed_addr constant [4 x i8] c"shr\00", align 1
@.str25 = private unnamed_addr constant [6 x i8] c" >>u \00", align 1
@.str26 = private unnamed_addr constant [5 x i8] c"shrs\00", align 1
@.str27 = private unnamed_addr constant [6 x i8] c" >>s \00", align 1
@isa = global [13 x %struct.anon] [%struct.anon { i32 (i32, i32, i32)* @neg, i32 1, i32 0, [3 x i32] [i32 11, i32 0, i32 0], i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0) }, %struct.anon { i32 (i32, i32, i32)* @Not, i32 1, i32 0, [3 x i32] [i32 11, i32 0, i32 0], i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0) }, %struct.anon { i32 (i32, i32, i32)* @add, i32 2, i32 1, [3 x i32] [i32 11, i32 2, i32 0], i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str7, i32 0, i32 0) }, %struct.anon { i32 (i32, i32, i32)* @sub, i32 2, i32 0, [3 x i32] [i32 2, i32 2, i32 0], i8* getelementptr inbounds ([4 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str9, i32 0, i32 0) }, %struct.anon { i32 (i32, i32, i32)* @mul, i32 2, i32 1, [3 x i32] [i32 11, i32 3, i32 0], i8* getelementptr inbounds ([4 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str11, i32 0, i32 0) }, %struct.anon { i32 (i32, i32, i32)* @divide, i32 2, i32 0, [3 x i32] [i32 1, i32 3, i32 0], i8* getelementptr inbounds ([4 x i8]* @.str12, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str13, i32 0, i32 0) }, %struct.anon { i32 (i32, i32, i32)* @divu, i32 2, i32 0, [3 x i32] [i32 1, i32 1, i32 0], i8* getelementptr inbounds ([5 x i8]* @.str14, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str15, i32 0, i32 0) }, %struct.anon { i32 (i32, i32, i32)* @And, i32 2, i32 1, [3 x i32] [i32 11, i32 2, i32 0], i8* getelementptr inbounds ([4 x i8]* @.str16, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str17, i32 0, i32 0) }, %struct.anon { i32 (i32, i32, i32)* @Or, i32 2, i32 1, [3 x i32] [i32 11, i32 2, i32 0], i8* getelementptr inbounds ([3 x i8]* @.str18, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str19, i32 0, i32 0) }, %struct.anon { i32 (i32, i32, i32)* @Xor, i32 2, i32 1, [3 x i32] [i32 11, i32 2, i32 0], i8* getelementptr inbounds ([4 x i8]* @.str20, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str21, i32 0, i32 0) }, %struct.anon { i32 (i32, i32, i32)* @shl, i32 2, i32 0, [3 x i32] [i32 1, i32 7, i32 0], i8* getelementptr inbounds ([4 x i8]* @.str22, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str23, i32 0, i32 0) }, %struct.anon { i32 (i32, i32, i32)* @shr, i32 2, i32 0, [3 x i32] [i32 1, i32 7, i32 0], i8* getelementptr inbounds ([4 x i8]* @.str24, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str25, i32 0, i32 0) }, %struct.anon { i32 (i32, i32, i32)* @shrs, i32 2, i32 0, [3 x i32] [i32 3, i32 7, i32 0], i8* getelementptr inbounds ([5 x i8]* @.str26, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str27, i32 0, i32 0) }], align 16
@r = global [17 x i32] [i32 0, i32 -1, i32 1, i32 -2147483648, i32 -2, i32 2, i32 3, i32 1, i32 2, i32 30, i32 31, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 16
@.str28 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str29 = private unnamed_addr constant [5 x i8] c"0x%X\00", align 1
@pgm = common global [5 x %struct.anon.0] zeroinitializer, align 16
@.str31 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@numi = common global i32 0, align 4
@.str33 = private unnamed_addr constant [13 x i8] c"   %-5s r%d,\00", align 1
@.str34 = private unnamed_addr constant [3 x i8] c"rx\00", align 1
@.str35 = private unnamed_addr constant [4 x i8] c"r%d\00", align 1
@.str38 = private unnamed_addr constant [10 x i8] c"   Expr: \00", align 1
@check.itrialx = internal unnamed_addr global i32 0, align 4
@corr_result = common global i32 0, align 4
@correct_result = common global [17 x i32] zeroinitializer, align 16
@.str39 = private unnamed_addr constant [32 x i8] c"\0AFound a %d-operation program:\0A\00", align 1
@.str40 = private unnamed_addr constant [44 x i8] c"Searching for programs with %d operations.\0A\00", align 1
@.str41 = private unnamed_addr constant [21 x i8] c"Found %d solutions.\0A\00", align 1
@.str42 = private unnamed_addr constant [12 x i8] c"Counters = \00", align 1
@.str43 = private unnamed_addr constant [5 x i8] c"%d, \00", align 1
@counter = common global [5 x i32] zeroinitializer, align 16
@.str44 = private unnamed_addr constant [12 x i8] c"total = %d\0A\00", align 1

; Function Attrs: nounwind optsize readnone uwtable
define i32 @neg(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !11), !dbg !251
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !12), !dbg !251
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !13), !dbg !251
  %1 = sub nsw i32 0, %x, !dbg !251
  ret i32 %1, !dbg !251
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @Not(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !16), !dbg !252
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !17), !dbg !252
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !18), !dbg !252
  %1 = xor i32 %x, -1, !dbg !252
  ret i32 %1, !dbg !252
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @pop(i32 %xx, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %xx}, i64 0, metadata !21), !dbg !253
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !22), !dbg !253
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !23), !dbg !253
  tail call void @llvm.dbg.value(metadata !{i32 %xx}, i64 0, metadata !24), !dbg !254
  %1 = lshr i32 %xx, 1, !dbg !255
  %2 = and i32 %1, 1431655765, !dbg !255
  %3 = sub i32 %xx, %2, !dbg !255
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !24), !dbg !255
  %4 = and i32 %3, 858993459, !dbg !256
  %5 = lshr i32 %3, 2, !dbg !256
  %6 = and i32 %5, 858993459, !dbg !256
  %7 = add i32 %6, %4, !dbg !256
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !24), !dbg !256
  %8 = lshr i32 %7, 4, !dbg !257
  %9 = add i32 %8, %7, !dbg !257
  %10 = and i32 %9, 252645135, !dbg !257
  tail call void @llvm.dbg.value(metadata !{i32 %10}, i64 0, metadata !24), !dbg !257
  %11 = mul i32 %10, 16843009, !dbg !258
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !24), !dbg !258
  %12 = lshr i32 %11, 24, !dbg !259
  ret i32 %12, !dbg !259
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @nlz(i32 %xx, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %xx}, i64 0, metadata !28), !dbg !260
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !29), !dbg !260
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !30), !dbg !260
  tail call void @llvm.dbg.value(metadata !{i32 %xx}, i64 0, metadata !31), !dbg !261
  %1 = icmp eq i32 %xx, 0, !dbg !262
  br i1 %1, label %20, label %2, !dbg !262

; <label>:2                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !264, i64 0, metadata !32), !dbg !265
  %3 = icmp ult i32 %xx, 65536, !dbg !266
  tail call void @llvm.dbg.value(metadata !268, i64 0, metadata !32), !dbg !269
  %4 = shl i32 %xx, 16, !dbg !269
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !31), !dbg !269
  %.xx = select i1 %3, i32 %4, i32 %xx, !dbg !266
  %. = select i1 %3, i32 16, i32 0, !dbg !266
  %5 = icmp ult i32 %.xx, 16777216, !dbg !271
  br i1 %5, label %6, label %9, !dbg !271

; <label>:6                                       ; preds = %2
  %7 = or i32 %., 8, !dbg !273
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !32), !dbg !273
  %8 = shl i32 %.xx, 8, !dbg !273
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !31), !dbg !273
  br label %9, !dbg !273

; <label>:9                                       ; preds = %6, %2
  %x.1 = phi i32 [ %8, %6 ], [ %.xx, %2 ]
  %n.1 = phi i32 [ %7, %6 ], [ %., %2 ]
  %10 = icmp ult i32 %x.1, 268435456, !dbg !275
  br i1 %10, label %11, label %14, !dbg !275

; <label>:11                                      ; preds = %9
  %12 = add nsw i32 %n.1, 4, !dbg !277
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !32), !dbg !277
  %13 = shl i32 %x.1, 4, !dbg !277
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !31), !dbg !277
  br label %14, !dbg !277

; <label>:14                                      ; preds = %11, %9
  %x.2 = phi i32 [ %13, %11 ], [ %x.1, %9 ]
  %n.2 = phi i32 [ %12, %11 ], [ %n.1, %9 ]
  %15 = icmp ult i32 %x.2, 1073741824, !dbg !279
  br i1 %15, label %16, label %19, !dbg !279

; <label>:16                                      ; preds = %14
  %17 = add nsw i32 %n.2, 2, !dbg !281
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !32), !dbg !281
  %18 = shl i32 %x.2, 2, !dbg !281
  tail call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !31), !dbg !281
  br label %19, !dbg !281

; <label>:19                                      ; preds = %16, %14
  %x.3 = phi i32 [ %18, %16 ], [ %x.2, %14 ]
  %n.3 = phi i32 [ %17, %16 ], [ %n.2, %14 ]
  %x.3.lobit = lshr i32 %x.3, 31, !dbg !283
  %x.3.lobit.not = xor i32 %x.3.lobit, 1, !dbg !283
  %.n.3 = add nsw i32 %x.3.lobit.not, %n.3, !dbg !283
  br label %20, !dbg !285

; <label>:20                                      ; preds = %0, %19
  %.0 = phi i32 [ %.n.3, %19 ], [ 32, %0 ]
  ret i32 %.0, !dbg !286
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @rev(i32 %xi, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %xi}, i64 0, metadata !35), !dbg !287
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !36), !dbg !287
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !37), !dbg !287
  tail call void @llvm.dbg.value(metadata !{i32 %xi}, i64 0, metadata !38), !dbg !288
  %1 = shl i32 %xi, 1, !dbg !289
  %2 = and i32 %1, -1431655766, !dbg !289
  %3 = lshr i32 %xi, 1, !dbg !289
  %4 = and i32 %3, 1431655765, !dbg !289
  %5 = or i32 %2, %4, !dbg !289
  tail call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !38), !dbg !289
  %6 = shl i32 %5, 2, !dbg !290
  %7 = and i32 %6, -858993460, !dbg !290
  %8 = lshr i32 %5, 2, !dbg !290
  %9 = and i32 %8, 858993459, !dbg !290
  %10 = or i32 %7, %9, !dbg !290
  tail call void @llvm.dbg.value(metadata !{i32 %10}, i64 0, metadata !38), !dbg !290
  %11 = shl i32 %10, 4, !dbg !291
  %12 = and i32 %11, -252645136, !dbg !291
  %13 = lshr i32 %10, 4, !dbg !291
  %14 = and i32 %13, 252645135, !dbg !291
  %15 = or i32 %12, %14, !dbg !291
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !38), !dbg !291
  %16 = shl i32 %15, 24, !dbg !292
  %17 = shl i32 %15, 8, !dbg !292
  %18 = and i32 %17, 16711680, !dbg !292
  %19 = lshr i32 %15, 8, !dbg !292
  %20 = and i32 %19, 65280, !dbg !292
  %21 = lshr i32 %15, 24, !dbg !292
  %22 = or i32 %21, %16, !dbg !292
  %23 = or i32 %22, %18, !dbg !292
  %24 = or i32 %23, %20, !dbg !292
  tail call void @llvm.dbg.value(metadata !{i32 %24}, i64 0, metadata !38), !dbg !292
  ret i32 %24, !dbg !293
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @add(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !41), !dbg !294
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !42), !dbg !294
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !43), !dbg !294
  %1 = add nsw i32 %y, %x, !dbg !294
  ret i32 %1, !dbg !294
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @sub(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !46), !dbg !295
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !47), !dbg !295
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !48), !dbg !295
  %1 = sub nsw i32 %x, %y, !dbg !295
  ret i32 %1, !dbg !295
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @mul(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !51), !dbg !296
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !52), !dbg !296
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !53), !dbg !296
  %1 = mul nsw i32 %y, %x, !dbg !296
  ret i32 %1, !dbg !296
}

; Function Attrs: nounwind optsize uwtable
define i32 @divide(i32 %x, i32 %y, i32 %z) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !56), !dbg !297
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !57), !dbg !297
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !58), !dbg !297
  %1 = icmp eq i32 %y, 0, !dbg !298
  br i1 %1, label %5, label %2, !dbg !298

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %y, -1, !dbg !298
  %4 = icmp eq i32 %x, -2147483648, !dbg !298
  %or.cond = and i1 %3, %4, !dbg !298
  br i1 %or.cond, label %5, label %6, !dbg !298

; <label>:5                                       ; preds = %2, %0
  store i32 1, i32* @unacceptable, align 4, !dbg !300, !tbaa !302
  br label %8, !dbg !300

; <label>:6                                       ; preds = %2
  %7 = sdiv i32 %x, %y, !dbg !306
  br label %8, !dbg !306

; <label>:8                                       ; preds = %6, %5
  %.0 = phi i32 [ 0, %5 ], [ %7, %6 ]
  ret i32 %.0, !dbg !307
}

; Function Attrs: nounwind optsize uwtable
define i32 @divu(i32 %x, i32 %y, i32 %z) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !61), !dbg !308
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !62), !dbg !308
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !63), !dbg !308
  %1 = icmp eq i32 %y, 0, !dbg !309
  br i1 %1, label %2, label %3, !dbg !309

; <label>:2                                       ; preds = %0
  store i32 1, i32* @unacceptable, align 4, !dbg !311, !tbaa !302
  br label %5, !dbg !311

; <label>:3                                       ; preds = %0
  %4 = udiv i32 %x, %y, !dbg !313
  br label %5, !dbg !313

; <label>:5                                       ; preds = %3, %2
  %.0 = phi i32 [ 0, %2 ], [ %4, %3 ]
  ret i32 %.0, !dbg !314
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @And(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !66), !dbg !315
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !67), !dbg !315
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !68), !dbg !315
  %1 = and i32 %y, %x, !dbg !315
  ret i32 %1, !dbg !315
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @Or(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !71), !dbg !316
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !72), !dbg !316
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !73), !dbg !316
  %1 = or i32 %y, %x, !dbg !316
  ret i32 %1, !dbg !316
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @Xor(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !76), !dbg !317
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !77), !dbg !317
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !78), !dbg !317
  %1 = xor i32 %y, %x, !dbg !317
  ret i32 %1, !dbg !317
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @rotl(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !81), !dbg !318
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !82), !dbg !318
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !83), !dbg !318
  %1 = and i32 %y, 63, !dbg !318
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !84), !dbg !318
  %2 = shl i32 %x, %1, !dbg !319
  %3 = sub nsw i32 32, %1, !dbg !319
  %4 = lshr i32 %x, %3, !dbg !319
  %5 = or i32 %4, %2, !dbg !319
  ret i32 %5, !dbg !319
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @shl(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !87), !dbg !320
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !88), !dbg !320
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !89), !dbg !320
  %1 = and i32 %y, 63, !dbg !320
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !90), !dbg !320
  %2 = icmp ugt i32 %1, 31, !dbg !321
  %3 = shl i32 %x, %1, !dbg !321
  %.0 = select i1 %2, i32 0, i32 %3, !dbg !321
  ret i32 %.0, !dbg !323
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @shr(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !93), !dbg !324
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !94), !dbg !324
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !95), !dbg !324
  %1 = and i32 %y, 63, !dbg !324
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !96), !dbg !324
  %2 = icmp ugt i32 %1, 31, !dbg !325
  %3 = lshr i32 %x, %1, !dbg !325
  %.0 = select i1 %2, i32 0, i32 %3, !dbg !325
  ret i32 %.0, !dbg !327
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @shrs(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !99), !dbg !328
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !100), !dbg !328
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !101), !dbg !328
  %1 = and i32 %y, 63, !dbg !328
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !102), !dbg !328
  %2 = icmp ugt i32 %1, 31, !dbg !329
  %.0.v = select i1 %2, i32 31, i32 %1, !dbg !329
  %.0 = ashr i32 %x, %.0.v, !dbg !329
  ret i32 %.0, !dbg !331
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @cmpeq(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !105), !dbg !332
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !106), !dbg !332
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !107), !dbg !332
  %1 = icmp eq i32 %x, %y, !dbg !332
  %2 = zext i1 %1 to i32, !dbg !332
  ret i32 %2, !dbg !332
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @cmplt(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !110), !dbg !333
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !111), !dbg !333
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !112), !dbg !333
  %1 = icmp slt i32 %x, %y, !dbg !333
  %2 = zext i1 %1 to i32, !dbg !333
  ret i32 %2, !dbg !333
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @cmpltu(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !115), !dbg !334
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !116), !dbg !334
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !117), !dbg !334
  %1 = icmp ult i32 %x, %y, !dbg !334
  %2 = zext i1 %1 to i32, !dbg !334
  ret i32 %2, !dbg !334
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @seleq(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !120), !dbg !335
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !121), !dbg !335
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !122), !dbg !335
  %1 = icmp eq i32 %x, 0, !dbg !335
  %2 = select i1 %1, i32 %y, i32 %z, !dbg !335
  ret i32 %2, !dbg !335
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @sellt(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !125), !dbg !336
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !126), !dbg !336
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !127), !dbg !336
  %1 = icmp slt i32 %x, 0, !dbg !336
  %2 = select i1 %1, i32 %y, i32 %z, !dbg !336
  ret i32 %2, !dbg !336
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @selle(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !130), !dbg !337
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !131), !dbg !337
  tail call void @llvm.dbg.value(metadata !{i32 %z}, i64 0, metadata !132), !dbg !337
  %1 = icmp slt i32 %x, 1, !dbg !337
  %2 = select i1 %1, i32 %y, i32 %z, !dbg !337
  ret i32 %2, !dbg !337
}

; Function Attrs: nounwind optsize uwtable
define void @print_expr(i32 %opn) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %opn}, i64 0, metadata !138), !dbg !338
  %1 = icmp slt i32 %opn, 11, !dbg !339
  br i1 %1, label %2, label %11, !dbg !339

; <label>:2                                       ; preds = %0
  %3 = sext i32 %opn to i64, !dbg !341
  %4 = getelementptr inbounds [17 x i32]* @r, i64 0, i64 %3, !dbg !341
  %5 = load i32* %4, align 4, !dbg !341, !tbaa !302
  %.off = add i32 %5, 31, !dbg !341
  %6 = icmp ult i32 %.off, 63, !dbg !341
  br i1 %6, label %7, label %9, !dbg !341

; <label>:7                                       ; preds = %2
  %8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str28, i64 0, i64 0), i32 %5) #6, !dbg !341
  br label %.loopexit, !dbg !341

; <label>:9                                       ; preds = %2
  %10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str29, i64 0, i64 0), i32 %5) #6, !dbg !344
  br label %.loopexit

; <label>:11                                      ; preds = %0
  %12 = icmp eq i32 %opn, 11, !dbg !345
  br i1 %12, label %13, label %14, !dbg !345

; <label>:13                                      ; preds = %11
  %putchar1 = tail call i32 @putchar(i32 120) #5, !dbg !345
  br label %.loopexit, !dbg !345

; <label>:14                                      ; preds = %11
  %15 = add nsw i32 %opn, -12, !dbg !347
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !139), !dbg !347
  %16 = sext i32 %15 to i64, !dbg !349
  %17 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %16, i32 0, !dbg !349
  %18 = load i32* %17, align 16, !dbg !349, !tbaa !350
  tail call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !142), !dbg !349
  %19 = sext i32 %18 to i64, !dbg !352
  %20 = getelementptr inbounds [13 x %struct.anon]* @isa, i64 0, i64 %19, i32 5, !dbg !352
  %21 = load i8** %20, align 8, !dbg !352, !tbaa !353
  %22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str31, i64 0, i64 0), i8* %21) #6, !dbg !352
  tail call void @llvm.dbg.value(metadata !264, i64 0, metadata !141), !dbg !356
  %23 = getelementptr inbounds [13 x %struct.anon]* @isa, i64 0, i64 %19, i32 1, !dbg !356
  %24 = load i32* %23, align 8, !dbg !356, !tbaa !358
  %25 = icmp sgt i32 %24, 0, !dbg !356
  br i1 %25, label %.lr.ph, label %.loopexit, !dbg !356

.lr.ph:                                           ; preds = %14
  %26 = getelementptr inbounds [13 x %struct.anon]* @isa, i64 0, i64 %19, i32 6, !dbg !359
  br label %27, !dbg !356

; <label>:27                                      ; preds = %.lr.ph, %38
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %38 ]
  %28 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %16, i32 1, i64 %indvars.iv, !dbg !362
  %29 = load i32* %28, align 4, !dbg !362, !tbaa !302
  tail call void @print_expr(i32 %29) #7, !dbg !362
  %30 = load i32* %23, align 8, !dbg !359, !tbaa !358
  %31 = add nsw i32 %30, -1, !dbg !359
  %32 = trunc i64 %indvars.iv to i32, !dbg !359
  %33 = icmp slt i32 %32, %31, !dbg !359
  br i1 %33, label %34, label %37, !dbg !359

; <label>:34                                      ; preds = %27
  %35 = load i8** %26, align 8, !dbg !359, !tbaa !363
  %36 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str31, i64 0, i64 0), i8* %35) #6, !dbg !359
  br label %38, !dbg !359

; <label>:37                                      ; preds = %27
  %putchar = tail call i32 @putchar(i32 41) #5, !dbg !364
  br label %38

; <label>:38                                      ; preds = %34, %37
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !356
  %39 = load i32* %23, align 8, !dbg !356, !tbaa !358
  %40 = trunc i64 %indvars.iv.next to i32, !dbg !356
  %41 = icmp slt i32 %40, %39, !dbg !356
  br i1 %41, label %27, label %.loopexit, !dbg !356

.loopexit:                                        ; preds = %38, %14, %13, %7, %9
  ret void, !dbg !365
}

; Function Attrs: nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind optsize uwtable
define void @print_pgm() #1 {
  tail call void @llvm.dbg.value(metadata !264, i64 0, metadata !147), !dbg !366
  %1 = load i32* @numi, align 4, !dbg !366, !tbaa !302
  %2 = icmp sgt i32 %1, 0, !dbg !366
  br i1 %2, label %.lr.ph7, label %._crit_edge8, !dbg !366

.lr.ph7:                                          ; preds = %0, %._crit_edge
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge ], [ 0, %0 ]
  %3 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv9, i32 0, !dbg !368
  %4 = load i32* %3, align 16, !dbg !368, !tbaa !350
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !149), !dbg !368
  %5 = sext i32 %4 to i64, !dbg !370
  %6 = getelementptr inbounds [13 x %struct.anon]* @isa, i64 0, i64 %5, i32 4, !dbg !370
  %7 = load i8** %6, align 8, !dbg !370, !tbaa !371
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1, !dbg !366
  %8 = trunc i64 %indvars.iv.next10 to i32, !dbg !370
  %9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str33, i64 0, i64 0), i8* %7, i32 %8) #6, !dbg !370
  tail call void @llvm.dbg.value(metadata !264, i64 0, metadata !148), !dbg !372
  %10 = getelementptr inbounds [13 x %struct.anon]* @isa, i64 0, i64 %5, i32 1, !dbg !372
  %11 = load i32* %10, align 8, !dbg !372, !tbaa !358
  %12 = icmp sgt i32 %11, 0, !dbg !372
  br i1 %12, label %.lr.ph, label %._crit_edge, !dbg !372

.lr.ph:                                           ; preds = %.lr.ph7, %38
  %indvars.iv = phi i64 [ %indvars.iv.next, %38 ], [ 0, %.lr.ph7 ]
  %13 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv9, i32 1, i64 %indvars.iv, !dbg !374
  %14 = load i32* %13, align 4, !dbg !374, !tbaa !302
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !150), !dbg !374
  %15 = icmp slt i32 %14, 11, !dbg !376
  br i1 %15, label %16, label %25, !dbg !376

; <label>:16                                      ; preds = %.lr.ph
  %17 = sext i32 %14 to i64, !dbg !378
  %18 = getelementptr inbounds [17 x i32]* @r, i64 0, i64 %17, !dbg !378
  %19 = load i32* %18, align 4, !dbg !378, !tbaa !302
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !150), !dbg !378
  %.off = add i32 %19, 31, !dbg !380
  %20 = icmp ult i32 %.off, 63, !dbg !380
  br i1 %20, label %21, label %23, !dbg !380

; <label>:21                                      ; preds = %16
  %22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str28, i64 0, i64 0), i32 %19) #6, !dbg !380
  br label %32, !dbg !380

; <label>:23                                      ; preds = %16
  %24 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str29, i64 0, i64 0), i32 %19) #6, !dbg !382
  br label %32

; <label>:25                                      ; preds = %.lr.ph
  %26 = icmp eq i32 %14, 11, !dbg !383
  br i1 %26, label %27, label %29, !dbg !383

; <label>:27                                      ; preds = %25
  %28 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str34, i64 0, i64 0)) #6, !dbg !383
  br label %32, !dbg !383

; <label>:29                                      ; preds = %25
  %30 = add nsw i32 %14, -11, !dbg !385
  %31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str35, i64 0, i64 0), i32 %30) #6, !dbg !385
  br label %32

; <label>:32                                      ; preds = %27, %29, %21, %23
  %33 = load i32* %10, align 8, !dbg !386, !tbaa !358
  %34 = add nsw i32 %33, -1, !dbg !386
  %35 = trunc i64 %indvars.iv to i32, !dbg !386
  %36 = icmp slt i32 %35, %34, !dbg !386
  br i1 %36, label %37, label %38, !dbg !386

; <label>:37                                      ; preds = %32
  %putchar3 = tail call i32 @putchar(i32 44) #5, !dbg !386
  %.pre = load i32* %10, align 8, !dbg !372, !tbaa !358
  br label %38, !dbg !386

; <label>:38                                      ; preds = %32, %37
  %39 = phi i32 [ %33, %32 ], [ %.pre, %37 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !372
  %40 = trunc i64 %indvars.iv.next to i32, !dbg !372
  %41 = icmp slt i32 %40, %39, !dbg !372
  br i1 %41, label %.lr.ph, label %._crit_edge, !dbg !372

._crit_edge:                                      ; preds = %38, %.lr.ph7
  %putchar2 = tail call i32 @putchar(i32 10) #5, !dbg !388
  %42 = load i32* @numi, align 4, !dbg !366, !tbaa !302
  %43 = icmp slt i32 %8, %42, !dbg !366
  br i1 %43, label %.lr.ph7, label %._crit_edge8, !dbg !366

._crit_edge8:                                     ; preds = %._crit_edge, %0
  %44 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str38, i64 0, i64 0)) #6, !dbg !390
  %45 = load i32* @numi, align 4, !dbg !391, !tbaa !302
  %46 = add nsw i32 %45, 11, !dbg !391
  tail call void @print_expr(i32 %46) #7, !dbg !391
  %putchar = tail call i32 @putchar(i32 10) #5, !dbg !392
  ret void, !dbg !393
}

; Function Attrs: nounwind optsize uwtable
define i32 @check(i32 %i) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !155), !dbg !394
  %1 = sext i32 %i to i64
  br label %2, !dbg !395

; <label>:2                                       ; preds = %2, %0
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %2 ], [ %1, %0 ]
  tail call void @llvm.dbg.value(metadata !397, i64 0, metadata !398) #5, !dbg !400
  %3 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv7, i32 1, i64 0, !dbg !401
  %4 = load i32* %3, align 4, !dbg !401, !tbaa !302
  %5 = sext i32 %4 to i64, !dbg !401
  %6 = getelementptr inbounds [17 x i32]* @r, i64 0, i64 %5, !dbg !401
  %7 = load i32* %6, align 4, !dbg !401, !tbaa !302
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !402) #5, !dbg !401
  %8 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv7, i32 1, i64 1, !dbg !403
  %9 = load i32* %8, align 4, !dbg !403, !tbaa !302
  %10 = sext i32 %9 to i64, !dbg !403
  %11 = getelementptr inbounds [17 x i32]* @r, i64 0, i64 %10, !dbg !403
  %12 = load i32* %11, align 4, !dbg !403, !tbaa !302
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !404) #5, !dbg !403
  %13 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv7, i32 1, i64 2, !dbg !405
  %14 = load i32* %13, align 4, !dbg !405, !tbaa !302
  %15 = sext i32 %14 to i64, !dbg !405
  %16 = getelementptr inbounds [17 x i32]* @r, i64 0, i64 %15, !dbg !405
  %17 = load i32* %16, align 4, !dbg !405, !tbaa !302
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !406) #5, !dbg !405
  %18 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv7, i32 0, !dbg !407
  %19 = load i32* %18, align 16, !dbg !407, !tbaa !350
  %20 = sext i32 %19 to i64, !dbg !407
  %21 = getelementptr inbounds [13 x %struct.anon]* @isa, i64 0, i64 %20, i32 0, !dbg !407
  %22 = load i32 (i32, i32, i32)** %21, align 8, !dbg !407, !tbaa !408
  %23 = tail call i32 %22(i32 %7, i32 %12, i32 %17) #6, !dbg !407
  %24 = add nsw i64 %indvars.iv7, 12, !dbg !407
  %25 = getelementptr inbounds [17 x i32]* @r, i64 0, i64 %24, !dbg !407
  store i32 %23, i32* %25, align 4, !dbg !407, !tbaa !302
  %26 = getelementptr inbounds [5 x i32]* @counter, i64 0, i64 %indvars.iv7, !dbg !409
  %27 = load i32* %26, align 4, !dbg !409, !tbaa !302
  %28 = add i32 %27, 1, !dbg !409
  store i32 %28, i32* %26, align 4, !dbg !409, !tbaa !302
  %29 = load i32* @numi, align 4, !dbg !411, !tbaa !302
  %30 = add nsw i32 %29, -1, !dbg !411
  %31 = trunc i64 %indvars.iv7 to i32, !dbg !411
  %32 = icmp slt i32 %31, %30, !dbg !411
  %indvars.iv.next8 = add nsw i64 %indvars.iv7, 1, !dbg !411
  br i1 %32, label %2, label %33, !dbg !411

; <label>:33                                      ; preds = %2
  %34 = load i32* @unacceptable, align 4, !dbg !413, !tbaa !302
  %35 = icmp eq i32 %34, 0, !dbg !413
  br i1 %35, label %37, label %36, !dbg !413

; <label>:36                                      ; preds = %33
  store i32 0, i32* @unacceptable, align 4, !dbg !415, !tbaa !302
  br label %.loopexit, !dbg !417

; <label>:37                                      ; preds = %33
  %38 = add nsw i32 %29, 11, !dbg !418
  %39 = sext i32 %38 to i64, !dbg !418
  %40 = getelementptr inbounds [17 x i32]* @r, i64 0, i64 %39, !dbg !418
  %41 = load i32* %40, align 4, !dbg !418, !tbaa !302
  %42 = load i32* @corr_result, align 4, !dbg !418, !tbaa !302
  %43 = icmp eq i32 %41, %42, !dbg !418
  br i1 %43, label %.preheader, label %.loopexit, !dbg !418

; <label>:44                                      ; preds = %.thread
  %45 = icmp slt i32 %93, 16, !dbg !420
  br i1 %45, label %.preheader, label %.loopexit, !dbg !420

.preheader:                                       ; preds = %37, %44
  %46 = phi i32 [ %.lcssa9, %44 ], [ %29, %37 ], !dbg !422
  %kx.04 = phi i32 [ %93, %44 ], [ 0, %37 ]
  %47 = load i32* @check.itrialx, align 4, !dbg !422, !tbaa !302
  %48 = add nsw i32 %47, 1, !dbg !422
  %49 = icmp sgt i32 %47, 15, !dbg !424
  %. = select i1 %49, i32 0, i32 %48, !dbg !424
  store i32 %., i32* @check.itrialx, align 4, !dbg !424, !tbaa !302
  %50 = sext i32 %. to i64, !dbg !426
  %51 = getelementptr inbounds [17 x i32]* @trialx, i64 0, i64 %50, !dbg !426
  %52 = load i32* %51, align 4, !dbg !426, !tbaa !302
  store i32 %52, i32* getelementptr inbounds ([17 x i32]* @r, i64 0, i64 11), align 4, !dbg !426, !tbaa !302
  %53 = getelementptr inbounds [17 x i32]* @correct_result, i64 0, i64 %50, !dbg !427
  %54 = load i32* %53, align 4, !dbg !427, !tbaa !302
  store i32 %54, i32* @corr_result, align 4, !dbg !427, !tbaa !302
  tail call void @llvm.dbg.value(metadata !264, i64 0, metadata !155), !dbg !428
  %55 = icmp sgt i32 %46, 0, !dbg !428
  br i1 %55, label %.lr.ph, label %.thread, !dbg !428

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.preheader ]
  tail call void @llvm.dbg.value(metadata !397, i64 0, metadata !430) #5, !dbg !433
  %56 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv, i32 1, i64 0, !dbg !434
  %57 = load i32* %56, align 4, !dbg !434, !tbaa !302
  %58 = sext i32 %57 to i64, !dbg !434
  %59 = getelementptr inbounds [17 x i32]* @r, i64 0, i64 %58, !dbg !434
  %60 = load i32* %59, align 4, !dbg !434, !tbaa !302
  tail call void @llvm.dbg.value(metadata !{i32 %60}, i64 0, metadata !435) #5, !dbg !434
  %61 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv, i32 1, i64 1, !dbg !436
  %62 = load i32* %61, align 4, !dbg !436, !tbaa !302
  %63 = sext i32 %62 to i64, !dbg !436
  %64 = getelementptr inbounds [17 x i32]* @r, i64 0, i64 %63, !dbg !436
  %65 = load i32* %64, align 4, !dbg !436, !tbaa !302
  tail call void @llvm.dbg.value(metadata !{i32 %65}, i64 0, metadata !437) #5, !dbg !436
  %66 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv, i32 1, i64 2, !dbg !438
  %67 = load i32* %66, align 4, !dbg !438, !tbaa !302
  %68 = sext i32 %67 to i64, !dbg !438
  %69 = getelementptr inbounds [17 x i32]* @r, i64 0, i64 %68, !dbg !438
  %70 = load i32* %69, align 4, !dbg !438, !tbaa !302
  tail call void @llvm.dbg.value(metadata !{i32 %70}, i64 0, metadata !439) #5, !dbg !438
  %71 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv, i32 0, !dbg !440
  %72 = load i32* %71, align 16, !dbg !440, !tbaa !350
  %73 = sext i32 %72 to i64, !dbg !440
  %74 = getelementptr inbounds [13 x %struct.anon]* @isa, i64 0, i64 %73, i32 0, !dbg !440
  %75 = load i32 (i32, i32, i32)** %74, align 8, !dbg !440, !tbaa !408
  %76 = tail call i32 %75(i32 %60, i32 %65, i32 %70) #6, !dbg !440
  %77 = add nsw i64 %indvars.iv, 12, !dbg !440
  %78 = getelementptr inbounds [17 x i32]* @r, i64 0, i64 %77, !dbg !440
  store i32 %76, i32* %78, align 4, !dbg !440, !tbaa !302
  %79 = getelementptr inbounds [5 x i32]* @counter, i64 0, i64 %indvars.iv, !dbg !441
  %80 = load i32* %79, align 4, !dbg !441, !tbaa !302
  %81 = add i32 %80, 1, !dbg !441
  store i32 %81, i32* %79, align 4, !dbg !441, !tbaa !302
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !428
  %82 = load i32* @numi, align 4, !dbg !428, !tbaa !302
  %83 = trunc i64 %indvars.iv.next to i32, !dbg !428
  %84 = icmp slt i32 %83, %82, !dbg !428
  br i1 %84, label %.lr.ph, label %85, !dbg !428

; <label>:85                                      ; preds = %.lr.ph
  %.pre = load i32* @unacceptable, align 4, !dbg !442, !tbaa !302
  %phitmp = icmp eq i32 %.pre, 0, !dbg !428
  br i1 %phitmp, label %.thread, label %86, !dbg !442

; <label>:86                                      ; preds = %85
  store i32 0, i32* @unacceptable, align 4, !dbg !444, !tbaa !302
  br label %.loopexit, !dbg !444

.thread:                                          ; preds = %.preheader, %85
  %.lcssa9 = phi i32 [ %82, %85 ], [ %46, %.preheader ]
  %87 = add nsw i32 %.lcssa9, 11, !dbg !446
  %88 = sext i32 %87 to i64, !dbg !446
  %89 = getelementptr inbounds [17 x i32]* @r, i64 0, i64 %88, !dbg !446
  %90 = load i32* %89, align 4, !dbg !446, !tbaa !302
  %91 = load i32* @corr_result, align 4, !dbg !446, !tbaa !302
  %92 = icmp eq i32 %90, %91, !dbg !446
  %93 = add nsw i32 %kx.04, 1, !dbg !420
  tail call void @llvm.dbg.value(metadata !{i32 %93}, i64 0, metadata !156), !dbg !420
  br i1 %92, label %44, label %.loopexit, !dbg !446

.loopexit:                                        ; preds = %44, %.thread, %37, %86, %36
  %.01 = phi i32 [ 0, %36 ], [ 0, %86 ], [ 0, %37 ], [ 1, %44 ], [ 0, %.thread ]
  ret i32 %.01, !dbg !448
}

; Function Attrs: nounwind optsize uwtable
define void @fix_operands(i32 %i) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !159), !dbg !449
  %1 = sext i32 %i to i64, !dbg !450
  %2 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %1, i32 0, !dbg !450
  %3 = load i32* %2, align 16, !dbg !450, !tbaa !350
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !162), !dbg !450
  %4 = load i32* @numi, align 4, !dbg !451, !tbaa !302
  %5 = add nsw i32 %4, -1, !dbg !451
  %6 = icmp eq i32 %5, %i, !dbg !451
  br i1 %6, label %7, label %52, !dbg !451

; <label>:7                                       ; preds = %0
  %8 = add nsw i32 %4, 10, !dbg !453
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !160), !dbg !453
  %9 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %1, i32 1, !dbg !455
  %10 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %1, i32 1, i64 1, !dbg !455
  %11 = load i32* %10, align 4, !dbg !455, !tbaa !302
  %12 = icmp eq i32 %11, %8, !dbg !455
  br i1 %12, label %19, label %13, !dbg !455

; <label>:13                                      ; preds = %7
  %14 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %1, i32 1, i64 2, !dbg !455
  %15 = load i32* %14, align 4, !dbg !455, !tbaa !302
  %16 = icmp eq i32 %15, %8, !dbg !455
  br i1 %16, label %19, label %17, !dbg !455

; <label>:17                                      ; preds = %13
  %18 = getelementptr inbounds [3 x i32]* %9, i64 0, i64 0, !dbg !457
  store i32 %8, i32* %18, align 4, !dbg !457, !tbaa !302
  br label %19, !dbg !459

; <label>:19                                      ; preds = %13, %7, %17
  %20 = add nsw i32 %4, 9, !dbg !460
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !161), !dbg !460
  %21 = icmp sgt i32 %20, 11, !dbg !461
  br i1 %21, label %22, label %52, !dbg !461

; <label>:22                                      ; preds = %19
  %23 = add nsw i32 %i, -1, !dbg !461
  %24 = sext i32 %23 to i64, !dbg !461
  %25 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %24, i32 1, i64 0, !dbg !461
  %26 = load i32* %25, align 4, !dbg !461, !tbaa !302
  %27 = icmp eq i32 %26, %20, !dbg !461
  br i1 %27, label %52, label %28, !dbg !461

; <label>:28                                      ; preds = %22
  %29 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %24, i32 1, i64 1, !dbg !461
  %30 = load i32* %29, align 4, !dbg !461, !tbaa !302
  %31 = icmp eq i32 %30, %20, !dbg !461
  br i1 %31, label %52, label %32, !dbg !461

; <label>:32                                      ; preds = %28
  %33 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %24, i32 1, i64 2, !dbg !461
  %34 = load i32* %33, align 4, !dbg !461, !tbaa !302
  %35 = icmp eq i32 %34, %20, !dbg !461
  %36 = icmp eq i32 %11, %20, !dbg !461
  %or.cond = or i1 %35, %36, !dbg !461
  br i1 %or.cond, label %52, label %37, !dbg !461

; <label>:37                                      ; preds = %32
  %38 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %1, i32 1, i64 2, !dbg !461
  %39 = load i32* %38, align 4, !dbg !461, !tbaa !302
  %40 = icmp eq i32 %39, %20, !dbg !461
  br i1 %40, label %52, label %41, !dbg !461

; <label>:41                                      ; preds = %37
  %42 = getelementptr inbounds [3 x i32]* %9, i64 0, i64 0, !dbg !463
  %43 = load i32* %42, align 4, !dbg !463, !tbaa !302
  %44 = icmp slt i32 %43, %20, !dbg !463
  br i1 %44, label %45, label %46, !dbg !463

; <label>:45                                      ; preds = %41
  store i32 %20, i32* %42, align 4, !dbg !463, !tbaa !302
  br label %52, !dbg !463

; <label>:46                                      ; preds = %41
  %47 = sext i32 %3 to i64, !dbg !466
  %48 = getelementptr inbounds [13 x %struct.anon]* @isa, i64 0, i64 %47, i32 1, !dbg !466
  %49 = load i32* %48, align 8, !dbg !466, !tbaa !358
  %50 = icmp sgt i32 %49, 1, !dbg !466
  br i1 %50, label %51, label %52, !dbg !466

; <label>:51                                      ; preds = %46
  store i32 %20, i32* %10, align 4, !dbg !466, !tbaa !302
  br label %52, !dbg !466

; <label>:52                                      ; preds = %37, %32, %28, %22, %19, %46, %51, %45, %0
  %53 = sext i32 %3 to i64, !dbg !468
  %54 = getelementptr inbounds [13 x %struct.anon]* @isa, i64 0, i64 %53, i32 2, !dbg !468
  %55 = load i32* %54, align 4, !dbg !468, !tbaa !470
  %56 = icmp eq i32 %55, 0, !dbg !468
  br i1 %56, label %64, label %57, !dbg !468

; <label>:57                                      ; preds = %52
  %58 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %1, i32 1, i64 0, !dbg !471
  %59 = load i32* %58, align 4, !dbg !471, !tbaa !302
  %60 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %1, i32 1, i64 1, !dbg !471
  %61 = load i32* %60, align 4, !dbg !471, !tbaa !302
  %62 = icmp slt i32 %59, %61, !dbg !471
  br i1 %62, label %63, label %78, !dbg !471

; <label>:63                                      ; preds = %57
  store i32 %61, i32* %58, align 4, !dbg !474, !tbaa !302
  br label %78, !dbg !474

; <label>:64                                      ; preds = %52
  br i1 %6, label %78, label %65, !dbg !475

; <label>:65                                      ; preds = %64
  %66 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %1, i32 1, i64 0, !dbg !477
  %67 = load i32* %66, align 4, !dbg !477, !tbaa !302
  %68 = icmp slt i32 %67, 11, !dbg !477
  br i1 %68, label %69, label %78, !dbg !477

; <label>:69                                      ; preds = %65
  %70 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %1, i32 1, i64 1, !dbg !477
  %71 = load i32* %70, align 4, !dbg !477, !tbaa !302
  %72 = icmp slt i32 %71, 11, !dbg !477
  br i1 %72, label %73, label %78, !dbg !477

; <label>:73                                      ; preds = %69
  %74 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %1, i32 1, i64 2, !dbg !477
  %75 = load i32* %74, align 4, !dbg !477, !tbaa !302
  %76 = icmp slt i32 %75, 11, !dbg !477
  br i1 %76, label %77, label %78, !dbg !477

; <label>:77                                      ; preds = %73
  store i32 11, i32* %66, align 4, !dbg !480, !tbaa !302
  br label %78, !dbg !482

; <label>:78                                      ; preds = %64, %65, %69, %73, %77, %57, %63
  ret void, !dbg !483
}

; Function Attrs: nounwind optsize uwtable
define i32 @search() #1 {
  %1 = load i32* getelementptr inbounds ([17 x i32]* @trialx, i64 0, i64 0), align 16, !dbg !484, !tbaa !302
  store i32 %1, i32* getelementptr inbounds ([17 x i32]* @r, i64 0, i64 11), align 4, !dbg !484, !tbaa !302
  %2 = load i32* getelementptr inbounds ([17 x i32]* @correct_result, i64 0, i64 0), align 16, !dbg !485, !tbaa !302
  store i32 %2, i32* @corr_result, align 4, !dbg !485, !tbaa !302
  tail call void @llvm.dbg.value(metadata !264, i64 0, metadata !169), !dbg !486
  tail call void @llvm.dbg.value(metadata !264, i64 0, metadata !168), !dbg !487
  br label %3, !dbg !488

; <label>:3                                       ; preds = %increment.exit, %0
  %i.0 = phi i32 [ 0, %0 ], [ %.0.i, %increment.exit ]
  %num_solutions.0 = phi i32 [ 0, %0 ], [ %num_solutions.1, %increment.exit ]
  %4 = tail call i32 @check(i32 %i.0) #7, !dbg !489
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !167), !dbg !489
  %5 = icmp eq i32 %4, 0, !dbg !491
  br i1 %5, label %11, label %6, !dbg !491

; <label>:6                                       ; preds = %3
  %7 = add nsw i32 %num_solutions.0, 1, !dbg !493
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !169), !dbg !493
  %8 = load i32* @numi, align 4, !dbg !495, !tbaa !302
  %9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str39, i64 0, i64 0), i32 %8) #6, !dbg !495
  tail call void @print_pgm() #6, !dbg !496
  %10 = icmp eq i32 %7, 5, !dbg !497
  br i1 %10, label %increment.exit.thread, label %11, !dbg !497

; <label>:11                                      ; preds = %3, %6
  %num_solutions.1 = phi i32 [ %7, %6 ], [ %num_solutions.0, %3 ]
  %12 = load i32* @numi, align 4, !dbg !499, !tbaa !302
  %13 = icmp sgt i32 %12, 0, !dbg !499
  br i1 %13, label %.lr.ph28.i, label %increment.exit.thread, !dbg !499

.lr.ph28.i:                                       ; preds = %11
  %14 = sext i32 %12 to i64
  br label %15, !dbg !499

; <label>:15                                      ; preds = %64, %.lr.ph28.i
  %indvars.iv64.i = phi i64 [ %14, %.lr.ph28.i ], [ %indvars.iv.next65.i, %64 ]
  %i.027.in.i = phi i32 [ %12, %.lr.ph28.i ], [ %i.027.i, %64 ]
  %indvars.iv.next65.i = add nsw i64 %indvars.iv64.i, -1, !dbg !499
  %i.027.i = add nsw i32 %i.027.in.i, -1, !dbg !499
  %16 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv.next65.i, i32 0, !dbg !502
  %17 = load i32* %16, align 16, !dbg !502, !tbaa !350
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !504) #5, !dbg !502
  %18 = sext i32 %17 to i64, !dbg !505
  %19 = getelementptr inbounds [13 x %struct.anon]* @isa, i64 0, i64 %18, i32 1, !dbg !505
  %20 = load i32* %19, align 8, !dbg !505, !tbaa !358
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !506) #5, !dbg !505
  tail call void @llvm.dbg.value(metadata !264, i64 0, metadata !507) #5, !dbg !508
  %21 = icmp sgt i32 %20, 0, !dbg !508
  br i1 %21, label %.lr.ph.i, label %..loopexit1_crit_edge.i, !dbg !508

.lr.ph.i:                                         ; preds = %15
  %22 = add nsw i32 %i.027.in.i, 10, !dbg !510
  br label %23, !dbg !508

; <label>:23                                      ; preds = %39, %.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %.lr.ph.i ], [ %indvars.iv.next.i, %39 ]
  %24 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv.next65.i, i32 1, i64 %indvars.iv.i, !dbg !515
  %25 = load i32* %24, align 4, !dbg !515, !tbaa !302
  tail call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !516) #5, !dbg !515
  %26 = icmp slt i32 %25, 6, !dbg !517
  br i1 %26, label %27, label %30, !dbg !517

; <label>:27                                      ; preds = %23
  %28 = trunc i64 %indvars.iv.i to i32, !dbg !518
  %29 = add nsw i32 %25, 1, !dbg !518
  store i32 %29, i32* %24, align 4, !dbg !518, !tbaa !302
  br label %.loopexit.i, !dbg !520

; <label>:30                                      ; preds = %23
  %31 = icmp eq i32 %25, 6, !dbg !521
  br i1 %31, label %32, label %34, !dbg !521

; <label>:32                                      ; preds = %30
  %33 = trunc i64 %indvars.iv.i to i32, !dbg !522
  store i32 11, i32* %24, align 4, !dbg !522, !tbaa !302
  br label %.loopexit.i, !dbg !524

; <label>:34                                      ; preds = %30
  %35 = icmp slt i32 %25, %22, !dbg !510
  br i1 %35, label %36, label %39, !dbg !510

; <label>:36                                      ; preds = %34
  %37 = trunc i64 %indvars.iv.i to i32, !dbg !525
  %38 = add nsw i32 %25, 1, !dbg !525
  store i32 %38, i32* %24, align 4, !dbg !525, !tbaa !302
  br label %.loopexit.i, !dbg !527

; <label>:39                                      ; preds = %34
  %40 = getelementptr inbounds [13 x %struct.anon]* @isa, i64 0, i64 %18, i32 3, i64 %indvars.iv.i, !dbg !528
  %41 = load i32* %40, align 4, !dbg !528, !tbaa !302
  store i32 %41, i32* %24, align 4, !dbg !528, !tbaa !302
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !508
  %42 = trunc i64 %indvars.iv.next.i to i32, !dbg !508
  %43 = icmp slt i32 %42, %20, !dbg !508
  br i1 %43, label %23, label %.loopexit.i, !dbg !508

.loopexit.i:                                      ; preds = %39, %36, %32, %27
  %44 = phi i1 [ true, %36 ], [ true, %32 ], [ true, %27 ], [ false, %39 ]
  %j.05.i = phi i32 [ %37, %36 ], [ %33, %32 ], [ %28, %27 ], [ %42, %39 ]
  %45 = icmp eq i32 %j.05.i, 0, !dbg !529
  br i1 %45, label %..loopexit1_crit_edge.i, label %46, !dbg !529

; <label>:46                                      ; preds = %.loopexit.i
  br i1 %44, label %47, label %49, !dbg !531

; <label>:47                                      ; preds = %46
  %48 = trunc i64 %indvars.iv.next65.i to i32, !dbg !533
  tail call void @fix_operands(i32 %48) #6, !dbg !533
  br label %increment.exit, !dbg !535

; <label>:49                                      ; preds = %46
  %50 = icmp slt i32 %17, 12, !dbg !536
  br i1 %50, label %51, label %64, !dbg !536

; <label>:51                                      ; preds = %49
  %52 = trunc i64 %indvars.iv.next65.i to i32, !dbg !538
  %53 = add nsw i32 %17, 1, !dbg !538
  tail call void @llvm.dbg.value(metadata !{i32 %53}, i64 0, metadata !504) #5, !dbg !538
  store i32 %53, i32* %16, align 16, !dbg !540, !tbaa !350
  %54 = sext i32 %53 to i64, !dbg !541
  %55 = getelementptr inbounds [13 x %struct.anon]* @isa, i64 0, i64 %54, i32 3, i64 0, !dbg !541
  %56 = load i32* %55, align 8, !dbg !541, !tbaa !302
  %57 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv.next65.i, i32 1, i64 0, !dbg !541
  store i32 %56, i32* %57, align 4, !dbg !541, !tbaa !302
  %58 = getelementptr inbounds [13 x %struct.anon]* @isa, i64 0, i64 %54, i32 3, i64 1, !dbg !542
  %59 = load i32* %58, align 4, !dbg !542, !tbaa !302
  %60 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv.next65.i, i32 1, i64 1, !dbg !542
  store i32 %59, i32* %60, align 4, !dbg !542, !tbaa !302
  %61 = getelementptr inbounds [13 x %struct.anon]* @isa, i64 0, i64 %54, i32 3, i64 2, !dbg !543
  %62 = load i32* %61, align 8, !dbg !543, !tbaa !302
  %63 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv.next65.i, i32 1, i64 2, !dbg !543
  store i32 %62, i32* %63, align 4, !dbg !543, !tbaa !302
  tail call void @fix_operands(i32 %52) #6, !dbg !544
  br label %increment.exit, !dbg !545

; <label>:64                                      ; preds = %49
  store i32 0, i32* %16, align 16, !dbg !546, !tbaa !350
  %65 = load i64* bitcast (i32* getelementptr inbounds ([13 x %struct.anon]* @isa, i64 0, i64 0, i32 3, i64 0) to i64*), align 16, !dbg !547
  %66 = trunc i64 %65 to i32, !dbg !547
  %67 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv.next65.i, i32 1, i64 0, !dbg !547
  store i32 %66, i32* %67, align 4, !dbg !547, !tbaa !302
  %68 = lshr i64 %65, 32
  %69 = trunc i64 %68 to i32
  %70 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv.next65.i, i32 1, i64 1, !dbg !548
  store i32 %69, i32* %70, align 4, !dbg !548, !tbaa !302
  %71 = load i32* getelementptr inbounds ([13 x %struct.anon]* @isa, i64 0, i64 0, i32 3, i64 2), align 8, !dbg !549, !tbaa !302
  %72 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv.next65.i, i32 1, i64 2, !dbg !549
  store i32 %71, i32* %72, align 4, !dbg !549, !tbaa !302
  %73 = trunc i64 %indvars.iv.next65.i to i32, !dbg !550
  tail call void @fix_operands(i32 %73) #6, !dbg !550
  %74 = icmp sgt i32 %73, 0, !dbg !499
  br i1 %74, label %15, label %increment.exit.thread, !dbg !499

..loopexit1_crit_edge.i:                          ; preds = %.loopexit.i, %15
  %75 = trunc i64 %indvars.iv.next65.i to i32, !dbg !529
  br label %increment.exit, !dbg !529

increment.exit:                                   ; preds = %47, %51, %..loopexit1_crit_edge.i
  %.0.i = phi i32 [ %48, %47 ], [ %52, %51 ], [ %75, %..loopexit1_crit_edge.i ]
  tail call void @llvm.dbg.value(metadata !{i32 %.0.i}, i64 0, metadata !168), !dbg !501
  %76 = icmp sgt i32 %.0.i, -1, !dbg !551
  br i1 %76, label %3, label %increment.exit.thread, !dbg !551

increment.exit.thread:                            ; preds = %11, %increment.exit, %6, %64
  %.0 = phi i32 [ %num_solutions.1, %64 ], [ %num_solutions.1, %11 ], [ %num_solutions.1, %increment.exit ], [ 5, %6 ]
  ret i32 %.0, !dbg !552
}

; Function Attrs: nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !177), !dbg !553
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !178), !dbg !553
  tail call void @llvm.dbg.value(metadata !264, i64 0, metadata !180), !dbg !554
  store i32 1, i32* @numi, align 4, !dbg !555, !tbaa !302
  br label %1, !dbg !555

; <label>:1                                       ; preds = %0, %._crit_edge8
  %storemerge9 = phi i32 [ 1, %0 ], [ %38, %._crit_edge8 ]
  %2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str40, i64 0, i64 0), i32 %storemerge9) #6, !dbg !556
  tail call void @llvm.dbg.value(metadata !264, i64 0, metadata !179), !dbg !557
  br label %5, !dbg !557

.preheader:                                       ; preds = %5
  %3 = load i32* @numi, align 4, !dbg !559, !tbaa !302
  %4 = icmp sgt i32 %3, 0, !dbg !559
  br i1 %4, label %.lr.ph, label %._crit_edge, !dbg !559

; <label>:5                                       ; preds = %5, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %5 ]
  %6 = getelementptr inbounds [17 x i32]* @trialx, i64 0, i64 %indvars.iv, !dbg !561
  %7 = load i32* %6, align 4, !dbg !561, !tbaa !302
  %8 = tail call i32 @userfun(i32 %7) #6, !dbg !561
  %9 = getelementptr inbounds [17 x i32]* @correct_result, i64 0, i64 %indvars.iv, !dbg !561
  store i32 %8, i32* %9, align 4, !dbg !561, !tbaa !302
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !557
  %exitcond = icmp eq i64 %indvars.iv.next, 17, !dbg !557
  br i1 %exitcond, label %.preheader, label %5, !dbg !557

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %.lr.ph ], [ 0, %.preheader ]
  %10 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv10, i32 0, !dbg !563
  store i32 0, i32* %10, align 16, !dbg !563, !tbaa !350
  %11 = load i64* bitcast (i32* getelementptr inbounds ([13 x %struct.anon]* @isa, i64 0, i64 0, i32 3, i64 0) to i64*), align 16, !dbg !565
  %12 = trunc i64 %11 to i32, !dbg !565
  %13 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv10, i32 1, i64 0, !dbg !565
  store i32 %12, i32* %13, align 4, !dbg !565, !tbaa !302
  %14 = lshr i64 %11, 32
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv10, i32 1, i64 1, !dbg !566
  store i32 %15, i32* %16, align 4, !dbg !566, !tbaa !302
  %17 = load i32* getelementptr inbounds ([13 x %struct.anon]* @isa, i64 0, i64 0, i32 3, i64 2), align 8, !dbg !567, !tbaa !302
  %18 = getelementptr inbounds [5 x %struct.anon.0]* @pgm, i64 0, i64 %indvars.iv10, i32 1, i64 2, !dbg !567
  store i32 %17, i32* %18, align 4, !dbg !567, !tbaa !302
  %19 = trunc i64 %indvars.iv10 to i32, !dbg !568
  tail call void @fix_operands(i32 %19) #7, !dbg !568
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1, !dbg !559
  %20 = load i32* @numi, align 4, !dbg !559, !tbaa !302
  %21 = trunc i64 %indvars.iv.next11 to i32, !dbg !559
  %22 = icmp slt i32 %21, %20, !dbg !559
  br i1 %22, label %.lr.ph, label %._crit_edge, !dbg !559

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %23 = tail call i32 @search() #7, !dbg !569
  tail call void @llvm.dbg.value(metadata !{i32 %23}, i64 0, metadata !180), !dbg !569
  %24 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str41, i64 0, i64 0), i32 %23) #6, !dbg !570
  tail call void @llvm.dbg.value(metadata !264, i64 0, metadata !181), !dbg !571
  %25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str42, i64 0, i64 0)) #6, !dbg !572
  tail call void @llvm.dbg.value(metadata !264, i64 0, metadata !179), !dbg !573
  %26 = load i32* @numi, align 4, !dbg !573, !tbaa !302
  %27 = icmp sgt i32 %26, 0, !dbg !573
  br i1 %27, label %.lr.ph7, label %._crit_edge8, !dbg !573

.lr.ph7:                                          ; preds = %._crit_edge, %.lr.ph7
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %.lr.ph7 ], [ 0, %._crit_edge ]
  %total.05 = phi i32 [ %32, %.lr.ph7 ], [ 0, %._crit_edge ]
  %28 = getelementptr inbounds [5 x i32]* @counter, i64 0, i64 %indvars.iv12, !dbg !575
  %29 = load i32* %28, align 4, !dbg !575, !tbaa !302
  %30 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str43, i64 0, i64 0), i32 %29) #6, !dbg !575
  %31 = load i32* %28, align 4, !dbg !577, !tbaa !302
  %32 = add i32 %31, %total.05, !dbg !577
  tail call void @llvm.dbg.value(metadata !{i32 %32}, i64 0, metadata !181), !dbg !577
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !573
  %33 = load i32* @numi, align 4, !dbg !573, !tbaa !302
  %34 = trunc i64 %indvars.iv.next13 to i32, !dbg !573
  %35 = icmp slt i32 %34, %33, !dbg !573
  br i1 %35, label %.lr.ph7, label %._crit_edge8, !dbg !573

._crit_edge8:                                     ; preds = %.lr.ph7, %._crit_edge
  %total.0.lcssa = phi i32 [ 0, %._crit_edge ], [ %32, %.lr.ph7 ]
  %36 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str44, i64 0, i64 0), i32 %total.0.lcssa) #6, !dbg !578
  %37 = load i32* @numi, align 4, !dbg !555, !tbaa !302
  %38 = add nsw i32 %37, 1, !dbg !555
  %phitmp = icmp eq i32 %23, 0, !dbg !555
  store i32 %38, i32* @numi, align 4, !dbg !555, !tbaa !302
  %39 = icmp slt i32 %38, 6, !dbg !555
  %or.cond = and i1 %39, %phitmp, !dbg !555
  br i1 %or.cond, label %1, label %.critedge, !dbg !555

.critedge:                                        ; preds = %._crit_edge8
  ret i32 0, !dbg !579
}

; Function Attrs: optsize
declare i32 @userfun(i32) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #4

; Function Attrs: nounwind
declare i32 @putchar(i32) #5

attributes #0 = { nounwind optsize readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { nounwind optsize }
attributes #7 = { optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!248, !249}
!llvm.ident = !{!250}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !199, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c] [DW_LANG_C99]
!1 = metadata !{metadata !"aha.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !14, metadata !19, metadata !26, metadata !33, metadata !39, metadata !44, metadata !49, metadata !54, metadata !59, metadata !64, metadata !69, metadata !74, metadata !79, metadata !85, metadata !91, metadata !97, metadata !103, metadata !108, metadata !113, metadata !118, metadata !123, metadata !128, metadata !133, metadata !143, metadata !151, metadata !157, metadata !163, metadata !170, metadata !186, metadata !193}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"neg", metadata !"neg", metadata !"", i32 54, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @neg, null, null, metadata !10, i32 54} ; [ DW_TAG_subprogram ] [line 54] [def] [neg]
!5 = metadata !{metadata !"./aha.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !9, metadata !9}
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{metadata !11, metadata !12, metadata !13}
!11 = metadata !{i32 786689, metadata !4, metadata !"x", metadata !6, i32 16777270, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 54]
!12 = metadata !{i32 786689, metadata !4, metadata !"y", metadata !6, i32 33554486, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 54]
!13 = metadata !{i32 786689, metadata !4, metadata !"z", metadata !6, i32 50331702, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 54]
!14 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"Not", metadata !"Not", metadata !"", i32 55, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @Not, null, null, metadata !15, i32 55} ; [ DW_TAG_subprogram ] [line 55] [def] [Not]
!15 = metadata !{metadata !16, metadata !17, metadata !18}
!16 = metadata !{i32 786689, metadata !14, metadata !"x", metadata !6, i32 16777271, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 55]
!17 = metadata !{i32 786689, metadata !14, metadata !"y", metadata !6, i32 33554487, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 55]
!18 = metadata !{i32 786689, metadata !14, metadata !"z", metadata !6, i32 50331703, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 55]
!19 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"pop", metadata !"pop", metadata !"", i32 56, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @pop, null, null, metadata !20, i32 56} ; [ DW_TAG_subprogram ] [line 56] [def] [pop]
!20 = metadata !{metadata !21, metadata !22, metadata !23, metadata !24}
!21 = metadata !{i32 786689, metadata !19, metadata !"xx", metadata !6, i32 16777272, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [xx] [line 56]
!22 = metadata !{i32 786689, metadata !19, metadata !"y", metadata !6, i32 33554488, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 56]
!23 = metadata !{i32 786689, metadata !19, metadata !"z", metadata !6, i32 50331704, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 56]
!24 = metadata !{i32 786688, metadata !19, metadata !"x", metadata !6, i32 57, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 57]
!25 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!26 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"nlz", metadata !"nlz", metadata !"", i32 66, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @nlz, null, null, metadata !27, i32 66} ; [ DW_TAG_subprogram ] [line 66] [def] [nlz]
!27 = metadata !{metadata !28, metadata !29, metadata !30, metadata !31, metadata !32}
!28 = metadata !{i32 786689, metadata !26, metadata !"xx", metadata !6, i32 16777282, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [xx] [line 66]
!29 = metadata !{i32 786689, metadata !26, metadata !"y", metadata !6, i32 33554498, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 66]
!30 = metadata !{i32 786689, metadata !26, metadata !"z", metadata !6, i32 50331714, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 66]
!31 = metadata !{i32 786688, metadata !26, metadata !"x", metadata !6, i32 67, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 67]
!32 = metadata !{i32 786688, metadata !26, metadata !"n", metadata !6, i32 68, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 68]
!33 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"rev", metadata !"rev", metadata !"", i32 80, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @rev, null, null, metadata !34, i32 80} ; [ DW_TAG_subprogram ] [line 80] [def] [rev]
!34 = metadata !{metadata !35, metadata !36, metadata !37, metadata !38}
!35 = metadata !{i32 786689, metadata !33, metadata !"xi", metadata !6, i32 16777296, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [xi] [line 80]
!36 = metadata !{i32 786689, metadata !33, metadata !"y", metadata !6, i32 33554512, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 80]
!37 = metadata !{i32 786689, metadata !33, metadata !"z", metadata !6, i32 50331728, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 80]
!38 = metadata !{i32 786688, metadata !33, metadata !"x", metadata !6, i32 81, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 81]
!39 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"add", metadata !"add", metadata !"", i32 90, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @add, null, null, metadata !40, i32 90} ; [ DW_TAG_subprogram ] [line 90] [def] [add]
!40 = metadata !{metadata !41, metadata !42, metadata !43}
!41 = metadata !{i32 786689, metadata !39, metadata !"x", metadata !6, i32 16777306, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 90]
!42 = metadata !{i32 786689, metadata !39, metadata !"y", metadata !6, i32 33554522, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 90]
!43 = metadata !{i32 786689, metadata !39, metadata !"z", metadata !6, i32 50331738, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 90]
!44 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"sub", metadata !"sub", metadata !"", i32 91, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @sub, null, null, metadata !45, i32 91} ; [ DW_TAG_subprogram ] [line 91] [def] [sub]
!45 = metadata !{metadata !46, metadata !47, metadata !48}
!46 = metadata !{i32 786689, metadata !44, metadata !"x", metadata !6, i32 16777307, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 91]
!47 = metadata !{i32 786689, metadata !44, metadata !"y", metadata !6, i32 33554523, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 91]
!48 = metadata !{i32 786689, metadata !44, metadata !"z", metadata !6, i32 50331739, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 91]
!49 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"mul", metadata !"mul", metadata !"", i32 92, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @mul, null, null, metadata !50, i32 92} ; [ DW_TAG_subprogram ] [line 92] [def] [mul]
!50 = metadata !{metadata !51, metadata !52, metadata !53}
!51 = metadata !{i32 786689, metadata !49, metadata !"x", metadata !6, i32 16777308, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 92]
!52 = metadata !{i32 786689, metadata !49, metadata !"y", metadata !6, i32 33554524, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 92]
!53 = metadata !{i32 786689, metadata !49, metadata !"z", metadata !6, i32 50331740, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 92]
!54 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"divide", metadata !"divide", metadata !"", i32 95, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @divide, null, null, metadata !55, i32 95} ; [ DW_TAG_subprogram ] [line 95] [def] [divide]
!55 = metadata !{metadata !56, metadata !57, metadata !58}
!56 = metadata !{i32 786689, metadata !54, metadata !"x", metadata !6, i32 16777311, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 95]
!57 = metadata !{i32 786689, metadata !54, metadata !"y", metadata !6, i32 33554527, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 95]
!58 = metadata !{i32 786689, metadata !54, metadata !"z", metadata !6, i32 50331743, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 95]
!59 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"divu", metadata !"divu", metadata !"", i32 99, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @divu, null, null, metadata !60, i32 99} ; [ DW_TAG_subprogram ] [line 99] [def] [divu]
!60 = metadata !{metadata !61, metadata !62, metadata !63}
!61 = metadata !{i32 786689, metadata !59, metadata !"x", metadata !6, i32 16777315, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 99]
!62 = metadata !{i32 786689, metadata !59, metadata !"y", metadata !6, i32 33554531, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 99]
!63 = metadata !{i32 786689, metadata !59, metadata !"z", metadata !6, i32 50331747, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 99]
!64 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"And", metadata !"And", metadata !"", i32 102, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @And, null, null, metadata !65, i32 102} ; [ DW_TAG_subprogram ] [line 102] [def] [And]
!65 = metadata !{metadata !66, metadata !67, metadata !68}
!66 = metadata !{i32 786689, metadata !64, metadata !"x", metadata !6, i32 16777318, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 102]
!67 = metadata !{i32 786689, metadata !64, metadata !"y", metadata !6, i32 33554534, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 102]
!68 = metadata !{i32 786689, metadata !64, metadata !"z", metadata !6, i32 50331750, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 102]
!69 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"Or", metadata !"Or", metadata !"", i32 103, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @Or, null, null, metadata !70, i32 103} ; [ DW_TAG_subprogram ] [line 103] [def] [Or]
!70 = metadata !{metadata !71, metadata !72, metadata !73}
!71 = metadata !{i32 786689, metadata !69, metadata !"x", metadata !6, i32 16777319, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 103]
!72 = metadata !{i32 786689, metadata !69, metadata !"y", metadata !6, i32 33554535, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 103]
!73 = metadata !{i32 786689, metadata !69, metadata !"z", metadata !6, i32 50331751, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 103]
!74 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"Xor", metadata !"Xor", metadata !"", i32 104, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @Xor, null, null, metadata !75, i32 104} ; [ DW_TAG_subprogram ] [line 104] [def] [Xor]
!75 = metadata !{metadata !76, metadata !77, metadata !78}
!76 = metadata !{i32 786689, metadata !74, metadata !"x", metadata !6, i32 16777320, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 104]
!77 = metadata !{i32 786689, metadata !74, metadata !"y", metadata !6, i32 33554536, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 104]
!78 = metadata !{i32 786689, metadata !74, metadata !"z", metadata !6, i32 50331752, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 104]
!79 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"rotl", metadata !"rotl", metadata !"", i32 105, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @rotl, null, null, metadata !80, i32 105} ; [ DW_TAG_subprogram ] [line 105] [def] [rotl]
!80 = metadata !{metadata !81, metadata !82, metadata !83, metadata !84}
!81 = metadata !{i32 786689, metadata !79, metadata !"x", metadata !6, i32 16777321, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 105]
!82 = metadata !{i32 786689, metadata !79, metadata !"y", metadata !6, i32 33554537, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 105]
!83 = metadata !{i32 786689, metadata !79, metadata !"z", metadata !6, i32 50331753, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 105]
!84 = metadata !{i32 786688, metadata !79, metadata !"s", metadata !6, i32 105, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 105]
!85 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"shl", metadata !"shl", metadata !"", i32 107, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @shl, null, null, metadata !86, i32 107} ; [ DW_TAG_subprogram ] [line 107] [def] [shl]
!86 = metadata !{metadata !87, metadata !88, metadata !89, metadata !90}
!87 = metadata !{i32 786689, metadata !85, metadata !"x", metadata !6, i32 16777323, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 107]
!88 = metadata !{i32 786689, metadata !85, metadata !"y", metadata !6, i32 33554539, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 107]
!89 = metadata !{i32 786689, metadata !85, metadata !"z", metadata !6, i32 50331755, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 107]
!90 = metadata !{i32 786688, metadata !85, metadata !"s", metadata !6, i32 107, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 107]
!91 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"shr", metadata !"shr", metadata !"", i32 109, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @shr, null, null, metadata !92, i32 109} ; [ DW_TAG_subprogram ] [line 109] [def] [shr]
!92 = metadata !{metadata !93, metadata !94, metadata !95, metadata !96}
!93 = metadata !{i32 786689, metadata !91, metadata !"x", metadata !6, i32 16777325, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 109]
!94 = metadata !{i32 786689, metadata !91, metadata !"y", metadata !6, i32 33554541, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 109]
!95 = metadata !{i32 786689, metadata !91, metadata !"z", metadata !6, i32 50331757, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 109]
!96 = metadata !{i32 786688, metadata !91, metadata !"s", metadata !6, i32 109, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 109]
!97 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"shrs", metadata !"shrs", metadata !"", i32 111, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @shrs, null, null, metadata !98, i32 111} ; [ DW_TAG_subprogram ] [line 111] [def] [shrs]
!98 = metadata !{metadata !99, metadata !100, metadata !101, metadata !102}
!99 = metadata !{i32 786689, metadata !97, metadata !"x", metadata !6, i32 16777327, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 111]
!100 = metadata !{i32 786689, metadata !97, metadata !"y", metadata !6, i32 33554543, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 111]
!101 = metadata !{i32 786689, metadata !97, metadata !"z", metadata !6, i32 50331759, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 111]
!102 = metadata !{i32 786688, metadata !97, metadata !"s", metadata !6, i32 111, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 111]
!103 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"cmpeq", metadata !"cmpeq", metadata !"", i32 113, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @cmpeq, null, null, metadata !104, i32 113} ; [ DW_TAG_subprogram ] [line 113] [def] [cmpeq]
!104 = metadata !{metadata !105, metadata !106, metadata !107}
!105 = metadata !{i32 786689, metadata !103, metadata !"x", metadata !6, i32 16777329, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 113]
!106 = metadata !{i32 786689, metadata !103, metadata !"y", metadata !6, i32 33554545, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 113]
!107 = metadata !{i32 786689, metadata !103, metadata !"z", metadata !6, i32 50331761, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 113]
!108 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"cmplt", metadata !"cmplt", metadata !"", i32 114, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @cmplt, null, null, metadata !109, i32 114} ; [ DW_TAG_subprogram ] [line 114] [def] [cmplt]
!109 = metadata !{metadata !110, metadata !111, metadata !112}
!110 = metadata !{i32 786689, metadata !108, metadata !"x", metadata !6, i32 16777330, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 114]
!111 = metadata !{i32 786689, metadata !108, metadata !"y", metadata !6, i32 33554546, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 114]
!112 = metadata !{i32 786689, metadata !108, metadata !"z", metadata !6, i32 50331762, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 114]
!113 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"cmpltu", metadata !"cmpltu", metadata !"", i32 115, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @cmpltu, null, null, metadata !114, i32 115} ; [ DW_TAG_subprogram ] [line 115] [def] [cmpltu]
!114 = metadata !{metadata !115, metadata !116, metadata !117}
!115 = metadata !{i32 786689, metadata !113, metadata !"x", metadata !6, i32 16777331, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 115]
!116 = metadata !{i32 786689, metadata !113, metadata !"y", metadata !6, i32 33554547, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 115]
!117 = metadata !{i32 786689, metadata !113, metadata !"z", metadata !6, i32 50331763, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 115]
!118 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"seleq", metadata !"seleq", metadata !"", i32 116, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @seleq, null, null, metadata !119, i32 116} ; [ DW_TAG_subprogram ] [line 116] [def] [seleq]
!119 = metadata !{metadata !120, metadata !121, metadata !122}
!120 = metadata !{i32 786689, metadata !118, metadata !"x", metadata !6, i32 16777332, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 116]
!121 = metadata !{i32 786689, metadata !118, metadata !"y", metadata !6, i32 33554548, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 116]
!122 = metadata !{i32 786689, metadata !118, metadata !"z", metadata !6, i32 50331764, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 116]
!123 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"sellt", metadata !"sellt", metadata !"", i32 117, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @sellt, null, null, metadata !124, i32 117} ; [ DW_TAG_subprogram ] [line 117] [def] [sellt]
!124 = metadata !{metadata !125, metadata !126, metadata !127}
!125 = metadata !{i32 786689, metadata !123, metadata !"x", metadata !6, i32 16777333, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 117]
!126 = metadata !{i32 786689, metadata !123, metadata !"y", metadata !6, i32 33554549, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 117]
!127 = metadata !{i32 786689, metadata !123, metadata !"z", metadata !6, i32 50331765, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 117]
!128 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"selle", metadata !"selle", metadata !"", i32 118, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @selle, null, null, metadata !129, i32 118} ; [ DW_TAG_subprogram ] [line 118] [def] [selle]
!129 = metadata !{metadata !130, metadata !131, metadata !132}
!130 = metadata !{i32 786689, metadata !128, metadata !"x", metadata !6, i32 16777334, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 118]
!131 = metadata !{i32 786689, metadata !128, metadata !"y", metadata !6, i32 33554550, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 118]
!132 = metadata !{i32 786689, metadata !128, metadata !"z", metadata !6, i32 50331766, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 118]
!133 = metadata !{i32 786478, metadata !1, metadata !134, metadata !"print_expr", metadata !"print_expr", metadata !"", i32 11, metadata !135, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32)* @print_expr, null, null, metadata !137, i32 12} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 12] [print_expr]
!134 = metadata !{i32 786473, metadata !1}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!135 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !136, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!136 = metadata !{null, metadata !9}
!137 = metadata !{metadata !138, metadata !139, metadata !141, metadata !142}
!138 = metadata !{i32 786689, metadata !133, metadata !"opn", metadata !134, i32 16777227, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [opn] [line 11]
!139 = metadata !{i32 786688, metadata !140, metadata !"i", metadata !134, i32 13, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 13]
!140 = metadata !{i32 786443, metadata !1, metadata !133} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!141 = metadata !{i32 786688, metadata !140, metadata !"j", metadata !134, i32 13, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 13]
!142 = metadata !{i32 786688, metadata !140, metadata !"k", metadata !134, i32 13, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 13]
!143 = metadata !{i32 786478, metadata !1, metadata !134, metadata !"print_pgm", metadata !"print_pgm", metadata !"", i32 38, metadata !144, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @print_pgm, null, null, metadata !146, i32 39} ; [ DW_TAG_subprogram ] [line 38] [def] [scope 39] [print_pgm]
!144 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !145, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!145 = metadata !{null}
!146 = metadata !{metadata !147, metadata !148, metadata !149, metadata !150}
!147 = metadata !{i32 786688, metadata !143, metadata !"i", metadata !134, i32 40, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 40]
!148 = metadata !{i32 786688, metadata !143, metadata !"j", metadata !134, i32 40, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 40]
!149 = metadata !{i32 786688, metadata !143, metadata !"k", metadata !134, i32 40, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 40]
!150 = metadata !{i32 786688, metadata !143, metadata !"opndj", metadata !134, i32 40, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [opndj] [line 40]
!151 = metadata !{i32 786478, metadata !1, metadata !134, metadata !"check", metadata !"check", metadata !"", i32 90, metadata !152, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @check, null, null, metadata !154, i32 91} ; [ DW_TAG_subprogram ] [line 90] [def] [scope 91] [check]
!152 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !153, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!153 = metadata !{metadata !9, metadata !9}
!154 = metadata !{metadata !155, metadata !156}
!155 = metadata !{i32 786689, metadata !151, metadata !"i", metadata !134, i32 16777306, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 90]
!156 = metadata !{i32 786688, metadata !151, metadata !"kx", metadata !134, i32 92, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [kx] [line 92]
!157 = metadata !{i32 786478, metadata !1, metadata !134, metadata !"fix_operands", metadata !"fix_operands", metadata !"", i32 175, metadata !135, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32)* @fix_operands, null, null, metadata !158, i32 176} ; [ DW_TAG_subprogram ] [line 175] [def] [scope 176] [fix_operands]
!158 = metadata !{metadata !159, metadata !160, metadata !161, metadata !162}
!159 = metadata !{i32 786689, metadata !157, metadata !"i", metadata !134, i32 16777391, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 175]
!160 = metadata !{i32 786688, metadata !157, metadata !"rs", metadata !134, i32 241, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rs] [line 241]
!161 = metadata !{i32 786688, metadata !157, metadata !"rt", metadata !134, i32 241, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rt] [line 241]
!162 = metadata !{i32 786688, metadata !157, metadata !"k", metadata !134, i32 241, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 241]
!163 = metadata !{i32 786478, metadata !1, metadata !134, metadata !"search", metadata !"search", metadata !"", i32 393, metadata !164, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @search, null, null, metadata !166, i32 394} ; [ DW_TAG_subprogram ] [line 393] [def] [scope 394] [search]
!164 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !165, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!165 = metadata !{metadata !9}
!166 = metadata !{metadata !167, metadata !168, metadata !169}
!167 = metadata !{i32 786688, metadata !163, metadata !"ok", metadata !134, i32 396, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ok] [line 396]
!168 = metadata !{i32 786688, metadata !163, metadata !"i", metadata !134, i32 396, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 396]
!169 = metadata !{i32 786688, metadata !163, metadata !"num_solutions", metadata !134, i32 396, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num_solutions] [line 396]
!170 = metadata !{i32 786478, metadata !1, metadata !134, metadata !"main", metadata !"main", metadata !"", i32 423, metadata !171, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !176, i32 423} ; [ DW_TAG_subprogram ] [line 423] [def] [main]
!171 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !172, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!172 = metadata !{metadata !9, metadata !9, metadata !173}
!173 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !174} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!174 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !175} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!175 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!176 = metadata !{metadata !177, metadata !178, metadata !179, metadata !180, metadata !181}
!177 = metadata !{i32 786689, metadata !170, metadata !"argc", metadata !134, i32 16777639, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 423]
!178 = metadata !{i32 786689, metadata !170, metadata !"argv", metadata !134, i32 33554855, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 423]
!179 = metadata !{i32 786688, metadata !170, metadata !"i", metadata !134, i32 424, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 424]
!180 = metadata !{i32 786688, metadata !170, metadata !"num_sol", metadata !134, i32 424, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num_sol] [line 424]
!181 = metadata !{i32 786688, metadata !182, metadata !"total", metadata !134, i32 461, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [total] [line 461]
!182 = metadata !{i32 786443, metadata !1, metadata !183, i32 460, i32 0, i32 81} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!183 = metadata !{i32 786443, metadata !1, metadata !184, i32 460, i32 0, i32 80} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!184 = metadata !{i32 786443, metadata !1, metadata !185, i32 426, i32 0, i32 75} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!185 = metadata !{i32 786443, metadata !1, metadata !170, i32 426, i32 0, i32 74} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!186 = metadata !{i32 786478, metadata !1, metadata !134, metadata !"increment", metadata !"increment", metadata !"", i32 283, metadata !164, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !187, i32 284} ; [ DW_TAG_subprogram ] [line 283] [local] [def] [scope 284] [increment]
!187 = metadata !{metadata !188, metadata !189, metadata !190, metadata !191, metadata !192}
!188 = metadata !{i32 786688, metadata !186, metadata !"i", metadata !134, i32 318, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 318]
!189 = metadata !{i32 786688, metadata !186, metadata !"j", metadata !134, i32 318, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 318]
!190 = metadata !{i32 786688, metadata !186, metadata !"k", metadata !134, i32 318, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 318]
!191 = metadata !{i32 786688, metadata !186, metadata !"opndj", metadata !134, i32 318, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [opndj] [line 318]
!192 = metadata !{i32 786688, metadata !186, metadata !"nopnds", metadata !134, i32 318, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nopnds] [line 318]
!193 = metadata !{i32 786478, metadata !1, metadata !134, metadata !"simulate_one_instruction", metadata !"simulate_one_instruction", metadata !"", i32 74, metadata !135, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !194, i32 75} ; [ DW_TAG_subprogram ] [line 74] [local] [def] [scope 75] [simulate_one_instruction]
!194 = metadata !{metadata !195, metadata !196, metadata !197, metadata !198}
!195 = metadata !{i32 786689, metadata !193, metadata !"i", metadata !134, i32 16777290, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 74]
!196 = metadata !{i32 786688, metadata !193, metadata !"arg0", metadata !134, i32 76, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [arg0] [line 76]
!197 = metadata !{i32 786688, metadata !193, metadata !"arg1", metadata !134, i32 76, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [arg1] [line 76]
!198 = metadata !{i32 786688, metadata !193, metadata !"arg2", metadata !134, i32 76, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [arg2] [line 76]
!199 = metadata !{metadata !200, metadata !202, metadata !203, metadata !207, metadata !211, metadata !215, metadata !232, metadata !233, metadata !234, metadata !235, metadata !236, metadata !237, metadata !245, metadata !246}
!200 = metadata !{i32 786484, i32 0, null, metadata !"debug", metadata !"debug", metadata !"", metadata !6, i32 2, metadata !201, i32 0, i32 1, i32* @debug, null} ; [ DW_TAG_variable ] [debug] [line 2] [def]
!201 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!202 = metadata !{i32 786484, i32 0, null, metadata !"counters", metadata !"counters", metadata !"", metadata !6, i32 3, metadata !201, i32 0, i32 1, i32* @counters, null} ; [ DW_TAG_variable ] [counters] [line 3] [def]
!203 = metadata !{i32 786484, i32 0, null, metadata !"trialx", metadata !"trialx", metadata !"", metadata !6, i32 30, metadata !204, i32 0, i32 1, [17 x i32]* @trialx, null} ; [ DW_TAG_variable ] [trialx] [line 30] [def]
!204 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 544, i64 32, i32 0, i32 0, metadata !9, metadata !205, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!205 = metadata !{metadata !206}
!206 = metadata !{i32 786465, i64 0, i64 17}      ; [ DW_TAG_subrange_type ] [0, 16]
!207 = metadata !{i32 786484, i32 0, null, metadata !"dummy1", metadata !"dummy1", metadata !"", metadata !6, i32 40, metadata !208, i32 0, i32 1, [7 x i32]* @dummy1, null} ; [ DW_TAG_variable ] [dummy1] [line 40] [def]
!208 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 224, i64 32, i32 0, i32 0, metadata !9, metadata !209, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 224, align 32, offset 0] [from int]
!209 = metadata !{metadata !210}
!210 = metadata !{i32 786465, i64 0, i64 7}       ; [ DW_TAG_subrange_type ] [0, 6]
!211 = metadata !{i32 786484, i32 0, null, metadata !"dummy2", metadata !"dummy2", metadata !"", metadata !6, i32 41, metadata !212, i32 0, i32 1, [4 x i32]* @dummy2, null} ; [ DW_TAG_variable ] [dummy2] [line 41] [def]
!212 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 32, i32 0, i32 0, metadata !9, metadata !213, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!213 = metadata !{metadata !214}
!214 = metadata !{i32 786465, i64 0, i64 4}       ; [ DW_TAG_subrange_type ] [0, 3]
!215 = metadata !{i32 786484, i32 0, null, metadata !"isa", metadata !"isa", metadata !"", metadata !6, i32 130, metadata !216, i32 0, i32 1, [13 x %struct.anon]* @isa, null} ; [ DW_TAG_variable ] [isa] [line 130] [def]
!216 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 5824, i64 64, i32 0, i32 0, metadata !217, metadata !230, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 5824, align 64, offset 0] [from ]
!217 = metadata !{i32 786451, metadata !5, null, metadata !"", i32 122, i64 448, i64 64, i32 0, i32 0, null, metadata !218, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 122, size 448, align 64, offset 0] [def] [from ]
!218 = metadata !{metadata !219, metadata !221, metadata !222, metadata !223, metadata !227, metadata !228, metadata !229}
!219 = metadata !{i32 786445, metadata !5, metadata !217, metadata !"proc", i32 123, i64 64, i64 64, i64 0, i32 0, metadata !220} ; [ DW_TAG_member ] [proc] [line 123, size 64, align 64, offset 0] [from ]
!220 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!221 = metadata !{i32 786445, metadata !5, metadata !217, metadata !"numopnds", i32 124, i64 32, i64 32, i64 64, i32 0, metadata !9} ; [ DW_TAG_member ] [numopnds] [line 124, size 32, align 32, offset 64] [from int]
!222 = metadata !{i32 786445, metadata !5, metadata !217, metadata !"commutative", i32 125, i64 32, i64 32, i64 96, i32 0, metadata !9} ; [ DW_TAG_member ] [commutative] [line 125, size 32, align 32, offset 96] [from int]
!223 = metadata !{i32 786445, metadata !5, metadata !217, metadata !"opndstart", i32 126, i64 96, i64 32, i64 128, i32 0, metadata !224} ; [ DW_TAG_member ] [opndstart] [line 126, size 96, align 32, offset 128] [from ]
!224 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 96, i64 32, i32 0, i32 0, metadata !9, metadata !225, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from int]
!225 = metadata !{metadata !226}
!226 = metadata !{i32 786465, i64 0, i64 3}       ; [ DW_TAG_subrange_type ] [0, 2]
!227 = metadata !{i32 786445, metadata !5, metadata !217, metadata !"mnemonic", i32 127, i64 64, i64 64, i64 256, i32 0, metadata !174} ; [ DW_TAG_member ] [mnemonic] [line 127, size 64, align 64, offset 256] [from ]
!228 = metadata !{i32 786445, metadata !5, metadata !217, metadata !"fun_name", i32 128, i64 64, i64 64, i64 320, i32 0, metadata !174} ; [ DW_TAG_member ] [fun_name] [line 128, size 64, align 64, offset 320] [from ]
!229 = metadata !{i32 786445, metadata !5, metadata !217, metadata !"op_name", i32 129, i64 64, i64 64, i64 384, i32 0, metadata !174} ; [ DW_TAG_member ] [op_name] [line 129, size 64, align 64, offset 384] [from ]
!230 = metadata !{metadata !231}
!231 = metadata !{i32 786465, i64 0, i64 13}      ; [ DW_TAG_subrange_type ] [0, 12]
!232 = metadata !{i32 786484, i32 0, null, metadata !"r", metadata !"r", metadata !"", metadata !6, i32 193, metadata !204, i32 0, i32 1, [17 x i32]* @r, null} ; [ DW_TAG_variable ] [r] [line 193] [def]
!233 = metadata !{i32 786484, i32 0, metadata !151, metadata !"itrialx", metadata !"itrialx", metadata !"", metadata !134, i32 93, metadata !9, i32 1, i32 1, i32* @check.itrialx, null} ; [ DW_TAG_variable ] [itrialx] [line 93] [local] [def]
!234 = metadata !{i32 786484, i32 0, null, metadata !"unacceptable", metadata !"unacceptable", metadata !"", metadata !6, i32 49, metadata !9, i32 0, i32 1, i32* @unacceptable, null} ; [ DW_TAG_variable ] [unacceptable] [line 49] [def]
!235 = metadata !{i32 786484, i32 0, null, metadata !"correct_result", metadata !"correct_result", metadata !"", metadata !6, i32 169, metadata !204, i32 0, i32 1, [17 x i32]* @correct_result, null} ; [ DW_TAG_variable ] [correct_result] [line 169] [def]
!236 = metadata !{i32 786484, i32 0, null, metadata !"corr_result", metadata !"corr_result", metadata !"", metadata !6, i32 174, metadata !9, i32 0, i32 1, i32* @corr_result, null} ; [ DW_TAG_variable ] [corr_result] [line 174] [def]
!237 = metadata !{i32 786484, i32 0, null, metadata !"pgm", metadata !"pgm", metadata !"", metadata !6, i32 183, metadata !238, i32 0, i32 1, [5 x %struct.anon.0]* @pgm, null} ; [ DW_TAG_variable ] [pgm] [line 183] [def]
!238 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 640, i64 32, i32 0, i32 0, metadata !239, metadata !243, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 640, align 32, offset 0] [from ]
!239 = metadata !{i32 786451, metadata !5, null, metadata !"", i32 178, i64 128, i64 32, i32 0, i32 0, null, metadata !240, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 178, size 128, align 32, offset 0] [def] [from ]
!240 = metadata !{metadata !241, metadata !242}
!241 = metadata !{i32 786445, metadata !5, metadata !239, metadata !"op", i32 179, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [op] [line 179, size 32, align 32, offset 0] [from int]
!242 = metadata !{i32 786445, metadata !5, metadata !239, metadata !"opnd", i32 180, i64 96, i64 32, i64 32, i32 0, metadata !224} ; [ DW_TAG_member ] [opnd] [line 180, size 96, align 32, offset 32] [from ]
!243 = metadata !{metadata !244}
!244 = metadata !{i32 786465, i64 0, i64 5}       ; [ DW_TAG_subrange_type ] [0, 4]
!245 = metadata !{i32 786484, i32 0, null, metadata !"numi", metadata !"numi", metadata !"", metadata !6, i32 185, metadata !9, i32 0, i32 1, i32* @numi, null} ; [ DW_TAG_variable ] [numi] [line 185] [def]
!246 = metadata !{i32 786484, i32 0, null, metadata !"counter", metadata !"counter", metadata !"", metadata !6, i32 194, metadata !247, i32 0, i32 1, [5 x i32]* @counter, null} ; [ DW_TAG_variable ] [counter] [line 194] [def]
!247 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160, i64 32, i32 0, i32 0, metadata !25, metadata !243, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160, align 32, offset 0] [from unsigned int]
!248 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!249 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!250 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!251 = metadata !{i32 54, i32 0, metadata !4, null}
!252 = metadata !{i32 55, i32 0, metadata !14, null}
!253 = metadata !{i32 56, i32 0, metadata !19, null}
!254 = metadata !{i32 57, i32 0, metadata !19, null}
!255 = metadata !{i32 58, i32 0, metadata !19, null} ; [ DW_TAG_imported_module ]
!256 = metadata !{i32 59, i32 0, metadata !19, null}
!257 = metadata !{i32 60, i32 0, metadata !19, null}
!258 = metadata !{i32 62, i32 0, metadata !19, null}
!259 = metadata !{i32 63, i32 0, metadata !19, null}
!260 = metadata !{i32 66, i32 0, metadata !26, null}
!261 = metadata !{i32 67, i32 0, metadata !26, null}
!262 = metadata !{i32 70, i32 0, metadata !263, null}
!263 = metadata !{i32 786443, metadata !5, metadata !26, i32 70, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!264 = metadata !{i32 0}
!265 = metadata !{i32 71, i32 0, metadata !26, null}
!266 = metadata !{i32 72, i32 0, metadata !267, null}
!267 = metadata !{i32 786443, metadata !5, metadata !26, i32 72, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!268 = metadata !{i32 16}
!269 = metadata !{i32 72, i32 0, metadata !270, null}
!270 = metadata !{i32 786443, metadata !5, metadata !267, i32 72, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!271 = metadata !{i32 73, i32 0, metadata !272, null}
!272 = metadata !{i32 786443, metadata !5, metadata !26, i32 73, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!273 = metadata !{i32 73, i32 0, metadata !274, null}
!274 = metadata !{i32 786443, metadata !5, metadata !272, i32 73, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!275 = metadata !{i32 74, i32 0, metadata !276, null}
!276 = metadata !{i32 786443, metadata !5, metadata !26, i32 74, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!277 = metadata !{i32 74, i32 0, metadata !278, null}
!278 = metadata !{i32 786443, metadata !5, metadata !276, i32 74, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!279 = metadata !{i32 75, i32 0, metadata !280, null}
!280 = metadata !{i32 786443, metadata !5, metadata !26, i32 75, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!281 = metadata !{i32 75, i32 0, metadata !282, null}
!282 = metadata !{i32 786443, metadata !5, metadata !280, i32 75, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!283 = metadata !{i32 76, i32 0, metadata !284, null}
!284 = metadata !{i32 786443, metadata !5, metadata !26, i32 76, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!285 = metadata !{i32 77, i32 0, metadata !26, null}
!286 = metadata !{i32 78, i32 0, metadata !26, null}
!287 = metadata !{i32 80, i32 0, metadata !33, null}
!288 = metadata !{i32 81, i32 0, metadata !33, null}
!289 = metadata !{i32 82, i32 0, metadata !33, null}
!290 = metadata !{i32 83, i32 0, metadata !33, null}
!291 = metadata !{i32 84, i32 0, metadata !33, null}
!292 = metadata !{i32 85, i32 0, metadata !33, null}
!293 = metadata !{i32 87, i32 0, metadata !33, null}
!294 = metadata !{i32 90, i32 0, metadata !39, null}
!295 = metadata !{i32 91, i32 0, metadata !44, null}
!296 = metadata !{i32 92, i32 0, metadata !49, null}
!297 = metadata !{i32 95, i32 0, metadata !54, null}
!298 = metadata !{i32 96, i32 0, metadata !299, null}
!299 = metadata !{i32 786443, metadata !5, metadata !54, i32 96, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!300 = metadata !{i32 97, i32 0, metadata !301, null}
!301 = metadata !{i32 786443, metadata !5, metadata !299, i32 97, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!302 = metadata !{metadata !303, metadata !303, i64 0}
!303 = metadata !{metadata !"int", metadata !304, i64 0}
!304 = metadata !{metadata !"omnipotent char", metadata !305, i64 0}
!305 = metadata !{metadata !"Simple C/C++ TBAA"}
!306 = metadata !{i32 98, i32 0, metadata !299, null}
!307 = metadata !{i32 98, i32 0, metadata !54, null}
!308 = metadata !{i32 99, i32 0, metadata !59, null}
!309 = metadata !{i32 100, i32 0, metadata !310, null}
!310 = metadata !{i32 786443, metadata !5, metadata !59, i32 100, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!311 = metadata !{i32 100, i32 0, metadata !312, null}
!312 = metadata !{i32 786443, metadata !5, metadata !310, i32 100, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!313 = metadata !{i32 101, i32 0, metadata !310, null}
!314 = metadata !{i32 101, i32 0, metadata !59, null}
!315 = metadata !{i32 102, i32 0, metadata !64, null}
!316 = metadata !{i32 103, i32 0, metadata !69, null}
!317 = metadata !{i32 104, i32 0, metadata !74, null}
!318 = metadata !{i32 105, i32 0, metadata !79, null}
!319 = metadata !{i32 106, i32 0, metadata !79, null}
!320 = metadata !{i32 107, i32 0, metadata !85, null}
!321 = metadata !{i32 108, i32 0, metadata !322, null}
!322 = metadata !{i32 786443, metadata !5, metadata !85, i32 108, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!323 = metadata !{i32 108, i32 0, metadata !85, null}
!324 = metadata !{i32 109, i32 0, metadata !91, null}
!325 = metadata !{i32 110, i32 0, metadata !326, null}
!326 = metadata !{i32 786443, metadata !5, metadata !91, i32 110, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!327 = metadata !{i32 110, i32 0, metadata !91, null}
!328 = metadata !{i32 111, i32 0, metadata !97, null}
!329 = metadata !{i32 112, i32 0, metadata !330, null}
!330 = metadata !{i32 786443, metadata !5, metadata !97, i32 112, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/./aha.h]
!331 = metadata !{i32 112, i32 0, metadata !97, null}
!332 = metadata !{i32 113, i32 0, metadata !103, null}
!333 = metadata !{i32 114, i32 0, metadata !108, null}
!334 = metadata !{i32 115, i32 0, metadata !113, null}
!335 = metadata !{i32 116, i32 0, metadata !118, null}
!336 = metadata !{i32 117, i32 0, metadata !123, null}
!337 = metadata !{i32 118, i32 0, metadata !128, null}
!338 = metadata !{i32 11, i32 0, metadata !133, null}
!339 = metadata !{i32 15, i32 0, metadata !340, null}
!340 = metadata !{i32 786443, metadata !1, metadata !140, i32 15, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!341 = metadata !{i32 16, i32 0, metadata !342, null}
!342 = metadata !{i32 786443, metadata !1, metadata !343, i32 16, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!343 = metadata !{i32 786443, metadata !1, metadata !340, i32 15, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!344 = metadata !{i32 17, i32 0, metadata !342, null}
!345 = metadata !{i32 19, i32 0, metadata !346, null}
!346 = metadata !{i32 786443, metadata !1, metadata !340, i32 19, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!347 = metadata !{i32 24, i32 0, metadata !348, null}
!348 = metadata !{i32 786443, metadata !1, metadata !346, i32 23, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!349 = metadata !{i32 25, i32 0, metadata !348, null}
!350 = metadata !{metadata !351, metadata !303, i64 0}
!351 = metadata !{metadata !"", metadata !303, i64 0, metadata !304, i64 4}
!352 = metadata !{i32 26, i32 0, metadata !348, null}
!353 = metadata !{metadata !354, metadata !355, i64 40}
!354 = metadata !{metadata !"", metadata !355, i64 0, metadata !303, i64 8, metadata !303, i64 12, metadata !304, i64 16, metadata !355, i64 32, metadata !355, i64 40, metadata !355, i64 48}
!355 = metadata !{metadata !"any pointer", metadata !304, i64 0}
!356 = metadata !{i32 27, i32 0, metadata !357, null}
!357 = metadata !{i32 786443, metadata !1, metadata !348, i32 27, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!358 = metadata !{metadata !354, metadata !303, i64 8}
!359 = metadata !{i32 29, i32 0, metadata !360, null}
!360 = metadata !{i32 786443, metadata !1, metadata !361, i32 29, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!361 = metadata !{i32 786443, metadata !1, metadata !357, i32 27, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!362 = metadata !{i32 28, i32 0, metadata !361, null}
!363 = metadata !{metadata !354, metadata !355, i64 48}
!364 = metadata !{i32 30, i32 0, metadata !360, null}
!365 = metadata !{i32 33, i32 0, metadata !140, null}
!366 = metadata !{i32 42, i32 0, metadata !367, null}
!367 = metadata !{i32 786443, metadata !1, metadata !143, i32 42, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!368 = metadata !{i32 43, i32 0, metadata !369, null}
!369 = metadata !{i32 786443, metadata !1, metadata !367, i32 42, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!370 = metadata !{i32 44, i32 0, metadata !369, null}
!371 = metadata !{metadata !354, metadata !355, i64 32}
!372 = metadata !{i32 45, i32 0, metadata !373, null}
!373 = metadata !{i32 786443, metadata !1, metadata !369, i32 45, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!374 = metadata !{i32 46, i32 0, metadata !375, null}
!375 = metadata !{i32 786443, metadata !1, metadata !373, i32 45, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!376 = metadata !{i32 47, i32 0, metadata !377, null}
!377 = metadata !{i32 786443, metadata !1, metadata !375, i32 47, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!378 = metadata !{i32 48, i32 0, metadata !379, null}
!379 = metadata !{i32 786443, metadata !1, metadata !377, i32 47, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!380 = metadata !{i32 49, i32 0, metadata !381, null}
!381 = metadata !{i32 786443, metadata !1, metadata !379, i32 49, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!382 = metadata !{i32 50, i32 0, metadata !381, null}
!383 = metadata !{i32 52, i32 0, metadata !384, null}
!384 = metadata !{i32 786443, metadata !1, metadata !377, i32 52, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!385 = metadata !{i32 56, i32 0, metadata !384, null}
!386 = metadata !{i32 57, i32 0, metadata !387, null}
!387 = metadata !{i32 786443, metadata !1, metadata !375, i32 57, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!388 = metadata !{i32 61, i32 0, metadata !389, null}
!389 = metadata !{i32 786443, metadata !1, metadata !369, i32 59, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!390 = metadata !{i32 66, i32 0, metadata !143, null}
!391 = metadata !{i32 67, i32 0, metadata !143, null}
!392 = metadata !{i32 68, i32 0, metadata !143, null}
!393 = metadata !{i32 69, i32 0, metadata !143, null}
!394 = metadata !{i32 90, i32 0, metadata !151, null}
!395 = metadata !{i32 106, i32 0, metadata !396, null}
!396 = metadata !{i32 786443, metadata !1, metadata !151, i32 98, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!397 = metadata !{i32 undef}
!398 = metadata !{i32 786689, metadata !193, metadata !"i", metadata !134, i32 16777290, metadata !9, i32 0, metadata !399} ; [ DW_TAG_arg_variable ] [i] [line 74]
!399 = metadata !{i32 108, i32 0, metadata !151, null}
!400 = metadata !{i32 74, i32 0, metadata !193, metadata !399}
!401 = metadata !{i32 78, i32 0, metadata !193, metadata !399}
!402 = metadata !{i32 786688, metadata !193, metadata !"arg0", metadata !134, i32 76, metadata !9, i32 0, metadata !399} ; [ DW_TAG_auto_variable ] [arg0] [line 76]
!403 = metadata !{i32 79, i32 0, metadata !193, metadata !399}
!404 = metadata !{i32 786688, metadata !193, metadata !"arg1", metadata !134, i32 76, metadata !9, i32 0, metadata !399} ; [ DW_TAG_auto_variable ] [arg1] [line 76]
!405 = metadata !{i32 80, i32 0, metadata !193, metadata !399}
!406 = metadata !{i32 786688, metadata !193, metadata !"arg2", metadata !134, i32 76, metadata !9, i32 0, metadata !399} ; [ DW_TAG_auto_variable ] [arg2] [line 76]
!407 = metadata !{i32 82, i32 0, metadata !193, metadata !399}
!408 = metadata !{metadata !354, metadata !355, i64 0}
!409 = metadata !{i32 83, i32 0, metadata !410, metadata !399}
!410 = metadata !{i32 786443, metadata !1, metadata !193, i32 83, i32 0, i32 99} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!411 = metadata !{i32 109, i32 0, metadata !412, null}
!412 = metadata !{i32 786443, metadata !1, metadata !151, i32 109, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!413 = metadata !{i32 110, i32 0, metadata !414, null}
!414 = metadata !{i32 786443, metadata !1, metadata !151, i32 110, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!415 = metadata !{i32 112, i32 0, metadata !416, null}
!416 = metadata !{i32 786443, metadata !1, metadata !414, i32 110, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!417 = metadata !{i32 113, i32 0, metadata !416, null}
!418 = metadata !{i32 121, i32 0, metadata !419, null}
!419 = metadata !{i32 786443, metadata !1, metadata !151, i32 121, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!420 = metadata !{i32 126, i32 0, metadata !421, null}
!421 = metadata !{i32 786443, metadata !1, metadata !151, i32 126, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!422 = metadata !{i32 127, i32 0, metadata !423, null}
!423 = metadata !{i32 786443, metadata !1, metadata !421, i32 126, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!424 = metadata !{i32 128, i32 0, metadata !425, null}
!425 = metadata !{i32 786443, metadata !1, metadata !423, i32 128, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!426 = metadata !{i32 129, i32 0, metadata !423, null}
!427 = metadata !{i32 131, i32 0, metadata !423, null}
!428 = metadata !{i32 154, i32 0, metadata !429, null}
!429 = metadata !{i32 786443, metadata !1, metadata !423, i32 154, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!430 = metadata !{i32 786689, metadata !193, metadata !"i", metadata !134, i32 16777290, metadata !9, i32 0, metadata !431} ; [ DW_TAG_arg_variable ] [i] [line 74]
!431 = metadata !{i32 155, i32 0, metadata !432, null}
!432 = metadata !{i32 786443, metadata !1, metadata !429, i32 154, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!433 = metadata !{i32 74, i32 0, metadata !193, metadata !431}
!434 = metadata !{i32 78, i32 0, metadata !193, metadata !431}
!435 = metadata !{i32 786688, metadata !193, metadata !"arg0", metadata !134, i32 76, metadata !9, i32 0, metadata !431} ; [ DW_TAG_auto_variable ] [arg0] [line 76]
!436 = metadata !{i32 79, i32 0, metadata !193, metadata !431}
!437 = metadata !{i32 786688, metadata !193, metadata !"arg1", metadata !134, i32 76, metadata !9, i32 0, metadata !431} ; [ DW_TAG_auto_variable ] [arg1] [line 76]
!438 = metadata !{i32 80, i32 0, metadata !193, metadata !431}
!439 = metadata !{i32 786688, metadata !193, metadata !"arg2", metadata !134, i32 76, metadata !9, i32 0, metadata !431} ; [ DW_TAG_auto_variable ] [arg2] [line 76]
!440 = metadata !{i32 82, i32 0, metadata !193, metadata !431}
!441 = metadata !{i32 83, i32 0, metadata !410, metadata !431}
!442 = metadata !{i32 157, i32 0, metadata !443, null}
!443 = metadata !{i32 786443, metadata !1, metadata !423, i32 157, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!444 = metadata !{i32 157, i32 0, metadata !445, null}
!445 = metadata !{i32 786443, metadata !1, metadata !443, i32 157, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!446 = metadata !{i32 163, i32 0, metadata !447, null}
!447 = metadata !{i32 786443, metadata !1, metadata !423, i32 163, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!448 = metadata !{i32 170, i32 0, metadata !151, null}
!449 = metadata !{i32 175, i32 0, metadata !157, null}
!450 = metadata !{i32 243, i32 0, metadata !157, null}
!451 = metadata !{i32 245, i32 0, metadata !452, null}
!452 = metadata !{i32 786443, metadata !1, metadata !157, i32 245, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!453 = metadata !{i32 246, i32 0, metadata !454, null}
!454 = metadata !{i32 786443, metadata !1, metadata !452, i32 245, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!455 = metadata !{i32 247, i32 0, metadata !456, null}
!456 = metadata !{i32 786443, metadata !1, metadata !454, i32 247, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!457 = metadata !{i32 248, i32 0, metadata !458, null}
!458 = metadata !{i32 786443, metadata !1, metadata !456, i32 247, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!459 = metadata !{i32 249, i32 0, metadata !458, null}
!460 = metadata !{i32 250, i32 0, metadata !454, null}
!461 = metadata !{i32 251, i32 0, metadata !462, null}
!462 = metadata !{i32 786443, metadata !1, metadata !454, i32 251, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!463 = metadata !{i32 258, i32 0, metadata !464, null}
!464 = metadata !{i32 786443, metadata !1, metadata !465, i32 258, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!465 = metadata !{i32 786443, metadata !1, metadata !462, i32 254, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!466 = metadata !{i32 259, i32 0, metadata !467, null}
!467 = metadata !{i32 786443, metadata !1, metadata !464, i32 259, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!468 = metadata !{i32 265, i32 0, metadata !469, null}
!469 = metadata !{i32 786443, metadata !1, metadata !157, i32 265, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!470 = metadata !{metadata !354, metadata !303, i64 12}
!471 = metadata !{i32 266, i32 0, metadata !472, null}
!472 = metadata !{i32 786443, metadata !1, metadata !473, i32 266, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!473 = metadata !{i32 786443, metadata !1, metadata !469, i32 265, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!474 = metadata !{i32 267, i32 0, metadata !472, null}
!475 = metadata !{i32 271, i32 0, metadata !476, null}
!476 = metadata !{i32 786443, metadata !1, metadata !157, i32 271, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!477 = metadata !{i32 272, i32 0, metadata !478, null}
!478 = metadata !{i32 786443, metadata !1, metadata !479, i32 272, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!479 = metadata !{i32 786443, metadata !1, metadata !476, i32 271, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!480 = metadata !{i32 275, i32 0, metadata !481, null}
!481 = metadata !{i32 786443, metadata !1, metadata !478, i32 273, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!482 = metadata !{i32 276, i32 0, metadata !481, null}
!483 = metadata !{i32 278, i32 0, metadata !157, null}
!484 = metadata !{i32 399, i32 0, metadata !163, null}
!485 = metadata !{i32 400, i32 0, metadata !163, null}
!486 = metadata !{i32 406, i32 0, metadata !163, null}
!487 = metadata !{i32 407, i32 0, metadata !163, null}
!488 = metadata !{i32 408, i32 0, metadata !163, null}
!489 = metadata !{i32 409, i32 0, metadata !490, null}
!490 = metadata !{i32 786443, metadata !1, metadata !163, i32 408, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!491 = metadata !{i32 410, i32 0, metadata !492, null}
!492 = metadata !{i32 786443, metadata !1, metadata !490, i32 410, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!493 = metadata !{i32 411, i32 0, metadata !494, null}
!494 = metadata !{i32 786443, metadata !1, metadata !492, i32 410, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!495 = metadata !{i32 412, i32 0, metadata !494, null}
!496 = metadata !{i32 413, i32 0, metadata !494, null}
!497 = metadata !{i32 414, i32 0, metadata !498, null}
!498 = metadata !{i32 786443, metadata !1, metadata !494, i32 414, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!499 = metadata !{i32 320, i32 0, metadata !500, metadata !501}
!500 = metadata !{i32 786443, metadata !1, metadata !186, i32 320, i32 0, i32 84} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!501 = metadata !{i32 416, i32 11, metadata !490, null}
!502 = metadata !{i32 321, i32 0, metadata !503, metadata !501}
!503 = metadata !{i32 786443, metadata !1, metadata !500, i32 320, i32 0, i32 85} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!504 = metadata !{i32 786688, metadata !186, metadata !"k", metadata !134, i32 318, metadata !9, i32 0, metadata !501} ; [ DW_TAG_auto_variable ] [k] [line 318]
!505 = metadata !{i32 322, i32 0, metadata !503, metadata !501}
!506 = metadata !{i32 786688, metadata !186, metadata !"nopnds", metadata !134, i32 318, metadata !9, i32 0, metadata !501} ; [ DW_TAG_auto_variable ] [nopnds] [line 318]
!507 = metadata !{i32 786688, metadata !186, metadata !"j", metadata !134, i32 318, metadata !9, i32 0, metadata !501} ; [ DW_TAG_auto_variable ] [j] [line 318]
!508 = metadata !{i32 323, i32 0, metadata !509, metadata !501}
!509 = metadata !{i32 786443, metadata !1, metadata !503, i32 323, i32 0, i32 86} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!510 = metadata !{i32 334, i32 0, metadata !511, metadata !501}
!511 = metadata !{i32 786443, metadata !1, metadata !512, i32 334, i32 0, i32 92} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!512 = metadata !{i32 786443, metadata !1, metadata !513, i32 330, i32 0, i32 90} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!513 = metadata !{i32 786443, metadata !1, metadata !514, i32 326, i32 0, i32 88} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!514 = metadata !{i32 786443, metadata !1, metadata !509, i32 323, i32 0, i32 87} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!515 = metadata !{i32 324, i32 0, metadata !514, metadata !501}
!516 = metadata !{i32 786688, metadata !186, metadata !"opndj", metadata !134, i32 318, metadata !9, i32 0, metadata !501} ; [ DW_TAG_auto_variable ] [opndj] [line 318]
!517 = metadata !{i32 326, i32 0, metadata !513, metadata !501}
!518 = metadata !{i32 327, i32 0, metadata !519, metadata !501}
!519 = metadata !{i32 786443, metadata !1, metadata !513, i32 326, i32 0, i32 89} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!520 = metadata !{i32 328, i32 0, metadata !519, metadata !501}
!521 = metadata !{i32 330, i32 0, metadata !512, metadata !501}
!522 = metadata !{i32 331, i32 0, metadata !523, metadata !501}
!523 = metadata !{i32 786443, metadata !1, metadata !512, i32 330, i32 0, i32 91} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!524 = metadata !{i32 332, i32 0, metadata !523, metadata !501}
!525 = metadata !{i32 335, i32 0, metadata !526, metadata !501}
!526 = metadata !{i32 786443, metadata !1, metadata !511, i32 334, i32 0, i32 93} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!527 = metadata !{i32 336, i32 0, metadata !526, metadata !501}
!528 = metadata !{i32 339, i32 0, metadata !514, metadata !501}
!529 = metadata !{i32 344, i32 0, metadata !530, metadata !501}
!530 = metadata !{i32 786443, metadata !1, metadata !503, i32 344, i32 0, i32 94} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!531 = metadata !{i32 347, i32 0, metadata !532, metadata !501}
!532 = metadata !{i32 786443, metadata !1, metadata !503, i32 347, i32 0, i32 95} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!533 = metadata !{i32 357, i32 0, metadata !534, metadata !501}
!534 = metadata !{i32 786443, metadata !1, metadata !532, i32 347, i32 0, i32 96} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!535 = metadata !{i32 358, i32 0, metadata !534, metadata !501}
!536 = metadata !{i32 364, i32 0, metadata !537, metadata !501}
!537 = metadata !{i32 786443, metadata !1, metadata !503, i32 364, i32 0, i32 97} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!538 = metadata !{i32 365, i32 0, metadata !539, metadata !501}
!539 = metadata !{i32 786443, metadata !1, metadata !537, i32 364, i32 0, i32 98} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!540 = metadata !{i32 366, i32 0, metadata !539, metadata !501}
!541 = metadata !{i32 367, i32 0, metadata !539, metadata !501}
!542 = metadata !{i32 368, i32 0, metadata !539, metadata !501}
!543 = metadata !{i32 369, i32 0, metadata !539, metadata !501}
!544 = metadata !{i32 371, i32 0, metadata !539, metadata !501}
!545 = metadata !{i32 372, i32 0, metadata !539, metadata !501}
!546 = metadata !{i32 380, i32 0, metadata !503, metadata !501}
!547 = metadata !{i32 381, i32 0, metadata !503, metadata !501}
!548 = metadata !{i32 382, i32 0, metadata !503, metadata !501}
!549 = metadata !{i32 383, i32 0, metadata !503, metadata !501}
!550 = metadata !{i32 385, i32 0, metadata !503, metadata !501}
!551 = metadata !{i32 417, i32 0, metadata !490, null}
!552 = metadata !{i32 419, i32 0, metadata !163, null}
!553 = metadata !{i32 423, i32 0, metadata !170, null}
!554 = metadata !{i32 424, i32 0, metadata !170, null}
!555 = metadata !{i32 426, i32 0, metadata !185, null}
!556 = metadata !{i32 427, i32 0, metadata !184, null}
!557 = metadata !{i32 431, i32 0, metadata !558, null}
!558 = metadata !{i32 786443, metadata !1, metadata !184, i32 431, i32 0, i32 76} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!559 = metadata !{i32 444, i32 0, metadata !560, null}
!560 = metadata !{i32 786443, metadata !1, metadata !184, i32 444, i32 0, i32 78} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!561 = metadata !{i32 433, i32 0, metadata !562, null}
!562 = metadata !{i32 786443, metadata !1, metadata !558, i32 431, i32 0, i32 77} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!563 = metadata !{i32 445, i32 0, metadata !564, null}
!564 = metadata !{i32 786443, metadata !1, metadata !560, i32 444, i32 0, i32 79} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!565 = metadata !{i32 446, i32 0, metadata !564, null}
!566 = metadata !{i32 447, i32 0, metadata !564, null}
!567 = metadata !{i32 448, i32 0, metadata !564, null}
!568 = metadata !{i32 453, i32 0, metadata !564, null}
!569 = metadata !{i32 457, i32 0, metadata !184, null}
!570 = metadata !{i32 459, i32 0, metadata !184, null}
!571 = metadata !{i32 461, i32 0, metadata !182, null}
!572 = metadata !{i32 462, i32 0, metadata !182, null}
!573 = metadata !{i32 463, i32 0, metadata !574, null}
!574 = metadata !{i32 786443, metadata !1, metadata !182, i32 463, i32 0, i32 82} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!575 = metadata !{i32 464, i32 0, metadata !576, null}
!576 = metadata !{i32 786443, metadata !1, metadata !574, i32 463, i32 0, i32 83} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/aha.c]
!577 = metadata !{i32 465, i32 0, metadata !576, null}
!578 = metadata !{i32 467, i32 0, metadata !182, null}
!579 = metadata !{i32 470, i32 0, metadata !170, null}
