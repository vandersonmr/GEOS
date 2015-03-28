; ModuleID = 'hexxagonboard.cpp'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%class.BitBoard64 = type { i32, i32 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%class.HexxagonBoard = type { %class.BitBoard64, %class.BitBoard64 }
%class.HexxagonMove = type { i8, i8, i32 }
%class.HexxagonMoveList = type { i32, %class.HexxagonMove* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@clone_lookups = global %class.BitBoard64* null, align 8
@jump_lookups = global %class.BitBoard64* null, align 8
@.str = private unnamed_addr constant [17 x i8] c"Out of memory !\0A\00", align 1
@.str1 = private unnamed_addr constant [16 x i8] c"No more moves.\0A\00", align 1
@_ZSt4cout = external global %"class.std::basic_ostream"
@.str2 = private unnamed_addr constant [28 x i8] c"         A B C D E F G H I\0A\00", align 1
@.str3 = private unnamed_addr constant [27 x i8] c"        / / / / / / / / /\0A\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"- \00", align 1
@.str5 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str6 = private unnamed_addr constant [3 x i8] c"x \00", align 1
@.str7 = private unnamed_addr constant [3 x i8] c"o \00", align 1
@.str8 = private unnamed_addr constant [3 x i8] c". \00", align 1
@.str9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str10 = private unnamed_addr constant [12 x i8] c"\0ABricks: x \00", align 1
@.str11 = private unnamed_addr constant [5 x i8] c", o \00", align 1
@.str12 = private unnamed_addr constant [9 x i8] c". Empty \00", align 1
@.str13 = private unnamed_addr constant [3 x i8] c".\0A\00", align 1
@.str14 = private unnamed_addr constant [15 x i8] c"Next to move: \00", align 1
@.str15 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str16 = private unnamed_addr constant [2 x i8] c"o\00", align 1
@.str17 = private unnamed_addr constant [13 x i8] c", Game over.\00", align 1
@.str18 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__llvm_gcov_ctr = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr19 = internal global [48 x i64] zeroinitializer
@__llvm_gcov_ctr20 = internal global [47 x i64] zeroinitializer
@__llvm_gcda_edge_table = internal unnamed_addr constant [2 x i64*] [i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 2), i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 3)]
@__llvm_gcov_global_state_pred = internal unnamed_addr global i32 -1
@__llvm_gcov_ctr21 = internal global [47 x i64] zeroinitializer
@__llvm_gcda_edge_table22 = internal unnamed_addr constant [2 x i64*] [i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 2), i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 3)]
@__llvm_gcov_global_state_pred23 = internal unnamed_addr global i32 -1
@__llvm_gcov_ctr24 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr25 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr26 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr27 = internal global [26 x i64] zeroinitializer
@__llvm_gcov_ctr28 = internal global [36 x i64] zeroinitializer
@__llvm_gcov_ctr29 = internal global [9 x i64] zeroinitializer
@__llvm_gcov_ctr30 = internal global [5 x i64] zeroinitializer
@__llvm_gcov_ctr31 = internal global [16 x i64] zeroinitializer
@__llvm_gcov_ctr32 = internal global [39 x i64] zeroinitializer
@__llvm_gcda_edge_table33 = internal unnamed_addr constant [8 x i64*] [i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 1), i64* null, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 2), i64* null, i64* null, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 33), i64* null, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 34)]
@__llvm_gcov_global_state_pred34 = internal unnamed_addr global i32 -1
@__llvm_gcov_ctr35 = internal global [12 x i64] zeroinitializer
@__llvm_gcda_edge_table36 = internal unnamed_addr constant [2 x i64*] [i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr35, i64 0, i64 6), i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr35, i64 0, i64 7)]
@__llvm_gcov_global_state_pred37 = internal unnamed_addr global i32 -1
@__llvm_gcov_ctr38 = internal global [12 x i64] zeroinitializer
@__llvm_gcda_edge_table39 = internal unnamed_addr constant [2 x i64*] [i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr38, i64 0, i64 6), i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr38, i64 0, i64 7)]
@__llvm_gcov_global_state_pred40 = internal unnamed_addr global i32 -1
@__llvm_gcov_ctr41 = internal global [8 x i64] zeroinitializer
@__llvm_gcov_ctr42 = internal global [8 x i64] zeroinitializer
@__llvm_gcov_ctr43 = internal global [55 x i64] zeroinitializer
@__llvm_gcov_ctr44 = internal global [5 x i64] zeroinitializer
@__llvm_gcov_ctr45 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr46 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr47 = internal global [8 x i64] zeroinitializer
@__llvm_gcda_edge_table48 = internal unnamed_addr constant [2 x i64*] [i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr47, i64 0, i64 2), i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr47, i64 0, i64 3)]
@__llvm_gcov_global_state_pred49 = internal unnamed_addr global i32 -1
@__llvm_gcov_ctr50 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr51 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr52 = internal global [2 x i64] zeroinitializer
@0 = private unnamed_addr constant [5 x i8] c"*204\00"
@1 = private unnamed_addr constant [95 x i8] c"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.gcda\00"
@2 = private unnamed_addr constant [22 x i8] c"__cxx_global_var_init\00"
@3 = private unnamed_addr constant [23 x i8] c"_Z16getHexxagonIndexii\00"
@4 = private unnamed_addr constant [22 x i8] c"_Z16initCloneLookupsv\00"
@5 = private unnamed_addr constant [21 x i8] c"_Z15initJumpLookupsv\00"
@6 = private unnamed_addr constant [26 x i8] c"_ZN13HexxagonBoardC2ERKS_\00"
@7 = private unnamed_addr constant [26 x i8] c"_ZN13HexxagonBoardaSERKS_\00"
@8 = private unnamed_addr constant [26 x i8] c"_ZN13HexxagonBoard4initEv\00"
@9 = private unnamed_addr constant [34 x i8] c"_ZN13HexxagonBoard11countBricksEi\00"
@10 = private unnamed_addr constant [30 x i8] c"_ZN13HexxagonBoard8evaluateEv\00"
@11 = private unnamed_addr constant [34 x i8] c"_ZN13HexxagonBoard11getHexxagonEi\00"
@12 = private unnamed_addr constant [45 x i8] c"_ZN13HexxagonBoard9applyMoveER12HexxagonMove\00"
@13 = private unnamed_addr constant [48 x i8] c"_ZN13HexxagonBoard11isMoveValidER12HexxagonMove\00"
@14 = private unnamed_addr constant [39 x i8] c"_ZN13HexxagonBoard16generateMoveListEv\00"
@15 = private unnamed_addr constant [31 x i8] c"_ZN13HexxagonBoard9endOfGameEv\00"
@16 = private unnamed_addr constant [41 x i8] c"_ZN13HexxagonBoard12computerMoveEiPFvvEi\00"
@17 = private unnamed_addr constant [44 x i8] c"_ZN13HexxagonBoard12readFromFileEP8_IO_FILE\00"
@18 = private unnamed_addr constant [43 x i8] c"_ZN13HexxagonBoard11writeToFileEP8_IO_FILE\00"
@19 = private unnamed_addr constant [39 x i8] c"_ZN13HexxagonBoard16displayBoardTextEi\00"
@20 = private unnamed_addr constant [26 x i8] c"_ZN16HexxagonMoveListD2Ev\00"
@21 = private unnamed_addr constant [23 x i8] c"_ZN12HexxagonMoveC2Eii\00"
@22 = private unnamed_addr constant [22 x i8] c"_ZN12HexxagonMoveC2Ei\00"
@23 = private unnamed_addr constant [26 x i8] c"_ZN16HexxagonMoveListC2Ev\00"
@24 = private unnamed_addr constant [22 x i8] c"_ZN12HexxagonMoveC2Ev\00"
@25 = private unnamed_addr constant [21 x i8] c"_ZN10BitBoard64C2Ejj\00"
@26 = private unnamed_addr constant [20 x i8] c"_ZN10BitBoard64C2Ev\00"
@llvm.global_ctors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_hexxagonboard.cpp, i8* null }, { i32, void ()*, i8* } { i32 0, void ()* @__llvm_gcov_init, i8* null }]

@_ZN13HexxagonBoardC1ERKS_ = alias void (%class.HexxagonBoard*, %class.HexxagonBoard*)* @_ZN13HexxagonBoardC2ERKS_

define internal void @__cxx_global_var_init() section ".text.startup" {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr, i64 0, i64 0)
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr, i64 0, i64 1), !dbg !603
  %4 = add i64 %3, 1, !dbg !603
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr, i64 0, i64 1), !dbg !603
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !603
  %5 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #1, !dbg !603
  ret void, !dbg !603
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) #0

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) #0

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #1

; Function Attrs: nounwind uwtable
define i32 @_Z16getHexxagonIndexii(i32 %x, i32 %y) #2 {
entry:
  %0 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 0)
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %no = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !604, metadata !605), !dbg !606
  store i32 %y, i32* %y.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y.addr, metadata !607, metadata !605), !dbg !608
  call void @llvm.dbg.declare(metadata i32* %no, metadata !609, metadata !605), !dbg !610
  %3 = load i32* %x.addr, align 4, !dbg !611
  %cmp = icmp sgt i32 %3, 0, !dbg !611
  %4 = select i1 %cmp, i64 1, i64 2, !dbg !613
  %5 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 %4, !dbg !613
  %6 = load i64* %5, !dbg !613
  %7 = add i64 %6, 1, !dbg !613
  store i64 %7, i64* %5, !dbg !613
  br i1 %cmp, label %land.lhs.true, label %if.end52, !dbg !613

land.lhs.true:                                    ; preds = %2
  %8 = load i32* %x.addr, align 4, !dbg !614
  %cmp1 = icmp slt i32 %8, 10, !dbg !614
  %9 = select i1 %cmp1, i64 3, i64 4, !dbg !613
  %10 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 %9, !dbg !613
  %11 = load i64* %10, !dbg !613
  %12 = add i64 %11, 1, !dbg !613
  store i64 %12, i64* %10, !dbg !613
  br i1 %cmp1, label %land.lhs.true2, label %if.end52, !dbg !613

land.lhs.true2:                                   ; preds = %land.lhs.true
  %13 = load i32* %y.addr, align 4, !dbg !616
  %cmp3 = icmp sgt i32 %13, 0, !dbg !616
  %14 = select i1 %cmp3, i64 5, i64 6, !dbg !613
  %15 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 %14, !dbg !613
  %16 = load i64* %15, !dbg !613
  %17 = add i64 %16, 1, !dbg !613
  store i64 %17, i64* %15, !dbg !613
  br i1 %cmp3, label %land.lhs.true4, label %if.end52, !dbg !613

land.lhs.true4:                                   ; preds = %land.lhs.true2
  %18 = load i32* %y.addr, align 4, !dbg !618
  %cmp5 = icmp slt i32 %18, 10, !dbg !618
  %19 = select i1 %cmp5, i64 7, i64 8, !dbg !613
  %20 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 %19, !dbg !613
  %21 = load i64* %20, !dbg !613
  %22 = add i64 %21, 1, !dbg !613
  store i64 %22, i64* %20, !dbg !613
  br i1 %cmp5, label %if.then, label %if.end52, !dbg !613

if.then:                                          ; preds = %land.lhs.true4
  %23 = load i32* %y.addr, align 4, !dbg !620
  %cmp6 = icmp slt i32 %23, 5, !dbg !620
  %24 = select i1 %cmp6, i64 9, i64 10, !dbg !623
  %25 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 %24, !dbg !623
  %26 = load i64* %25, !dbg !623
  %27 = add i64 %26, 1, !dbg !623
  store i64 %27, i64* %25, !dbg !623
  br i1 %cmp6, label %if.then7, label %if.end11, !dbg !623

if.then7:                                         ; preds = %if.then
  %28 = load i32* %x.addr, align 4, !dbg !624
  %29 = load i32* %y.addr, align 4, !dbg !626
  %sub = sub nsw i32 5, %29, !dbg !627
  %sub8 = sub nsw i32 9, %sub, !dbg !628
  %cmp9 = icmp sgt i32 %28, %sub8, !dbg !624
  %30 = select i1 %cmp9, i64 11, i64 12, !dbg !629
  %31 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 %30, !dbg !629
  %32 = load i64* %31, !dbg !629
  %33 = add i64 %32, 1, !dbg !629
  store i64 %33, i64* %31, !dbg !629
  br i1 %cmp9, label %if.then10, label %if.end, !dbg !629

if.then10:                                        ; preds = %if.then7
  %34 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 13), !dbg !630
  %35 = add i64 %34, 1, !dbg !630
  store i64 %35, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 13), !dbg !630
  store i32 -1, i32* %retval, !dbg !630
  br label %return, !dbg !630

if.end:                                           ; preds = %if.then7
  %36 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 14), !dbg !631
  %37 = add i64 %36, 1, !dbg !631
  store i64 %37, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 14), !dbg !631
  br label %if.end11, !dbg !631

if.end11:                                         ; preds = %if.end, %if.then
  %38 = load i32* %y.addr, align 4, !dbg !633
  %cmp12 = icmp sgt i32 %38, 5, !dbg !633
  %39 = select i1 %cmp12, i64 15, i64 16, !dbg !635
  %40 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 %39, !dbg !635
  %41 = load i64* %40, !dbg !635
  %42 = add i64 %41, 1, !dbg !635
  store i64 %42, i64* %40, !dbg !635
  br i1 %cmp12, label %if.then13, label %if.end18, !dbg !635

if.then13:                                        ; preds = %if.end11
  %43 = load i32* %x.addr, align 4, !dbg !636
  %44 = load i32* %y.addr, align 4, !dbg !638
  %sub14 = sub nsw i32 %44, 5, !dbg !638
  %cmp15 = icmp sle i32 %43, %sub14, !dbg !636
  %45 = select i1 %cmp15, i64 17, i64 18, !dbg !639
  %46 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 %45, !dbg !639
  %47 = load i64* %46, !dbg !639
  %48 = add i64 %47, 1, !dbg !639
  store i64 %48, i64* %46, !dbg !639
  br i1 %cmp15, label %if.then16, label %if.end17, !dbg !639

if.then16:                                        ; preds = %if.then13
  %49 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 19), !dbg !640
  %50 = add i64 %49, 1, !dbg !640
  store i64 %50, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 19), !dbg !640
  store i32 -1, i32* %retval, !dbg !640
  br label %return, !dbg !640

if.end17:                                         ; preds = %if.then13
  %51 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 20), !dbg !641
  %52 = add i64 %51, 1, !dbg !641
  store i64 %52, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 20), !dbg !641
  br label %if.end18, !dbg !641

if.end18:                                         ; preds = %if.end17, %if.end11
  %53 = load i32* %x.addr, align 4, !dbg !643
  %54 = load i32* %y.addr, align 4, !dbg !644
  %mul = mul nsw i32 %54, 9, !dbg !644
  %add = add nsw i32 %53, %mul, !dbg !643
  %sub19 = sub nsw i32 %add, 10, !dbg !643
  store i32 %sub19, i32* %no, align 4, !dbg !645
  %55 = load i32* %y.addr, align 4, !dbg !646
  %cmp20 = icmp sgt i32 %55, 1, !dbg !646
  %56 = select i1 %cmp20, i64 21, i64 22, !dbg !648
  %57 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 %56, !dbg !648
  %58 = load i64* %57, !dbg !648
  %59 = add i64 %58, 1, !dbg !648
  store i64 %59, i64* %57, !dbg !648
  br i1 %cmp20, label %if.then21, label %if.end23, !dbg !648

if.then21:                                        ; preds = %if.end18
  %60 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 23), !dbg !649
  %61 = add i64 %60, 1, !dbg !649
  store i64 %61, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 23), !dbg !649
  %62 = load i32* %no, align 4, !dbg !649
  %sub22 = sub nsw i32 %62, 4, !dbg !649
  store i32 %sub22, i32* %no, align 4, !dbg !649
  br label %if.end23, !dbg !649

if.end23:                                         ; preds = %if.then21, %if.end18
  %63 = load i32* %y.addr, align 4, !dbg !651
  %cmp24 = icmp sgt i32 %63, 2, !dbg !651
  %64 = select i1 %cmp24, i64 24, i64 25, !dbg !653
  %65 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 %64, !dbg !653
  %66 = load i64* %65, !dbg !653
  %67 = add i64 %66, 1, !dbg !653
  store i64 %67, i64* %65, !dbg !653
  br i1 %cmp24, label %if.then25, label %if.end27, !dbg !653

if.then25:                                        ; preds = %if.end23
  %68 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 26), !dbg !654
  %69 = add i64 %68, 1, !dbg !654
  store i64 %69, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 26), !dbg !654
  %70 = load i32* %no, align 4, !dbg !654
  %sub26 = sub nsw i32 %70, 3, !dbg !654
  store i32 %sub26, i32* %no, align 4, !dbg !654
  br label %if.end27, !dbg !654

if.end27:                                         ; preds = %if.then25, %if.end23
  %71 = load i32* %y.addr, align 4, !dbg !656
  %cmp28 = icmp sgt i32 %71, 3, !dbg !656
  %72 = select i1 %cmp28, i64 27, i64 28, !dbg !658
  %73 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 %72, !dbg !658
  %74 = load i64* %73, !dbg !658
  %75 = add i64 %74, 1, !dbg !658
  store i64 %75, i64* %73, !dbg !658
  br i1 %cmp28, label %if.then29, label %if.end31, !dbg !658

if.then29:                                        ; preds = %if.end27
  %76 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 29), !dbg !659
  %77 = add i64 %76, 1, !dbg !659
  store i64 %77, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 29), !dbg !659
  %78 = load i32* %no, align 4, !dbg !659
  %sub30 = sub nsw i32 %78, 2, !dbg !659
  store i32 %sub30, i32* %no, align 4, !dbg !659
  br label %if.end31, !dbg !659

if.end31:                                         ; preds = %if.then29, %if.end27
  %79 = load i32* %y.addr, align 4, !dbg !661
  %cmp32 = icmp sgt i32 %79, 4, !dbg !661
  %80 = select i1 %cmp32, i64 30, i64 31, !dbg !663
  %81 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 %80, !dbg !663
  %82 = load i64* %81, !dbg !663
  %83 = add i64 %82, 1, !dbg !663
  store i64 %83, i64* %81, !dbg !663
  br i1 %cmp32, label %if.then33, label %if.end35, !dbg !663

if.then33:                                        ; preds = %if.end31
  %84 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 32), !dbg !664
  %85 = add i64 %84, 1, !dbg !664
  store i64 %85, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 32), !dbg !664
  %86 = load i32* %no, align 4, !dbg !664
  %sub34 = sub nsw i32 %86, 1, !dbg !664
  store i32 %sub34, i32* %no, align 4, !dbg !664
  br label %if.end35, !dbg !664

if.end35:                                         ; preds = %if.then33, %if.end31
  %87 = load i32* %y.addr, align 4, !dbg !666
  %cmp36 = icmp sgt i32 %87, 5, !dbg !666
  %88 = select i1 %cmp36, i64 33, i64 34, !dbg !668
  %89 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 %88, !dbg !668
  %90 = load i64* %89, !dbg !668
  %91 = add i64 %90, 1, !dbg !668
  store i64 %91, i64* %89, !dbg !668
  br i1 %cmp36, label %if.then37, label %if.end39, !dbg !668

if.then37:                                        ; preds = %if.end35
  %92 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 35), !dbg !669
  %93 = add i64 %92, 1, !dbg !669
  store i64 %93, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 35), !dbg !669
  %94 = load i32* %no, align 4, !dbg !669
  %sub38 = sub nsw i32 %94, 1, !dbg !669
  store i32 %sub38, i32* %no, align 4, !dbg !669
  br label %if.end39, !dbg !669

if.end39:                                         ; preds = %if.then37, %if.end35
  %95 = load i32* %y.addr, align 4, !dbg !671
  %cmp40 = icmp sgt i32 %95, 6, !dbg !671
  %96 = select i1 %cmp40, i64 36, i64 37, !dbg !673
  %97 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 %96, !dbg !673
  %98 = load i64* %97, !dbg !673
  %99 = add i64 %98, 1, !dbg !673
  store i64 %99, i64* %97, !dbg !673
  br i1 %cmp40, label %if.then41, label %if.end43, !dbg !673

if.then41:                                        ; preds = %if.end39
  %100 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 38), !dbg !674
  %101 = add i64 %100, 1, !dbg !674
  store i64 %101, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 38), !dbg !674
  %102 = load i32* %no, align 4, !dbg !674
  %sub42 = sub nsw i32 %102, 2, !dbg !674
  store i32 %sub42, i32* %no, align 4, !dbg !674
  br label %if.end43, !dbg !674

if.end43:                                         ; preds = %if.then41, %if.end39
  %103 = load i32* %y.addr, align 4, !dbg !676
  %cmp44 = icmp sgt i32 %103, 7, !dbg !676
  %104 = select i1 %cmp44, i64 39, i64 40, !dbg !678
  %105 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 %104, !dbg !678
  %106 = load i64* %105, !dbg !678
  %107 = add i64 %106, 1, !dbg !678
  store i64 %107, i64* %105, !dbg !678
  br i1 %cmp44, label %if.then45, label %if.end47, !dbg !678

if.then45:                                        ; preds = %if.end43
  %108 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 41), !dbg !679
  %109 = add i64 %108, 1, !dbg !679
  store i64 %109, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 41), !dbg !679
  %110 = load i32* %no, align 4, !dbg !679
  %sub46 = sub nsw i32 %110, 3, !dbg !679
  store i32 %sub46, i32* %no, align 4, !dbg !679
  br label %if.end47, !dbg !679

if.end47:                                         ; preds = %if.then45, %if.end43
  %111 = load i32* %y.addr, align 4, !dbg !681
  %cmp48 = icmp sgt i32 %111, 8, !dbg !681
  %112 = select i1 %cmp48, i64 42, i64 43, !dbg !683
  %113 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 %112, !dbg !683
  %114 = load i64* %113, !dbg !683
  %115 = add i64 %114, 1, !dbg !683
  store i64 %115, i64* %113, !dbg !683
  br i1 %cmp48, label %if.then49, label %if.end51, !dbg !683

if.then49:                                        ; preds = %if.end47
  %116 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 44), !dbg !684
  %117 = add i64 %116, 1, !dbg !684
  store i64 %117, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 44), !dbg !684
  %118 = load i32* %no, align 4, !dbg !684
  %sub50 = sub nsw i32 %118, 4, !dbg !684
  store i32 %sub50, i32* %no, align 4, !dbg !684
  br label %if.end51, !dbg !684

if.end51:                                         ; preds = %if.then49, %if.end47
  %119 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 45), !dbg !686
  %120 = add i64 %119, 1, !dbg !686
  store i64 %120, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 45), !dbg !686
  %121 = load i32* %no, align 4, !dbg !686
  store i32 %121, i32* %retval, !dbg !687
  br label %return, !dbg !687

if.end52:                                         ; preds = %land.lhs.true4, %land.lhs.true2, %land.lhs.true, %2
  %122 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 46), !dbg !688
  %123 = add i64 %122, 1, !dbg !688
  store i64 %123, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 46), !dbg !688
  store i32 -1, i32* %retval, !dbg !688
  br label %return, !dbg !688

return:                                           ; preds = %if.end52, %if.end51, %if.then16, %if.then10
  %124 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 47), !dbg !689
  %125 = add i64 %124, 1, !dbg !689
  store i64 %125, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 47), !dbg !689
  %126 = load i32* %retval, !dbg !689
  ret i32 %126, !dbg !689
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

; Function Attrs: uwtable
define void @_Z16initCloneLookupsv() #4 {
entry:
  %0 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 0)
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %no = alloca i32, align 4
  %i = alloca i32, align 4
  %ref.tmp = alloca %class.BitBoard64, align 4
  %coerce = alloca %class.BitBoard64, align 4
  %y = alloca i32, align 4
  %x = alloca i32, align 4
  %out = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 1), !dbg !690
  %4 = add i64 %3, 1, !dbg !690
  store i64 %4, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 1), !dbg !690
  %call = call noalias i8* @_Znam(i64 488) #9, !dbg !690
  %5 = bitcast i8* %call to %class.BitBoard64*, !dbg !690
  %arrayctor.end = getelementptr inbounds %class.BitBoard64* %5, i64 61, !dbg !690
  br label %arrayctor.loop, !dbg !690

arrayctor.loop:                                   ; preds = %invoke.cont, %2
  %arrayctor.cur = phi %class.BitBoard64* [ %5, %2 ], [ %arrayctor.next, %invoke.cont ], !dbg !690
  store i32 0, i32* @__llvm_gcov_global_state_pred, !dbg !691
  invoke void @_ZN10BitBoard64C2Ev(%class.BitBoard64* %arrayctor.cur)
          to label %invoke.cont unwind label %lpad, !dbg !691

invoke.cont:                                      ; preds = %arrayctor.loop
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table, i64 0, i64 0)), !dbg !694
  %arrayctor.next = getelementptr inbounds %class.BitBoard64* %arrayctor.cur, i64 1, !dbg !694
  %arrayctor.done = icmp eq %class.BitBoard64* %arrayctor.next, %arrayctor.end, !dbg !694
  %6 = select i1 %arrayctor.done, i64 4, i64 5, !dbg !694
  %7 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 %6, !dbg !694
  %8 = load i64* %7, !dbg !694
  %9 = add i64 %8, 1, !dbg !694
  store i64 %9, i64* %7, !dbg !694
  br i1 %arrayctor.done, label %arrayctor.cont, label %arrayctor.loop, !dbg !694

arrayctor.cont:                                   ; preds = %invoke.cont
  %10 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 6), !dbg !696
  %11 = add i64 %10, 1, !dbg !696
  store i64 %11, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 6), !dbg !696
  store %class.BitBoard64* %5, %class.BitBoard64** @clone_lookups, align 8, !dbg !696
  call void @llvm.dbg.declare(metadata i32* %no, metadata !698, metadata !605), !dbg !699
  store i32 0, i32* %no, align 4, !dbg !699
  call void @llvm.dbg.declare(metadata i32* %i, metadata !700, metadata !605), !dbg !702
  store i32 0, i32* %i, align 4, !dbg !702
  br label %for.cond, !dbg !703

for.cond:                                         ; preds = %for.inc, %arrayctor.cont
  %12 = load i32* %i, align 4, !dbg !704
  %cmp = icmp slt i32 %12, 61, !dbg !704
  %13 = select i1 %cmp, i64 7, i64 8, !dbg !708
  %14 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 %13, !dbg !708
  %15 = load i64* %14, !dbg !708
  %16 = add i64 %15, 1, !dbg !708
  store i64 %16, i64* %14, !dbg !708
  br i1 %cmp, label %for.body, label %for.end, !dbg !708

for.body:                                         ; preds = %for.cond
  %17 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 9), !dbg !709
  %18 = add i64 %17, 1, !dbg !709
  store i64 %18, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 9), !dbg !709
  %19 = load i32* %i, align 4, !dbg !709
  %idxprom = sext i32 %19 to i64, !dbg !710
  %20 = load %class.BitBoard64** @clone_lookups, align 8, !dbg !710
  %arrayidx = getelementptr inbounds %class.BitBoard64* %20, i64 %idxprom, !dbg !710
  call void @_ZN10BitBoard64C2Ejj(%class.BitBoard64* %ref.tmp, i32 0, i32 0), !dbg !710
  %call1 = call i64 @_ZN10BitBoard64aSERKS_(%class.BitBoard64* %arrayidx, %class.BitBoard64* dereferenceable(8) %ref.tmp), !dbg !710
  %21 = bitcast %class.BitBoard64* %coerce to i64*, !dbg !710
  store i64 %call1, i64* %21, align 1, !dbg !710
  br label %for.inc, !dbg !710

for.inc:                                          ; preds = %for.body
  %22 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 10), !dbg !711
  %23 = add i64 %22, 1, !dbg !711
  store i64 %23, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 10), !dbg !711
  %24 = load i32* %i, align 4, !dbg !711
  %inc = add nsw i32 %24, 1, !dbg !711
  store i32 %inc, i32* %i, align 4, !dbg !711
  br label %for.cond, !dbg !712

lpad:                                             ; preds = %arrayctor.loop
  %25 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !713
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table, i64 0, i64 1)), !dbg !713
  %26 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 11), !dbg !713
  %27 = add i64 %26, 1, !dbg !713
  store i64 %27, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 11), !dbg !713
  %28 = extractvalue { i8*, i32 } %25, 0, !dbg !713
  store i8* %28, i8** %exn.slot, !dbg !713
  %29 = extractvalue { i8*, i32 } %25, 1, !dbg !713
  store i32 %29, i32* %ehselector.slot, !dbg !713
  call void @_ZdaPv(i8* %call) #10, !dbg !713
  br label %eh.resume, !dbg !713

for.end:                                          ; preds = %for.cond
  %30 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 12), !dbg !714
  %31 = add i64 %30, 1, !dbg !714
  store i64 %31, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 12), !dbg !714
  call void @llvm.dbg.declare(metadata i32* %y, metadata !716, metadata !605), !dbg !714
  store i32 1, i32* %y, align 4, !dbg !714
  br label %for.cond2, !dbg !717

for.cond2:                                        ; preds = %for.inc59, %for.end
  %32 = load i32* %y, align 4, !dbg !718
  %cmp3 = icmp sle i32 %32, 9, !dbg !718
  %33 = select i1 %cmp3, i64 13, i64 14, !dbg !722
  %34 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 %33, !dbg !722
  %35 = load i64* %34, !dbg !722
  %36 = add i64 %35, 1, !dbg !722
  store i64 %36, i64* %34, !dbg !722
  br i1 %cmp3, label %for.body4, label %for.end61, !dbg !722

for.body4:                                        ; preds = %for.cond2
  %37 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 15), !dbg !723
  %38 = add i64 %37, 1, !dbg !723
  store i64 %38, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 15), !dbg !723
  call void @llvm.dbg.declare(metadata i32* %x, metadata !726, metadata !605), !dbg !723
  store i32 1, i32* %x, align 4, !dbg !723
  br label %for.cond5, !dbg !727

for.cond5:                                        ; preds = %for.inc56, %for.body4
  %39 = load i32* %x, align 4, !dbg !728
  %cmp6 = icmp sle i32 %39, 9, !dbg !728
  %40 = select i1 %cmp6, i64 16, i64 17, !dbg !732
  %41 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 %40, !dbg !732
  %42 = load i64* %41, !dbg !732
  %43 = add i64 %42, 1, !dbg !732
  store i64 %43, i64* %41, !dbg !732
  br i1 %cmp6, label %for.body7, label %for.end58, !dbg !732

for.body7:                                        ; preds = %for.cond5
  call void @llvm.dbg.declare(metadata i32* %out, metadata !733, metadata !605), !dbg !735
  store i32 0, i32* %out, align 4, !dbg !735
  %44 = load i32* %x, align 4, !dbg !736
  %cmp8 = icmp sgt i32 %44, 0, !dbg !736
  %45 = select i1 %cmp8, i64 18, i64 19, !dbg !738
  %46 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 %45, !dbg !738
  %47 = load i64* %46, !dbg !738
  %48 = add i64 %47, 1, !dbg !738
  store i64 %48, i64* %46, !dbg !738
  br i1 %cmp8, label %land.lhs.true, label %if.end27, !dbg !738

land.lhs.true:                                    ; preds = %for.body7
  %49 = load i32* %x, align 4, !dbg !739
  %cmp9 = icmp slt i32 %49, 10, !dbg !739
  %50 = select i1 %cmp9, i64 20, i64 21, !dbg !738
  %51 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 %50, !dbg !738
  %52 = load i64* %51, !dbg !738
  %53 = add i64 %52, 1, !dbg !738
  store i64 %53, i64* %51, !dbg !738
  br i1 %cmp9, label %land.lhs.true10, label %if.end27, !dbg !738

land.lhs.true10:                                  ; preds = %land.lhs.true
  %54 = load i32* %y, align 4, !dbg !741
  %cmp11 = icmp sgt i32 %54, 0, !dbg !741
  %55 = select i1 %cmp11, i64 22, i64 23, !dbg !738
  %56 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 %55, !dbg !738
  %57 = load i64* %56, !dbg !738
  %58 = add i64 %57, 1, !dbg !738
  store i64 %58, i64* %56, !dbg !738
  br i1 %cmp11, label %land.lhs.true12, label %if.end27, !dbg !738

land.lhs.true12:                                  ; preds = %land.lhs.true10
  %59 = load i32* %y, align 4, !dbg !743
  %cmp13 = icmp slt i32 %59, 10, !dbg !743
  %60 = select i1 %cmp13, i64 24, i64 25, !dbg !738
  %61 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 %60, !dbg !738
  %62 = load i64* %61, !dbg !738
  %63 = add i64 %62, 1, !dbg !738
  store i64 %63, i64* %61, !dbg !738
  br i1 %cmp13, label %if.then, label %if.end27, !dbg !738

if.then:                                          ; preds = %land.lhs.true12
  %64 = load i32* %y, align 4, !dbg !745
  %cmp14 = icmp slt i32 %64, 5, !dbg !745
  %65 = select i1 %cmp14, i64 26, i64 27, !dbg !748
  %66 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 %65, !dbg !748
  %67 = load i64* %66, !dbg !748
  %68 = add i64 %67, 1, !dbg !748
  store i64 %68, i64* %66, !dbg !748
  br i1 %cmp14, label %if.then15, label %if.end19, !dbg !748

if.then15:                                        ; preds = %if.then
  %69 = load i32* %x, align 4, !dbg !749
  %70 = load i32* %y, align 4, !dbg !751
  %sub = sub nsw i32 5, %70, !dbg !752
  %sub16 = sub nsw i32 9, %sub, !dbg !753
  %cmp17 = icmp sgt i32 %69, %sub16, !dbg !749
  %71 = select i1 %cmp17, i64 28, i64 29, !dbg !754
  %72 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 %71, !dbg !754
  %73 = load i64* %72, !dbg !754
  %74 = add i64 %73, 1, !dbg !754
  store i64 %74, i64* %72, !dbg !754
  br i1 %cmp17, label %if.then18, label %if.end, !dbg !754

if.then18:                                        ; preds = %if.then15
  %75 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 30), !dbg !755
  %76 = add i64 %75, 1, !dbg !755
  store i64 %76, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 30), !dbg !755
  store i32 1, i32* %out, align 4, !dbg !755
  br label %if.end, !dbg !755

if.end:                                           ; preds = %if.then18, %if.then15
  %77 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 31), !dbg !756
  %78 = add i64 %77, 1, !dbg !756
  store i64 %78, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 31), !dbg !756
  br label %if.end19, !dbg !756

if.end19:                                         ; preds = %if.end, %if.then
  %79 = load i32* %y, align 4, !dbg !758
  %cmp20 = icmp sgt i32 %79, 5, !dbg !758
  %80 = select i1 %cmp20, i64 32, i64 33, !dbg !760
  %81 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 %80, !dbg !760
  %82 = load i64* %81, !dbg !760
  %83 = add i64 %82, 1, !dbg !760
  store i64 %83, i64* %81, !dbg !760
  br i1 %cmp20, label %if.then21, label %if.end26, !dbg !760

if.then21:                                        ; preds = %if.end19
  %84 = load i32* %x, align 4, !dbg !761
  %85 = load i32* %y, align 4, !dbg !763
  %sub22 = sub nsw i32 %85, 5, !dbg !763
  %cmp23 = icmp sle i32 %84, %sub22, !dbg !761
  %86 = select i1 %cmp23, i64 34, i64 35, !dbg !764
  %87 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 %86, !dbg !764
  %88 = load i64* %87, !dbg !764
  %89 = add i64 %88, 1, !dbg !764
  store i64 %89, i64* %87, !dbg !764
  br i1 %cmp23, label %if.then24, label %if.end25, !dbg !764

if.then24:                                        ; preds = %if.then21
  %90 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 36), !dbg !765
  %91 = add i64 %90, 1, !dbg !765
  store i64 %91, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 36), !dbg !765
  store i32 1, i32* %out, align 4, !dbg !765
  br label %if.end25, !dbg !765

if.end25:                                         ; preds = %if.then24, %if.then21
  %92 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 37), !dbg !766
  %93 = add i64 %92, 1, !dbg !766
  store i64 %93, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 37), !dbg !766
  br label %if.end26, !dbg !766

if.end26:                                         ; preds = %if.end25, %if.end19
  %94 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 38), !dbg !768
  %95 = add i64 %94, 1, !dbg !768
  store i64 %95, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 38), !dbg !768
  br label %if.end27, !dbg !768

if.end27:                                         ; preds = %if.end26, %land.lhs.true12, %land.lhs.true10, %land.lhs.true, %for.body7
  %96 = load i32* %out, align 4, !dbg !769
  %tobool = icmp ne i32 %96, 0, !dbg !769
  %97 = select i1 %tobool, i64 39, i64 40, !dbg !771
  %98 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 %97, !dbg !771
  %99 = load i64* %98, !dbg !771
  %100 = add i64 %99, 1, !dbg !771
  store i64 %100, i64* %98, !dbg !771
  br i1 %tobool, label %if.end55, label %if.then28, !dbg !771

if.then28:                                        ; preds = %if.end27
  %101 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 41), !dbg !772
  %102 = add i64 %101, 1, !dbg !772
  store i64 %102, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 41), !dbg !772
  %103 = load i32* %no, align 4, !dbg !772
  %idxprom29 = sext i32 %103 to i64, !dbg !774
  %104 = load %class.BitBoard64** @clone_lookups, align 8, !dbg !774
  %arrayidx30 = getelementptr inbounds %class.BitBoard64* %104, i64 %idxprom29, !dbg !774
  %105 = load i32* %x, align 4, !dbg !775
  %sub31 = sub nsw i32 %105, 1, !dbg !775
  %106 = load i32* %y, align 4, !dbg !776
  %sub32 = sub nsw i32 %106, 1, !dbg !776
  %call33 = call i32 @_Z16getHexxagonIndexii(i32 %sub31, i32 %sub32), !dbg !777
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx30, i32 %call33), !dbg !774
  %107 = load i32* %no, align 4, !dbg !778
  %idxprom34 = sext i32 %107 to i64, !dbg !779
  %108 = load %class.BitBoard64** @clone_lookups, align 8, !dbg !779
  %arrayidx35 = getelementptr inbounds %class.BitBoard64* %108, i64 %idxprom34, !dbg !779
  %109 = load i32* %x, align 4, !dbg !780
  %110 = load i32* %y, align 4, !dbg !781
  %sub36 = sub nsw i32 %110, 1, !dbg !781
  %call37 = call i32 @_Z16getHexxagonIndexii(i32 %109, i32 %sub36), !dbg !782
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx35, i32 %call37), !dbg !779
  %111 = load i32* %no, align 4, !dbg !783
  %idxprom38 = sext i32 %111 to i64, !dbg !784
  %112 = load %class.BitBoard64** @clone_lookups, align 8, !dbg !784
  %arrayidx39 = getelementptr inbounds %class.BitBoard64* %112, i64 %idxprom38, !dbg !784
  %113 = load i32* %x, align 4, !dbg !785
  %sub40 = sub nsw i32 %113, 1, !dbg !785
  %114 = load i32* %y, align 4, !dbg !786
  %call41 = call i32 @_Z16getHexxagonIndexii(i32 %sub40, i32 %114), !dbg !787
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx39, i32 %call41), !dbg !784
  %115 = load i32* %no, align 4, !dbg !788
  %idxprom42 = sext i32 %115 to i64, !dbg !789
  %116 = load %class.BitBoard64** @clone_lookups, align 8, !dbg !789
  %arrayidx43 = getelementptr inbounds %class.BitBoard64* %116, i64 %idxprom42, !dbg !789
  %117 = load i32* %x, align 4, !dbg !790
  %add = add nsw i32 %117, 1, !dbg !790
  %118 = load i32* %y, align 4, !dbg !791
  %call44 = call i32 @_Z16getHexxagonIndexii(i32 %add, i32 %118), !dbg !792
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx43, i32 %call44), !dbg !789
  %119 = load i32* %no, align 4, !dbg !793
  %idxprom45 = sext i32 %119 to i64, !dbg !794
  %120 = load %class.BitBoard64** @clone_lookups, align 8, !dbg !794
  %arrayidx46 = getelementptr inbounds %class.BitBoard64* %120, i64 %idxprom45, !dbg !794
  %121 = load i32* %x, align 4, !dbg !795
  %122 = load i32* %y, align 4, !dbg !796
  %add47 = add nsw i32 %122, 1, !dbg !796
  %call48 = call i32 @_Z16getHexxagonIndexii(i32 %121, i32 %add47), !dbg !797
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx46, i32 %call48), !dbg !794
  %123 = load i32* %no, align 4, !dbg !798
  %idxprom49 = sext i32 %123 to i64, !dbg !799
  %124 = load %class.BitBoard64** @clone_lookups, align 8, !dbg !799
  %arrayidx50 = getelementptr inbounds %class.BitBoard64* %124, i64 %idxprom49, !dbg !799
  %125 = load i32* %x, align 4, !dbg !800
  %add51 = add nsw i32 %125, 1, !dbg !800
  %126 = load i32* %y, align 4, !dbg !801
  %add52 = add nsw i32 %126, 1, !dbg !801
  %call53 = call i32 @_Z16getHexxagonIndexii(i32 %add51, i32 %add52), !dbg !802
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx50, i32 %call53), !dbg !799
  %127 = load i32* %no, align 4, !dbg !803
  %inc54 = add nsw i32 %127, 1, !dbg !803
  store i32 %inc54, i32* %no, align 4, !dbg !803
  br label %if.end55, !dbg !804

if.end55:                                         ; preds = %if.then28, %if.end27
  %128 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 42), !dbg !805
  %129 = add i64 %128, 1, !dbg !805
  store i64 %129, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 42), !dbg !805
  br label %for.inc56, !dbg !805

for.inc56:                                        ; preds = %if.end55
  %130 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 43), !dbg !806
  %131 = add i64 %130, 1, !dbg !806
  store i64 %131, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 43), !dbg !806
  %132 = load i32* %x, align 4, !dbg !806
  %inc57 = add nsw i32 %132, 1, !dbg !806
  store i32 %inc57, i32* %x, align 4, !dbg !806
  br label %for.cond5, !dbg !807

for.end58:                                        ; preds = %for.cond5
  %133 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 44), !dbg !808
  %134 = add i64 %133, 1, !dbg !808
  store i64 %134, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 44), !dbg !808
  br label %for.inc59, !dbg !808

for.inc59:                                        ; preds = %for.end58
  %135 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 45), !dbg !809
  %136 = add i64 %135, 1, !dbg !809
  store i64 %136, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 45), !dbg !809
  %137 = load i32* %y, align 4, !dbg !809
  %inc60 = add nsw i32 %137, 1, !dbg !809
  store i32 %inc60, i32* %y, align 4, !dbg !809
  br label %for.cond2, !dbg !810

for.end61:                                        ; preds = %for.cond2
  %138 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 46), !dbg !713
  %139 = add i64 %138, 1, !dbg !713
  store i64 %139, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 46), !dbg !713
  ret void, !dbg !713

eh.resume:                                        ; preds = %lpad
  %exn = load i8** %exn.slot, !dbg !811
  %sel = load i32* %ehselector.slot, !dbg !811
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !811
  %lpad.val62 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !811
  resume { i8*, i32 } %lpad.val62, !dbg !811
}

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #5

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN10BitBoard64C2Ev(%class.BitBoard64* %this) unnamed_addr #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr52, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr52, i64 0, i64 0)
  %this.addr = alloca %class.BitBoard64*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr52, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr52, i64 0, i64 1)
  store %class.BitBoard64* %this, %class.BitBoard64** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %this.addr, metadata !812, metadata !605), !dbg !813
  %this1 = load %class.BitBoard64** %this.addr
  ret void, !dbg !814
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) #6

declare i64 @_ZN10BitBoard64aSERKS_(%class.BitBoard64*, %class.BitBoard64* dereferenceable(8)) #0

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN10BitBoard64C2Ejj(%class.BitBoard64* %this, i32 %l, i32 %h) unnamed_addr #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr51, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr51, i64 0, i64 0)
  %this.addr = alloca %class.BitBoard64*, align 8
  %l.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr51, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr51, i64 0, i64 1)
  store %class.BitBoard64* %this, %class.BitBoard64** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %this.addr, metadata !815, metadata !605), !dbg !816
  store i32 %l, i32* %l.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %l.addr, metadata !817, metadata !605), !dbg !819
  store i32 %h, i32* %h.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %h.addr, metadata !820, metadata !605), !dbg !821
  %this1 = load %class.BitBoard64** %this.addr
  %5 = load i32* %l.addr, align 4, !dbg !822
  %lowbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 0, !dbg !824
  store i32 %5, i32* %lowbits, align 4, !dbg !824
  %6 = load i32* %h.addr, align 4, !dbg !825
  %highbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 1, !dbg !824
  store i32 %6, i32* %highbits, align 4, !dbg !824
  ret void, !dbg !826
}

declare void @_ZN10BitBoard646setBitEi(%class.BitBoard64*, i32) #0

; Function Attrs: uwtable
define void @_Z15initJumpLookupsv() #4 {
entry:
  %0 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 0)
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %no = alloca i32, align 4
  %i = alloca i32, align 4
  %ref.tmp = alloca %class.BitBoard64, align 4
  %coerce = alloca %class.BitBoard64, align 4
  %y = alloca i32, align 4
  %x = alloca i32, align 4
  %out = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 1), !dbg !827
  %4 = add i64 %3, 1, !dbg !827
  store i64 %4, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 1), !dbg !827
  %call = call noalias i8* @_Znam(i64 488) #9, !dbg !827
  %5 = bitcast i8* %call to %class.BitBoard64*, !dbg !827
  %arrayctor.end = getelementptr inbounds %class.BitBoard64* %5, i64 61, !dbg !827
  br label %arrayctor.loop, !dbg !827

arrayctor.loop:                                   ; preds = %invoke.cont, %2
  %arrayctor.cur = phi %class.BitBoard64* [ %5, %2 ], [ %arrayctor.next, %invoke.cont ], !dbg !827
  store i32 0, i32* @__llvm_gcov_global_state_pred23, !dbg !828
  invoke void @_ZN10BitBoard64C2Ev(%class.BitBoard64* %arrayctor.cur)
          to label %invoke.cont unwind label %lpad, !dbg !828

invoke.cont:                                      ; preds = %arrayctor.loop
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred23, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table22, i64 0, i64 0)), !dbg !831
  %arrayctor.next = getelementptr inbounds %class.BitBoard64* %arrayctor.cur, i64 1, !dbg !831
  %arrayctor.done = icmp eq %class.BitBoard64* %arrayctor.next, %arrayctor.end, !dbg !831
  %6 = select i1 %arrayctor.done, i64 4, i64 5, !dbg !831
  %7 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 %6, !dbg !831
  %8 = load i64* %7, !dbg !831
  %9 = add i64 %8, 1, !dbg !831
  store i64 %9, i64* %7, !dbg !831
  br i1 %arrayctor.done, label %arrayctor.cont, label %arrayctor.loop, !dbg !831

arrayctor.cont:                                   ; preds = %invoke.cont
  %10 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 6), !dbg !833
  %11 = add i64 %10, 1, !dbg !833
  store i64 %11, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 6), !dbg !833
  store %class.BitBoard64* %5, %class.BitBoard64** @jump_lookups, align 8, !dbg !833
  call void @llvm.dbg.declare(metadata i32* %no, metadata !835, metadata !605), !dbg !836
  store i32 0, i32* %no, align 4, !dbg !836
  call void @llvm.dbg.declare(metadata i32* %i, metadata !837, metadata !605), !dbg !839
  store i32 0, i32* %i, align 4, !dbg !839
  br label %for.cond, !dbg !840

for.cond:                                         ; preds = %for.inc, %arrayctor.cont
  %12 = load i32* %i, align 4, !dbg !841
  %cmp = icmp slt i32 %12, 61, !dbg !841
  %13 = select i1 %cmp, i64 7, i64 8, !dbg !845
  %14 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 %13, !dbg !845
  %15 = load i64* %14, !dbg !845
  %16 = add i64 %15, 1, !dbg !845
  store i64 %16, i64* %14, !dbg !845
  br i1 %cmp, label %for.body, label %for.end, !dbg !845

for.body:                                         ; preds = %for.cond
  %17 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 9), !dbg !846
  %18 = add i64 %17, 1, !dbg !846
  store i64 %18, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 9), !dbg !846
  %19 = load i32* %i, align 4, !dbg !846
  %idxprom = sext i32 %19 to i64, !dbg !847
  %20 = load %class.BitBoard64** @jump_lookups, align 8, !dbg !847
  %arrayidx = getelementptr inbounds %class.BitBoard64* %20, i64 %idxprom, !dbg !847
  call void @_ZN10BitBoard64C2Ejj(%class.BitBoard64* %ref.tmp, i32 0, i32 0), !dbg !847
  %call1 = call i64 @_ZN10BitBoard64aSERKS_(%class.BitBoard64* %arrayidx, %class.BitBoard64* dereferenceable(8) %ref.tmp), !dbg !847
  %21 = bitcast %class.BitBoard64* %coerce to i64*, !dbg !847
  store i64 %call1, i64* %21, align 1, !dbg !847
  br label %for.inc, !dbg !847

for.inc:                                          ; preds = %for.body
  %22 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 10), !dbg !848
  %23 = add i64 %22, 1, !dbg !848
  store i64 %23, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 10), !dbg !848
  %24 = load i32* %i, align 4, !dbg !848
  %inc = add nsw i32 %24, 1, !dbg !848
  store i32 %inc, i32* %i, align 4, !dbg !848
  br label %for.cond, !dbg !849

lpad:                                             ; preds = %arrayctor.loop
  %25 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !850
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred23, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table22, i64 0, i64 1)), !dbg !850
  %26 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 11), !dbg !850
  %27 = add i64 %26, 1, !dbg !850
  store i64 %27, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 11), !dbg !850
  %28 = extractvalue { i8*, i32 } %25, 0, !dbg !850
  store i8* %28, i8** %exn.slot, !dbg !850
  %29 = extractvalue { i8*, i32 } %25, 1, !dbg !850
  store i32 %29, i32* %ehselector.slot, !dbg !850
  call void @_ZdaPv(i8* %call) #10, !dbg !850
  br label %eh.resume, !dbg !850

for.end:                                          ; preds = %for.cond
  %30 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 12), !dbg !851
  %31 = add i64 %30, 1, !dbg !851
  store i64 %31, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 12), !dbg !851
  call void @llvm.dbg.declare(metadata i32* %y, metadata !853, metadata !605), !dbg !851
  store i32 1, i32* %y, align 4, !dbg !851
  br label %for.cond2, !dbg !854

for.cond2:                                        ; preds = %for.inc89, %for.end
  %32 = load i32* %y, align 4, !dbg !855
  %cmp3 = icmp sle i32 %32, 9, !dbg !855
  %33 = select i1 %cmp3, i64 13, i64 14, !dbg !859
  %34 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 %33, !dbg !859
  %35 = load i64* %34, !dbg !859
  %36 = add i64 %35, 1, !dbg !859
  store i64 %36, i64* %34, !dbg !859
  br i1 %cmp3, label %for.body4, label %for.end91, !dbg !859

for.body4:                                        ; preds = %for.cond2
  %37 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 15), !dbg !860
  %38 = add i64 %37, 1, !dbg !860
  store i64 %38, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 15), !dbg !860
  call void @llvm.dbg.declare(metadata i32* %x, metadata !863, metadata !605), !dbg !860
  store i32 1, i32* %x, align 4, !dbg !860
  br label %for.cond5, !dbg !864

for.cond5:                                        ; preds = %for.inc86, %for.body4
  %39 = load i32* %x, align 4, !dbg !865
  %cmp6 = icmp sle i32 %39, 9, !dbg !865
  %40 = select i1 %cmp6, i64 16, i64 17, !dbg !869
  %41 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 %40, !dbg !869
  %42 = load i64* %41, !dbg !869
  %43 = add i64 %42, 1, !dbg !869
  store i64 %43, i64* %41, !dbg !869
  br i1 %cmp6, label %for.body7, label %for.end88, !dbg !869

for.body7:                                        ; preds = %for.cond5
  call void @llvm.dbg.declare(metadata i32* %out, metadata !870, metadata !605), !dbg !872
  store i32 0, i32* %out, align 4, !dbg !872
  %44 = load i32* %x, align 4, !dbg !873
  %cmp8 = icmp sgt i32 %44, 0, !dbg !873
  %45 = select i1 %cmp8, i64 18, i64 19, !dbg !875
  %46 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 %45, !dbg !875
  %47 = load i64* %46, !dbg !875
  %48 = add i64 %47, 1, !dbg !875
  store i64 %48, i64* %46, !dbg !875
  br i1 %cmp8, label %land.lhs.true, label %if.end27, !dbg !875

land.lhs.true:                                    ; preds = %for.body7
  %49 = load i32* %x, align 4, !dbg !876
  %cmp9 = icmp slt i32 %49, 10, !dbg !876
  %50 = select i1 %cmp9, i64 20, i64 21, !dbg !875
  %51 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 %50, !dbg !875
  %52 = load i64* %51, !dbg !875
  %53 = add i64 %52, 1, !dbg !875
  store i64 %53, i64* %51, !dbg !875
  br i1 %cmp9, label %land.lhs.true10, label %if.end27, !dbg !875

land.lhs.true10:                                  ; preds = %land.lhs.true
  %54 = load i32* %y, align 4, !dbg !878
  %cmp11 = icmp sgt i32 %54, 0, !dbg !878
  %55 = select i1 %cmp11, i64 22, i64 23, !dbg !875
  %56 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 %55, !dbg !875
  %57 = load i64* %56, !dbg !875
  %58 = add i64 %57, 1, !dbg !875
  store i64 %58, i64* %56, !dbg !875
  br i1 %cmp11, label %land.lhs.true12, label %if.end27, !dbg !875

land.lhs.true12:                                  ; preds = %land.lhs.true10
  %59 = load i32* %y, align 4, !dbg !880
  %cmp13 = icmp slt i32 %59, 10, !dbg !880
  %60 = select i1 %cmp13, i64 24, i64 25, !dbg !875
  %61 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 %60, !dbg !875
  %62 = load i64* %61, !dbg !875
  %63 = add i64 %62, 1, !dbg !875
  store i64 %63, i64* %61, !dbg !875
  br i1 %cmp13, label %if.then, label %if.end27, !dbg !875

if.then:                                          ; preds = %land.lhs.true12
  %64 = load i32* %y, align 4, !dbg !882
  %cmp14 = icmp slt i32 %64, 5, !dbg !882
  %65 = select i1 %cmp14, i64 26, i64 27, !dbg !885
  %66 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 %65, !dbg !885
  %67 = load i64* %66, !dbg !885
  %68 = add i64 %67, 1, !dbg !885
  store i64 %68, i64* %66, !dbg !885
  br i1 %cmp14, label %if.then15, label %if.end19, !dbg !885

if.then15:                                        ; preds = %if.then
  %69 = load i32* %x, align 4, !dbg !886
  %70 = load i32* %y, align 4, !dbg !888
  %sub = sub nsw i32 5, %70, !dbg !889
  %sub16 = sub nsw i32 9, %sub, !dbg !890
  %cmp17 = icmp sgt i32 %69, %sub16, !dbg !886
  %71 = select i1 %cmp17, i64 28, i64 29, !dbg !891
  %72 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 %71, !dbg !891
  %73 = load i64* %72, !dbg !891
  %74 = add i64 %73, 1, !dbg !891
  store i64 %74, i64* %72, !dbg !891
  br i1 %cmp17, label %if.then18, label %if.end, !dbg !891

if.then18:                                        ; preds = %if.then15
  %75 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 30), !dbg !892
  %76 = add i64 %75, 1, !dbg !892
  store i64 %76, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 30), !dbg !892
  store i32 1, i32* %out, align 4, !dbg !892
  br label %if.end, !dbg !892

if.end:                                           ; preds = %if.then18, %if.then15
  %77 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 31), !dbg !893
  %78 = add i64 %77, 1, !dbg !893
  store i64 %78, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 31), !dbg !893
  br label %if.end19, !dbg !893

if.end19:                                         ; preds = %if.end, %if.then
  %79 = load i32* %y, align 4, !dbg !895
  %cmp20 = icmp sgt i32 %79, 5, !dbg !895
  %80 = select i1 %cmp20, i64 32, i64 33, !dbg !897
  %81 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 %80, !dbg !897
  %82 = load i64* %81, !dbg !897
  %83 = add i64 %82, 1, !dbg !897
  store i64 %83, i64* %81, !dbg !897
  br i1 %cmp20, label %if.then21, label %if.end26, !dbg !897

if.then21:                                        ; preds = %if.end19
  %84 = load i32* %x, align 4, !dbg !898
  %85 = load i32* %y, align 4, !dbg !900
  %sub22 = sub nsw i32 %85, 5, !dbg !900
  %cmp23 = icmp sle i32 %84, %sub22, !dbg !898
  %86 = select i1 %cmp23, i64 34, i64 35, !dbg !901
  %87 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 %86, !dbg !901
  %88 = load i64* %87, !dbg !901
  %89 = add i64 %88, 1, !dbg !901
  store i64 %89, i64* %87, !dbg !901
  br i1 %cmp23, label %if.then24, label %if.end25, !dbg !901

if.then24:                                        ; preds = %if.then21
  %90 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 36), !dbg !902
  %91 = add i64 %90, 1, !dbg !902
  store i64 %91, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 36), !dbg !902
  store i32 1, i32* %out, align 4, !dbg !902
  br label %if.end25, !dbg !902

if.end25:                                         ; preds = %if.then24, %if.then21
  %92 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 37), !dbg !903
  %93 = add i64 %92, 1, !dbg !903
  store i64 %93, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 37), !dbg !903
  br label %if.end26, !dbg !903

if.end26:                                         ; preds = %if.end25, %if.end19
  %94 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 38), !dbg !905
  %95 = add i64 %94, 1, !dbg !905
  store i64 %95, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 38), !dbg !905
  br label %if.end27, !dbg !905

if.end27:                                         ; preds = %if.end26, %land.lhs.true12, %land.lhs.true10, %land.lhs.true, %for.body7
  %96 = load i32* %out, align 4, !dbg !906
  %tobool = icmp ne i32 %96, 0, !dbg !906
  %97 = select i1 %tobool, i64 39, i64 40, !dbg !908
  %98 = getelementptr inbounds [47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 %97, !dbg !908
  %99 = load i64* %98, !dbg !908
  %100 = add i64 %99, 1, !dbg !908
  store i64 %100, i64* %98, !dbg !908
  br i1 %tobool, label %if.end85, label %if.then28, !dbg !908

if.then28:                                        ; preds = %if.end27
  %101 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 41), !dbg !909
  %102 = add i64 %101, 1, !dbg !909
  store i64 %102, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 41), !dbg !909
  %103 = load i32* %no, align 4, !dbg !909
  %idxprom29 = sext i32 %103 to i64, !dbg !911
  %104 = load %class.BitBoard64** @jump_lookups, align 8, !dbg !911
  %arrayidx30 = getelementptr inbounds %class.BitBoard64* %104, i64 %idxprom29, !dbg !911
  %105 = load i32* %x, align 4, !dbg !912
  %sub31 = sub nsw i32 %105, 2, !dbg !912
  %106 = load i32* %y, align 4, !dbg !913
  %sub32 = sub nsw i32 %106, 2, !dbg !913
  %call33 = call i32 @_Z16getHexxagonIndexii(i32 %sub31, i32 %sub32), !dbg !914
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx30, i32 %call33), !dbg !911
  %107 = load i32* %no, align 4, !dbg !915
  %idxprom34 = sext i32 %107 to i64, !dbg !916
  %108 = load %class.BitBoard64** @jump_lookups, align 8, !dbg !916
  %arrayidx35 = getelementptr inbounds %class.BitBoard64* %108, i64 %idxprom34, !dbg !916
  %109 = load i32* %x, align 4, !dbg !917
  %sub36 = sub nsw i32 %109, 1, !dbg !917
  %110 = load i32* %y, align 4, !dbg !918
  %sub37 = sub nsw i32 %110, 2, !dbg !918
  %call38 = call i32 @_Z16getHexxagonIndexii(i32 %sub36, i32 %sub37), !dbg !919
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx35, i32 %call38), !dbg !916
  %111 = load i32* %no, align 4, !dbg !920
  %idxprom39 = sext i32 %111 to i64, !dbg !921
  %112 = load %class.BitBoard64** @jump_lookups, align 8, !dbg !921
  %arrayidx40 = getelementptr inbounds %class.BitBoard64* %112, i64 %idxprom39, !dbg !921
  %113 = load i32* %x, align 4, !dbg !922
  %114 = load i32* %y, align 4, !dbg !923
  %sub41 = sub nsw i32 %114, 2, !dbg !923
  %call42 = call i32 @_Z16getHexxagonIndexii(i32 %113, i32 %sub41), !dbg !924
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx40, i32 %call42), !dbg !921
  %115 = load i32* %no, align 4, !dbg !925
  %idxprom43 = sext i32 %115 to i64, !dbg !926
  %116 = load %class.BitBoard64** @jump_lookups, align 8, !dbg !926
  %arrayidx44 = getelementptr inbounds %class.BitBoard64* %116, i64 %idxprom43, !dbg !926
  %117 = load i32* %x, align 4, !dbg !927
  %sub45 = sub nsw i32 %117, 2, !dbg !927
  %118 = load i32* %y, align 4, !dbg !928
  %sub46 = sub nsw i32 %118, 1, !dbg !928
  %call47 = call i32 @_Z16getHexxagonIndexii(i32 %sub45, i32 %sub46), !dbg !929
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx44, i32 %call47), !dbg !926
  %119 = load i32* %no, align 4, !dbg !930
  %idxprom48 = sext i32 %119 to i64, !dbg !931
  %120 = load %class.BitBoard64** @jump_lookups, align 8, !dbg !931
  %arrayidx49 = getelementptr inbounds %class.BitBoard64* %120, i64 %idxprom48, !dbg !931
  %121 = load i32* %x, align 4, !dbg !932
  %add = add nsw i32 %121, 1, !dbg !932
  %122 = load i32* %y, align 4, !dbg !933
  %sub50 = sub nsw i32 %122, 1, !dbg !933
  %call51 = call i32 @_Z16getHexxagonIndexii(i32 %add, i32 %sub50), !dbg !934
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx49, i32 %call51), !dbg !931
  %123 = load i32* %no, align 4, !dbg !935
  %idxprom52 = sext i32 %123 to i64, !dbg !936
  %124 = load %class.BitBoard64** @jump_lookups, align 8, !dbg !936
  %arrayidx53 = getelementptr inbounds %class.BitBoard64* %124, i64 %idxprom52, !dbg !936
  %125 = load i32* %x, align 4, !dbg !937
  %sub54 = sub nsw i32 %125, 2, !dbg !937
  %126 = load i32* %y, align 4, !dbg !938
  %call55 = call i32 @_Z16getHexxagonIndexii(i32 %sub54, i32 %126), !dbg !939
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx53, i32 %call55), !dbg !936
  %127 = load i32* %no, align 4, !dbg !940
  %idxprom56 = sext i32 %127 to i64, !dbg !941
  %128 = load %class.BitBoard64** @jump_lookups, align 8, !dbg !941
  %arrayidx57 = getelementptr inbounds %class.BitBoard64* %128, i64 %idxprom56, !dbg !941
  %129 = load i32* %x, align 4, !dbg !942
  %add58 = add nsw i32 %129, 2, !dbg !942
  %130 = load i32* %y, align 4, !dbg !943
  %call59 = call i32 @_Z16getHexxagonIndexii(i32 %add58, i32 %130), !dbg !944
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx57, i32 %call59), !dbg !941
  %131 = load i32* %no, align 4, !dbg !945
  %idxprom60 = sext i32 %131 to i64, !dbg !946
  %132 = load %class.BitBoard64** @jump_lookups, align 8, !dbg !946
  %arrayidx61 = getelementptr inbounds %class.BitBoard64* %132, i64 %idxprom60, !dbg !946
  %133 = load i32* %x, align 4, !dbg !947
  %sub62 = sub nsw i32 %133, 1, !dbg !947
  %134 = load i32* %y, align 4, !dbg !948
  %add63 = add nsw i32 %134, 1, !dbg !948
  %call64 = call i32 @_Z16getHexxagonIndexii(i32 %sub62, i32 %add63), !dbg !949
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx61, i32 %call64), !dbg !946
  %135 = load i32* %no, align 4, !dbg !950
  %idxprom65 = sext i32 %135 to i64, !dbg !951
  %136 = load %class.BitBoard64** @jump_lookups, align 8, !dbg !951
  %arrayidx66 = getelementptr inbounds %class.BitBoard64* %136, i64 %idxprom65, !dbg !951
  %137 = load i32* %x, align 4, !dbg !952
  %add67 = add nsw i32 %137, 2, !dbg !952
  %138 = load i32* %y, align 4, !dbg !953
  %add68 = add nsw i32 %138, 1, !dbg !953
  %call69 = call i32 @_Z16getHexxagonIndexii(i32 %add67, i32 %add68), !dbg !954
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx66, i32 %call69), !dbg !951
  %139 = load i32* %no, align 4, !dbg !955
  %idxprom70 = sext i32 %139 to i64, !dbg !956
  %140 = load %class.BitBoard64** @jump_lookups, align 8, !dbg !956
  %arrayidx71 = getelementptr inbounds %class.BitBoard64* %140, i64 %idxprom70, !dbg !956
  %141 = load i32* %x, align 4, !dbg !957
  %142 = load i32* %y, align 4, !dbg !958
  %add72 = add nsw i32 %142, 2, !dbg !958
  %call73 = call i32 @_Z16getHexxagonIndexii(i32 %141, i32 %add72), !dbg !959
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx71, i32 %call73), !dbg !956
  %143 = load i32* %no, align 4, !dbg !960
  %idxprom74 = sext i32 %143 to i64, !dbg !961
  %144 = load %class.BitBoard64** @jump_lookups, align 8, !dbg !961
  %arrayidx75 = getelementptr inbounds %class.BitBoard64* %144, i64 %idxprom74, !dbg !961
  %145 = load i32* %x, align 4, !dbg !962
  %add76 = add nsw i32 %145, 1, !dbg !962
  %146 = load i32* %y, align 4, !dbg !963
  %add77 = add nsw i32 %146, 2, !dbg !963
  %call78 = call i32 @_Z16getHexxagonIndexii(i32 %add76, i32 %add77), !dbg !964
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx75, i32 %call78), !dbg !961
  %147 = load i32* %no, align 4, !dbg !965
  %idxprom79 = sext i32 %147 to i64, !dbg !966
  %148 = load %class.BitBoard64** @jump_lookups, align 8, !dbg !966
  %arrayidx80 = getelementptr inbounds %class.BitBoard64* %148, i64 %idxprom79, !dbg !966
  %149 = load i32* %x, align 4, !dbg !967
  %add81 = add nsw i32 %149, 2, !dbg !967
  %150 = load i32* %y, align 4, !dbg !968
  %add82 = add nsw i32 %150, 2, !dbg !968
  %call83 = call i32 @_Z16getHexxagonIndexii(i32 %add81, i32 %add82), !dbg !969
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %arrayidx80, i32 %call83), !dbg !966
  %151 = load i32* %no, align 4, !dbg !970
  %inc84 = add nsw i32 %151, 1, !dbg !970
  store i32 %inc84, i32* %no, align 4, !dbg !970
  br label %if.end85, !dbg !971

if.end85:                                         ; preds = %if.then28, %if.end27
  %152 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 42), !dbg !972
  %153 = add i64 %152, 1, !dbg !972
  store i64 %153, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 42), !dbg !972
  br label %for.inc86, !dbg !972

for.inc86:                                        ; preds = %if.end85
  %154 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 43), !dbg !973
  %155 = add i64 %154, 1, !dbg !973
  store i64 %155, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 43), !dbg !973
  %156 = load i32* %x, align 4, !dbg !973
  %inc87 = add nsw i32 %156, 1, !dbg !973
  store i32 %inc87, i32* %x, align 4, !dbg !973
  br label %for.cond5, !dbg !974

for.end88:                                        ; preds = %for.cond5
  %157 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 44), !dbg !975
  %158 = add i64 %157, 1, !dbg !975
  store i64 %158, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 44), !dbg !975
  br label %for.inc89, !dbg !975

for.inc89:                                        ; preds = %for.end88
  %159 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 45), !dbg !976
  %160 = add i64 %159, 1, !dbg !976
  store i64 %160, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 45), !dbg !976
  %161 = load i32* %y, align 4, !dbg !976
  %inc90 = add nsw i32 %161, 1, !dbg !976
  store i32 %inc90, i32* %y, align 4, !dbg !976
  br label %for.cond2, !dbg !977

for.end91:                                        ; preds = %for.cond2
  %162 = load i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 46), !dbg !850
  %163 = add i64 %162, 1, !dbg !850
  store i64 %163, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 46), !dbg !850
  ret void, !dbg !850

eh.resume:                                        ; preds = %lpad
  %exn = load i8** %exn.slot, !dbg !978
  %sel = load i32* %ehselector.slot, !dbg !978
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !978
  %lpad.val92 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !978
  resume { i8*, i32 } %lpad.val92, !dbg !978
}

; Function Attrs: uwtable
define void @_ZN13HexxagonBoardC2ERKS_(%class.HexxagonBoard* %this, %class.HexxagonBoard* dereferenceable(16) %copy) unnamed_addr #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr24, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr24, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonBoard*, align 8
  %copy.addr = alloca %class.HexxagonBoard*, align 8
  %coerce = alloca %class.BitBoard64, align 4
  %coerce7 = alloca %class.BitBoard64, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr24, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr24, i64 0, i64 1)
  store %class.HexxagonBoard* %this, %class.HexxagonBoard** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %this.addr, metadata !979, metadata !605), !dbg !981
  store %class.HexxagonBoard* %copy, %class.HexxagonBoard** %copy.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %copy.addr, metadata !982, metadata !605), !dbg !983
  %this1 = load %class.HexxagonBoard** %this.addr
  %board = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !984
  call void @_ZN10BitBoard64C2Ev(%class.BitBoard64* %board), !dbg !984
  %color = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !984
  call void @_ZN10BitBoard64C2Ev(%class.BitBoard64* %color), !dbg !984
  %board2 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !985
  %5 = load %class.HexxagonBoard** %copy.addr, align 8, !dbg !985
  %board3 = getelementptr inbounds %class.HexxagonBoard* %5, i32 0, i32 0, !dbg !985
  %call = call i64 @_ZN10BitBoard64aSERKS_(%class.BitBoard64* %board2, %class.BitBoard64* dereferenceable(8) %board3), !dbg !985
  %6 = bitcast %class.BitBoard64* %coerce to i64*, !dbg !985
  store i64 %call, i64* %6, align 1, !dbg !985
  %color4 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !987
  %7 = load %class.HexxagonBoard** %copy.addr, align 8, !dbg !987
  %color5 = getelementptr inbounds %class.HexxagonBoard* %7, i32 0, i32 1, !dbg !987
  %call6 = call i64 @_ZN10BitBoard64aSERKS_(%class.BitBoard64* %color4, %class.BitBoard64* dereferenceable(8) %color5), !dbg !987
  %8 = bitcast %class.BitBoard64* %coerce7 to i64*, !dbg !987
  store i64 %call6, i64* %8, align 1, !dbg !987
  ret void, !dbg !988
}

; Function Attrs: uwtable
define void @_ZN13HexxagonBoardaSERKS_(%class.HexxagonBoard* noalias sret %agg.result, %class.HexxagonBoard* %this, %class.HexxagonBoard* dereferenceable(16) %right) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr25, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr25, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonBoard*, align 8
  %right.addr = alloca %class.HexxagonBoard*, align 8
  %coerce = alloca %class.BitBoard64, align 4
  %coerce5 = alloca %class.BitBoard64, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr25, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr25, i64 0, i64 1)
  store %class.HexxagonBoard* %this, %class.HexxagonBoard** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %this.addr, metadata !989, metadata !605), !dbg !990
  store %class.HexxagonBoard* %right, %class.HexxagonBoard** %right.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %right.addr, metadata !991, metadata !605), !dbg !992
  %this1 = load %class.HexxagonBoard** %this.addr
  %color = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !993
  %5 = load %class.HexxagonBoard** %right.addr, align 8, !dbg !993
  %color2 = getelementptr inbounds %class.HexxagonBoard* %5, i32 0, i32 1, !dbg !993
  %call = call i64 @_ZN10BitBoard64aSERKS_(%class.BitBoard64* %color, %class.BitBoard64* dereferenceable(8) %color2), !dbg !993
  %6 = bitcast %class.BitBoard64* %coerce to i64*, !dbg !993
  store i64 %call, i64* %6, align 1, !dbg !993
  %board = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !994
  %7 = load %class.HexxagonBoard** %right.addr, align 8, !dbg !994
  %board3 = getelementptr inbounds %class.HexxagonBoard* %7, i32 0, i32 0, !dbg !994
  %call4 = call i64 @_ZN10BitBoard64aSERKS_(%class.BitBoard64* %board, %class.BitBoard64* dereferenceable(8) %board3), !dbg !994
  %8 = bitcast %class.BitBoard64* %coerce5 to i64*, !dbg !994
  store i64 %call4, i64* %8, align 1, !dbg !994
  call void @_ZN13HexxagonBoardC1ERKS_(%class.HexxagonBoard* %agg.result, %class.HexxagonBoard* dereferenceable(16) %this1), !dbg !995
  ret void, !dbg !995
}

; Function Attrs: uwtable
define void @_ZN13HexxagonBoard4initEv(%class.HexxagonBoard* %this) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr26, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr26, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonBoard*, align 8
  %ref.tmp = alloca %class.BitBoard64, align 4
  %coerce = alloca %class.BitBoard64, align 4
  %ref.tmp2 = alloca %class.BitBoard64, align 4
  %coerce4 = alloca %class.BitBoard64, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr26, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr26, i64 0, i64 1)
  store %class.HexxagonBoard* %this, %class.HexxagonBoard** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %this.addr, metadata !996, metadata !605), !dbg !997
  %this1 = load %class.HexxagonBoard** %this.addr
  %board = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !998
  call void @_ZN10BitBoard64C2Ejj(%class.BitBoard64* %ref.tmp, i32 0, i32 0), !dbg !998
  %call = call i64 @_ZN10BitBoard64aSERKS_(%class.BitBoard64* %board, %class.BitBoard64* dereferenceable(8) %ref.tmp), !dbg !998
  %5 = bitcast %class.BitBoard64* %coerce to i64*, !dbg !998
  store i64 %call, i64* %5, align 1, !dbg !998
  %color = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !999
  call void @_ZN10BitBoard64C2Ejj(%class.BitBoard64* %ref.tmp2, i32 0, i32 0), !dbg !999
  %call3 = call i64 @_ZN10BitBoard64aSERKS_(%class.BitBoard64* %color, %class.BitBoard64* dereferenceable(8) %ref.tmp2), !dbg !999
  %6 = bitcast %class.BitBoard64* %coerce4 to i64*, !dbg !999
  store i64 %call3, i64* %6, align 1, !dbg !999
  %board5 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1000
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %board5, i32 0), !dbg !1000
  %color6 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !1001
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %color6, i32 0), !dbg !1001
  %board7 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1002
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %board7, i32 34), !dbg !1002
  %color8 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !1003
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %color8, i32 34), !dbg !1003
  %board9 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1004
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %board9, i32 56), !dbg !1004
  %color10 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !1005
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %color10, i32 56), !dbg !1005
  %board11 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1006
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %board11, i32 4), !dbg !1006
  %board12 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1007
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %board12, i32 26), !dbg !1007
  %board13 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1008
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %board13, i32 60), !dbg !1008
  ret void, !dbg !1009
}

; Function Attrs: uwtable
define i32 @_ZN13HexxagonBoard11countBricksEi(%class.HexxagonBoard* %this, i32 %player) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 0)
  %retval = alloca i32, align 4
  %this.addr = alloca %class.HexxagonBoard*, align 8
  %player.addr = alloca i32, align 4
  %good = alloca i32, align 4
  %bad = alloca i32, align 4
  %i = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 1)
  store %class.HexxagonBoard* %this, %class.HexxagonBoard** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %this.addr, metadata !1010, metadata !605), !dbg !1011
  store i32 %player, i32* %player.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %player.addr, metadata !1012, metadata !605), !dbg !1013
  %this1 = load %class.HexxagonBoard** %this.addr
  call void @llvm.dbg.declare(metadata i32* %good, metadata !1014, metadata !605), !dbg !1015
  store i32 0, i32* %good, align 4, !dbg !1015
  call void @llvm.dbg.declare(metadata i32* %bad, metadata !1016, metadata !605), !dbg !1017
  store i32 0, i32* %bad, align 4, !dbg !1017
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1018, metadata !605), !dbg !1020
  store i32 0, i32* %i, align 4, !dbg !1020
  br label %for.cond, !dbg !1021

for.cond:                                         ; preds = %for.inc, %2
  %5 = load i32* %i, align 4, !dbg !1022
  %cmp = icmp slt i32 %5, 61, !dbg !1022
  %6 = select i1 %cmp, i64 2, i64 3, !dbg !1026
  %7 = getelementptr inbounds [26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 %6, !dbg !1026
  %8 = load i64* %7, !dbg !1026
  %9 = add i64 %8, 1, !dbg !1026
  store i64 %9, i64* %7, !dbg !1026
  br i1 %cmp, label %for.body, label %for.end, !dbg !1026

for.body:                                         ; preds = %for.cond
  %board = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1027
  %10 = load i32* %i, align 4, !dbg !1030
  %call = call i32 @_ZN10BitBoard646getBitEi(%class.BitBoard64* %board, i32 %10), !dbg !1027
  %tobool = icmp ne i32 %call, 0, !dbg !1027
  %11 = select i1 %tobool, i64 4, i64 5, !dbg !1031
  %12 = getelementptr inbounds [26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 %11, !dbg !1031
  %13 = load i64* %12, !dbg !1031
  %14 = add i64 %13, 1, !dbg !1031
  store i64 %14, i64* %12, !dbg !1031
  br i1 %tobool, label %if.then, label %if.end6, !dbg !1031

if.then:                                          ; preds = %for.body
  %color = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !1032
  %15 = load i32* %i, align 4, !dbg !1035
  %call2 = call i32 @_ZN10BitBoard646getBitEi(%class.BitBoard64* %color, i32 %15), !dbg !1032
  %tobool3 = icmp ne i32 %call2, 0, !dbg !1032
  %16 = select i1 %tobool3, i64 6, i64 7, !dbg !1036
  %17 = getelementptr inbounds [26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 %16, !dbg !1036
  %18 = load i64* %17, !dbg !1036
  %19 = add i64 %18, 1, !dbg !1036
  store i64 %19, i64* %17, !dbg !1036
  br i1 %tobool3, label %if.then4, label %if.else, !dbg !1036

if.then4:                                         ; preds = %if.then
  %20 = load i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 8), !dbg !1037
  %21 = add i64 %20, 1, !dbg !1037
  store i64 %21, i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 8), !dbg !1037
  %22 = load i32* %good, align 4, !dbg !1037
  %inc = add nsw i32 %22, 1, !dbg !1037
  store i32 %inc, i32* %good, align 4, !dbg !1037
  br label %if.end, !dbg !1037

if.else:                                          ; preds = %if.then
  %23 = load i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 9), !dbg !1038
  %24 = add i64 %23, 1, !dbg !1038
  store i64 %24, i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 9), !dbg !1038
  %25 = load i32* %bad, align 4, !dbg !1038
  %inc5 = add nsw i32 %25, 1, !dbg !1038
  store i32 %inc5, i32* %bad, align 4, !dbg !1038
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then4
  %26 = load i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 10), !dbg !1039
  %27 = add i64 %26, 1, !dbg !1039
  store i64 %27, i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 10), !dbg !1039
  br label %if.end6, !dbg !1039

if.end6:                                          ; preds = %if.end, %for.body
  %28 = load i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 11), !dbg !1040
  %29 = add i64 %28, 1, !dbg !1040
  store i64 %29, i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 11), !dbg !1040
  br label %for.inc, !dbg !1040

for.inc:                                          ; preds = %if.end6
  %30 = load i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 12), !dbg !1041
  %31 = add i64 %30, 1, !dbg !1041
  store i64 %31, i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 12), !dbg !1041
  %32 = load i32* %i, align 4, !dbg !1041
  %inc7 = add nsw i32 %32, 1, !dbg !1041
  store i32 %inc7, i32* %i, align 4, !dbg !1041
  br label %for.cond, !dbg !1042

for.end:                                          ; preds = %for.cond
  %33 = load i32* %player.addr, align 4, !dbg !1043
  %cmp8 = icmp eq i32 %33, 0, !dbg !1043
  %34 = select i1 %cmp8, i64 13, i64 14, !dbg !1045
  %35 = getelementptr inbounds [26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 %34, !dbg !1045
  %36 = load i64* %35, !dbg !1045
  %37 = add i64 %36, 1, !dbg !1045
  store i64 %37, i64* %35, !dbg !1045
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1045

if.then9:                                         ; preds = %for.end
  %38 = load i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 15), !dbg !1046
  %39 = add i64 %38, 1, !dbg !1046
  store i64 %39, i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 15), !dbg !1046
  %40 = load i32* %good, align 4, !dbg !1046
  %41 = load i32* %bad, align 4, !dbg !1047
  %sub = sub nsw i32 %40, %41, !dbg !1046
  store i32 %sub, i32* %retval, !dbg !1048
  br label %return, !dbg !1048

if.else10:                                        ; preds = %for.end
  %42 = load i32* %player.addr, align 4, !dbg !1049
  %cmp11 = icmp eq i32 %42, 1, !dbg !1049
  %43 = select i1 %cmp11, i64 16, i64 17, !dbg !1051
  %44 = getelementptr inbounds [26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 %43, !dbg !1051
  %45 = load i64* %44, !dbg !1051
  %46 = add i64 %45, 1, !dbg !1051
  store i64 %46, i64* %44, !dbg !1051
  br i1 %cmp11, label %if.then12, label %if.else13, !dbg !1051

if.then12:                                        ; preds = %if.else10
  %47 = load i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 18), !dbg !1052
  %48 = add i64 %47, 1, !dbg !1052
  store i64 %48, i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 18), !dbg !1052
  %49 = load i32* %good, align 4, !dbg !1052
  store i32 %49, i32* %retval, !dbg !1053
  br label %return, !dbg !1053

if.else13:                                        ; preds = %if.else10
  %50 = load i32* %player.addr, align 4, !dbg !1054
  %cmp14 = icmp eq i32 %50, 2, !dbg !1054
  %51 = select i1 %cmp14, i64 19, i64 20, !dbg !1056
  %52 = getelementptr inbounds [26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 %51, !dbg !1056
  %53 = load i64* %52, !dbg !1056
  %54 = add i64 %53, 1, !dbg !1056
  store i64 %54, i64* %52, !dbg !1056
  br i1 %cmp14, label %if.then15, label %if.end16, !dbg !1056

if.then15:                                        ; preds = %if.else13
  %55 = load i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 21), !dbg !1057
  %56 = add i64 %55, 1, !dbg !1057
  store i64 %56, i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 21), !dbg !1057
  %57 = load i32* %bad, align 4, !dbg !1057
  store i32 %57, i32* %retval, !dbg !1058
  br label %return, !dbg !1058

if.end16:                                         ; preds = %if.else13
  %58 = load i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 22)
  %59 = add i64 %58, 1
  store i64 %59, i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 22)
  br label %if.end17

if.end17:                                         ; preds = %if.end16
  %60 = load i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 23)
  %61 = add i64 %60, 1
  store i64 %61, i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 23)
  br label %if.end18

if.end18:                                         ; preds = %if.end17
  %62 = load i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 24), !dbg !1059
  %63 = add i64 %62, 1, !dbg !1059
  store i64 %63, i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 24), !dbg !1059
  store i32 0, i32* %retval, !dbg !1059
  br label %return, !dbg !1059

return:                                           ; preds = %if.end18, %if.then15, %if.then12, %if.then9
  %64 = load i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 25), !dbg !1060
  %65 = add i64 %64, 1, !dbg !1060
  store i64 %65, i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 25), !dbg !1060
  %66 = load i32* %retval, !dbg !1060
  ret i32 %66, !dbg !1060
}

declare i32 @_ZN10BitBoard646getBitEi(%class.BitBoard64*, i32) #0

; Function Attrs: uwtable
define i32 @_ZN13HexxagonBoard8evaluateEv(%class.HexxagonBoard* %this) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonBoard*, align 8
  %good = alloca i32, align 4
  %bad = alloca i32, align 4
  %count = alloca i32, align 4
  %i = alloca i32, align 4
  %score = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 1)
  store %class.HexxagonBoard* %this, %class.HexxagonBoard** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %this.addr, metadata !1061, metadata !605), !dbg !1062
  %this1 = load %class.HexxagonBoard** %this.addr
  call void @llvm.dbg.declare(metadata i32* %good, metadata !1063, metadata !605), !dbg !1064
  store i32 0, i32* %good, align 4, !dbg !1064
  call void @llvm.dbg.declare(metadata i32* %bad, metadata !1065, metadata !605), !dbg !1066
  store i32 0, i32* %bad, align 4, !dbg !1066
  call void @llvm.dbg.declare(metadata i32* %count, metadata !1067, metadata !605), !dbg !1068
  store i32 0, i32* %count, align 4, !dbg !1068
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1069, metadata !605), !dbg !1071
  store i32 0, i32* %i, align 4, !dbg !1071
  br label %for.cond, !dbg !1072

for.cond:                                         ; preds = %for.inc, %2
  %5 = load i32* %i, align 4, !dbg !1073
  %cmp = icmp slt i32 %5, 61, !dbg !1073
  %6 = select i1 %cmp, i64 2, i64 3, !dbg !1077
  %7 = getelementptr inbounds [36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 %6, !dbg !1077
  %8 = load i64* %7, !dbg !1077
  %9 = add i64 %8, 1, !dbg !1077
  store i64 %9, i64* %7, !dbg !1077
  br i1 %cmp, label %for.body, label %for.end, !dbg !1077

for.body:                                         ; preds = %for.cond
  %board = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1078
  %10 = load i32* %i, align 4, !dbg !1081
  %call = call i32 @_ZN10BitBoard646getBitEi(%class.BitBoard64* %board, i32 %10), !dbg !1078
  %tobool = icmp ne i32 %call, 0, !dbg !1078
  %11 = select i1 %tobool, i64 4, i64 5, !dbg !1082
  %12 = getelementptr inbounds [36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 %11, !dbg !1082
  %13 = load i64* %12, !dbg !1082
  %14 = add i64 %13, 1, !dbg !1082
  store i64 %14, i64* %12, !dbg !1082
  br i1 %tobool, label %if.then, label %if.end7, !dbg !1082

if.then:                                          ; preds = %for.body
  %15 = load i32* %count, align 4, !dbg !1083
  %inc = add nsw i32 %15, 1, !dbg !1083
  store i32 %inc, i32* %count, align 4, !dbg !1083
  %color = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !1085
  %16 = load i32* %i, align 4, !dbg !1087
  %call2 = call i32 @_ZN10BitBoard646getBitEi(%class.BitBoard64* %color, i32 %16), !dbg !1085
  %tobool3 = icmp ne i32 %call2, 0, !dbg !1085
  %17 = select i1 %tobool3, i64 6, i64 7, !dbg !1088
  %18 = getelementptr inbounds [36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 %17, !dbg !1088
  %19 = load i64* %18, !dbg !1088
  %20 = add i64 %19, 1, !dbg !1088
  store i64 %20, i64* %18, !dbg !1088
  br i1 %tobool3, label %if.then4, label %if.else, !dbg !1088

if.then4:                                         ; preds = %if.then
  %21 = load i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 8), !dbg !1089
  %22 = add i64 %21, 1, !dbg !1089
  store i64 %22, i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 8), !dbg !1089
  %23 = load i32* %good, align 4, !dbg !1089
  %inc5 = add nsw i32 %23, 1, !dbg !1089
  store i32 %inc5, i32* %good, align 4, !dbg !1089
  br label %if.end, !dbg !1089

if.else:                                          ; preds = %if.then
  %24 = load i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 9), !dbg !1090
  %25 = add i64 %24, 1, !dbg !1090
  store i64 %25, i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 9), !dbg !1090
  %26 = load i32* %bad, align 4, !dbg !1090
  %inc6 = add nsw i32 %26, 1, !dbg !1090
  store i32 %inc6, i32* %bad, align 4, !dbg !1090
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then4
  %27 = load i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 10), !dbg !1091
  %28 = add i64 %27, 1, !dbg !1091
  store i64 %28, i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 10), !dbg !1091
  br label %if.end7, !dbg !1091

if.end7:                                          ; preds = %if.end, %for.body
  %29 = load i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 11), !dbg !1092
  %30 = add i64 %29, 1, !dbg !1092
  store i64 %30, i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 11), !dbg !1092
  br label %for.inc, !dbg !1092

for.inc:                                          ; preds = %if.end7
  %31 = load i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 12), !dbg !1093
  %32 = add i64 %31, 1, !dbg !1093
  store i64 %32, i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 12), !dbg !1093
  %33 = load i32* %i, align 4, !dbg !1093
  %inc8 = add nsw i32 %33, 1, !dbg !1093
  store i32 %inc8, i32* %i, align 4, !dbg !1093
  br label %for.cond, !dbg !1094

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %score, metadata !1095, metadata !605), !dbg !1096
  %34 = load i32* %good, align 4, !dbg !1097
  %35 = load i32* %bad, align 4, !dbg !1098
  %sub = sub nsw i32 %34, %35, !dbg !1097
  store i32 %sub, i32* %score, align 4, !dbg !1096
  %36 = load i32* %good, align 4, !dbg !1099
  %cmp9 = icmp eq i32 %36, 0, !dbg !1099
  %37 = select i1 %cmp9, i64 13, i64 14, !dbg !1101
  %38 = getelementptr inbounds [36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 %37, !dbg !1101
  %39 = load i64* %38, !dbg !1101
  %40 = add i64 %39, 1, !dbg !1101
  store i64 %40, i64* %38, !dbg !1101
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !1101

lor.lhs.false:                                    ; preds = %for.end
  %41 = load i32* %bad, align 4, !dbg !1102
  %cmp10 = icmp eq i32 %41, 0, !dbg !1102
  %42 = select i1 %cmp10, i64 15, i64 16, !dbg !1101
  %43 = getelementptr inbounds [36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 %42, !dbg !1101
  %44 = load i64* %43, !dbg !1101
  %45 = add i64 %44, 1, !dbg !1101
  store i64 %45, i64* %43, !dbg !1101
  br i1 %cmp10, label %if.then13, label %lor.lhs.false11, !dbg !1101

lor.lhs.false11:                                  ; preds = %lor.lhs.false
  %46 = load i32* %count, align 4, !dbg !1104
  %cmp12 = icmp eq i32 %46, 61, !dbg !1104
  %47 = select i1 %cmp12, i64 17, i64 18, !dbg !1101
  %48 = getelementptr inbounds [36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 %47, !dbg !1101
  %49 = load i64* %48, !dbg !1101
  %50 = add i64 %49, 1, !dbg !1101
  store i64 %50, i64* %48, !dbg !1101
  br i1 %cmp12, label %if.then13, label %if.end32, !dbg !1101

if.then13:                                        ; preds = %lor.lhs.false11, %lor.lhs.false, %for.end
  %51 = load i32* %good, align 4, !dbg !1106
  %cmp14 = icmp eq i32 %51, 0, !dbg !1106
  %52 = select i1 %cmp14, i64 19, i64 20, !dbg !1109
  %53 = getelementptr inbounds [36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 %52, !dbg !1109
  %54 = load i64* %53, !dbg !1109
  %55 = add i64 %54, 1, !dbg !1109
  store i64 %55, i64* %53, !dbg !1109
  br i1 %cmp14, label %if.then15, label %if.end17, !dbg !1109

if.then15:                                        ; preds = %if.then13
  %56 = load i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 21), !dbg !1110
  %57 = add i64 %56, 1, !dbg !1110
  store i64 %57, i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 21), !dbg !1110
  %58 = load i32* %score, align 4, !dbg !1110
  %sub16 = sub nsw i32 %58, 20000, !dbg !1110
  store i32 %sub16, i32* %score, align 4, !dbg !1110
  br label %if.end17, !dbg !1110

if.end17:                                         ; preds = %if.then15, %if.then13
  %59 = load i32* %bad, align 4, !dbg !1111
  %cmp18 = icmp eq i32 %59, 0, !dbg !1111
  %60 = select i1 %cmp18, i64 22, i64 23, !dbg !1113
  %61 = getelementptr inbounds [36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 %60, !dbg !1113
  %62 = load i64* %61, !dbg !1113
  %63 = add i64 %62, 1, !dbg !1113
  store i64 %63, i64* %61, !dbg !1113
  br i1 %cmp18, label %if.then19, label %if.end20, !dbg !1113

if.then19:                                        ; preds = %if.end17
  %64 = load i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 24), !dbg !1114
  %65 = add i64 %64, 1, !dbg !1114
  store i64 %65, i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 24), !dbg !1114
  %66 = load i32* %score, align 4, !dbg !1114
  %add = add nsw i32 %66, 20000, !dbg !1114
  store i32 %add, i32* %score, align 4, !dbg !1114
  br label %if.end20, !dbg !1114

if.end20:                                         ; preds = %if.then19, %if.end17
  %67 = load i32* %count, align 4, !dbg !1115
  %cmp21 = icmp eq i32 %67, 61, !dbg !1115
  %68 = select i1 %cmp21, i64 25, i64 26, !dbg !1117
  %69 = getelementptr inbounds [36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 %68, !dbg !1117
  %70 = load i64* %69, !dbg !1117
  %71 = add i64 %70, 1, !dbg !1117
  store i64 %71, i64* %69, !dbg !1117
  br i1 %cmp21, label %if.then22, label %if.end31, !dbg !1117

if.then22:                                        ; preds = %if.end20
  %72 = load i32* %good, align 4, !dbg !1118
  %73 = load i32* %bad, align 4, !dbg !1121
  %cmp23 = icmp sgt i32 %72, %73, !dbg !1118
  %74 = select i1 %cmp23, i64 27, i64 28, !dbg !1122
  %75 = getelementptr inbounds [36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 %74, !dbg !1122
  %76 = load i64* %75, !dbg !1122
  %77 = add i64 %76, 1, !dbg !1122
  store i64 %77, i64* %75, !dbg !1122
  br i1 %cmp23, label %if.then24, label %if.end26, !dbg !1122

if.then24:                                        ; preds = %if.then22
  %78 = load i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 29), !dbg !1123
  %79 = add i64 %78, 1, !dbg !1123
  store i64 %79, i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 29), !dbg !1123
  %80 = load i32* %score, align 4, !dbg !1123
  %add25 = add nsw i32 %80, 20000, !dbg !1123
  store i32 %add25, i32* %score, align 4, !dbg !1123
  br label %if.end26, !dbg !1123

if.end26:                                         ; preds = %if.then24, %if.then22
  %81 = load i32* %good, align 4, !dbg !1124
  %82 = load i32* %bad, align 4, !dbg !1126
  %cmp27 = icmp sle i32 %81, %82, !dbg !1124
  %83 = select i1 %cmp27, i64 30, i64 31, !dbg !1127
  %84 = getelementptr inbounds [36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 %83, !dbg !1127
  %85 = load i64* %84, !dbg !1127
  %86 = add i64 %85, 1, !dbg !1127
  store i64 %86, i64* %84, !dbg !1127
  br i1 %cmp27, label %if.then28, label %if.end30, !dbg !1127

if.then28:                                        ; preds = %if.end26
  %87 = load i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 32), !dbg !1128
  %88 = add i64 %87, 1, !dbg !1128
  store i64 %88, i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 32), !dbg !1128
  %89 = load i32* %score, align 4, !dbg !1128
  %sub29 = sub nsw i32 %89, 20000, !dbg !1128
  store i32 %sub29, i32* %score, align 4, !dbg !1128
  br label %if.end30, !dbg !1128

if.end30:                                         ; preds = %if.then28, %if.end26
  %90 = load i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 33), !dbg !1129
  %91 = add i64 %90, 1, !dbg !1129
  store i64 %91, i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 33), !dbg !1129
  br label %if.end31, !dbg !1129

if.end31:                                         ; preds = %if.end30, %if.end20
  %92 = load i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 34), !dbg !1130
  %93 = add i64 %92, 1, !dbg !1130
  store i64 %93, i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 34), !dbg !1130
  br label %if.end32, !dbg !1130

if.end32:                                         ; preds = %if.end31, %lor.lhs.false11
  %94 = load i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 35), !dbg !1131
  %95 = add i64 %94, 1, !dbg !1131
  store i64 %95, i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 35), !dbg !1131
  %96 = load i32* %score, align 4, !dbg !1131
  ret i32 %96, !dbg !1132
}

; Function Attrs: uwtable
define i32 @_ZN13HexxagonBoard11getHexxagonEi(%class.HexxagonBoard* %this, i32 %i) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr29, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr29, i64 0, i64 0)
  %retval = alloca i32, align 4
  %this.addr = alloca %class.HexxagonBoard*, align 8
  %i.addr = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonBoard* %this, %class.HexxagonBoard** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %this.addr, metadata !1133, metadata !605), !dbg !1134
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !1135, metadata !605), !dbg !1136
  %this1 = load %class.HexxagonBoard** %this.addr
  %board = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1137
  %3 = load i32* %i.addr, align 4, !dbg !1139
  %call = call i32 @_ZN10BitBoard646getBitEi(%class.BitBoard64* %board, i32 %3), !dbg !1137
  %tobool = icmp ne i32 %call, 0, !dbg !1137
  %4 = select i1 %tobool, i64 1, i64 2, !dbg !1140
  %5 = getelementptr inbounds [9 x i64]* @__llvm_gcov_ctr29, i64 0, i64 %4, !dbg !1140
  %6 = load i64* %5, !dbg !1140
  %7 = add i64 %6, 1, !dbg !1140
  store i64 %7, i64* %5, !dbg !1140
  br i1 %tobool, label %if.then, label %if.else5, !dbg !1140

if.then:                                          ; preds = %2
  %color = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !1141
  %8 = load i32* %i.addr, align 4, !dbg !1144
  %call2 = call i32 @_ZN10BitBoard646getBitEi(%class.BitBoard64* %color, i32 %8), !dbg !1141
  %tobool3 = icmp ne i32 %call2, 0, !dbg !1141
  %9 = select i1 %tobool3, i64 3, i64 4, !dbg !1145
  %10 = getelementptr inbounds [9 x i64]* @__llvm_gcov_ctr29, i64 0, i64 %9, !dbg !1145
  %11 = load i64* %10, !dbg !1145
  %12 = add i64 %11, 1, !dbg !1145
  store i64 %12, i64* %10, !dbg !1145
  br i1 %tobool3, label %if.then4, label %if.else, !dbg !1145

if.then4:                                         ; preds = %if.then
  %13 = load i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr29, i64 0, i64 5), !dbg !1146
  %14 = add i64 %13, 1, !dbg !1146
  store i64 %14, i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr29, i64 0, i64 5), !dbg !1146
  store i32 1, i32* %retval, !dbg !1146
  br label %return, !dbg !1146

if.else:                                          ; preds = %if.then
  %15 = load i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr29, i64 0, i64 6), !dbg !1147
  %16 = add i64 %15, 1, !dbg !1147
  store i64 %16, i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr29, i64 0, i64 6), !dbg !1147
  store i32 2, i32* %retval, !dbg !1147
  br label %return, !dbg !1147

if.else5:                                         ; preds = %2
  %17 = load i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr29, i64 0, i64 7), !dbg !1148
  %18 = add i64 %17, 1, !dbg !1148
  store i64 %18, i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr29, i64 0, i64 7), !dbg !1148
  store i32 3, i32* %retval, !dbg !1148
  br label %return, !dbg !1148

return:                                           ; preds = %if.else5, %if.else, %if.then4
  %19 = load i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr29, i64 0, i64 8), !dbg !1149
  %20 = add i64 %19, 1, !dbg !1149
  store i64 %20, i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr29, i64 0, i64 8), !dbg !1149
  %21 = load i32* %retval, !dbg !1149
  ret i32 %21, !dbg !1149
}

; Function Attrs: uwtable
define i32 @_ZN13HexxagonBoard9applyMoveER12HexxagonMove(%class.HexxagonBoard* %this, %class.HexxagonMove* dereferenceable(8) %move) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr30, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr30, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonBoard*, align 8
  %move.addr = alloca %class.HexxagonMove*, align 8
  %ref.tmp = alloca %class.BitBoard64, align 4
  %coerce = alloca %class.BitBoard64, align 4
  %ref.tmp15 = alloca %class.BitBoard64, align 4
  %coerce19 = alloca %class.BitBoard64, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonBoard* %this, %class.HexxagonBoard** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %this.addr, metadata !1150, metadata !605), !dbg !1151
  store %class.HexxagonMove* %move, %class.HexxagonMove** %move.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMove** %move.addr, metadata !1152, metadata !605), !dbg !1153
  %this1 = load %class.HexxagonBoard** %this.addr
  %board = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1154
  %3 = load %class.HexxagonMove** %move.addr, align 8, !dbg !1155
  %to = getelementptr inbounds %class.HexxagonMove* %3, i32 0, i32 1, !dbg !1155
  %4 = load i8* %to, align 1, !dbg !1155
  %conv = sext i8 %4 to i32, !dbg !1155
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %board, i32 %conv), !dbg !1154
  %color = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !1156
  %5 = load %class.HexxagonMove** %move.addr, align 8, !dbg !1157
  %to2 = getelementptr inbounds %class.HexxagonMove* %5, i32 0, i32 1, !dbg !1157
  %6 = load i8* %to2, align 1, !dbg !1157
  %conv3 = sext i8 %6 to i32, !dbg !1157
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %color, i32 %conv3), !dbg !1156
  %color4 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !1158
  %color5 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !1159
  %7 = load %class.HexxagonMove** %move.addr, align 8, !dbg !1160
  %to6 = getelementptr inbounds %class.HexxagonMove* %7, i32 0, i32 1, !dbg !1160
  %8 = load i8* %to6, align 1, !dbg !1160
  %idxprom = sext i8 %8 to i64, !dbg !1159
  %9 = load %class.BitBoard64** @clone_lookups, align 8, !dbg !1161
  %arrayidx = getelementptr inbounds %class.BitBoard64* %9, i64 %idxprom, !dbg !1159
  %call = call i64 @_ZN10BitBoard64orERKS_(%class.BitBoard64* %color5, %class.BitBoard64* dereferenceable(8) %arrayidx), !dbg !1159
  %10 = bitcast %class.BitBoard64* %ref.tmp to i64*, !dbg !1159
  store i64 %call, i64* %10, align 1, !dbg !1159
  %call7 = call i64 @_ZN10BitBoard64aSERKS_(%class.BitBoard64* %color4, %class.BitBoard64* dereferenceable(8) %ref.tmp), !dbg !1158
  %11 = bitcast %class.BitBoard64* %coerce to i64*, !dbg !1158
  store i64 %call7, i64* %11, align 1, !dbg !1158
  %12 = load %class.HexxagonMove** %move.addr, align 8, !dbg !1162
  %from = getelementptr inbounds %class.HexxagonMove* %12, i32 0, i32 0, !dbg !1162
  %13 = load i8* %from, align 1, !dbg !1162
  %conv8 = sext i8 %13 to i32, !dbg !1162
  %14 = load %class.HexxagonMove** %move.addr, align 8, !dbg !1164
  %to9 = getelementptr inbounds %class.HexxagonMove* %14, i32 0, i32 1, !dbg !1164
  %15 = load i8* %to9, align 1, !dbg !1164
  %conv10 = sext i8 %15 to i32, !dbg !1164
  %cmp = icmp ne i32 %conv8, %conv10, !dbg !1162
  %16 = select i1 %cmp, i64 1, i64 2, !dbg !1165
  %17 = getelementptr inbounds [5 x i64]* @__llvm_gcov_ctr30, i64 0, i64 %16, !dbg !1165
  %18 = load i64* %17, !dbg !1165
  %19 = add i64 %18, 1, !dbg !1165
  store i64 %19, i64* %17, !dbg !1165
  br i1 %cmp, label %if.then, label %if.end, !dbg !1165

if.then:                                          ; preds = %2
  %20 = load i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr30, i64 0, i64 3), !dbg !1166
  %21 = add i64 %20, 1, !dbg !1166
  store i64 %21, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr30, i64 0, i64 3), !dbg !1166
  %board11 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1166
  %22 = load %class.HexxagonMove** %move.addr, align 8, !dbg !1167
  %from12 = getelementptr inbounds %class.HexxagonMove* %22, i32 0, i32 0, !dbg !1167
  %23 = load i8* %from12, align 1, !dbg !1167
  %conv13 = sext i8 %23 to i32, !dbg !1167
  call void @_ZN10BitBoard648unSetBitEi(%class.BitBoard64* %board11, i32 %conv13), !dbg !1166
  br label %if.end, !dbg !1166

if.end:                                           ; preds = %if.then, %2
  %24 = load i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr30, i64 0, i64 4), !dbg !1168
  %25 = add i64 %24, 1, !dbg !1168
  store i64 %25, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr30, i64 0, i64 4), !dbg !1168
  %color14 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !1168
  %color16 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !1169
  %call17 = call i64 @_ZN10BitBoard64coEv(%class.BitBoard64* %color16), !dbg !1169
  %26 = bitcast %class.BitBoard64* %ref.tmp15 to i64*, !dbg !1169
  store i64 %call17, i64* %26, align 1, !dbg !1169
  %call18 = call i64 @_ZN10BitBoard64aSERKS_(%class.BitBoard64* %color14, %class.BitBoard64* dereferenceable(8) %ref.tmp15), !dbg !1168
  %27 = bitcast %class.BitBoard64* %coerce19 to i64*, !dbg !1168
  store i64 %call18, i64* %27, align 1, !dbg !1168
  ret i32 0, !dbg !1170
}

declare i64 @_ZN10BitBoard64orERKS_(%class.BitBoard64*, %class.BitBoard64* dereferenceable(8)) #0

declare void @_ZN10BitBoard648unSetBitEi(%class.BitBoard64*, i32) #0

declare i64 @_ZN10BitBoard64coEv(%class.BitBoard64*) #0

; Function Attrs: uwtable
define i32 @_ZN13HexxagonBoard11isMoveValidER12HexxagonMove(%class.HexxagonBoard* %this, %class.HexxagonMove* dereferenceable(8) %move) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 0)
  %retval = alloca i32, align 4
  %this.addr = alloca %class.HexxagonBoard*, align 8
  %move.addr = alloca %class.HexxagonMove*, align 8
  %mine = alloca %class.BitBoard64, align 4
  %coerce = alloca %class.BitBoard64, align 4
  %tmp = alloca %class.BitBoard64, align 4
  %coerce18 = alloca %class.BitBoard64, align 4
  %coerce20 = alloca %class.BitBoard64, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonBoard* %this, %class.HexxagonBoard** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %this.addr, metadata !1171, metadata !605), !dbg !1172
  store %class.HexxagonMove* %move, %class.HexxagonMove** %move.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMove** %move.addr, metadata !1173, metadata !605), !dbg !1174
  %this1 = load %class.HexxagonBoard** %this.addr
  call void @llvm.dbg.declare(metadata %class.BitBoard64* %mine, metadata !1175, metadata !605), !dbg !1176
  %color = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !1177
  %board = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1177
  %call = call i64 @_ZN10BitBoard64anERKS_(%class.BitBoard64* %color, %class.BitBoard64* dereferenceable(8) %board), !dbg !1177
  %3 = bitcast %class.BitBoard64* %mine to i64*, !dbg !1177
  store i64 %call, i64* %3, align 1, !dbg !1177
  %board2 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1178
  %4 = load %class.HexxagonMove** %move.addr, align 8, !dbg !1180
  %to = getelementptr inbounds %class.HexxagonMove* %4, i32 0, i32 1, !dbg !1180
  %5 = load i8* %to, align 1, !dbg !1180
  %conv = sext i8 %5 to i32, !dbg !1180
  %call3 = call i32 @_ZN10BitBoard646getBitEi(%class.BitBoard64* %board2, i32 %conv), !dbg !1178
  %tobool = icmp ne i32 %call3, 0, !dbg !1178
  %6 = select i1 %tobool, i64 1, i64 2, !dbg !1181
  %7 = getelementptr inbounds [16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 %6, !dbg !1181
  %8 = load i64* %7, !dbg !1181
  %9 = add i64 %8, 1, !dbg !1181
  store i64 %9, i64* %7, !dbg !1181
  br i1 %tobool, label %if.end25, label %if.then, !dbg !1181

if.then:                                          ; preds = %2
  %10 = load %class.HexxagonMove** %move.addr, align 8, !dbg !1182
  %from = getelementptr inbounds %class.HexxagonMove* %10, i32 0, i32 0, !dbg !1182
  %11 = load i8* %from, align 1, !dbg !1182
  %conv4 = sext i8 %11 to i32, !dbg !1182
  %12 = load %class.HexxagonMove** %move.addr, align 8, !dbg !1185
  %to5 = getelementptr inbounds %class.HexxagonMove* %12, i32 0, i32 1, !dbg !1185
  %13 = load i8* %to5, align 1, !dbg !1185
  %conv6 = sext i8 %13 to i32, !dbg !1185
  %cmp = icmp eq i32 %conv4, %conv6, !dbg !1182
  %14 = select i1 %cmp, i64 3, i64 4, !dbg !1186
  %15 = getelementptr inbounds [16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 %14, !dbg !1186
  %16 = load i64* %15, !dbg !1186
  %17 = add i64 %16, 1, !dbg !1186
  store i64 %17, i64* %15, !dbg !1186
  br i1 %cmp, label %if.then7, label %if.else, !dbg !1186

if.then7:                                         ; preds = %if.then
  %18 = load %class.HexxagonMove** %move.addr, align 8, !dbg !1187
  %to8 = getelementptr inbounds %class.HexxagonMove* %18, i32 0, i32 1, !dbg !1187
  %19 = load i8* %to8, align 1, !dbg !1187
  %idxprom = sext i8 %19 to i64, !dbg !1190
  %20 = load %class.BitBoard64** @clone_lookups, align 8, !dbg !1191
  %arrayidx = getelementptr inbounds %class.BitBoard64* %20, i64 %idxprom, !dbg !1190
  %call9 = call i64 @_ZN10BitBoard64anERKS_(%class.BitBoard64* %mine, %class.BitBoard64* dereferenceable(8) %arrayidx), !dbg !1190
  %21 = bitcast %class.BitBoard64* %coerce to i64*, !dbg !1190
  store i64 %call9, i64* %21, align 1, !dbg !1190
  %call10 = call zeroext i1 @_ZN10BitBoard64cvbEv(%class.BitBoard64* %coerce), !dbg !1190
  %22 = select i1 %call10, i64 5, i64 6, !dbg !1192
  %23 = getelementptr inbounds [16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 %22, !dbg !1192
  %24 = load i64* %23, !dbg !1192
  %25 = add i64 %24, 1, !dbg !1192
  store i64 %25, i64* %23, !dbg !1192
  br i1 %call10, label %if.then11, label %if.end, !dbg !1192

if.then11:                                        ; preds = %if.then7
  %26 = load i64* getelementptr inbounds ([16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 7), !dbg !1193
  %27 = add i64 %26, 1, !dbg !1193
  store i64 %27, i64* getelementptr inbounds ([16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 7), !dbg !1193
  store i32 1, i32* %retval, !dbg !1193
  br label %return, !dbg !1193

if.end:                                           ; preds = %if.then7
  %28 = load i64* getelementptr inbounds ([16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 8), !dbg !1194
  %29 = add i64 %28, 1, !dbg !1194
  store i64 %29, i64* getelementptr inbounds ([16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 8), !dbg !1194
  br label %if.end24, !dbg !1194

if.else:                                          ; preds = %if.then
  call void @llvm.dbg.declare(metadata %class.BitBoard64* %tmp, metadata !1195, metadata !605), !dbg !1197
  call void @_ZN10BitBoard64C2Ejj(%class.BitBoard64* %tmp, i32 0, i32 0), !dbg !1197
  %30 = load %class.HexxagonMove** %move.addr, align 8, !dbg !1198
  %from12 = getelementptr inbounds %class.HexxagonMove* %30, i32 0, i32 0, !dbg !1198
  %31 = load i8* %from12, align 1, !dbg !1198
  %conv13 = sext i8 %31 to i32, !dbg !1198
  call void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %tmp, i32 %conv13), !dbg !1199
  %32 = load %class.HexxagonMove** %move.addr, align 8, !dbg !1200
  %to14 = getelementptr inbounds %class.HexxagonMove* %32, i32 0, i32 1, !dbg !1200
  %33 = load i8* %to14, align 1, !dbg !1200
  %idxprom15 = sext i8 %33 to i64, !dbg !1202
  %34 = load %class.BitBoard64** @jump_lookups, align 8, !dbg !1203
  %arrayidx16 = getelementptr inbounds %class.BitBoard64* %34, i64 %idxprom15, !dbg !1202
  %call17 = call i64 @_ZN10BitBoard64anERKS_(%class.BitBoard64* %tmp, %class.BitBoard64* dereferenceable(8) %arrayidx16), !dbg !1202
  %35 = bitcast %class.BitBoard64* %coerce18 to i64*, !dbg !1202
  store i64 %call17, i64* %35, align 1, !dbg !1202
  %call19 = call i64 @_ZN10BitBoard64anERKS_(%class.BitBoard64* %coerce18, %class.BitBoard64* dereferenceable(8) %mine), !dbg !1202
  %36 = bitcast %class.BitBoard64* %coerce20 to i64*, !dbg !1202
  store i64 %call19, i64* %36, align 1, !dbg !1202
  %call21 = call zeroext i1 @_ZN10BitBoard64cvbEv(%class.BitBoard64* %coerce20), !dbg !1202
  %37 = select i1 %call21, i64 9, i64 10, !dbg !1204
  %38 = getelementptr inbounds [16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 %37, !dbg !1204
  %39 = load i64* %38, !dbg !1204
  %40 = add i64 %39, 1, !dbg !1204
  store i64 %40, i64* %38, !dbg !1204
  br i1 %call21, label %if.then22, label %if.end23, !dbg !1204

if.then22:                                        ; preds = %if.else
  %41 = load i64* getelementptr inbounds ([16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 11), !dbg !1205
  %42 = add i64 %41, 1, !dbg !1205
  store i64 %42, i64* getelementptr inbounds ([16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 11), !dbg !1205
  store i32 1, i32* %retval, !dbg !1205
  br label %return, !dbg !1205

if.end23:                                         ; preds = %if.else
  %43 = load i64* getelementptr inbounds ([16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 12)
  %44 = add i64 %43, 1
  store i64 %44, i64* getelementptr inbounds ([16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 12)
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.end
  %45 = load i64* getelementptr inbounds ([16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 13), !dbg !1206
  %46 = add i64 %45, 1, !dbg !1206
  store i64 %46, i64* getelementptr inbounds ([16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 13), !dbg !1206
  br label %if.end25, !dbg !1206

if.end25:                                         ; preds = %if.end24, %2
  %47 = load i64* getelementptr inbounds ([16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 14), !dbg !1207
  %48 = add i64 %47, 1, !dbg !1207
  store i64 %48, i64* getelementptr inbounds ([16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 14), !dbg !1207
  store i32 0, i32* %retval, !dbg !1207
  br label %return, !dbg !1207

return:                                           ; preds = %if.end25, %if.then22, %if.then11
  %49 = load i64* getelementptr inbounds ([16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 15), !dbg !1208
  %50 = add i64 %49, 1, !dbg !1208
  store i64 %50, i64* getelementptr inbounds ([16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 15), !dbg !1208
  %51 = load i32* %retval, !dbg !1208
  ret i32 %51, !dbg !1208
}

declare i64 @_ZN10BitBoard64anERKS_(%class.BitBoard64*, %class.BitBoard64* dereferenceable(8)) #0

declare zeroext i1 @_ZN10BitBoard64cvbEv(%class.BitBoard64*) #0

; Function Attrs: uwtable
define %class.HexxagonMoveList* @_ZN13HexxagonBoard16generateMoveListEv(%class.HexxagonBoard* %this) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 0)
  %retval = alloca %class.HexxagonMoveList*, align 8
  %this.addr = alloca %class.HexxagonBoard*, align 8
  %list = alloca %class.HexxagonMoveList*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %i = alloca i32, align 4
  %ref.tmp = alloca %class.BitBoard64, align 4
  %coerce = alloca %class.BitBoard64, align 4
  %move = alloca %class.HexxagonMove, align 4
  %moves = alloca %class.BitBoard64, align 4
  %ref.tmp12 = alloca %class.BitBoard64, align 4
  %coerce17 = alloca %class.BitBoard64, align 4
  %coerce21 = alloca %class.BitBoard64, align 4
  %j = alloca i32, align 4
  %move30 = alloca %class.HexxagonMove, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  store i32 0, i32* @__llvm_gcov_global_state_pred34
  store %class.HexxagonBoard* %this, %class.HexxagonBoard** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %this.addr, metadata !1209, metadata !605), !dbg !1210
  %this1 = load %class.HexxagonBoard** %this.addr
  call void @llvm.dbg.declare(metadata %class.HexxagonMoveList** %list, metadata !1211, metadata !605), !dbg !1212
  %call = call noalias i8* @_Znwm(i64 16) #9, !dbg !1213
  %3 = bitcast i8* %call to %class.HexxagonMoveList*, !dbg !1213
  invoke void @_ZN16HexxagonMoveListC2Ev(%class.HexxagonMoveList* %3)
          to label %invoke.cont unwind label %lpad, !dbg !1213

invoke.cont:                                      ; preds = %2
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred34, i64** getelementptr inbounds ([8 x i64*]* @__llvm_gcda_edge_table33, i64 0, i64 0)), !dbg !1214
  store %class.HexxagonMoveList* %3, %class.HexxagonMoveList** %list, align 8, !dbg !1214
  %4 = load %class.HexxagonMoveList** %list, align 8, !dbg !1216
  %tobool = icmp ne %class.HexxagonMoveList* %4, null, !dbg !1216
  %5 = select i1 %tobool, i64 3, i64 4, !dbg !1218
  %6 = getelementptr inbounds [39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 %5, !dbg !1218
  %7 = load i64* %6, !dbg !1218
  %8 = add i64 %7, 1, !dbg !1218
  store i64 %8, i64* %6, !dbg !1218
  br i1 %tobool, label %if.end, label %if.then, !dbg !1218

if.then:                                          ; preds = %invoke.cont
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)), !dbg !1219
  call void @exit(i32 -1) #11, !dbg !1221
  unreachable, !dbg !1221

lpad:                                             ; preds = %2
  %9 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !1222
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred34, i64** getelementptr inbounds ([8 x i64*]* @__llvm_gcda_edge_table33, i64 0, i64 2)), !dbg !1222
  %10 = load i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 5), !dbg !1222
  %11 = add i64 %10, 1, !dbg !1222
  store i64 %11, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 5), !dbg !1222
  %12 = extractvalue { i8*, i32 } %9, 0, !dbg !1222
  store i8* %12, i8** %exn.slot, !dbg !1222
  %13 = extractvalue { i8*, i32 } %9, 1, !dbg !1222
  store i32 %13, i32* %ehselector.slot, !dbg !1222
  call void @_ZdlPv(i8* %call) #10, !dbg !1222
  br label %eh.resume, !dbg !1222

if.end:                                           ; preds = %invoke.cont
  %14 = load i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 6), !dbg !1223
  %15 = add i64 %14, 1, !dbg !1223
  store i64 %15, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 6), !dbg !1223
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1225, metadata !605), !dbg !1223
  store i32 0, i32* %i, align 4, !dbg !1223
  br label %for.cond, !dbg !1226

for.cond:                                         ; preds = %for.inc34, %if.end
  %16 = load i32* %i, align 4, !dbg !1227
  %cmp = icmp slt i32 %16, 61, !dbg !1227
  %17 = select i1 %cmp, i64 7, i64 8, !dbg !1231
  %18 = getelementptr inbounds [39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 %17, !dbg !1231
  %19 = load i64* %18, !dbg !1231
  %20 = add i64 %19, 1, !dbg !1231
  store i64 %20, i64* %18, !dbg !1231
  br i1 %cmp, label %for.body, label %for.end36, !dbg !1231

for.body:                                         ; preds = %for.cond
  %board = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1232
  %21 = load i32* %i, align 4, !dbg !1235
  %call3 = call i32 @_ZN10BitBoard646getBitEi(%class.BitBoard64* %board, i32 %21), !dbg !1232
  %tobool4 = icmp ne i32 %call3, 0, !dbg !1232
  %22 = select i1 %tobool4, i64 9, i64 10, !dbg !1236
  %23 = getelementptr inbounds [39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 %22, !dbg !1236
  %24 = load i64* %23, !dbg !1236
  %25 = add i64 %24, 1, !dbg !1236
  store i64 %25, i64* %23, !dbg !1236
  br i1 %tobool4, label %if.end33, label %if.then5, !dbg !1236

if.then5:                                         ; preds = %for.body
  %color = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !1237
  %board6 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1240
  %26 = load i32* %i, align 4, !dbg !1241
  %idxprom = sext i32 %26 to i64, !dbg !1240
  %27 = load %class.BitBoard64** @clone_lookups, align 8, !dbg !1242
  %arrayidx = getelementptr inbounds %class.BitBoard64* %27, i64 %idxprom, !dbg !1240
  %call7 = call i64 @_ZN10BitBoard64anERKS_(%class.BitBoard64* %board6, %class.BitBoard64* dereferenceable(8) %arrayidx), !dbg !1240
  %28 = bitcast %class.BitBoard64* %ref.tmp to i64*, !dbg !1240
  store i64 %call7, i64* %28, align 1, !dbg !1240
  %call8 = call i64 @_ZN10BitBoard64anERKS_(%class.BitBoard64* %color, %class.BitBoard64* dereferenceable(8) %ref.tmp), !dbg !1237
  %29 = bitcast %class.BitBoard64* %coerce to i64*, !dbg !1237
  store i64 %call8, i64* %29, align 1, !dbg !1237
  %call9 = call zeroext i1 @_ZN10BitBoard64cvbEv(%class.BitBoard64* %coerce), !dbg !1237
  %30 = select i1 %call9, i64 11, i64 12, !dbg !1243
  %31 = getelementptr inbounds [39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 %30, !dbg !1243
  %32 = load i64* %31, !dbg !1243
  %33 = add i64 %32, 1, !dbg !1243
  store i64 %33, i64* %31, !dbg !1243
  br i1 %call9, label %if.then10, label %if.end11, !dbg !1243

if.then10:                                        ; preds = %if.then5
  %34 = load i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 13), !dbg !1244
  %35 = add i64 %34, 1, !dbg !1244
  store i64 %35, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 13), !dbg !1244
  call void @llvm.dbg.declare(metadata %class.HexxagonMove* %move, metadata !1246, metadata !605), !dbg !1244
  %36 = load i32* %i, align 4, !dbg !1247
  call void @_ZN12HexxagonMoveC2Ei(%class.HexxagonMove* %move, i32 %36), !dbg !1244
  %37 = load %class.HexxagonMoveList** %list, align 8, !dbg !1248
  call void @_ZN16HexxagonMoveList7addMoveER12HexxagonMove(%class.HexxagonMoveList* %37, %class.HexxagonMove* dereferenceable(8) %move), !dbg !1248
  br label %if.end11, !dbg !1249

if.end11:                                         ; preds = %if.then10, %if.then5
  call void @llvm.dbg.declare(metadata %class.BitBoard64* %moves, metadata !1250, metadata !605), !dbg !1251
  call void @_ZN10BitBoard64C2Ev(%class.BitBoard64* %moves), !dbg !1251
  %board13 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1252
  %38 = load i32* %i, align 4, !dbg !1254
  %idxprom14 = sext i32 %38 to i64, !dbg !1252
  %39 = load %class.BitBoard64** @jump_lookups, align 8, !dbg !1255
  %arrayidx15 = getelementptr inbounds %class.BitBoard64* %39, i64 %idxprom14, !dbg !1252
  %call16 = call i64 @_ZN10BitBoard64anERKS_(%class.BitBoard64* %board13, %class.BitBoard64* dereferenceable(8) %arrayidx15), !dbg !1252
  %40 = bitcast %class.BitBoard64* %coerce17 to i64*, !dbg !1252
  store i64 %call16, i64* %40, align 1, !dbg !1252
  %color18 = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !1256
  %call19 = call i64 @_ZN10BitBoard64anERKS_(%class.BitBoard64* %coerce17, %class.BitBoard64* dereferenceable(8) %color18), !dbg !1252
  %41 = bitcast %class.BitBoard64* %ref.tmp12 to i64*, !dbg !1252
  store i64 %call19, i64* %41, align 1, !dbg !1252
  %call20 = call i64 @_ZN10BitBoard64aSERKS_(%class.BitBoard64* %moves, %class.BitBoard64* dereferenceable(8) %ref.tmp12), !dbg !1257
  %42 = bitcast %class.BitBoard64* %coerce21 to i64*, !dbg !1257
  store i64 %call20, i64* %42, align 1, !dbg !1257
  %call22 = call zeroext i1 @_ZN10BitBoard64cvbEv(%class.BitBoard64* %coerce21), !dbg !1258
  %43 = select i1 %call22, i64 14, i64 15, !dbg !1259
  %44 = getelementptr inbounds [39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 %43, !dbg !1259
  %45 = load i64* %44, !dbg !1259
  %46 = add i64 %45, 1, !dbg !1259
  store i64 %46, i64* %44, !dbg !1259
  br i1 %call22, label %if.then23, label %if.end32, !dbg !1259

if.then23:                                        ; preds = %if.end11
  %47 = load i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 16), !dbg !1260
  %48 = add i64 %47, 1, !dbg !1260
  store i64 %48, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 16), !dbg !1260
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1263, metadata !605), !dbg !1260
  store i32 0, i32* %j, align 4, !dbg !1260
  br label %for.cond24, !dbg !1264

for.cond24:                                       ; preds = %for.inc, %if.then23
  %49 = load i32* %j, align 4, !dbg !1265
  %cmp25 = icmp slt i32 %49, 61, !dbg !1265
  %50 = select i1 %cmp25, i64 17, i64 18, !dbg !1269
  %51 = getelementptr inbounds [39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 %50, !dbg !1269
  %52 = load i64* %51, !dbg !1269
  %53 = add i64 %52, 1, !dbg !1269
  store i64 %53, i64* %51, !dbg !1269
  br i1 %cmp25, label %for.body26, label %for.end, !dbg !1269

for.body26:                                       ; preds = %for.cond24
  %54 = load i32* %j, align 4, !dbg !1270
  %call27 = call i32 @_ZN10BitBoard646getBitEi(%class.BitBoard64* %moves, i32 %54), !dbg !1273
  %tobool28 = icmp ne i32 %call27, 0, !dbg !1273
  %55 = select i1 %tobool28, i64 19, i64 20, !dbg !1274
  %56 = getelementptr inbounds [39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 %55, !dbg !1274
  %57 = load i64* %56, !dbg !1274
  %58 = add i64 %57, 1, !dbg !1274
  store i64 %58, i64* %56, !dbg !1274
  br i1 %tobool28, label %if.then29, label %if.end31, !dbg !1274

if.then29:                                        ; preds = %for.body26
  %59 = load i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 21), !dbg !1275
  %60 = add i64 %59, 1, !dbg !1275
  store i64 %60, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 21), !dbg !1275
  call void @llvm.dbg.declare(metadata %class.HexxagonMove* %move30, metadata !1277, metadata !605), !dbg !1275
  %61 = load i32* %j, align 4, !dbg !1278
  %62 = load i32* %i, align 4, !dbg !1279
  call void @_ZN12HexxagonMoveC2Eii(%class.HexxagonMove* %move30, i32 %61, i32 %62), !dbg !1275
  %63 = load %class.HexxagonMoveList** %list, align 8, !dbg !1280
  call void @_ZN16HexxagonMoveList7addMoveER12HexxagonMove(%class.HexxagonMoveList* %63, %class.HexxagonMove* dereferenceable(8) %move30), !dbg !1280
  br label %if.end31, !dbg !1281

if.end31:                                         ; preds = %if.then29, %for.body26
  %64 = load i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 22), !dbg !1282
  %65 = add i64 %64, 1, !dbg !1282
  store i64 %65, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 22), !dbg !1282
  br label %for.inc, !dbg !1282

for.inc:                                          ; preds = %if.end31
  %66 = load i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 23), !dbg !1283
  %67 = add i64 %66, 1, !dbg !1283
  store i64 %67, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 23), !dbg !1283
  %68 = load i32* %j, align 4, !dbg !1283
  %inc = add nsw i32 %68, 1, !dbg !1283
  store i32 %inc, i32* %j, align 4, !dbg !1283
  br label %for.cond24, !dbg !1284

for.end:                                          ; preds = %for.cond24
  %69 = load i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 24), !dbg !1285
  %70 = add i64 %69, 1, !dbg !1285
  store i64 %70, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 24), !dbg !1285
  br label %if.end32, !dbg !1285

if.end32:                                         ; preds = %for.end, %if.end11
  %71 = load i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 25), !dbg !1286
  %72 = add i64 %71, 1, !dbg !1286
  store i64 %72, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 25), !dbg !1286
  br label %if.end33, !dbg !1286

if.end33:                                         ; preds = %if.end32, %for.body
  %73 = load i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 26), !dbg !1287
  %74 = add i64 %73, 1, !dbg !1287
  store i64 %74, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 26), !dbg !1287
  br label %for.inc34, !dbg !1287

for.inc34:                                        ; preds = %if.end33
  %75 = load i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 27), !dbg !1288
  %76 = add i64 %75, 1, !dbg !1288
  store i64 %76, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 27), !dbg !1288
  %77 = load i32* %i, align 4, !dbg !1288
  %inc35 = add nsw i32 %77, 1, !dbg !1288
  store i32 %inc35, i32* %i, align 4, !dbg !1288
  br label %for.cond, !dbg !1289

for.end36:                                        ; preds = %for.cond
  %78 = load %class.HexxagonMoveList** %list, align 8, !dbg !1290
  %call37 = call i32 @_ZN16HexxagonMoveList10getNrMovesEv(%class.HexxagonMoveList* %78), !dbg !1290
  %tobool38 = icmp ne i32 %call37, 0, !dbg !1290
  %79 = select i1 %tobool38, i64 28, i64 29, !dbg !1292
  %80 = getelementptr inbounds [39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 %79, !dbg !1292
  %81 = load i64* %80, !dbg !1292
  %82 = add i64 %81, 1, !dbg !1292
  store i64 %82, i64* %80, !dbg !1292
  br i1 %tobool38, label %if.then39, label %if.end40, !dbg !1292

if.then39:                                        ; preds = %for.end36
  %83 = load i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 30), !dbg !1293
  %84 = add i64 %83, 1, !dbg !1293
  store i64 %84, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 30), !dbg !1293
  %85 = load %class.HexxagonMoveList** %list, align 8, !dbg !1293
  store %class.HexxagonMoveList* %85, %class.HexxagonMoveList** %retval, !dbg !1294
  br label %return, !dbg !1294

if.end40:                                         ; preds = %for.end36
  %86 = load %class.HexxagonMoveList** %list, align 8, !dbg !1295
  %isnull = icmp eq %class.HexxagonMoveList* %86, null, !dbg !1296
  %87 = select i1 %isnull, i64 31, i64 32, !dbg !1296
  %88 = getelementptr inbounds [39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 %87, !dbg !1296
  %89 = load i64* %88, !dbg !1296
  %90 = add i64 %89, 1, !dbg !1296
  store i64 %90, i64* %88, !dbg !1296
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !1296

delete.notnull:                                   ; preds = %if.end40
  store i32 1, i32* @__llvm_gcov_global_state_pred34, !dbg !1297
  invoke void @_ZN16HexxagonMoveListD2Ev(%class.HexxagonMoveList* %86)
          to label %invoke.cont42 unwind label %lpad41, !dbg !1297

invoke.cont42:                                    ; preds = %delete.notnull
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred34, i64** getelementptr inbounds ([8 x i64*]* @__llvm_gcda_edge_table33, i64 0, i64 4)), !dbg !1298
  %91 = load i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 35), !dbg !1298
  %92 = add i64 %91, 1, !dbg !1298
  store i64 %92, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 35), !dbg !1298
  %93 = bitcast %class.HexxagonMoveList* %86 to i8*, !dbg !1298
  call void @_ZdlPv(i8* %93) #10, !dbg !1298
  br label %delete.end, !dbg !1298

delete.end:                                       ; preds = %invoke.cont42, %if.end40
  %94 = load i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 36), !dbg !1300
  %95 = add i64 %94, 1, !dbg !1300
  store i64 %95, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 36), !dbg !1300
  store %class.HexxagonMoveList* null, %class.HexxagonMoveList** %retval, !dbg !1300
  br label %return, !dbg !1300

lpad41:                                           ; preds = %delete.notnull
  %96 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !1222
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred34, i64** getelementptr inbounds ([8 x i64*]* @__llvm_gcda_edge_table33, i64 0, i64 6)), !dbg !1222
  %97 = load i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 37), !dbg !1222
  %98 = add i64 %97, 1, !dbg !1222
  store i64 %98, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 37), !dbg !1222
  %99 = extractvalue { i8*, i32 } %96, 0, !dbg !1222
  store i8* %99, i8** %exn.slot, !dbg !1222
  %100 = extractvalue { i8*, i32 } %96, 1, !dbg !1222
  store i32 %100, i32* %ehselector.slot, !dbg !1222
  %101 = bitcast %class.HexxagonMoveList* %86 to i8*, !dbg !1222
  call void @_ZdlPv(i8* %101) #10, !dbg !1222
  br label %eh.resume, !dbg !1222

return:                                           ; preds = %delete.end, %if.then39
  %102 = load i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 38), !dbg !1222
  %103 = add i64 %102, 1, !dbg !1222
  store i64 %103, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 38), !dbg !1222
  %104 = load %class.HexxagonMoveList** %retval, !dbg !1222
  ret %class.HexxagonMoveList* %104, !dbg !1222

eh.resume:                                        ; preds = %lpad41, %lpad
  %exn = load i8** %exn.slot, !dbg !1301
  %sel = load i32* %ehselector.slot, !dbg !1301
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !1301
  %lpad.val43 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !1301
  resume { i8*, i32 } %lpad.val43, !dbg !1301
}

; Function Attrs: nobuiltin
declare noalias i8* @_Znwm(i64) #5

; Function Attrs: uwtable
define linkonce_odr void @_ZN16HexxagonMoveListC2Ev(%class.HexxagonMoveList* %this) unnamed_addr #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr47, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr47, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonMoveList*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr47, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr47, i64 0, i64 1)
  store %class.HexxagonMoveList* %this, %class.HexxagonMoveList** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMoveList** %this.addr, metadata !1303, metadata !605), !dbg !1304
  %this1 = load %class.HexxagonMoveList** %this.addr
  %call = call noalias i8* @_Znam(i64 128) #9, !dbg !1305
  %5 = bitcast i8* %call to %class.HexxagonMove*, !dbg !1305
  %arrayctor.end = getelementptr inbounds %class.HexxagonMove* %5, i64 16, !dbg !1305
  br label %arrayctor.loop, !dbg !1305

arrayctor.loop:                                   ; preds = %invoke.cont, %2
  %arrayctor.cur = phi %class.HexxagonMove* [ %5, %2 ], [ %arrayctor.next, %invoke.cont ], !dbg !1305
  store i32 0, i32* @__llvm_gcov_global_state_pred49, !dbg !1307
  invoke void @_ZN12HexxagonMoveC2Ev(%class.HexxagonMove* %arrayctor.cur)
          to label %invoke.cont unwind label %lpad, !dbg !1307

invoke.cont:                                      ; preds = %arrayctor.loop
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred49, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table48, i64 0, i64 0)), !dbg !1310
  %arrayctor.next = getelementptr inbounds %class.HexxagonMove* %arrayctor.cur, i64 1, !dbg !1310
  %arrayctor.done = icmp eq %class.HexxagonMove* %arrayctor.next, %arrayctor.end, !dbg !1310
  %6 = select i1 %arrayctor.done, i64 4, i64 5, !dbg !1310
  %7 = getelementptr inbounds [8 x i64]* @__llvm_gcov_ctr47, i64 0, i64 %6, !dbg !1310
  %8 = load i64* %7, !dbg !1310
  %9 = add i64 %8, 1, !dbg !1310
  store i64 %9, i64* %7, !dbg !1310
  br i1 %arrayctor.done, label %arrayctor.cont, label %arrayctor.loop, !dbg !1310

arrayctor.cont:                                   ; preds = %invoke.cont
  %10 = load i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr47, i64 0, i64 6), !dbg !1312
  %11 = add i64 %10, 1, !dbg !1312
  store i64 %11, i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr47, i64 0, i64 6), !dbg !1312
  %moves = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 1, !dbg !1312
  store %class.HexxagonMove* %5, %class.HexxagonMove** %moves, align 8, !dbg !1312
  %nr_moves = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 0, !dbg !1314
  store i32 0, i32* %nr_moves, align 4, !dbg !1314
  ret void, !dbg !1315

lpad:                                             ; preds = %arrayctor.loop
  %12 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !1316
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred49, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table48, i64 0, i64 1)), !dbg !1316
  %13 = load i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr47, i64 0, i64 7), !dbg !1316
  %14 = add i64 %13, 1, !dbg !1316
  store i64 %14, i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr47, i64 0, i64 7), !dbg !1316
  %15 = extractvalue { i8*, i32 } %12, 0, !dbg !1316
  store i8* %15, i8** %exn.slot, !dbg !1316
  %16 = extractvalue { i8*, i32 } %12, 1, !dbg !1316
  store i32 %16, i32* %ehselector.slot, !dbg !1316
  call void @_ZdaPv(i8* %call) #10, !dbg !1316
  br label %eh.resume, !dbg !1316

eh.resume:                                        ; preds = %lpad
  %exn = load i8** %exn.slot, !dbg !1318
  %sel = load i32* %ehselector.slot, !dbg !1318
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !1318
  %lpad.val2 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !1318
  resume { i8*, i32 } %lpad.val2, !dbg !1318
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #6

declare i32 @printf(i8*, ...) #0

; Function Attrs: noreturn nounwind
declare void @exit(i32) #7

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN12HexxagonMoveC2Ei(%class.HexxagonMove* %this, i32 %t) unnamed_addr #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr46, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr46, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonMove*, align 8
  %t.addr = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr46, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr46, i64 0, i64 1)
  store %class.HexxagonMove* %this, %class.HexxagonMove** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMove** %this.addr, metadata !1320, metadata !605), !dbg !1321
  store i32 %t, i32* %t.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %t.addr, metadata !1322, metadata !605), !dbg !1324
  %this1 = load %class.HexxagonMove** %this.addr
  %5 = load i32* %t.addr, align 4, !dbg !1325
  %conv = trunc i32 %5 to i8, !dbg !1325
  %from = getelementptr inbounds %class.HexxagonMove* %this1, i32 0, i32 0, !dbg !1327
  store i8 %conv, i8* %from, align 1, !dbg !1327
  %6 = load i32* %t.addr, align 4, !dbg !1328
  %conv2 = trunc i32 %6 to i8, !dbg !1328
  %to = getelementptr inbounds %class.HexxagonMove* %this1, i32 0, i32 1, !dbg !1329
  store i8 %conv2, i8* %to, align 1, !dbg !1329
  ret void, !dbg !1330
}

declare void @_ZN16HexxagonMoveList7addMoveER12HexxagonMove(%class.HexxagonMoveList*, %class.HexxagonMove* dereferenceable(8)) #0

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN12HexxagonMoveC2Eii(%class.HexxagonMove* %this, i32 %f, i32 %t) unnamed_addr #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr45, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr45, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonMove*, align 8
  %f.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr45, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr45, i64 0, i64 1)
  store %class.HexxagonMove* %this, %class.HexxagonMove** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMove** %this.addr, metadata !1331, metadata !605), !dbg !1332
  store i32 %f, i32* %f.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %f.addr, metadata !1333, metadata !605), !dbg !1334
  store i32 %t, i32* %t.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %t.addr, metadata !1335, metadata !605), !dbg !1336
  %this1 = load %class.HexxagonMove** %this.addr
  %5 = load i32* %f.addr, align 4, !dbg !1337
  %conv = trunc i32 %5 to i8, !dbg !1337
  %from = getelementptr inbounds %class.HexxagonMove* %this1, i32 0, i32 0, !dbg !1339
  store i8 %conv, i8* %from, align 1, !dbg !1339
  %6 = load i32* %t.addr, align 4, !dbg !1340
  %conv2 = trunc i32 %6 to i8, !dbg !1340
  %to = getelementptr inbounds %class.HexxagonMove* %this1, i32 0, i32 1, !dbg !1341
  store i8 %conv2, i8* %to, align 1, !dbg !1341
  ret void, !dbg !1342
}

declare i32 @_ZN16HexxagonMoveList10getNrMovesEv(%class.HexxagonMoveList*) #0

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN16HexxagonMoveListD2Ev(%class.HexxagonMoveList* %this) unnamed_addr #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr44, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr44, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonMoveList*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonMoveList* %this, %class.HexxagonMoveList** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMoveList** %this.addr, metadata !1343, metadata !605), !dbg !1344
  %this1 = load %class.HexxagonMoveList** %this.addr
  %moves = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 1, !dbg !1345
  %3 = load %class.HexxagonMove** %moves, align 8, !dbg !1345
  %isnull = icmp eq %class.HexxagonMove* %3, null, !dbg !1347
  %4 = select i1 %isnull, i64 1, i64 2, !dbg !1347
  %5 = getelementptr inbounds [5 x i64]* @__llvm_gcov_ctr44, i64 0, i64 %4, !dbg !1347
  %6 = load i64* %5, !dbg !1347
  %7 = add i64 %6, 1, !dbg !1347
  store i64 %7, i64* %5, !dbg !1347
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !1347

delete.notnull:                                   ; preds = %2
  %8 = load i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr44, i64 0, i64 3), !dbg !1348
  %9 = add i64 %8, 1, !dbg !1348
  store i64 %9, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr44, i64 0, i64 3), !dbg !1348
  %10 = bitcast %class.HexxagonMove* %3 to i8*, !dbg !1348
  call void @_ZdlPv(i8* %10) #10, !dbg !1348
  br label %delete.end, !dbg !1348

delete.end:                                       ; preds = %delete.notnull, %2
  %11 = load i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr44, i64 0, i64 4), !dbg !1350
  %12 = add i64 %11, 1, !dbg !1350
  store i64 %12, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr44, i64 0, i64 4), !dbg !1350
  ret void, !dbg !1350
}

; Function Attrs: uwtable
define i32 @_ZN13HexxagonBoard9endOfGameEv(%class.HexxagonBoard* %this) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr35, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr35, i64 0, i64 0)
  %retval = alloca i32, align 4
  %this.addr = alloca %class.HexxagonBoard*, align 8
  %movelist = alloca %class.HexxagonMoveList*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonBoard* %this, %class.HexxagonBoard** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %this.addr, metadata !1353, metadata !605), !dbg !1354
  %this1 = load %class.HexxagonBoard** %this.addr
  call void @llvm.dbg.declare(metadata %class.HexxagonMoveList** %movelist, metadata !1355, metadata !605), !dbg !1356
  %call = call %class.HexxagonMoveList* @_ZN13HexxagonBoard16generateMoveListEv(%class.HexxagonBoard* %this1), !dbg !1357
  store %class.HexxagonMoveList* %call, %class.HexxagonMoveList** %movelist, align 8, !dbg !1358
  %3 = load %class.HexxagonMoveList** %movelist, align 8, !dbg !1359
  %tobool = icmp ne %class.HexxagonMoveList* %3, null, !dbg !1359
  %4 = select i1 %tobool, i64 1, i64 2, !dbg !1361
  %5 = getelementptr inbounds [12 x i64]* @__llvm_gcov_ctr35, i64 0, i64 %4, !dbg !1361
  %6 = load i64* %5, !dbg !1361
  %7 = add i64 %6, 1, !dbg !1361
  store i64 %7, i64* %5, !dbg !1361
  br i1 %tobool, label %if.end, label %if.then, !dbg !1361

if.then:                                          ; preds = %2
  %8 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr35, i64 0, i64 3), !dbg !1362
  %9 = add i64 %8, 1, !dbg !1362
  store i64 %9, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr35, i64 0, i64 3), !dbg !1362
  store i32 1, i32* %retval, !dbg !1362
  br label %return, !dbg !1362

if.end:                                           ; preds = %2
  %10 = load %class.HexxagonMoveList** %movelist, align 8, !dbg !1363
  %isnull = icmp eq %class.HexxagonMoveList* %10, null, !dbg !1364
  %11 = select i1 %isnull, i64 4, i64 5, !dbg !1364
  %12 = getelementptr inbounds [12 x i64]* @__llvm_gcov_ctr35, i64 0, i64 %11, !dbg !1364
  %13 = load i64* %12, !dbg !1364
  %14 = add i64 %13, 1, !dbg !1364
  store i64 %14, i64* %12, !dbg !1364
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !1364

delete.notnull:                                   ; preds = %if.end
  store i32 0, i32* @__llvm_gcov_global_state_pred37, !dbg !1365
  invoke void @_ZN16HexxagonMoveListD2Ev(%class.HexxagonMoveList* %10)
          to label %invoke.cont unwind label %lpad, !dbg !1365

invoke.cont:                                      ; preds = %delete.notnull
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred37, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table36, i64 0, i64 0)), !dbg !1367
  %15 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr35, i64 0, i64 8), !dbg !1367
  %16 = add i64 %15, 1, !dbg !1367
  store i64 %16, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr35, i64 0, i64 8), !dbg !1367
  %17 = bitcast %class.HexxagonMoveList* %10 to i8*, !dbg !1367
  call void @_ZdlPv(i8* %17) #10, !dbg !1367
  br label %delete.end, !dbg !1367

delete.end:                                       ; preds = %invoke.cont, %if.end
  %18 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr35, i64 0, i64 9), !dbg !1369
  %19 = add i64 %18, 1, !dbg !1369
  store i64 %19, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr35, i64 0, i64 9), !dbg !1369
  store i32 0, i32* %retval, !dbg !1369
  br label %return, !dbg !1369

lpad:                                             ; preds = %delete.notnull
  %20 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !1370
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred37, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table36, i64 0, i64 1)), !dbg !1370
  %21 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr35, i64 0, i64 10), !dbg !1370
  %22 = add i64 %21, 1, !dbg !1370
  store i64 %22, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr35, i64 0, i64 10), !dbg !1370
  %23 = extractvalue { i8*, i32 } %20, 0, !dbg !1370
  store i8* %23, i8** %exn.slot, !dbg !1370
  %24 = extractvalue { i8*, i32 } %20, 1, !dbg !1370
  store i32 %24, i32* %ehselector.slot, !dbg !1370
  %25 = bitcast %class.HexxagonMoveList* %10 to i8*, !dbg !1370
  call void @_ZdlPv(i8* %25) #10, !dbg !1370
  br label %eh.resume, !dbg !1370

return:                                           ; preds = %delete.end, %if.then
  %26 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr35, i64 0, i64 11), !dbg !1370
  %27 = add i64 %26, 1, !dbg !1370
  store i64 %27, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr35, i64 0, i64 11), !dbg !1370
  %28 = load i32* %retval, !dbg !1370
  ret i32 %28, !dbg !1370

eh.resume:                                        ; preds = %lpad
  %exn = load i8** %exn.slot, !dbg !1371
  %sel = load i32* %ehselector.slot, !dbg !1371
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !1371
  %lpad.val2 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !1371
  resume { i8*, i32 } %lpad.val2, !dbg !1371
}

; Function Attrs: uwtable
define i32 @_ZN13HexxagonBoard12computerMoveEiPFvvEi(%class.HexxagonBoard* %this, i32 %depth, void ()* %callback, i32 %maxtime) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr38, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr38, i64 0, i64 0)
  %retval = alloca i32, align 4
  %this.addr = alloca %class.HexxagonBoard*, align 8
  %depth.addr = alloca i32, align 4
  %callback.addr = alloca void ()*, align 8
  %maxtime.addr = alloca i32, align 4
  %movelist = alloca %class.HexxagonMoveList*, align 8
  %agg.tmp = alloca %class.HexxagonBoard, align 4
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonBoard* %this, %class.HexxagonBoard** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %this.addr, metadata !1372, metadata !605), !dbg !1373
  store i32 %depth, i32* %depth.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %depth.addr, metadata !1374, metadata !605), !dbg !1375
  store void ()* %callback, void ()** %callback.addr, align 8
  call void @llvm.dbg.declare(metadata void ()** %callback.addr, metadata !1376, metadata !605), !dbg !1377
  store i32 %maxtime, i32* %maxtime.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %maxtime.addr, metadata !1378, metadata !605), !dbg !1379
  %this1 = load %class.HexxagonBoard** %this.addr
  call void @llvm.dbg.declare(metadata %class.HexxagonMoveList** %movelist, metadata !1380, metadata !605), !dbg !1381
  %call = call %class.HexxagonMoveList* @_ZN13HexxagonBoard16generateMoveListEv(%class.HexxagonBoard* %this1), !dbg !1382
  store %class.HexxagonMoveList* %call, %class.HexxagonMoveList** %movelist, align 8, !dbg !1384
  %tobool = icmp ne %class.HexxagonMoveList* %call, null, !dbg !1385
  %3 = select i1 %tobool, i64 1, i64 2, !dbg !1386
  %4 = getelementptr inbounds [12 x i64]* @__llvm_gcov_ctr38, i64 0, i64 %3, !dbg !1386
  %5 = load i64* %4, !dbg !1386
  %6 = add i64 %5, 1, !dbg !1386
  store i64 %6, i64* %4, !dbg !1386
  br i1 %tobool, label %if.end, label %if.then, !dbg !1386

if.then:                                          ; preds = %2
  %7 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr38, i64 0, i64 3), !dbg !1387
  %8 = add i64 %7, 1, !dbg !1387
  store i64 %8, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr38, i64 0, i64 3), !dbg !1387
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0)), !dbg !1387
  store i32 -1, i32* %retval, !dbg !1389
  br label %return, !dbg !1389

if.end:                                           ; preds = %2
  %9 = load %class.HexxagonMoveList** %movelist, align 8, !dbg !1390
  call void @_ZN13HexxagonBoardC1ERKS_(%class.HexxagonBoard* %agg.tmp, %class.HexxagonBoard* dereferenceable(16) %this1), !dbg !1390
  %10 = load i32* %depth.addr, align 4, !dbg !1391
  %11 = load void ()** %callback.addr, align 8, !dbg !1392
  %12 = load i32* %maxtime.addr, align 4, !dbg !1393
  call void @_ZN16HexxagonMoveList13scoreAllMovesE13HexxagonBoardiPFvvEi(%class.HexxagonMoveList* %9, %class.HexxagonBoard* %agg.tmp, i32 %10, void ()* %11, i32 %12), !dbg !1390
  %13 = load %class.HexxagonMoveList** %movelist, align 8, !dbg !1394
  %call3 = call %class.HexxagonMove* @_ZN16HexxagonMoveList11getBestMoveEv(%class.HexxagonMoveList* %13), !dbg !1394
  %call4 = call i32 @_ZN13HexxagonBoard9applyMoveER12HexxagonMove(%class.HexxagonBoard* %this1, %class.HexxagonMove* dereferenceable(8) %call3), !dbg !1395
  %14 = load %class.HexxagonMoveList** %movelist, align 8, !dbg !1396
  %isnull = icmp eq %class.HexxagonMoveList* %14, null, !dbg !1397
  %15 = select i1 %isnull, i64 4, i64 5, !dbg !1397
  %16 = getelementptr inbounds [12 x i64]* @__llvm_gcov_ctr38, i64 0, i64 %15, !dbg !1397
  %17 = load i64* %16, !dbg !1397
  %18 = add i64 %17, 1, !dbg !1397
  store i64 %18, i64* %16, !dbg !1397
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !1397

delete.notnull:                                   ; preds = %if.end
  store i32 0, i32* @__llvm_gcov_global_state_pred40, !dbg !1398
  invoke void @_ZN16HexxagonMoveListD2Ev(%class.HexxagonMoveList* %14)
          to label %invoke.cont unwind label %lpad, !dbg !1398

invoke.cont:                                      ; preds = %delete.notnull
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred40, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table39, i64 0, i64 0)), !dbg !1400
  %19 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr38, i64 0, i64 8), !dbg !1400
  %20 = add i64 %19, 1, !dbg !1400
  store i64 %20, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr38, i64 0, i64 8), !dbg !1400
  %21 = bitcast %class.HexxagonMoveList* %14 to i8*, !dbg !1400
  call void @_ZdlPv(i8* %21) #10, !dbg !1400
  br label %delete.end, !dbg !1400

delete.end:                                       ; preds = %invoke.cont, %if.end
  %22 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr38, i64 0, i64 9), !dbg !1402
  %23 = add i64 %22, 1, !dbg !1402
  store i64 %23, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr38, i64 0, i64 9), !dbg !1402
  store i32 0, i32* %retval, !dbg !1402
  br label %return, !dbg !1402

lpad:                                             ; preds = %delete.notnull
  %24 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !1403
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred40, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table39, i64 0, i64 1)), !dbg !1403
  %25 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr38, i64 0, i64 10), !dbg !1403
  %26 = add i64 %25, 1, !dbg !1403
  store i64 %26, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr38, i64 0, i64 10), !dbg !1403
  %27 = extractvalue { i8*, i32 } %24, 0, !dbg !1403
  store i8* %27, i8** %exn.slot, !dbg !1403
  %28 = extractvalue { i8*, i32 } %24, 1, !dbg !1403
  store i32 %28, i32* %ehselector.slot, !dbg !1403
  %29 = bitcast %class.HexxagonMoveList* %14 to i8*, !dbg !1403
  call void @_ZdlPv(i8* %29) #10, !dbg !1403
  br label %eh.resume, !dbg !1403

return:                                           ; preds = %delete.end, %if.then
  %30 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr38, i64 0, i64 11), !dbg !1403
  %31 = add i64 %30, 1, !dbg !1403
  store i64 %31, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr38, i64 0, i64 11), !dbg !1403
  %32 = load i32* %retval, !dbg !1403
  ret i32 %32, !dbg !1403

eh.resume:                                        ; preds = %lpad
  %exn = load i8** %exn.slot, !dbg !1404
  %sel = load i32* %ehselector.slot, !dbg !1404
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !1404
  %lpad.val5 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !1404
  resume { i8*, i32 } %lpad.val5, !dbg !1404
}

declare void @_ZN16HexxagonMoveList13scoreAllMovesE13HexxagonBoardiPFvvEi(%class.HexxagonMoveList*, %class.HexxagonBoard*, i32, void ()*, i32) #0

declare %class.HexxagonMove* @_ZN16HexxagonMoveList11getBestMoveEv(%class.HexxagonMoveList*) #0

; Function Attrs: uwtable
define i32 @_ZN13HexxagonBoard12readFromFileEP8_IO_FILE(%class.HexxagonBoard* %this, %struct._IO_FILE* %file) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr41, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr41, i64 0, i64 0)
  %retval = alloca i32, align 4
  %this.addr = alloca %class.HexxagonBoard*, align 8
  %file.addr = alloca %struct._IO_FILE*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonBoard* %this, %class.HexxagonBoard** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %this.addr, metadata !1405, metadata !605), !dbg !1406
  store %struct._IO_FILE* %file, %struct._IO_FILE** %file.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %file.addr, metadata !1407, metadata !605), !dbg !1408
  %this1 = load %class.HexxagonBoard** %this.addr
  %color = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !1409
  %3 = load %struct._IO_FILE** %file.addr, align 8, !dbg !1411
  %call = call i32 @_ZN10BitBoard6412readFromFileEP8_IO_FILE(%class.BitBoard64* %color, %struct._IO_FILE* %3), !dbg !1409
  %tobool = icmp ne i32 %call, 0, !dbg !1409
  %4 = select i1 %tobool, i64 1, i64 2, !dbg !1412
  %5 = getelementptr inbounds [8 x i64]* @__llvm_gcov_ctr41, i64 0, i64 %4, !dbg !1412
  %6 = load i64* %5, !dbg !1412
  %7 = add i64 %6, 1, !dbg !1412
  store i64 %7, i64* %5, !dbg !1412
  br i1 %tobool, label %if.then, label %lor.lhs.false, !dbg !1412

lor.lhs.false:                                    ; preds = %2
  %board = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1413
  %8 = load %struct._IO_FILE** %file.addr, align 8, !dbg !1415
  %call2 = call i32 @_ZN10BitBoard6412readFromFileEP8_IO_FILE(%class.BitBoard64* %board, %struct._IO_FILE* %8), !dbg !1416
  %tobool3 = icmp ne i32 %call2, 0, !dbg !1416
  %9 = select i1 %tobool3, i64 3, i64 4, !dbg !1412
  %10 = getelementptr inbounds [8 x i64]* @__llvm_gcov_ctr41, i64 0, i64 %9, !dbg !1412
  %11 = load i64* %10, !dbg !1412
  %12 = add i64 %11, 1, !dbg !1412
  store i64 %12, i64* %10, !dbg !1412
  br i1 %tobool3, label %if.then, label %if.else, !dbg !1412

if.then:                                          ; preds = %lor.lhs.false, %2
  %13 = load i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr41, i64 0, i64 5), !dbg !1417
  %14 = add i64 %13, 1, !dbg !1417
  store i64 %14, i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr41, i64 0, i64 5), !dbg !1417
  store i32 -1, i32* %retval, !dbg !1417
  br label %return, !dbg !1417

if.else:                                          ; preds = %lor.lhs.false
  %15 = load i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr41, i64 0, i64 6), !dbg !1418
  %16 = add i64 %15, 1, !dbg !1418
  store i64 %16, i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr41, i64 0, i64 6), !dbg !1418
  store i32 0, i32* %retval, !dbg !1418
  br label %return, !dbg !1418

return:                                           ; preds = %if.else, %if.then
  %17 = load i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr41, i64 0, i64 7), !dbg !1419
  %18 = add i64 %17, 1, !dbg !1419
  store i64 %18, i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr41, i64 0, i64 7), !dbg !1419
  %19 = load i32* %retval, !dbg !1419
  ret i32 %19, !dbg !1419
}

declare i32 @_ZN10BitBoard6412readFromFileEP8_IO_FILE(%class.BitBoard64*, %struct._IO_FILE*) #0

; Function Attrs: uwtable
define i32 @_ZN13HexxagonBoard11writeToFileEP8_IO_FILE(%class.HexxagonBoard* %this, %struct._IO_FILE* %file) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr42, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr42, i64 0, i64 0)
  %retval = alloca i32, align 4
  %this.addr = alloca %class.HexxagonBoard*, align 8
  %file.addr = alloca %struct._IO_FILE*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonBoard* %this, %class.HexxagonBoard** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %this.addr, metadata !1420, metadata !605), !dbg !1421
  store %struct._IO_FILE* %file, %struct._IO_FILE** %file.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %file.addr, metadata !1422, metadata !605), !dbg !1423
  %this1 = load %class.HexxagonBoard** %this.addr
  %color = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !1424
  %3 = load %struct._IO_FILE** %file.addr, align 8, !dbg !1426
  %call = call i32 @_ZN10BitBoard6411writeToFileEP8_IO_FILE(%class.BitBoard64* %color, %struct._IO_FILE* %3), !dbg !1424
  %tobool = icmp ne i32 %call, 0, !dbg !1424
  %4 = select i1 %tobool, i64 1, i64 2, !dbg !1427
  %5 = getelementptr inbounds [8 x i64]* @__llvm_gcov_ctr42, i64 0, i64 %4, !dbg !1427
  %6 = load i64* %5, !dbg !1427
  %7 = add i64 %6, 1, !dbg !1427
  store i64 %7, i64* %5, !dbg !1427
  br i1 %tobool, label %if.then, label %lor.lhs.false, !dbg !1427

lor.lhs.false:                                    ; preds = %2
  %board = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1428
  %8 = load %struct._IO_FILE** %file.addr, align 8, !dbg !1430
  %call2 = call i32 @_ZN10BitBoard6411writeToFileEP8_IO_FILE(%class.BitBoard64* %board, %struct._IO_FILE* %8), !dbg !1431
  %tobool3 = icmp ne i32 %call2, 0, !dbg !1431
  %9 = select i1 %tobool3, i64 3, i64 4, !dbg !1427
  %10 = getelementptr inbounds [8 x i64]* @__llvm_gcov_ctr42, i64 0, i64 %9, !dbg !1427
  %11 = load i64* %10, !dbg !1427
  %12 = add i64 %11, 1, !dbg !1427
  store i64 %12, i64* %10, !dbg !1427
  br i1 %tobool3, label %if.then, label %if.else, !dbg !1427

if.then:                                          ; preds = %lor.lhs.false, %2
  %13 = load i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr42, i64 0, i64 5), !dbg !1432
  %14 = add i64 %13, 1, !dbg !1432
  store i64 %14, i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr42, i64 0, i64 5), !dbg !1432
  store i32 -1, i32* %retval, !dbg !1432
  br label %return, !dbg !1432

if.else:                                          ; preds = %lor.lhs.false
  %15 = load i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr42, i64 0, i64 6), !dbg !1433
  %16 = add i64 %15, 1, !dbg !1433
  store i64 %16, i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr42, i64 0, i64 6), !dbg !1433
  store i32 0, i32* %retval, !dbg !1433
  br label %return, !dbg !1433

return:                                           ; preds = %if.else, %if.then
  %17 = load i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr42, i64 0, i64 7), !dbg !1434
  %18 = add i64 %17, 1, !dbg !1434
  store i64 %18, i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr42, i64 0, i64 7), !dbg !1434
  %19 = load i32* %retval, !dbg !1434
  ret i32 %19, !dbg !1434
}

declare i32 @_ZN10BitBoard6411writeToFileEP8_IO_FILE(%class.BitBoard64*, %struct._IO_FILE*) #0

; Function Attrs: uwtable
define void @_ZN13HexxagonBoard16displayBoardTextEi(%class.HexxagonBoard* %this, i32 %turn) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonBoard*, align 8
  %turn.addr = alloca i32, align 4
  %c = alloca %class.BitBoard64, align 4
  %ref.tmp = alloca %class.BitBoard64, align 4
  %coerce = alloca %class.BitBoard64, align 4
  %y = alloca i32, align 4
  %off = alloca i32, align 4
  %x = alloca i32, align 4
  %no = alloca i32, align 4
  %empty = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonBoard* %this, %class.HexxagonBoard** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %this.addr, metadata !1435, metadata !605), !dbg !1436
  store i32 %turn, i32* %turn.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %turn.addr, metadata !1437, metadata !605), !dbg !1438
  %this1 = load %class.HexxagonBoard** %this.addr
  call void @llvm.dbg.declare(metadata %class.BitBoard64* %c, metadata !1439, metadata !605), !dbg !1440
  %color = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !1440
  %3 = bitcast %class.BitBoard64* %c to i8*, !dbg !1440
  %4 = bitcast %class.BitBoard64* %color to i8*, !dbg !1440
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 8, i32 4, i1 false), !dbg !1440
  %5 = load i32* %turn.addr, align 4, !dbg !1441
  %tobool = icmp ne i32 %5, 0, !dbg !1441
  %6 = select i1 %tobool, i64 1, i64 2, !dbg !1443
  %7 = getelementptr inbounds [55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 %6, !dbg !1443
  %8 = load i64* %7, !dbg !1443
  %9 = add i64 %8, 1, !dbg !1443
  store i64 %9, i64* %7, !dbg !1443
  br i1 %tobool, label %if.end, label %if.then, !dbg !1443

if.then:                                          ; preds = %2
  %10 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 3), !dbg !1444
  %11 = add i64 %10, 1, !dbg !1444
  store i64 %11, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 3), !dbg !1444
  %call = call i64 @_ZN10BitBoard64coEv(%class.BitBoard64* %c), !dbg !1444
  %12 = bitcast %class.BitBoard64* %ref.tmp to i64*, !dbg !1444
  store i64 %call, i64* %12, align 1, !dbg !1444
  %call2 = call i64 @_ZN10BitBoard64aSERKS_(%class.BitBoard64* %c, %class.BitBoard64* dereferenceable(8) %ref.tmp), !dbg !1445
  %13 = bitcast %class.BitBoard64* %coerce to i64*, !dbg !1445
  store i64 %call2, i64* %13, align 1, !dbg !1445
  br label %if.end, !dbg !1445

if.end:                                           ; preds = %if.then, %2
  %14 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 4), !dbg !1446
  %15 = add i64 %14, 1, !dbg !1446
  store i64 %15, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 4), !dbg !1446
  %call3 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0)), !dbg !1446
  %call4 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([27 x i8]* @.str3, i32 0, i32 0)), !dbg !1447
  call void @llvm.dbg.declare(metadata i32* %y, metadata !1448, metadata !605), !dbg !1450
  store i32 1, i32* %y, align 4, !dbg !1450
  br label %for.cond, !dbg !1451

for.cond:                                         ; preds = %for.inc40, %if.end
  %16 = load i32* %y, align 4, !dbg !1452
  %cmp = icmp slt i32 %16, 10, !dbg !1452
  %17 = select i1 %cmp, i64 5, i64 6, !dbg !1456
  %18 = getelementptr inbounds [55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 %17, !dbg !1456
  %19 = load i64* %18, !dbg !1456
  %20 = add i64 %19, 1, !dbg !1456
  store i64 %20, i64* %18, !dbg !1456
  br i1 %cmp, label %for.body, label %for.end42, !dbg !1456

for.body:                                         ; preds = %for.cond
  %21 = load i32* %y, align 4, !dbg !1457
  %call5 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* @_ZSt4cout, i32 %21), !dbg !1459
  %call6 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call5, i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0)), !dbg !1460
  %22 = load i32* %y, align 4, !dbg !1461
  %cmp7 = icmp slt i32 %22, 5, !dbg !1461
  %23 = select i1 %cmp7, i64 7, i64 8, !dbg !1463
  %24 = getelementptr inbounds [55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 %23, !dbg !1463
  %25 = load i64* %24, !dbg !1463
  %26 = add i64 %25, 1, !dbg !1463
  store i64 %26, i64* %24, !dbg !1463
  br i1 %cmp7, label %if.then8, label %if.end13, !dbg !1463

if.then8:                                         ; preds = %for.body
  %27 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 9), !dbg !1464
  %28 = add i64 %27, 1, !dbg !1464
  store i64 %28, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 9), !dbg !1464
  call void @llvm.dbg.declare(metadata i32* %off, metadata !1467, metadata !605), !dbg !1464
  store i32 0, i32* %off, align 4, !dbg !1464
  br label %for.cond9, !dbg !1468

for.cond9:                                        ; preds = %for.inc, %if.then8
  %29 = load i32* %off, align 4, !dbg !1469
  %30 = load i32* %y, align 4, !dbg !1473
  %sub = sub nsw i32 5, %30, !dbg !1474
  %cmp10 = icmp slt i32 %29, %sub, !dbg !1475
  %31 = select i1 %cmp10, i64 10, i64 11, !dbg !1476
  %32 = getelementptr inbounds [55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 %31, !dbg !1476
  %33 = load i64* %32, !dbg !1476
  %34 = add i64 %33, 1, !dbg !1476
  store i64 %34, i64* %32, !dbg !1476
  br i1 %cmp10, label %for.body11, label %for.end, !dbg !1476

for.body11:                                       ; preds = %for.cond9
  %35 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 12), !dbg !1477
  %36 = add i64 %35, 1, !dbg !1477
  store i64 %36, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 12), !dbg !1477
  %call12 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0)), !dbg !1477
  br label %for.inc, !dbg !1478

for.inc:                                          ; preds = %for.body11
  %37 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 13), !dbg !1479
  %38 = add i64 %37, 1, !dbg !1479
  store i64 %38, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 13), !dbg !1479
  %39 = load i32* %off, align 4, !dbg !1479
  %inc = add nsw i32 %39, 1, !dbg !1479
  store i32 %inc, i32* %off, align 4, !dbg !1479
  br label %for.cond9, !dbg !1480

for.end:                                          ; preds = %for.cond9
  %40 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 14), !dbg !1481
  %41 = add i64 %40, 1, !dbg !1481
  store i64 %41, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 14), !dbg !1481
  br label %if.end13, !dbg !1481

if.end13:                                         ; preds = %for.end, %for.body
  %42 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 15), !dbg !1482
  %43 = add i64 %42, 1, !dbg !1482
  store i64 %43, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 15), !dbg !1482
  call void @llvm.dbg.declare(metadata i32* %x, metadata !1484, metadata !605), !dbg !1482
  store i32 1, i32* %x, align 4, !dbg !1482
  br label %for.cond14, !dbg !1485

for.cond14:                                       ; preds = %for.inc36, %if.end13
  %44 = load i32* %x, align 4, !dbg !1486
  %cmp15 = icmp slt i32 %44, 10, !dbg !1486
  %45 = select i1 %cmp15, i64 16, i64 17, !dbg !1490
  %46 = getelementptr inbounds [55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 %45, !dbg !1490
  %47 = load i64* %46, !dbg !1490
  %48 = add i64 %47, 1, !dbg !1490
  store i64 %48, i64* %46, !dbg !1490
  br i1 %cmp15, label %for.body16, label %for.end38, !dbg !1490

for.body16:                                       ; preds = %for.cond14
  call void @llvm.dbg.declare(metadata i32* %no, metadata !1491, metadata !605), !dbg !1493
  %49 = load i32* %x, align 4, !dbg !1494
  %50 = load i32* %y, align 4, !dbg !1496
  %call17 = call i32 @_Z16getHexxagonIndexii(i32 %49, i32 %50), !dbg !1497
  store i32 %call17, i32* %no, align 4, !dbg !1498
  %cmp18 = icmp eq i32 %call17, -1, !dbg !1499
  %51 = select i1 %cmp18, i64 18, i64 19, !dbg !1500
  %52 = getelementptr inbounds [55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 %51, !dbg !1500
  %53 = load i64* %52, !dbg !1500
  %54 = add i64 %53, 1, !dbg !1500
  store i64 %54, i64* %52, !dbg !1500
  br i1 %cmp18, label %if.then19, label %if.else, !dbg !1500

if.then19:                                        ; preds = %for.body16
  %55 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 20), !dbg !1501
  %56 = add i64 %55, 1, !dbg !1501
  store i64 %56, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 20), !dbg !1501
  %call20 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0)), !dbg !1501
  br label %if.end35, !dbg !1502

if.else:                                          ; preds = %for.body16
  %board = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !1503
  %57 = load i32* %no, align 4, !dbg !1506
  %call21 = call i32 @_ZN10BitBoard646getBitEi(%class.BitBoard64* %board, i32 %57), !dbg !1503
  %tobool22 = icmp ne i32 %call21, 0, !dbg !1503
  %58 = select i1 %tobool22, i64 21, i64 22, !dbg !1507
  %59 = getelementptr inbounds [55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 %58, !dbg !1507
  %60 = load i64* %59, !dbg !1507
  %61 = add i64 %60, 1, !dbg !1507
  store i64 %61, i64* %59, !dbg !1507
  br i1 %tobool22, label %if.then23, label %if.else32, !dbg !1507

if.then23:                                        ; preds = %if.else
  %62 = load i32* %x, align 4, !dbg !1508
  %63 = load i32* %y, align 4, !dbg !1511
  %call24 = call i32 @_Z16getHexxagonIndexii(i32 %62, i32 %63), !dbg !1512
  %call25 = call i32 @_ZN10BitBoard646getBitEi(%class.BitBoard64* %c, i32 %call24), !dbg !1513
  %tobool26 = icmp ne i32 %call25, 0, !dbg !1513
  %64 = select i1 %tobool26, i64 23, i64 24, !dbg !1514
  %65 = getelementptr inbounds [55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 %64, !dbg !1514
  %66 = load i64* %65, !dbg !1514
  %67 = add i64 %66, 1, !dbg !1514
  store i64 %67, i64* %65, !dbg !1514
  br i1 %tobool26, label %if.then27, label %if.else29, !dbg !1514

if.then27:                                        ; preds = %if.then23
  %68 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 25), !dbg !1515
  %69 = add i64 %68, 1, !dbg !1515
  store i64 %69, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 25), !dbg !1515
  %call28 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0)), !dbg !1515
  br label %if.end31, !dbg !1516

if.else29:                                        ; preds = %if.then23
  %70 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 26), !dbg !1517
  %71 = add i64 %70, 1, !dbg !1517
  store i64 %71, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 26), !dbg !1517
  %call30 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([3 x i8]* @.str7, i32 0, i32 0)), !dbg !1517
  br label %if.end31

if.end31:                                         ; preds = %if.else29, %if.then27
  %72 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 27), !dbg !1518
  %73 = add i64 %72, 1, !dbg !1518
  store i64 %73, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 27), !dbg !1518
  br label %if.end34, !dbg !1518

if.else32:                                        ; preds = %if.else
  %74 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 28), !dbg !1519
  %75 = add i64 %74, 1, !dbg !1519
  store i64 %75, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 28), !dbg !1519
  %call33 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([3 x i8]* @.str8, i32 0, i32 0)), !dbg !1519
  br label %if.end34

if.end34:                                         ; preds = %if.else32, %if.end31
  %76 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 29)
  %77 = add i64 %76, 1
  store i64 %77, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 29)
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.then19
  %78 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 30), !dbg !1520
  %79 = add i64 %78, 1, !dbg !1520
  store i64 %79, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 30), !dbg !1520
  br label %for.inc36, !dbg !1520

for.inc36:                                        ; preds = %if.end35
  %80 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 31), !dbg !1521
  %81 = add i64 %80, 1, !dbg !1521
  store i64 %81, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 31), !dbg !1521
  %82 = load i32* %x, align 4, !dbg !1521
  %inc37 = add nsw i32 %82, 1, !dbg !1521
  store i32 %inc37, i32* %x, align 4, !dbg !1521
  br label %for.cond14, !dbg !1522

for.end38:                                        ; preds = %for.cond14
  %83 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 32), !dbg !1523
  %84 = add i64 %83, 1, !dbg !1523
  store i64 %84, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 32), !dbg !1523
  %call39 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([2 x i8]* @.str9, i32 0, i32 0)), !dbg !1523
  br label %for.inc40, !dbg !1524

for.inc40:                                        ; preds = %for.end38
  %85 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 33), !dbg !1525
  %86 = add i64 %85, 1, !dbg !1525
  store i64 %86, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 33), !dbg !1525
  %87 = load i32* %y, align 4, !dbg !1525
  %inc41 = add nsw i32 %87, 1, !dbg !1525
  store i32 %inc41, i32* %y, align 4, !dbg !1525
  br label %for.cond, !dbg !1526

for.end42:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %empty, metadata !1527, metadata !605), !dbg !1528
  %88 = load i32* %turn.addr, align 4, !dbg !1529
  %tobool43 = icmp ne i32 %88, 0, !dbg !1529
  %89 = select i1 %tobool43, i64 34, i64 35, !dbg !1529
  %90 = getelementptr inbounds [55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 %89, !dbg !1529
  %91 = load i64* %90, !dbg !1529
  %92 = add i64 %91, 1, !dbg !1529
  store i64 %92, i64* %90, !dbg !1529
  br i1 %tobool43, label %cond.true, label %cond.false, !dbg !1529

cond.true:                                        ; preds = %for.end42
  %93 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 36), !dbg !1530
  %94 = add i64 %93, 1, !dbg !1530
  store i64 %94, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 36), !dbg !1530
  %call44 = call i32 @_ZN13HexxagonBoard11countBricksEi(%class.HexxagonBoard* %this1, i32 1), !dbg !1530
  br label %cond.end, !dbg !1529

cond.false:                                       ; preds = %for.end42
  %95 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 37), !dbg !1532
  %96 = add i64 %95, 1, !dbg !1532
  store i64 %96, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 37), !dbg !1532
  %call45 = call i32 @_ZN13HexxagonBoard11countBricksEi(%class.HexxagonBoard* %this1, i32 2), !dbg !1532
  br label %cond.end, !dbg !1529

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call44, %cond.true ], [ %call45, %cond.false ], !dbg !1529
  %97 = load i32* %turn.addr, align 4, !dbg !1534
  %tobool46 = icmp ne i32 %97, 0, !dbg !1534
  %98 = select i1 %tobool46, i64 38, i64 39, !dbg !1534
  %99 = getelementptr inbounds [55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 %98, !dbg !1534
  %100 = load i64* %99, !dbg !1534
  %101 = add i64 %100, 1, !dbg !1534
  store i64 %101, i64* %99, !dbg !1534
  br i1 %tobool46, label %cond.true47, label %cond.false49, !dbg !1534

cond.true47:                                      ; preds = %cond.end
  %102 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 40), !dbg !1535
  %103 = add i64 %102, 1, !dbg !1535
  store i64 %103, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 40), !dbg !1535
  %call48 = call i32 @_ZN13HexxagonBoard11countBricksEi(%class.HexxagonBoard* %this1, i32 2), !dbg !1535
  br label %cond.end51, !dbg !1534

cond.false49:                                     ; preds = %cond.end
  %104 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 41), !dbg !1536
  %105 = add i64 %104, 1, !dbg !1536
  store i64 %105, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 41), !dbg !1536
  %call50 = call i32 @_ZN13HexxagonBoard11countBricksEi(%class.HexxagonBoard* %this1, i32 1), !dbg !1536
  br label %cond.end51, !dbg !1534

cond.end51:                                       ; preds = %cond.false49, %cond.true47
  %cond52 = phi i32 [ %call48, %cond.true47 ], [ %call50, %cond.false49 ], !dbg !1534
  %add = add nsw i32 %cond, %cond52, !dbg !1537
  %sub53 = sub nsw i32 61, %add, !dbg !1538
  store i32 %sub53, i32* %empty, align 4, !dbg !1528
  %call54 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([12 x i8]* @.str10, i32 0, i32 0)), !dbg !1539
  %106 = load i32* %turn.addr, align 4, !dbg !1540
  %tobool55 = icmp ne i32 %106, 0, !dbg !1540
  %107 = select i1 %tobool55, i64 42, i64 43, !dbg !1540
  %108 = getelementptr inbounds [55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 %107, !dbg !1540
  %109 = load i64* %108, !dbg !1540
  %110 = add i64 %109, 1, !dbg !1540
  store i64 %110, i64* %108, !dbg !1540
  br i1 %tobool55, label %cond.true56, label %cond.false58, !dbg !1540

cond.true56:                                      ; preds = %cond.end51
  %111 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 44), !dbg !1541
  %112 = add i64 %111, 1, !dbg !1541
  store i64 %112, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 44), !dbg !1541
  %call57 = call i32 @_ZN13HexxagonBoard11countBricksEi(%class.HexxagonBoard* %this1, i32 1), !dbg !1541
  br label %cond.end60, !dbg !1540

cond.false58:                                     ; preds = %cond.end51
  %113 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 45), !dbg !1542
  %114 = add i64 %113, 1, !dbg !1542
  store i64 %114, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 45), !dbg !1542
  %call59 = call i32 @_ZN13HexxagonBoard11countBricksEi(%class.HexxagonBoard* %this1, i32 2), !dbg !1542
  br label %cond.end60, !dbg !1540

cond.end60:                                       ; preds = %cond.false58, %cond.true56
  %cond61 = phi i32 [ %call57, %cond.true56 ], [ %call59, %cond.false58 ], !dbg !1540
  %call62 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call54, i32 %cond61), !dbg !1543
  %call63 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([5 x i8]* @.str11, i32 0, i32 0)), !dbg !1546
  %115 = load i32* %turn.addr, align 4, !dbg !1547
  %tobool64 = icmp ne i32 %115, 0, !dbg !1547
  %116 = select i1 %tobool64, i64 46, i64 47, !dbg !1547
  %117 = getelementptr inbounds [55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 %116, !dbg !1547
  %118 = load i64* %117, !dbg !1547
  %119 = add i64 %118, 1, !dbg !1547
  store i64 %119, i64* %117, !dbg !1547
  br i1 %tobool64, label %cond.true65, label %cond.false67, !dbg !1547

cond.true65:                                      ; preds = %cond.end60
  %120 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 48), !dbg !1548
  %121 = add i64 %120, 1, !dbg !1548
  store i64 %121, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 48), !dbg !1548
  %call66 = call i32 @_ZN13HexxagonBoard11countBricksEi(%class.HexxagonBoard* %this1, i32 2), !dbg !1548
  br label %cond.end69, !dbg !1547

cond.false67:                                     ; preds = %cond.end60
  %122 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 49), !dbg !1549
  %123 = add i64 %122, 1, !dbg !1549
  store i64 %123, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 49), !dbg !1549
  %call68 = call i32 @_ZN13HexxagonBoard11countBricksEi(%class.HexxagonBoard* %this1, i32 1), !dbg !1549
  br label %cond.end69, !dbg !1547

cond.end69:                                       ; preds = %cond.false67, %cond.true65
  %cond70 = phi i32 [ %call66, %cond.true65 ], [ %call68, %cond.false67 ], !dbg !1547
  %call71 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call63, i32 %cond70), !dbg !1550
  %call72 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([9 x i8]* @.str12, i32 0, i32 0)), !dbg !1551
  %124 = load i32* %empty, align 4, !dbg !1552
  %call73 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call72, i32 %124), !dbg !1551
  %call74 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call73, i8* getelementptr inbounds ([3 x i8]* @.str13, i32 0, i32 0)), !dbg !1553
  %call75 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([15 x i8]* @.str14, i32 0, i32 0)), !dbg !1554
  %125 = load i32* %turn.addr, align 4, !dbg !1555
  %tobool76 = icmp ne i32 %125, 0, !dbg !1555
  %126 = select i1 %tobool76, i64 50, i64 51, !dbg !1556
  %127 = getelementptr inbounds [55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 %126, !dbg !1556
  %128 = load i64* %127, !dbg !1556
  %129 = add i64 %128, 1, !dbg !1556
  store i64 %129, i64* %127, !dbg !1556
  br i1 %tobool76, label %cond.true77, label %cond.false78, !dbg !1556

cond.true77:                                      ; preds = %cond.end69
  %130 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 52), !dbg !1557
  %131 = add i64 %130, 1, !dbg !1557
  store i64 %131, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 52), !dbg !1557
  br label %cond.end79, !dbg !1557

cond.false78:                                     ; preds = %cond.end69
  %132 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 53), !dbg !1558
  %133 = add i64 %132, 1, !dbg !1558
  store i64 %133, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 53), !dbg !1558
  br label %cond.end79, !dbg !1558

cond.end79:                                       ; preds = %cond.false78, %cond.true77
  %cond-lvalue = phi [2 x i8]* [ @.str15, %cond.true77 ], [ @.str16, %cond.false78 ], !dbg !1556
  %134 = load i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 54), !dbg !1559
  %135 = add i64 %134, 1, !dbg !1559
  store i64 %135, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 54), !dbg !1559
  %arraydecay = getelementptr inbounds [2 x i8]* %cond-lvalue, i32 0, i32 0, !dbg !1559
  %call80 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call75, i8* %arraydecay), !dbg !1560
  %call81 = call i32 @_ZN13HexxagonBoard9endOfGameEv(%class.HexxagonBoard* %this1), !dbg !1561
  %tobool82 = icmp ne i32 %call81, 0, !dbg !1561
  %cond83 = select i1 %tobool82, i8* getelementptr inbounds ([13 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str18, i32 0, i32 0), !dbg !1561
  %call84 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* %cond83), !dbg !1562
  %call85 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call84, i8* getelementptr inbounds ([2 x i8]* @.str9, i32 0, i32 0)), !dbg !1563
  ret void, !dbg !1564
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #0

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN12HexxagonMoveC2Ev(%class.HexxagonMove* %this) unnamed_addr #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr50, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr50, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonMove*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr50, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr50, i64 0, i64 1)
  store %class.HexxagonMove* %this, %class.HexxagonMove** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMove** %this.addr, metadata !1565, metadata !605), !dbg !1566
  %this1 = load %class.HexxagonMove** %this.addr
  ret void, !dbg !1567
}

define internal void @_GLOBAL__sub_I_hexxagonboard.cpp() section ".text.startup" {
entry:
  call void @__cxx_global_var_init(), !dbg !1568
  ret void
}

; Function Attrs: noinline
define internal void @__llvm_gcov_indirect_counter_increment(i32* %predecessor, i64** %counters) unnamed_addr #8 {
entry:
  %pred = load i32* %predecessor
  %0 = icmp eq i32 %pred, -1
  br i1 %0, label %exit, label %1

; <label>:1                                       ; preds = %entry
  %2 = zext i32 %pred to i64
  %3 = getelementptr i64** %counters, i64 %2
  %counter = load i64** %3
  %4 = icmp eq i64* %counter, null
  br i1 %4, label %exit, label %5

; <label>:5                                       ; preds = %1
  %6 = load i64* %counter
  %7 = add i64 %6, 1
  store i64 %7, i64* %counter
  br label %exit

exit:                                             ; preds = %5, %1, %entry
  ret void
}

; Function Attrs: noinline
define internal void @__llvm_gcov_writeout() unnamed_addr #8 {
entry:
  call void @llvm_gcda_start_file(i8* getelementptr inbounds ([95 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @0, i32 0, i32 0), i32 -1608943684)
  call void @llvm_gcda_emit_function(i32 0, i8* getelementptr inbounds ([22 x i8]* @2, i32 0, i32 0), i32 -343593632, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 1, i8* getelementptr inbounds ([23 x i8]* @3, i32 0, i32 0), i32 -269134694, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 48, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr19, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 2, i8* getelementptr inbounds ([22 x i8]* @4, i32 0, i32 0), i32 1905514388, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 47, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr20, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 3, i8* getelementptr inbounds ([21 x i8]* @5, i32 0, i32 0), i32 112478219, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 47, i64* getelementptr inbounds ([47 x i64]* @__llvm_gcov_ctr21, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 4, i8* getelementptr inbounds ([26 x i8]* @6, i32 0, i32 0), i32 -238785127, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr24, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 5, i8* getelementptr inbounds ([26 x i8]* @7, i32 0, i32 0), i32 1869641593, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr25, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 6, i8* getelementptr inbounds ([26 x i8]* @8, i32 0, i32 0), i32 637088386, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr26, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 7, i8* getelementptr inbounds ([34 x i8]* @9, i32 0, i32 0), i32 -599594944, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 26, i64* getelementptr inbounds ([26 x i64]* @__llvm_gcov_ctr27, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 8, i8* getelementptr inbounds ([30 x i8]* @10, i32 0, i32 0), i32 -1597830961, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 36, i64* getelementptr inbounds ([36 x i64]* @__llvm_gcov_ctr28, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 9, i8* getelementptr inbounds ([34 x i8]* @11, i32 0, i32 0), i32 1745465004, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 9, i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr29, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 10, i8* getelementptr inbounds ([45 x i8]* @12, i32 0, i32 0), i32 -802179790, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 5, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr30, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 11, i8* getelementptr inbounds ([48 x i8]* @13, i32 0, i32 0), i32 1221338279, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 16, i64* getelementptr inbounds ([16 x i64]* @__llvm_gcov_ctr31, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 12, i8* getelementptr inbounds ([39 x i8]* @14, i32 0, i32 0), i32 467403136, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 39, i64* getelementptr inbounds ([39 x i64]* @__llvm_gcov_ctr32, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 13, i8* getelementptr inbounds ([31 x i8]* @15, i32 0, i32 0), i32 -1070908754, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 12, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr35, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 14, i8* getelementptr inbounds ([41 x i8]* @16, i32 0, i32 0), i32 325177375, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 12, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr38, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 15, i8* getelementptr inbounds ([44 x i8]* @17, i32 0, i32 0), i32 645164791, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 8, i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr41, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 16, i8* getelementptr inbounds ([43 x i8]* @18, i32 0, i32 0), i32 -916865448, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 8, i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr42, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 17, i8* getelementptr inbounds ([39 x i8]* @19, i32 0, i32 0), i32 111566612, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 55, i64* getelementptr inbounds ([55 x i64]* @__llvm_gcov_ctr43, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 18, i8* getelementptr inbounds ([26 x i8]* @20, i32 0, i32 0), i32 1494599864, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 5, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr44, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 19, i8* getelementptr inbounds ([23 x i8]* @21, i32 0, i32 0), i32 -242329079, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr45, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 20, i8* getelementptr inbounds ([22 x i8]* @22, i32 0, i32 0), i32 -932945543, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr46, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 21, i8* getelementptr inbounds ([26 x i8]* @23, i32 0, i32 0), i32 467595693, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 8, i64* getelementptr inbounds ([8 x i64]* @__llvm_gcov_ctr47, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 22, i8* getelementptr inbounds ([22 x i8]* @24, i32 0, i32 0), i32 -269156019, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr50, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 23, i8* getelementptr inbounds ([21 x i8]* @25, i32 0, i32 0), i32 757312497, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr51, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 24, i8* getelementptr inbounds ([20 x i8]* @26, i32 0, i32 0), i32 -196194665, i8 0, i32 -1608943684)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr52, i64 0, i64 0))
  call void @llvm_gcda_summary_info()
  call void @llvm_gcda_end_file()
  ret void
}

declare void @llvm_gcda_start_file(i8*, i8*, i32)

declare void @llvm_gcda_emit_function(i32, i8*, i32, i8, i32)

declare void @llvm_gcda_emit_arcs(i32, i64*)

declare void @llvm_gcda_summary_info()

declare void @llvm_gcda_end_file()

; Function Attrs: noinline
define internal void @__llvm_gcov_flush() unnamed_addr #8 {
entry:
  call void @__llvm_gcov_writeout()
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr
  store [48 x i64] zeroinitializer, [48 x i64]* @__llvm_gcov_ctr19
  store [47 x i64] zeroinitializer, [47 x i64]* @__llvm_gcov_ctr20
  store [47 x i64] zeroinitializer, [47 x i64]* @__llvm_gcov_ctr21
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr24
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr25
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr26
  store [26 x i64] zeroinitializer, [26 x i64]* @__llvm_gcov_ctr27
  store [36 x i64] zeroinitializer, [36 x i64]* @__llvm_gcov_ctr28
  store [9 x i64] zeroinitializer, [9 x i64]* @__llvm_gcov_ctr29
  store [5 x i64] zeroinitializer, [5 x i64]* @__llvm_gcov_ctr30
  store [16 x i64] zeroinitializer, [16 x i64]* @__llvm_gcov_ctr31
  store [39 x i64] zeroinitializer, [39 x i64]* @__llvm_gcov_ctr32
  store [12 x i64] zeroinitializer, [12 x i64]* @__llvm_gcov_ctr35
  store [12 x i64] zeroinitializer, [12 x i64]* @__llvm_gcov_ctr38
  store [8 x i64] zeroinitializer, [8 x i64]* @__llvm_gcov_ctr41
  store [8 x i64] zeroinitializer, [8 x i64]* @__llvm_gcov_ctr42
  store [55 x i64] zeroinitializer, [55 x i64]* @__llvm_gcov_ctr43
  store [5 x i64] zeroinitializer, [5 x i64]* @__llvm_gcov_ctr44
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr45
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr46
  store [8 x i64] zeroinitializer, [8 x i64]* @__llvm_gcov_ctr47
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr50
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr51
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr52
  ret void
}

; Function Attrs: noinline
define internal void @__llvm_gcov_init() unnamed_addr #8 {
entry:
  call void @llvm_gcov_init(void ()* @__llvm_gcov_writeout, void ()* @__llvm_gcov_flush)
  ret void
}

declare void @llvm_gcov_init(void ()*, void ()*)

attributes #0 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nobuiltin "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nobuiltin nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noinline }
attributes #9 = { builtin }
attributes #10 = { builtin nounwind }
attributes #11 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!599, !600}
!llvm.gcov = !{!601}
!llvm.ident = !{!602}

!0 = !{!"0x11\004\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !14, !194, !228, !233} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp] [DW_LANG_C_plus_plus]
!1 = !{!"hexxagonboard.cpp", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!2 = !{!3, !8}
!3 = !{!"0x4\00\0031\0032\0032\000\000\000", !4, null, null, !5, null, null, null} ; [ DW_TAG_enumeration_type ] [line 31, size 32, align 32, offset 0] [def] [from ]
!4 = !{!"./hexxagonboard.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!5 = !{!6, !7}
!6 = !{!"0x28\00SCR_WIN\0020000"}                 ; [ DW_TAG_enumerator ] [SCR_WIN :: 20000]
!7 = !{!"0x28\00SCR_INFINITY\0032000"}            ; [ DW_TAG_enumerator ] [SCR_INFINITY :: 32000]
!8 = !{!"0x4\00\0038\0032\0032\000\000\000", !4, null, null, !9, null, null, null} ; [ DW_TAG_enumeration_type ] [line 38, size 32, align 32, offset 0] [def] [from ]
!9 = !{!10, !11, !12, !13}
!10 = !{!"0x28\00pl1\001"}                        ; [ DW_TAG_enumerator ] [pl1 :: 1]
!11 = !{!"0x28\00pl2\002"}                        ; [ DW_TAG_enumerator ] [pl2 :: 2]
!12 = !{!"0x28\00empty\003"}                      ; [ DW_TAG_enumerator ] [empty :: 3]
!13 = !{!"0x28\00removed\004"}                    ; [ DW_TAG_enumerator ] [removed :: 4]
!14 = !{!15, !21, !30, !32, !39, !40, !42, !45, !57, !100, !151, !167}
!15 = !{!"0x13\00\0082\0064\0032\000\000\000", !16, null, null, !17, null, null, !"_ZTS11__mbstate_t"} ; [ DW_TAG_structure_type ] [line 82, size 64, align 32, offset 0] [def] [from ]
!16 = !{!"/usr/include/wchar.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!17 = !{!18, !20}
!18 = !{!"0xd\00__count\0084\0032\0032\000\000", !16, !"_ZTS11__mbstate_t", !19} ; [ DW_TAG_member ] [__count] [line 84, size 32, align 32, offset 0] [from int]
!19 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!20 = !{!"0xd\00__value\0093\0032\0032\0032\000", !16, !"_ZTS11__mbstate_t", !"_ZTSN11__mbstate_tUt_E"} ; [ DW_TAG_member ] [__value] [line 93, size 32, align 32, offset 32] [from _ZTSN11__mbstate_tUt_E]
!21 = !{!"0x17\00\0085\0032\0032\000\000\000", !16, !"_ZTS11__mbstate_t", null, !22, null, null, !"_ZTSN11__mbstate_tUt_E"} ; [ DW_TAG_union_type ] [line 85, size 32, align 32, offset 0] [def] [from ]
!22 = !{!23, !25}
!23 = !{!"0xd\00__wch\0088\0032\0032\000\000", !16, !"_ZTSN11__mbstate_tUt_E", !24} ; [ DW_TAG_member ] [__wch] [line 88, size 32, align 32, offset 0] [from unsigned int]
!24 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!25 = !{!"0xd\00__wchb\0092\0032\008\000\000", !16, !"_ZTSN11__mbstate_tUt_E", !26} ; [ DW_TAG_member ] [__wchb] [line 92, size 32, align 8, offset 0] [from ]
!26 = !{!"0x1\00\000\0032\008\000\000\000", null, null, !27, !28, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32, align 8, offset 0] [from char]
!27 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!28 = !{!29}
!29 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!30 = !{!"0x13\00_IO_FILE\00245\000\000\000\004\000", !31, null, null, null, null, null, !"_ZTS8_IO_FILE"} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 0, align 0, offset 0] [decl] [from ]
!31 = !{!"/usr/include/libio.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!32 = !{!"0x13\00__va_list_tag\000\00192\0064\000\000\000", !1, null, null, !33, null, null, !"_ZTS13__va_list_tag"} ; [ DW_TAG_structure_type ] [__va_list_tag] [line 0, size 192, align 64, offset 0] [def] [from ]
!33 = !{!34, !35, !36, !38}
!34 = !{!"0xd\00gp_offset\000\0032\0032\000\000", !1, !"_ZTS13__va_list_tag", !24} ; [ DW_TAG_member ] [gp_offset] [line 0, size 32, align 32, offset 0] [from unsigned int]
!35 = !{!"0xd\00fp_offset\000\0032\0032\0032\000", !1, !"_ZTS13__va_list_tag", !24} ; [ DW_TAG_member ] [fp_offset] [line 0, size 32, align 32, offset 32] [from unsigned int]
!36 = !{!"0xd\00overflow_arg_area\000\0064\0064\0064\000", !1, !"_ZTS13__va_list_tag", !37} ; [ DW_TAG_member ] [overflow_arg_area] [line 0, size 64, align 64, offset 64] [from ]
!37 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!38 = !{!"0xd\00reg_save_area\000\0064\0064\00128\000", !1, !"_ZTS13__va_list_tag", !37} ; [ DW_TAG_member ] [reg_save_area] [line 0, size 64, align 64, offset 128] [from ]
!39 = !{!"0x13\00tm\00137\000\000\000\004\000", !16, null, null, null, null, null, !"_ZTS2tm"} ; [ DW_TAG_structure_type ] [tm] [line 137, size 0, align 0, offset 0] [decl] [from ]
!40 = !{!"0x13\00lconv\0053\000\000\000\004\000", !41, null, null, null, null, null, !"_ZTS5lconv"} ; [ DW_TAG_structure_type ] [lconv] [line 53, size 0, align 0, offset 0] [decl] [from ]
!41 = !{!"/usr/include/locale.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!42 = !{!"0x2\00ios_base\00199\000\000\000\004\000", !43, !44, null, null, null, null, !"_ZTSSt8ios_base"} ; [ DW_TAG_class_type ] [ios_base] [line 199, size 0, align 0, offset 0] [decl] [from ]
!43 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/ios_base.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!44 = !{!"0x39\00std\000", !1, null}              ; [ DW_TAG_namespace ] [std] [line 0]
!45 = !{!"0x2\00Init\00533\008\008\000\000\000", !43, !"_ZTSSt8ios_base", null, !46, null, null, !"_ZTSNSt8ios_base4InitE"} ; [ DW_TAG_class_type ] [Init] [line 533, size 8, align 8, offset 0] [def] [from ]
!46 = !{!47, !50, !52, !56}
!47 = !{!"0xd\00_S_refcount\00541\000\000\000\004096", !43, !"_ZTSNSt8ios_base4InitE", !48, null} ; [ DW_TAG_member ] [_S_refcount] [line 541, size 0, align 0, offset 0] [static] [from _Atomic_word]
!48 = !{!"0x16\00_Atomic_word\0032\000\000\000\000", !49, null, !19} ; [ DW_TAG_typedef ] [_Atomic_word] [line 32, size 0, align 0, offset 0] [from int]
!49 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/x86_64-linux-gnu/c++/4.8/bits/atomic_word.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!50 = !{!"0xd\00_S_synced_with_stdio\00542\000\000\000\004096", !43, !"_ZTSNSt8ios_base4InitE", !51, null} ; [ DW_TAG_member ] [_S_synced_with_stdio] [line 542, size 0, align 0, offset 0] [static] [from bool]
!51 = !{!"0x24\00bool\000\008\008\000\000\002", null, null} ; [ DW_TAG_base_type ] [bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!52 = !{!"0x2e\00Init\00Init\00\00537\000\000\000\000\00259\000\00537", !43, !"_ZTSNSt8ios_base4InitE", !53, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 537] [public] [Init]
!53 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !54, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!54 = !{null, !55}
!55 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTSNSt8ios_base4InitE"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTSNSt8ios_base4InitE]
!56 = !{!"0x2e\00~Init\00~Init\00\00538\000\000\000\000\00259\000\00538", !43, !"_ZTSNSt8ios_base4InitE", !53, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 538] [public] [~Init]
!57 = !{!"0x2\00BitBoard64\0031\0064\0032\000\000\000", !58, null, null, !59, null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_class_type ] [BitBoard64] [line 31, size 64, align 32, offset 0] [def] [from ]
!58 = !{!"./bitboard64.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!59 = !{!60, !63, !64, !68, !71, !74, !75, !78, !83, !84, !85, !86, !89, !92, !93, !99}
!60 = !{!"0xd\00lowbits\0056\0032\0032\000\000", !58, !"_ZTS10BitBoard64", !61} ; [ DW_TAG_member ] [lowbits] [line 56, size 32, align 32, offset 0] [from uint32_t]
!61 = !{!"0x16\00uint32_t\0051\000\000\000\000", !62, null, !24} ; [ DW_TAG_typedef ] [uint32_t] [line 51, size 0, align 0, offset 0] [from unsigned int]
!62 = !{!"/usr/include/stdint.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!63 = !{!"0xd\00highbits\0056\0032\0032\0032\000", !58, !"_ZTS10BitBoard64", !61} ; [ DW_TAG_member ] [highbits] [line 56, size 32, align 32, offset 32] [from uint32_t]
!64 = !{!"0x2e\00BitBoard64\00BitBoard64\00\0034\000\000\000\000\00259\000\0034", !58, !"_ZTS10BitBoard64", !65, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 34] [public] [BitBoard64]
!65 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !66, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = !{null, !67}
!67 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS10BitBoard64]
!68 = !{!"0x2e\00BitBoard64\00BitBoard64\00\0035\000\000\000\000\00259\000\0035", !58, !"_ZTS10BitBoard64", !69, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 35] [public] [BitBoard64]
!69 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !70, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = !{null, !67, !61, !61}
!71 = !{!"0x2e\00setBit\00setBit\00_ZN10BitBoard646setBitEi\0037\000\000\000\000\00259\000\0037", !58, !"_ZTS10BitBoard64", !72, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 37] [public] [setBit]
!72 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !73, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!73 = !{null, !67, !19}
!74 = !{!"0x2e\00unSetBit\00unSetBit\00_ZN10BitBoard648unSetBitEi\0038\000\000\000\000\00259\000\0038", !58, !"_ZTS10BitBoard64", !72, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 38] [public] [unSetBit]
!75 = !{!"0x2e\00getBit\00getBit\00_ZN10BitBoard646getBitEi\0039\000\000\000\000\00259\000\0039", !58, !"_ZTS10BitBoard64", !76, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 39] [public] [getBit]
!76 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !77, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!77 = !{!19, !67, !19}
!78 = !{!"0x2e\00operator&\00operator&\00_ZN10BitBoard64anERKS_\0041\000\000\000\000\00259\000\0041", !58, !"_ZTS10BitBoard64", !79, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 41] [public] [operator&]
!79 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !80, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!80 = !{!"_ZTS10BitBoard64", !67, !81}
!81 = !{!"0x10\00\000\000\000\000\000", null, null, !82} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS10BitBoard64]
!83 = !{!"0x2e\00operator|\00operator|\00_ZN10BitBoard64orERKS_\0042\000\000\000\000\00259\000\0042", !58, !"_ZTS10BitBoard64", !79, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 42] [public] [operator|]
!84 = !{!"0x2e\00operator^\00operator^\00_ZN10BitBoard64eoERKS_\0043\000\000\000\000\00259\000\0043", !58, !"_ZTS10BitBoard64", !79, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 43] [public] [operator^]
!85 = !{!"0x2e\00operator=\00operator=\00_ZN10BitBoard64aSERKS_\0044\000\000\000\000\00259\000\0044", !58, !"_ZTS10BitBoard64", !79, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 44] [public] [operator=]
!86 = !{!"0x2e\00operator~\00operator~\00_ZN10BitBoard64coEv\0045\000\000\000\000\00259\000\0045", !58, !"_ZTS10BitBoard64", !87, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 45] [public] [operator~]
!87 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !88, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!88 = !{!"_ZTS10BitBoard64", !67}
!89 = !{!"0x2e\00operator bool\00operator bool\00_ZN10BitBoard64cvbEv\0047\000\000\000\000\00259\000\0047", !58, !"_ZTS10BitBoard64", !90, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 47] [public] [operator bool]
!90 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !91, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!91 = !{!51, !67}
!92 = !{!"0x2e\00print\00print\00_ZN10BitBoard645printEv\0049\000\000\000\000\00259\000\0049", !58, !"_ZTS10BitBoard64", !65, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 49] [public] [print]
!93 = !{!"0x2e\00readFromFile\00readFromFile\00_ZN10BitBoard6412readFromFileEP8_IO_FILE\0051\000\000\000\000\00259\000\0051", !58, !"_ZTS10BitBoard64", !94, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 51] [public] [readFromFile]
!94 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !95, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!95 = !{!19, !67, !96}
!96 = !{!"0xf\00\000\0064\0064\000\000", null, null, !97} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!97 = !{!"0x16\00FILE\0048\000\000\000\000", !98, null, !"_ZTS8_IO_FILE"} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _ZTS8_IO_FILE]
!98 = !{!"/usr/include/stdio.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!99 = !{!"0x2e\00writeToFile\00writeToFile\00_ZN10BitBoard6411writeToFileEP8_IO_FILE\0052\000\000\000\000\00259\000\0052", !58, !"_ZTS10BitBoard64", !94, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 52] [public] [writeToFile]
!100 = !{!"0x2\00HexxagonBoard\0050\00128\0032\000\000\000", !4, null, null, !101, null, null, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_class_type ] [HexxagonBoard] [line 50, size 128, align 32, offset 0] [def] [from ]
!101 = !{!102, !103, !104, !108, !113, !114, !117, !120, !121, !125, !129, !135, !136, !137, !140, !141, !144, !147, !148}
!102 = !{!"0xd\00board\0080\0064\0032\000\002", !4, !"_ZTS13HexxagonBoard", !"_ZTS10BitBoard64"} ; [ DW_TAG_member ] [board] [line 80, size 64, align 32, offset 0] [protected] [from _ZTS10BitBoard64]
!103 = !{!"0xd\00color\0081\0064\0032\0064\002", !4, !"_ZTS13HexxagonBoard", !"_ZTS10BitBoard64"} ; [ DW_TAG_member ] [color] [line 81, size 64, align 32, offset 64] [protected] [from _ZTS10BitBoard64]
!104 = !{!"0x2e\00HexxagonBoard\00HexxagonBoard\00\0054\000\000\000\000\00259\000\0054", !4, !"_ZTS13HexxagonBoard", !105, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 54] [public] [HexxagonBoard]
!105 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !106, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!106 = !{null, !107}
!107 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS13HexxagonBoard]
!108 = !{!"0x2e\00HexxagonBoard\00HexxagonBoard\00\0055\000\000\000\000\00259\000\0055", !4, !"_ZTS13HexxagonBoard", !109, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 55] [public] [HexxagonBoard]
!109 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !110, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!110 = !{null, !107, !111}
!111 = !{!"0x10\00\000\000\000\000\000", null, null, !112} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!112 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS13HexxagonBoard]
!113 = !{!"0x2e\00init\00init\00_ZN13HexxagonBoard4initEv\0057\000\000\000\000\00259\000\0057", !4, !"_ZTS13HexxagonBoard", !105, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 57] [public] [init]
!114 = !{!"0x2e\00evaluate\00evaluate\00_ZN13HexxagonBoard8evaluateEv\0058\000\000\000\000\00259\000\0058", !4, !"_ZTS13HexxagonBoard", !115, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 58] [public] [evaluate]
!115 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !116, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!116 = !{!19, !107}
!117 = !{!"0x2e\00countBricks\00countBricks\00_ZN13HexxagonBoard11countBricksEi\0059\000\000\000\000\00259\000\0059", !4, !"_ZTS13HexxagonBoard", !118, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 59] [public] [countBricks]
!118 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !119, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!119 = !{!19, !107, !19}
!120 = !{!"0x2e\00getHexxagon\00getHexxagon\00_ZN13HexxagonBoard11getHexxagonEi\0060\000\000\000\000\00259\000\0060", !4, !"_ZTS13HexxagonBoard", !118, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 60] [public] [getHexxagon]
!121 = !{!"0x2e\00applyMove\00applyMove\00_ZN13HexxagonBoard9applyMoveER12HexxagonMove\0061\000\000\000\000\00259\000\0061", !4, !"_ZTS13HexxagonBoard", !122, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 61] [public] [applyMove]
!122 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !123, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!123 = !{!19, !107, !124}
!124 = !{!"0x10\00\000\000\000\000\000", null, null, !"_ZTS12HexxagonMove"} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from _ZTS12HexxagonMove]
!125 = !{!"0x2e\00generateMoveList\00generateMoveList\00_ZN13HexxagonBoard16generateMoveListEv\0063\000\000\000\000\00259\000\0063", !4, !"_ZTS13HexxagonBoard", !126, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 63] [public] [generateMoveList]
!126 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !127, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!127 = !{!128, !107}
!128 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS16HexxagonMoveList"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS16HexxagonMoveList]
!129 = !{!"0x2e\00computerMove\00computerMove\00_ZN13HexxagonBoard12computerMoveEiPFvvEi\0065\000\000\000\000\00259\000\0065", !4, !"_ZTS13HexxagonBoard", !130, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 65] [public] [computerMove]
!130 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !131, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!131 = !{!19, !107, !19, !132, !19}
!132 = !{!"0xf\00\000\0064\0064\000\000", null, null, !133} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!133 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !134, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!134 = !{null}
!135 = !{!"0x2e\00endOfGame\00endOfGame\00_ZN13HexxagonBoard9endOfGameEv\0066\000\000\000\000\00259\000\0066", !4, !"_ZTS13HexxagonBoard", !115, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 66] [public] [endOfGame]
!136 = !{!"0x2e\00isMoveValid\00isMoveValid\00_ZN13HexxagonBoard11isMoveValidER12HexxagonMove\0067\000\000\000\000\00259\000\0067", !4, !"_ZTS13HexxagonBoard", !122, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 67] [public] [isMoveValid]
!137 = !{!"0x2e\00getBBBoard\00getBBBoard\00_ZN13HexxagonBoard10getBBBoardEv\0069\000\000\000\000\00259\000\0069", !4, !"_ZTS13HexxagonBoard", !138, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 69] [public] [getBBBoard]
!138 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !139, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!139 = !{!"_ZTS10BitBoard64", !107}
!140 = !{!"0x2e\00getBBColor\00getBBColor\00_ZN13HexxagonBoard10getBBColorEv\0070\000\000\000\000\00259\000\0070", !4, !"_ZTS13HexxagonBoard", !138, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 70] [public] [getBBColor]
!141 = !{!"0x2e\00operator=\00operator=\00_ZN13HexxagonBoardaSERKS_\0072\000\000\000\000\00259\000\0072", !4, !"_ZTS13HexxagonBoard", !142, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 72] [public] [operator=]
!142 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !143, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!143 = !{!"_ZTS13HexxagonBoard", !107, !111}
!144 = !{!"0x2e\00readFromFile\00readFromFile\00_ZN13HexxagonBoard12readFromFileEP8_IO_FILE\0074\000\000\000\000\00259\000\0074", !4, !"_ZTS13HexxagonBoard", !145, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 74] [public] [readFromFile]
!145 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !146, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!146 = !{!19, !107, !96}
!147 = !{!"0x2e\00writeToFile\00writeToFile\00_ZN13HexxagonBoard11writeToFileEP8_IO_FILE\0075\000\000\000\000\00259\000\0075", !4, !"_ZTS13HexxagonBoard", !145, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 75] [public] [writeToFile]
!148 = !{!"0x2e\00displayBoardText\00displayBoardText\00_ZN13HexxagonBoard16displayBoardTextEi\0077\000\000\000\000\00259\000\0077", !4, !"_ZTS13HexxagonBoard", !149, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 77] [public] [displayBoardText]
!149 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !150, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!150 = !{null, !107, !19}
!151 = !{!"0x2\00HexxagonMove\0032\0064\0032\000\000\000", !152, null, null, !153, null, null, !"_ZTS12HexxagonMove"} ; [ DW_TAG_class_type ] [HexxagonMove] [line 32, size 64, align 32, offset 0] [def] [from ]
!152 = !{!"./hexxagonmove.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!153 = !{!154, !155, !156, !157, !161, !164}
!154 = !{!"0xd\00from\0039\008\008\000\003", !152, !"_ZTS12HexxagonMove", !27} ; [ DW_TAG_member ] [from] [line 39, size 8, align 8, offset 0] [public] [from char]
!155 = !{!"0xd\00to\0039\008\008\008\003", !152, !"_ZTS12HexxagonMove", !27} ; [ DW_TAG_member ] [to] [line 39, size 8, align 8, offset 8] [public] [from char]
!156 = !{!"0xd\00score\0040\0032\0032\0032\003", !152, !"_ZTS12HexxagonMove", !19} ; [ DW_TAG_member ] [score] [line 40, size 32, align 32, offset 32] [public] [from int]
!157 = !{!"0x2e\00HexxagonMove\00HexxagonMove\00\0035\000\000\000\000\00259\000\0035", !152, !"_ZTS12HexxagonMove", !158, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 35] [public] [HexxagonMove]
!158 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !159, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!159 = !{null, !160}
!160 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS12HexxagonMove"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS12HexxagonMove]
!161 = !{!"0x2e\00HexxagonMove\00HexxagonMove\00\0036\000\000\000\000\00259\000\0036", !152, !"_ZTS12HexxagonMove", !162, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 36] [public] [HexxagonMove]
!162 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !163, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!163 = !{null, !160, !19}
!164 = !{!"0x2e\00HexxagonMove\00HexxagonMove\00\0037\000\000\000\000\00259\000\0037", !152, !"_ZTS12HexxagonMove", !165, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 37] [public] [HexxagonMove]
!165 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !166, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!166 = !{null, !160, !19, !19}
!167 = !{!"0x2\00HexxagonMoveList\0043\00128\0064\000\000\000", !152, null, null, !168, null, null, !"_ZTS16HexxagonMoveList"} ; [ DW_TAG_class_type ] [HexxagonMoveList] [line 43, size 128, align 64, offset 0] [def] [from ]
!168 = !{!169, !170, !172, !176, !177, !180, !181, !182, !185, !188, !191}
!169 = !{!"0xd\00nr_moves\0062\0032\0032\000\000", !152, !"_ZTS16HexxagonMoveList", !19} ; [ DW_TAG_member ] [nr_moves] [line 62, size 32, align 32, offset 0] [from int]
!170 = !{!"0xd\00moves\0063\0064\0064\0064\000", !152, !"_ZTS16HexxagonMoveList", !171} ; [ DW_TAG_member ] [moves] [line 63, size 64, align 64, offset 64] [from ]
!171 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS12HexxagonMove"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS12HexxagonMove]
!172 = !{!"0x2e\00HexxagonMoveList\00HexxagonMoveList\00\0046\000\000\000\000\00259\000\0046", !152, !"_ZTS16HexxagonMoveList", !173, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 46] [public] [HexxagonMoveList]
!173 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !174, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!174 = !{null, !175}
!175 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS16HexxagonMoveList"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS16HexxagonMoveList]
!176 = !{!"0x2e\00~HexxagonMoveList\00~HexxagonMoveList\00\0047\000\000\000\000\00259\000\0047", !152, !"_ZTS16HexxagonMoveList", !173, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 47] [public] [~HexxagonMoveList]
!177 = !{!"0x2e\00scoreAllMoves\00scoreAllMoves\00_ZN16HexxagonMoveList13scoreAllMovesE13HexxagonBoardiPFvvEi\0049\000\000\000\000\00259\000\0049", !152, !"_ZTS16HexxagonMoveList", !178, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 49] [public] [scoreAllMoves]
!178 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !179, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!179 = !{null, !175, !"_ZTS13HexxagonBoard", !19, !132, !19}
!180 = !{!"0x2e\00sortList\00sortList\00_ZN16HexxagonMoveList8sortListEv\0050\000\000\000\000\00259\000\0050", !152, !"_ZTS16HexxagonMoveList", !173, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 50] [public] [sortList]
!181 = !{!"0x2e\00sortListQuick\00sortListQuick\00_ZN16HexxagonMoveList13sortListQuickEv\0051\000\000\000\000\00259\000\0051", !152, !"_ZTS16HexxagonMoveList", !173, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 51] [public] [sortListQuick]
!182 = !{!"0x2e\00getNrMoves\00getNrMoves\00_ZN16HexxagonMoveList10getNrMovesEv\0053\000\000\000\000\00259\000\0053", !152, !"_ZTS16HexxagonMoveList", !183, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 53] [public] [getNrMoves]
!183 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !184, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!184 = !{!19, !175}
!185 = !{!"0x2e\00addMove\00addMove\00_ZN16HexxagonMoveList7addMoveER12HexxagonMove\0055\000\000\000\000\00259\000\0055", !152, !"_ZTS16HexxagonMoveList", !186, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 55] [public] [addMove]
!186 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !187, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!187 = !{null, !175, !124}
!188 = !{!"0x2e\00getMove\00getMove\00_ZN16HexxagonMoveList7getMoveEi\0056\000\000\000\000\00259\000\0056", !152, !"_ZTS16HexxagonMoveList", !189, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 56] [public] [getMove]
!189 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !190, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!190 = !{!171, !175, !19}
!191 = !{!"0x2e\00getBestMove\00getBestMove\00_ZN16HexxagonMoveList11getBestMoveEv\0058\000\000\000\000\00259\000\0058", !152, !"_ZTS16HexxagonMoveList", !192, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 58] [public] [getBestMove]
!192 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !193, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!193 = !{!171, !175}
!194 = !{!195, !199, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226}
!195 = !{!"0x2e\00__cxx_global_var_init\00__cxx_global_var_init\00\0074\001\001\000\000\00256\000\0074", !196, !197, !133, null, void ()* @__cxx_global_var_init, null, null, !198} ; [ DW_TAG_subprogram ] [line 74] [local] [def] [__cxx_global_var_init]
!196 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/iostream", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!197 = !{!"0x29", !196}                           ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon//usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/iostream]
!198 = !{}
!199 = !{!"0x2e\00getHexxagonIndex\00getHexxagonIndex\00_Z16getHexxagonIndexii\0033\000\001\000\000\00256\000\0034", !1, !200, !201, null, i32 (i32, i32)* @_Z16getHexxagonIndexii, null, null, !198} ; [ DW_TAG_subprogram ] [line 33] [def] [scope 34] [getHexxagonIndex]
!200 = !{!"0x29", !1}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!201 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !202, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!202 = !{!19, !19, !19}
!203 = !{!"0x2e\00initCloneLookups\00initCloneLookups\00_Z16initCloneLookupsv\0064\000\001\000\000\00256\000\0065", !1, !200, !133, null, void ()* @_Z16initCloneLookupsv, null, null, !198} ; [ DW_TAG_subprogram ] [line 64] [def] [scope 65] [initCloneLookups]
!204 = !{!"0x2e\00initJumpLookups\00initJumpLookups\00_Z15initJumpLookupsv\00105\000\001\000\000\00256\000\00106", !1, !200, !133, null, void ()* @_Z15initJumpLookupsv, null, null, !198} ; [ DW_TAG_subprogram ] [line 105] [def] [scope 106] [initJumpLookups]
!205 = !{!"0x2e\00HexxagonBoard\00HexxagonBoard\00_ZN13HexxagonBoardC2ERKS_\00152\000\001\000\000\00256\000\00153", !1, !"_ZTS13HexxagonBoard", !109, null, void (%class.HexxagonBoard*, %class.HexxagonBoard*)* @_ZN13HexxagonBoardC2ERKS_, null, !108, !198} ; [ DW_TAG_subprogram ] [line 152] [def] [scope 153] [HexxagonBoard]
!206 = !{!"0x2e\00operator=\00operator=\00_ZN13HexxagonBoardaSERKS_\00158\000\001\000\000\00256\000\00159", !1, !"_ZTS13HexxagonBoard", !142, null, void (%class.HexxagonBoard*, %class.HexxagonBoard*, %class.HexxagonBoard*)* @_ZN13HexxagonBoardaSERKS_, null, !141, !198} ; [ DW_TAG_subprogram ] [line 158] [def] [scope 159] [operator=]
!207 = !{!"0x2e\00init\00init\00_ZN13HexxagonBoard4initEv\00166\000\001\000\000\00256\000\00167", !1, !"_ZTS13HexxagonBoard", !105, null, void (%class.HexxagonBoard*)* @_ZN13HexxagonBoard4initEv, null, !113, !198} ; [ DW_TAG_subprogram ] [line 166] [def] [scope 167] [init]
!208 = !{!"0x2e\00countBricks\00countBricks\00_ZN13HexxagonBoard11countBricksEi\00179\000\001\000\000\00256\000\00180", !1, !"_ZTS13HexxagonBoard", !118, null, i32 (%class.HexxagonBoard*, i32)* @_ZN13HexxagonBoard11countBricksEi, null, !117, !198} ; [ DW_TAG_subprogram ] [line 179] [def] [scope 180] [countBricks]
!209 = !{!"0x2e\00evaluate\00evaluate\00_ZN13HexxagonBoard8evaluateEv\00204\000\001\000\000\00256\000\00205", !1, !"_ZTS13HexxagonBoard", !115, null, i32 (%class.HexxagonBoard*)* @_ZN13HexxagonBoard8evaluateEv, null, !114, !198} ; [ DW_TAG_subprogram ] [line 204] [def] [scope 205] [evaluate]
!210 = !{!"0x2e\00getHexxagon\00getHexxagon\00_ZN13HexxagonBoard11getHexxagonEi\00245\000\001\000\000\00256\000\00246", !1, !"_ZTS13HexxagonBoard", !118, null, i32 (%class.HexxagonBoard*, i32)* @_ZN13HexxagonBoard11getHexxagonEi, null, !120, !198} ; [ DW_TAG_subprogram ] [line 245] [def] [scope 246] [getHexxagon]
!211 = !{!"0x2e\00applyMove\00applyMove\00_ZN13HexxagonBoard9applyMoveER12HexxagonMove\00257\000\001\000\000\00256\000\00258", !1, !"_ZTS13HexxagonBoard", !122, null, i32 (%class.HexxagonBoard*, %class.HexxagonMove*)* @_ZN13HexxagonBoard9applyMoveER12HexxagonMove, null, !121, !198} ; [ DW_TAG_subprogram ] [line 257] [def] [scope 258] [applyMove]
!212 = !{!"0x2e\00isMoveValid\00isMoveValid\00_ZN13HexxagonBoard11isMoveValidER12HexxagonMove\00272\000\001\000\000\00256\000\00273", !1, !"_ZTS13HexxagonBoard", !122, null, i32 (%class.HexxagonBoard*, %class.HexxagonMove*)* @_ZN13HexxagonBoard11isMoveValidER12HexxagonMove, null, !136, !198} ; [ DW_TAG_subprogram ] [line 272] [def] [scope 273] [isMoveValid]
!213 = !{!"0x2e\00generateMoveList\00generateMoveList\00_ZN13HexxagonBoard16generateMoveListEv\00296\000\001\000\000\00256\000\00297", !1, !"_ZTS13HexxagonBoard", !126, null, %class.HexxagonMoveList* (%class.HexxagonBoard*)* @_ZN13HexxagonBoard16generateMoveListEv, null, !125, !198} ; [ DW_TAG_subprogram ] [line 296] [def] [scope 297] [generateMoveList]
!214 = !{!"0x2e\00endOfGame\00endOfGame\00_ZN13HexxagonBoard9endOfGameEv\00338\000\001\000\000\00256\000\00339", !1, !"_ZTS13HexxagonBoard", !115, null, i32 (%class.HexxagonBoard*)* @_ZN13HexxagonBoard9endOfGameEv, null, !135, !198} ; [ DW_TAG_subprogram ] [line 338] [def] [scope 339] [endOfGame]
!215 = !{!"0x2e\00computerMove\00computerMove\00_ZN13HexxagonBoard12computerMoveEiPFvvEi\00352\000\001\000\000\00256\000\00353", !1, !"_ZTS13HexxagonBoard", !130, null, i32 (%class.HexxagonBoard*, i32, void ()*, i32)* @_ZN13HexxagonBoard12computerMoveEiPFvvEi, null, !129, !198} ; [ DW_TAG_subprogram ] [line 352] [def] [scope 353] [computerMove]
!216 = !{!"0x2e\00readFromFile\00readFromFile\00_ZN13HexxagonBoard12readFromFileEP8_IO_FILE\00370\000\001\000\000\00256\000\00371", !1, !"_ZTS13HexxagonBoard", !145, null, i32 (%class.HexxagonBoard*, %struct._IO_FILE*)* @_ZN13HexxagonBoard12readFromFileEP8_IO_FILE, null, !144, !198} ; [ DW_TAG_subprogram ] [line 370] [def] [scope 371] [readFromFile]
!217 = !{!"0x2e\00writeToFile\00writeToFile\00_ZN13HexxagonBoard11writeToFileEP8_IO_FILE\00378\000\001\000\000\00256\000\00379", !1, !"_ZTS13HexxagonBoard", !145, null, i32 (%class.HexxagonBoard*, %struct._IO_FILE*)* @_ZN13HexxagonBoard11writeToFileEP8_IO_FILE, null, !147, !198} ; [ DW_TAG_subprogram ] [line 378] [def] [scope 379] [writeToFile]
!218 = !{!"0x2e\00displayBoardText\00displayBoardText\00_ZN13HexxagonBoard16displayBoardTextEi\00386\000\001\000\000\00256\000\00387", !1, !"_ZTS13HexxagonBoard", !149, null, void (%class.HexxagonBoard*, i32)* @_ZN13HexxagonBoard16displayBoardTextEi, null, !148, !198} ; [ DW_TAG_subprogram ] [line 386] [def] [scope 387] [displayBoardText]
!219 = !{!"0x2e\00~HexxagonMoveList\00~HexxagonMoveList\00_ZN16HexxagonMoveListD2Ev\0047\000\001\000\000\00256\000\0047", !152, !"_ZTS16HexxagonMoveList", !173, null, void (%class.HexxagonMoveList*)* @_ZN16HexxagonMoveListD2Ev, null, !176, !198} ; [ DW_TAG_subprogram ] [line 47] [def] [~HexxagonMoveList]
!220 = !{!"0x2e\00HexxagonMove\00HexxagonMove\00_ZN12HexxagonMoveC2Eii\0037\000\001\000\000\00256\000\0037", !152, !"_ZTS12HexxagonMove", !165, null, void (%class.HexxagonMove*, i32, i32)* @_ZN12HexxagonMoveC2Eii, null, !164, !198} ; [ DW_TAG_subprogram ] [line 37] [def] [HexxagonMove]
!221 = !{!"0x2e\00HexxagonMove\00HexxagonMove\00_ZN12HexxagonMoveC2Ei\0036\000\001\000\000\00256\000\0036", !152, !"_ZTS12HexxagonMove", !162, null, void (%class.HexxagonMove*, i32)* @_ZN12HexxagonMoveC2Ei, null, !161, !198} ; [ DW_TAG_subprogram ] [line 36] [def] [HexxagonMove]
!222 = !{!"0x2e\00HexxagonMoveList\00HexxagonMoveList\00_ZN16HexxagonMoveListC2Ev\0046\000\001\000\000\00256\000\0046", !152, !"_ZTS16HexxagonMoveList", !173, null, void (%class.HexxagonMoveList*)* @_ZN16HexxagonMoveListC2Ev, null, !172, !198} ; [ DW_TAG_subprogram ] [line 46] [def] [HexxagonMoveList]
!223 = !{!"0x2e\00HexxagonMove\00HexxagonMove\00_ZN12HexxagonMoveC2Ev\0035\000\001\000\000\00256\000\0035", !152, !"_ZTS12HexxagonMove", !158, null, void (%class.HexxagonMove*)* @_ZN12HexxagonMoveC2Ev, null, !157, !198} ; [ DW_TAG_subprogram ] [line 35] [def] [HexxagonMove]
!224 = !{!"0x2e\00BitBoard64\00BitBoard64\00_ZN10BitBoard64C2Ejj\0035\000\001\000\000\00256\000\0035", !58, !"_ZTS10BitBoard64", !69, null, void (%class.BitBoard64*, i32, i32)* @_ZN10BitBoard64C2Ejj, null, !68, !198} ; [ DW_TAG_subprogram ] [line 35] [def] [BitBoard64]
!225 = !{!"0x2e\00BitBoard64\00BitBoard64\00_ZN10BitBoard64C2Ev\0034\000\001\000\000\00256\000\0034", !58, !"_ZTS10BitBoard64", !65, null, void (%class.BitBoard64*)* @_ZN10BitBoard64C2Ev, null, !64, !198} ; [ DW_TAG_subprogram ] [line 34] [def] [BitBoard64]
!226 = !{!"0x2e\00\00\00_GLOBAL__sub_I_hexxagonboard.cpp\000\001\001\000\000\0064\000\000", !1, !200, !227, null, void ()* @_GLOBAL__sub_I_hexxagonboard.cpp, null, null, !198} ; [ DW_TAG_subprogram ] [line 0] [local] [def]
!227 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !198, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!228 = !{!229, !230, !232}
!229 = !{!"0x34\00__ioinit\00__ioinit\00_ZStL8__ioinit\0074\001\001", !44, !197, !"_ZTSNSt8ios_base4InitE", %"class.std::ios_base::Init"* @_ZStL8__ioinit, null} ; [ DW_TAG_variable ] [__ioinit] [line 74] [local] [def]
!230 = !{!"0x34\00clone_lookups\00clone_lookups\00\0030\000\001", null, !200, !231, %class.BitBoard64** @clone_lookups, null} ; [ DW_TAG_variable ] [clone_lookups] [line 30] [def]
!231 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS10BitBoard64]
!232 = !{!"0x34\00jump_lookups\00jump_lookups\00\0031\000\001", null, !200, !231, %class.BitBoard64** @jump_lookups, null} ; [ DW_TAG_variable ] [jump_lookups] [line 31] [def]
!233 = !{!234, !237, !240, !245, !251, !259, !263, !270, !274, !278, !280, !282, !286, !297, !301, !307, !313, !315, !319, !323, !327, !331, !337, !339, !343, !347, !351, !353, !359, !363, !367, !369, !371, !375, !382, !386, !390, !394, !396, !402, !404, !411, !416, !420, !425, !429, !433, !437, !439, !441, !445, !449, !453, !455, !459, !463, !465, !467, !471, !478, !483, !488, !489, !490, !491, !495, !496, !501, !506, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !539, !541, !548, !550, !551, !554, !556, !558, !560, !564, !566, !568, !570, !572, !574, !576, !578, !580, !584, !588, !590, !594, !598}
!234 = !{!"0x8\0064\00", !44, !235}               ; [ DW_TAG_imported_declaration ]
!235 = !{!"0x16\00mbstate_t\00106\000\000\000\000", !16, null, !236} ; [ DW_TAG_typedef ] [mbstate_t] [line 106, size 0, align 0, offset 0] [from __mbstate_t]
!236 = !{!"0x16\00__mbstate_t\0094\000\000\000\000", !16, null, !"_ZTS11__mbstate_t"} ; [ DW_TAG_typedef ] [__mbstate_t] [line 94, size 0, align 0, offset 0] [from _ZTS11__mbstate_t]
!237 = !{!"0x8\00139\00", !44, !238}              ; [ DW_TAG_imported_declaration ]
!238 = !{!"0x16\00wint_t\00132\000\000\000\000", !239, null, !24} ; [ DW_TAG_typedef ] [wint_t] [line 132, size 0, align 0, offset 0] [from unsigned int]
!239 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!240 = !{!"0x8\00141\00", !44, !241}              ; [ DW_TAG_imported_declaration ]
!241 = !{!"0x2e\00btowc\00btowc\00\00353\000\000\000\000\00256\000\000", !16, !242, !243, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 353] [scope 0] [btowc]
!242 = !{!"0x29", !16}                            ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon//usr/include/wchar.h]
!243 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !244, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!244 = !{!238, !19}
!245 = !{!"0x8\00142\00", !44, !246}              ; [ DW_TAG_imported_declaration ]
!246 = !{!"0x2e\00fgetwc\00fgetwc\00\00745\000\000\000\000\00256\000\000", !16, !242, !247, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 745] [scope 0] [fgetwc]
!247 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !248, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!248 = !{!238, !249}
!249 = !{!"0xf\00\000\0064\0064\000\000", null, null, !250} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from __FILE]
!250 = !{!"0x16\00__FILE\0064\000\000\000\000", !98, null, !"_ZTS8_IO_FILE"} ; [ DW_TAG_typedef ] [__FILE] [line 64, size 0, align 0, offset 0] [from _ZTS8_IO_FILE]
!251 = !{!"0x8\00143\00", !44, !252}              ; [ DW_TAG_imported_declaration ]
!252 = !{!"0x2e\00fgetws\00fgetws\00\00774\000\000\000\000\00256\000\000", !16, !242, !253, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 774] [scope 0] [fgetws]
!253 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !254, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!254 = !{!255, !257, !19, !258}
!255 = !{!"0xf\00\000\0064\0064\000\000", null, null, !256} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from wchar_t]
!256 = !{!"0x24\00wchar_t\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [wchar_t] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!257 = !{!"0x37\00\000\000\000\000\000", null, null, !255} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!258 = !{!"0x37\00\000\000\000\000\000", null, null, !249} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!259 = !{!"0x8\00144\00", !44, !260}              ; [ DW_TAG_imported_declaration ]
!260 = !{!"0x2e\00fputwc\00fputwc\00\00759\000\000\000\000\00256\000\000", !16, !242, !261, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 759] [scope 0] [fputwc]
!261 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !262, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!262 = !{!238, !256, !249}
!263 = !{!"0x8\00145\00", !44, !264}              ; [ DW_TAG_imported_declaration ]
!264 = !{!"0x2e\00fputws\00fputws\00\00781\000\000\000\000\00256\000\000", !16, !242, !265, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 781] [scope 0] [fputws]
!265 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !266, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!266 = !{!19, !267, !258}
!267 = !{!"0x37\00\000\000\000\000\000", null, null, !268} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!268 = !{!"0xf\00\000\0064\0064\000\000", null, null, !269} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!269 = !{!"0x26\00\000\000\000\000\000", null, null, !256} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from wchar_t]
!270 = !{!"0x8\00146\00", !44, !271}              ; [ DW_TAG_imported_declaration ]
!271 = !{!"0x2e\00fwide\00fwide\00\00587\000\000\000\000\00256\000\000", !16, !242, !272, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 587] [scope 0] [fwide]
!272 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !273, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!273 = !{!19, !249, !19}
!274 = !{!"0x8\00147\00", !44, !275}              ; [ DW_TAG_imported_declaration ]
!275 = !{!"0x2e\00fwprintf\00fwprintf\00\00594\000\000\000\000\00256\000\000", !16, !242, !276, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 594] [scope 0] [fwprintf]
!276 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !277, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!277 = !{!19, !258, !267, null}
!278 = !{!"0x8\00148\00", !44, !279}              ; [ DW_TAG_imported_declaration ]
!279 = !{!"0x2e\00fwscanf\00fwscanf\00\00635\000\000\000\000\00256\000\000", !16, !242, !276, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 635] [scope 0] [fwscanf]
!280 = !{!"0x8\00149\00", !44, !281}              ; [ DW_TAG_imported_declaration ]
!281 = !{!"0x2e\00getwc\00getwc\00\00746\000\000\000\000\00256\000\000", !16, !242, !247, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 746] [scope 0] [getwc]
!282 = !{!"0x8\00150\00", !44, !283}              ; [ DW_TAG_imported_declaration ]
!283 = !{!"0x2e\00getwchar\00getwchar\00\00752\000\000\000\000\00256\000\000", !16, !242, !284, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 752] [scope 0] [getwchar]
!284 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !285, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!285 = !{!238}
!286 = !{!"0x8\00151\00", !44, !287}              ; [ DW_TAG_imported_declaration ]
!287 = !{!"0x2e\00mbrlen\00mbrlen\00\00376\000\000\000\000\00256\000\000", !16, !242, !288, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 376] [scope 0] [mbrlen]
!288 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !289, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!289 = !{!290, !292, !290, !295}
!290 = !{!"0x16\00size_t\0062\000\000\000\000", !239, null, !291} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!291 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!292 = !{!"0x37\00\000\000\000\000\000", null, null, !293} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!293 = !{!"0xf\00\000\0064\0064\000\000", null, null, !294} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!294 = !{!"0x26\00\000\000\000\000\000", null, null, !27} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!295 = !{!"0x37\00\000\000\000\000\000", null, null, !296} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!296 = !{!"0xf\00\000\0064\0064\000\000", null, null, !235} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from mbstate_t]
!297 = !{!"0x8\00152\00", !44, !298}              ; [ DW_TAG_imported_declaration ]
!298 = !{!"0x2e\00mbrtowc\00mbrtowc\00\00365\000\000\000\000\00256\000\000", !16, !242, !299, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 365] [scope 0] [mbrtowc]
!299 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !300, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!300 = !{!290, !257, !292, !290, !295}
!301 = !{!"0x8\00153\00", !44, !302}              ; [ DW_TAG_imported_declaration ]
!302 = !{!"0x2e\00mbsinit\00mbsinit\00\00361\000\000\000\000\00256\000\000", !16, !242, !303, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 361] [scope 0] [mbsinit]
!303 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !304, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!304 = !{!19, !305}
!305 = !{!"0xf\00\000\0064\0064\000\000", null, null, !306} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!306 = !{!"0x26\00\000\000\000\000\000", null, null, !235} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from mbstate_t]
!307 = !{!"0x8\00154\00", !44, !308}              ; [ DW_TAG_imported_declaration ]
!308 = !{!"0x2e\00mbsrtowcs\00mbsrtowcs\00\00408\000\000\000\000\00256\000\000", !16, !242, !309, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 408] [scope 0] [mbsrtowcs]
!309 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !310, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!310 = !{!290, !257, !311, !290, !295}
!311 = !{!"0x37\00\000\000\000\000\000", null, null, !312} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!312 = !{!"0xf\00\000\0064\0064\000\000", null, null, !293} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!313 = !{!"0x8\00155\00", !44, !314}              ; [ DW_TAG_imported_declaration ]
!314 = !{!"0x2e\00putwc\00putwc\00\00760\000\000\000\000\00256\000\000", !16, !242, !261, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 760] [scope 0] [putwc]
!315 = !{!"0x8\00156\00", !44, !316}              ; [ DW_TAG_imported_declaration ]
!316 = !{!"0x2e\00putwchar\00putwchar\00\00766\000\000\000\000\00256\000\000", !16, !242, !317, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 766] [scope 0] [putwchar]
!317 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !318, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!318 = !{!238, !256}
!319 = !{!"0x8\00158\00", !44, !320}              ; [ DW_TAG_imported_declaration ]
!320 = !{!"0x2e\00swprintf\00swprintf\00\00604\000\000\000\000\00256\000\000", !16, !242, !321, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 604] [scope 0] [swprintf]
!321 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !322, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!322 = !{!19, !257, !290, !267, null}
!323 = !{!"0x8\00160\00", !44, !324}              ; [ DW_TAG_imported_declaration ]
!324 = !{!"0x2e\00swscanf\00swscanf\00\00645\000\000\000\000\00256\000\000", !16, !242, !325, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 645] [scope 0] [swscanf]
!325 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !326, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!326 = !{!19, !267, !267, null}
!327 = !{!"0x8\00161\00", !44, !328}              ; [ DW_TAG_imported_declaration ]
!328 = !{!"0x2e\00ungetwc\00ungetwc\00\00789\000\000\000\000\00256\000\000", !16, !242, !329, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 789] [scope 0] [ungetwc]
!329 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !330, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!330 = !{!238, !238, !249}
!331 = !{!"0x8\00162\00", !44, !332}              ; [ DW_TAG_imported_declaration ]
!332 = !{!"0x2e\00vfwprintf\00vfwprintf\00\00612\000\000\000\000\00256\000\000", !16, !242, !333, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 612] [scope 0] [vfwprintf]
!333 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !334, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!334 = !{!19, !258, !267, !335}
!335 = !{!"0xf\00\000\0064\0064\000\000", null, null, !336} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from __va_list_tag]
!336 = !{!"0x16\00__va_list_tag\000\000\000\000\000", !1, null, !"_ZTS13__va_list_tag"} ; [ DW_TAG_typedef ] [__va_list_tag] [line 0, size 0, align 0, offset 0] [from _ZTS13__va_list_tag]
!337 = !{!"0x8\00164\00", !44, !338}              ; [ DW_TAG_imported_declaration ]
!338 = !{!"0x2e\00vfwscanf\00vfwscanf\00\00689\000\000\000\000\00256\000\000", !16, !242, !333, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 689] [scope 0] [vfwscanf]
!339 = !{!"0x8\00167\00", !44, !340}              ; [ DW_TAG_imported_declaration ]
!340 = !{!"0x2e\00vswprintf\00vswprintf\00\00625\000\000\000\000\00256\000\000", !16, !242, !341, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 625] [scope 0] [vswprintf]
!341 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !342, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!342 = !{!19, !257, !290, !267, !335}
!343 = !{!"0x8\00170\00", !44, !344}              ; [ DW_TAG_imported_declaration ]
!344 = !{!"0x2e\00vswscanf\00vswscanf\00\00701\000\000\000\000\00256\000\000", !16, !242, !345, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 701] [scope 0] [vswscanf]
!345 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !346, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!346 = !{!19, !267, !267, !335}
!347 = !{!"0x8\00172\00", !44, !348}              ; [ DW_TAG_imported_declaration ]
!348 = !{!"0x2e\00vwprintf\00vwprintf\00\00620\000\000\000\000\00256\000\000", !16, !242, !349, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 620] [scope 0] [vwprintf]
!349 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !350, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!350 = !{!19, !267, !335}
!351 = !{!"0x8\00174\00", !44, !352}              ; [ DW_TAG_imported_declaration ]
!352 = !{!"0x2e\00vwscanf\00vwscanf\00\00697\000\000\000\000\00256\000\000", !16, !242, !349, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 697] [scope 0] [vwscanf]
!353 = !{!"0x8\00176\00", !44, !354}              ; [ DW_TAG_imported_declaration ]
!354 = !{!"0x2e\00wcrtomb\00wcrtomb\00\00370\000\000\000\000\00256\000\000", !16, !242, !355, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 370] [scope 0] [wcrtomb]
!355 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !356, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!356 = !{!290, !357, !256, !295}
!357 = !{!"0x37\00\000\000\000\000\000", null, null, !358} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!358 = !{!"0xf\00\000\0064\0064\000\000", null, null, !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!359 = !{!"0x8\00177\00", !44, !360}              ; [ DW_TAG_imported_declaration ]
!360 = !{!"0x2e\00wcscat\00wcscat\00\00155\000\000\000\000\00256\000\000", !16, !242, !361, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 155] [scope 0] [wcscat]
!361 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !362, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!362 = !{!255, !257, !267}
!363 = !{!"0x8\00178\00", !44, !364}              ; [ DW_TAG_imported_declaration ]
!364 = !{!"0x2e\00wcscmp\00wcscmp\00\00163\000\000\000\000\00256\000\000", !16, !242, !365, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 163] [scope 0] [wcscmp]
!365 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !366, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!366 = !{!19, !268, !268}
!367 = !{!"0x8\00179\00", !44, !368}              ; [ DW_TAG_imported_declaration ]
!368 = !{!"0x2e\00wcscoll\00wcscoll\00\00192\000\000\000\000\00256\000\000", !16, !242, !365, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 192] [scope 0] [wcscoll]
!369 = !{!"0x8\00180\00", !44, !370}              ; [ DW_TAG_imported_declaration ]
!370 = !{!"0x2e\00wcscpy\00wcscpy\00\00147\000\000\000\000\00256\000\000", !16, !242, !361, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 147] [scope 0] [wcscpy]
!371 = !{!"0x8\00181\00", !44, !372}              ; [ DW_TAG_imported_declaration ]
!372 = !{!"0x2e\00wcscspn\00wcscspn\00\00252\000\000\000\000\00256\000\000", !16, !242, !373, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 252] [scope 0] [wcscspn]
!373 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !374, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!374 = !{!290, !268, !268}
!375 = !{!"0x8\00182\00", !44, !376}              ; [ DW_TAG_imported_declaration ]
!376 = !{!"0x2e\00wcsftime\00wcsftime\00\00855\000\000\000\000\00256\000\000", !16, !242, !377, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 855] [scope 0] [wcsftime]
!377 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !378, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!378 = !{!290, !257, !290, !267, !379}
!379 = !{!"0x37\00\000\000\000\000\000", null, null, !380} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!380 = !{!"0xf\00\000\0064\0064\000\000", null, null, !381} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!381 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS2tm"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS2tm]
!382 = !{!"0x8\00183\00", !44, !383}              ; [ DW_TAG_imported_declaration ]
!383 = !{!"0x2e\00wcslen\00wcslen\00\00287\000\000\000\000\00256\000\000", !16, !242, !384, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 287] [scope 0] [wcslen]
!384 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !385, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!385 = !{!290, !268}
!386 = !{!"0x8\00184\00", !44, !387}              ; [ DW_TAG_imported_declaration ]
!387 = !{!"0x2e\00wcsncat\00wcsncat\00\00158\000\000\000\000\00256\000\000", !16, !242, !388, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 158] [scope 0] [wcsncat]
!388 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !389, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!389 = !{!255, !257, !267, !290}
!390 = !{!"0x8\00185\00", !44, !391}              ; [ DW_TAG_imported_declaration ]
!391 = !{!"0x2e\00wcsncmp\00wcsncmp\00\00166\000\000\000\000\00256\000\000", !16, !242, !392, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 166] [scope 0] [wcsncmp]
!392 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !393, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!393 = !{!19, !268, !268, !290}
!394 = !{!"0x8\00186\00", !44, !395}              ; [ DW_TAG_imported_declaration ]
!395 = !{!"0x2e\00wcsncpy\00wcsncpy\00\00150\000\000\000\000\00256\000\000", !16, !242, !388, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 150] [scope 0] [wcsncpy]
!396 = !{!"0x8\00187\00", !44, !397}              ; [ DW_TAG_imported_declaration ]
!397 = !{!"0x2e\00wcsrtombs\00wcsrtombs\00\00414\000\000\000\000\00256\000\000", !16, !242, !398, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 414] [scope 0] [wcsrtombs]
!398 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !399, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!399 = !{!290, !357, !400, !290, !295}
!400 = !{!"0x37\00\000\000\000\000\000", null, null, !401} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!401 = !{!"0xf\00\000\0064\0064\000\000", null, null, !268} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!402 = !{!"0x8\00188\00", !44, !403}              ; [ DW_TAG_imported_declaration ]
!403 = !{!"0x2e\00wcsspn\00wcsspn\00\00256\000\000\000\000\00256\000\000", !16, !242, !373, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 256] [scope 0] [wcsspn]
!404 = !{!"0x8\00189\00", !44, !405}              ; [ DW_TAG_imported_declaration ]
!405 = !{!"0x2e\00wcstod\00wcstod\00\00450\000\000\000\000\00256\000\000", !16, !242, !406, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 450] [scope 0] [wcstod]
!406 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !407, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!407 = !{!408, !267, !409}
!408 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!409 = !{!"0x37\00\000\000\000\000\000", null, null, !410} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!410 = !{!"0xf\00\000\0064\0064\000\000", null, null, !255} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!411 = !{!"0x8\00191\00", !44, !412}              ; [ DW_TAG_imported_declaration ]
!412 = !{!"0x2e\00wcstof\00wcstof\00\00457\000\000\000\000\00256\000\000", !16, !242, !413, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 457] [scope 0] [wcstof]
!413 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !414, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!414 = !{!415, !267, !409}
!415 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!416 = !{!"0x8\00193\00", !44, !417}              ; [ DW_TAG_imported_declaration ]
!417 = !{!"0x2e\00wcstok\00wcstok\00\00282\000\000\000\000\00256\000\000", !16, !242, !418, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 282] [scope 0] [wcstok]
!418 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !419, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!419 = !{!255, !257, !267, !409}
!420 = !{!"0x8\00194\00", !44, !421}              ; [ DW_TAG_imported_declaration ]
!421 = !{!"0x2e\00wcstol\00wcstol\00\00468\000\000\000\000\00256\000\000", !16, !242, !422, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 468] [scope 0] [wcstol]
!422 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !423, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!423 = !{!424, !267, !409, !19}
!424 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!425 = !{!"0x8\00195\00", !44, !426}              ; [ DW_TAG_imported_declaration ]
!426 = !{!"0x2e\00wcstoul\00wcstoul\00\00473\000\000\000\000\00256\000\000", !16, !242, !427, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 473] [scope 0] [wcstoul]
!427 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !428, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!428 = !{!291, !267, !409, !19}
!429 = !{!"0x8\00196\00", !44, !430}              ; [ DW_TAG_imported_declaration ]
!430 = !{!"0x2e\00wcsxfrm\00wcsxfrm\00\00196\000\000\000\000\00256\000\000", !16, !242, !431, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 196] [scope 0] [wcsxfrm]
!431 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !432, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!432 = !{!290, !257, !267, !290}
!433 = !{!"0x8\00197\00", !44, !434}              ; [ DW_TAG_imported_declaration ]
!434 = !{!"0x2e\00wctob\00wctob\00\00357\000\000\000\000\00256\000\000", !16, !242, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 357] [scope 0] [wctob]
!435 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !436, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!436 = !{!19, !238}
!437 = !{!"0x8\00198\00", !44, !438}              ; [ DW_TAG_imported_declaration ]
!438 = !{!"0x2e\00wmemcmp\00wmemcmp\00\00325\000\000\000\000\00256\000\000", !16, !242, !392, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 325] [scope 0] [wmemcmp]
!439 = !{!"0x8\00199\00", !44, !440}              ; [ DW_TAG_imported_declaration ]
!440 = !{!"0x2e\00wmemcpy\00wmemcpy\00\00329\000\000\000\000\00256\000\000", !16, !242, !388, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 329] [scope 0] [wmemcpy]
!441 = !{!"0x8\00200\00", !44, !442}              ; [ DW_TAG_imported_declaration ]
!442 = !{!"0x2e\00wmemmove\00wmemmove\00\00334\000\000\000\000\00256\000\000", !16, !242, !443, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 334] [scope 0] [wmemmove]
!443 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !444, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!444 = !{!255, !255, !268, !290}
!445 = !{!"0x8\00201\00", !44, !446}              ; [ DW_TAG_imported_declaration ]
!446 = !{!"0x2e\00wmemset\00wmemset\00\00338\000\000\000\000\00256\000\000", !16, !242, !447, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 338] [scope 0] [wmemset]
!447 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !448, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!448 = !{!255, !255, !256, !290}
!449 = !{!"0x8\00202\00", !44, !450}              ; [ DW_TAG_imported_declaration ]
!450 = !{!"0x2e\00wprintf\00wprintf\00\00601\000\000\000\000\00256\000\000", !16, !242, !451, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 601] [scope 0] [wprintf]
!451 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !452, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!452 = !{!19, !267, null}
!453 = !{!"0x8\00203\00", !44, !454}              ; [ DW_TAG_imported_declaration ]
!454 = !{!"0x2e\00wscanf\00wscanf\00\00642\000\000\000\000\00256\000\000", !16, !242, !451, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 642] [scope 0] [wscanf]
!455 = !{!"0x8\00204\00", !44, !456}              ; [ DW_TAG_imported_declaration ]
!456 = !{!"0x2e\00wcschr\00wcschr\00\00227\000\000\000\000\00256\000\000", !16, !242, !457, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 227] [scope 0] [wcschr]
!457 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !458, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!458 = !{!255, !268, !256}
!459 = !{!"0x8\00205\00", !44, !460}              ; [ DW_TAG_imported_declaration ]
!460 = !{!"0x2e\00wcspbrk\00wcspbrk\00\00266\000\000\000\000\00256\000\000", !16, !242, !461, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 266] [scope 0] [wcspbrk]
!461 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !462, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!462 = !{!255, !268, !268}
!463 = !{!"0x8\00206\00", !44, !464}              ; [ DW_TAG_imported_declaration ]
!464 = !{!"0x2e\00wcsrchr\00wcsrchr\00\00237\000\000\000\000\00256\000\000", !16, !242, !457, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 237] [scope 0] [wcsrchr]
!465 = !{!"0x8\00207\00", !44, !466}              ; [ DW_TAG_imported_declaration ]
!466 = !{!"0x2e\00wcsstr\00wcsstr\00\00277\000\000\000\000\00256\000\000", !16, !242, !461, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 277] [scope 0] [wcsstr]
!467 = !{!"0x8\00208\00", !44, !468}              ; [ DW_TAG_imported_declaration ]
!468 = !{!"0x2e\00wmemchr\00wmemchr\00\00320\000\000\000\000\00256\000\000", !16, !242, !469, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 320] [scope 0] [wmemchr]
!469 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !470, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!470 = !{!255, !268, !256, !290}
!471 = !{!"0x8\00248\00", !472, !474}             ; [ DW_TAG_imported_declaration ]
!472 = !{!"0x39\00__gnu_cxx\00241", !473, null}   ; [ DW_TAG_namespace ] [__gnu_cxx] [line 241]
!473 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/cwchar", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!474 = !{!"0x2e\00wcstold\00wcstold\00\00459\000\000\000\000\00256\000\000", !16, !242, !475, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 459] [scope 0] [wcstold]
!475 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !476, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!476 = !{!477, !267, !409}
!477 = !{!"0x24\00long double\000\00128\00128\000\000\004", null, null} ; [ DW_TAG_base_type ] [long double] [line 0, size 128, align 128, offset 0, enc DW_ATE_float]
!478 = !{!"0x8\00257\00", !472, !479}             ; [ DW_TAG_imported_declaration ]
!479 = !{!"0x2e\00wcstoll\00wcstoll\00\00483\000\000\000\000\00256\000\000", !16, !242, !480, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 483] [scope 0] [wcstoll]
!480 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !481, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!481 = !{!482, !267, !409, !19}
!482 = !{!"0x24\00long long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!483 = !{!"0x8\00258\00", !472, !484}             ; [ DW_TAG_imported_declaration ]
!484 = !{!"0x2e\00wcstoull\00wcstoull\00\00490\000\000\000\000\00256\000\000", !16, !242, !485, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 490] [scope 0] [wcstoull]
!485 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !486, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!486 = !{!487, !267, !409, !19}
!487 = !{!"0x24\00long long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!488 = !{!"0x8\00264\00", !44, !474}              ; [ DW_TAG_imported_declaration ]
!489 = !{!"0x8\00265\00", !44, !479}              ; [ DW_TAG_imported_declaration ]
!490 = !{!"0x8\00266\00", !44, !484}              ; [ DW_TAG_imported_declaration ]
!491 = !{!"0x3a\0056\00", !492, !494}             ; [ DW_TAG_imported_module ]
!492 = !{!"0x39\00__gnu_debug\0054", !493, null}  ; [ DW_TAG_namespace ] [__gnu_debug] [line 54]
!493 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/debug/debug.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!494 = !{!"0x39\00__debug\0048", !493, !44}       ; [ DW_TAG_namespace ] [__debug] [line 48]
!495 = !{!"0x8\0053\00", !44, !"_ZTS5lconv"}      ; [ DW_TAG_imported_declaration ]
!496 = !{!"0x8\0054\00", !44, !497}               ; [ DW_TAG_imported_declaration ]
!497 = !{!"0x2e\00setlocale\00setlocale\00\00124\000\000\000\000\00256\000\000", !41, !498, !499, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 124] [scope 0] [setlocale]
!498 = !{!"0x29", !41}                            ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon//usr/include/locale.h]
!499 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !500, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!500 = !{!358, !19, !293}
!501 = !{!"0x8\0055\00", !44, !502}               ; [ DW_TAG_imported_declaration ]
!502 = !{!"0x2e\00localeconv\00localeconv\00\00127\000\000\000\000\00256\000\000", !41, !498, !503, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 127] [scope 0] [localeconv]
!503 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !504, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!504 = !{!505}
!505 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS5lconv"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS5lconv]
!506 = !{!"0x8\0064\00", !44, !507}               ; [ DW_TAG_imported_declaration ]
!507 = !{!"0x2e\00isalnum\00isalnum\00\00110\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 110] [scope 0] [isalnum]
!508 = !{!"/usr/include/ctype.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!509 = !{!"0x29", !508}                           ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon//usr/include/ctype.h]
!510 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !511, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!511 = !{!19, !19}
!512 = !{!"0x8\0065\00", !44, !513}               ; [ DW_TAG_imported_declaration ]
!513 = !{!"0x2e\00isalpha\00isalpha\00\00111\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 111] [scope 0] [isalpha]
!514 = !{!"0x8\0066\00", !44, !515}               ; [ DW_TAG_imported_declaration ]
!515 = !{!"0x2e\00iscntrl\00iscntrl\00\00112\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 112] [scope 0] [iscntrl]
!516 = !{!"0x8\0067\00", !44, !517}               ; [ DW_TAG_imported_declaration ]
!517 = !{!"0x2e\00isdigit\00isdigit\00\00113\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 113] [scope 0] [isdigit]
!518 = !{!"0x8\0068\00", !44, !519}               ; [ DW_TAG_imported_declaration ]
!519 = !{!"0x2e\00isgraph\00isgraph\00\00115\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 115] [scope 0] [isgraph]
!520 = !{!"0x8\0069\00", !44, !521}               ; [ DW_TAG_imported_declaration ]
!521 = !{!"0x2e\00islower\00islower\00\00114\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 114] [scope 0] [islower]
!522 = !{!"0x8\0070\00", !44, !523}               ; [ DW_TAG_imported_declaration ]
!523 = !{!"0x2e\00isprint\00isprint\00\00116\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 116] [scope 0] [isprint]
!524 = !{!"0x8\0071\00", !44, !525}               ; [ DW_TAG_imported_declaration ]
!525 = !{!"0x2e\00ispunct\00ispunct\00\00117\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 117] [scope 0] [ispunct]
!526 = !{!"0x8\0072\00", !44, !527}               ; [ DW_TAG_imported_declaration ]
!527 = !{!"0x2e\00isspace\00isspace\00\00118\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 118] [scope 0] [isspace]
!528 = !{!"0x8\0073\00", !44, !529}               ; [ DW_TAG_imported_declaration ]
!529 = !{!"0x2e\00isupper\00isupper\00\00119\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 119] [scope 0] [isupper]
!530 = !{!"0x8\0074\00", !44, !531}               ; [ DW_TAG_imported_declaration ]
!531 = !{!"0x2e\00isxdigit\00isxdigit\00\00120\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 120] [scope 0] [isxdigit]
!532 = !{!"0x8\0075\00", !44, !533}               ; [ DW_TAG_imported_declaration ]
!533 = !{!"0x2e\00tolower\00tolower\00\00124\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 124] [scope 0] [tolower]
!534 = !{!"0x8\0076\00", !44, !535}               ; [ DW_TAG_imported_declaration ]
!535 = !{!"0x2e\00toupper\00toupper\00\00127\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 127] [scope 0] [toupper]
!536 = !{!"0x8\0044\00", !472, !537}              ; [ DW_TAG_imported_declaration ]
!537 = !{!"0x16\00size_t\00186\000\000\000\000", !538, !44, !291} ; [ DW_TAG_typedef ] [size_t] [line 186, size 0, align 0, offset 0] [from long unsigned int]
!538 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/x86_64-linux-gnu/c++/4.8/bits/c++config.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!539 = !{!"0x8\0045\00", !472, !540}              ; [ DW_TAG_imported_declaration ]
!540 = !{!"0x16\00ptrdiff_t\00187\000\000\000\000", !538, !44, !424} ; [ DW_TAG_typedef ] [ptrdiff_t] [line 187, size 0, align 0, offset 0] [from long int]
!541 = !{!"0x8\0082\00", !44, !542}               ; [ DW_TAG_imported_declaration ]
!542 = !{!"0x16\00wctrans_t\00186\000\000\000\000", !543, null, !544} ; [ DW_TAG_typedef ] [wctrans_t] [line 186, size 0, align 0, offset 0] [from ]
!543 = !{!"/usr/include/wctype.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!544 = !{!"0xf\00\000\0064\0064\000\000", null, null, !545} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!545 = !{!"0x26\00\000\000\000\000\000", null, null, !546} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from __int32_t]
!546 = !{!"0x16\00__int32_t\0040\000\000\000\000", !547, null, !19} ; [ DW_TAG_typedef ] [__int32_t] [line 40, size 0, align 0, offset 0] [from int]
!547 = !{!"/usr/include/x86_64-linux-gnu/bits/types.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!548 = !{!"0x8\0083\00", !44, !549}               ; [ DW_TAG_imported_declaration ]
!549 = !{!"0x16\00wctype_t\0052\000\000\000\000", !543, null, !291} ; [ DW_TAG_typedef ] [wctype_t] [line 52, size 0, align 0, offset 0] [from long unsigned int]
!550 = !{!"0x8\0084\00", !44, !238}               ; [ DW_TAG_imported_declaration ]
!551 = !{!"0x8\0086\00", !44, !552}               ; [ DW_TAG_imported_declaration ]
!552 = !{!"0x2e\00iswalnum\00iswalnum\00\00111\000\000\000\000\00256\000\000", !543, !553, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 111] [scope 0] [iswalnum]
!553 = !{!"0x29", !543}                           ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon//usr/include/wctype.h]
!554 = !{!"0x8\0087\00", !44, !555}               ; [ DW_TAG_imported_declaration ]
!555 = !{!"0x2e\00iswalpha\00iswalpha\00\00117\000\000\000\000\00256\000\000", !543, !553, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 117] [scope 0] [iswalpha]
!556 = !{!"0x8\0089\00", !44, !557}               ; [ DW_TAG_imported_declaration ]
!557 = !{!"0x2e\00iswblank\00iswblank\00\00162\000\000\000\000\00256\000\000", !543, !553, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 162] [scope 0] [iswblank]
!558 = !{!"0x8\0091\00", !44, !559}               ; [ DW_TAG_imported_declaration ]
!559 = !{!"0x2e\00iswcntrl\00iswcntrl\00\00120\000\000\000\000\00256\000\000", !543, !553, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 120] [scope 0] [iswcntrl]
!560 = !{!"0x8\0092\00", !44, !561}               ; [ DW_TAG_imported_declaration ]
!561 = !{!"0x2e\00iswctype\00iswctype\00\00175\000\000\000\000\00256\000\000", !543, !553, !562, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 175] [scope 0] [iswctype]
!562 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !563, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!563 = !{!19, !238, !549}
!564 = !{!"0x8\0093\00", !44, !565}               ; [ DW_TAG_imported_declaration ]
!565 = !{!"0x2e\00iswdigit\00iswdigit\00\00124\000\000\000\000\00256\000\000", !543, !553, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 124] [scope 0] [iswdigit]
!566 = !{!"0x8\0094\00", !44, !567}               ; [ DW_TAG_imported_declaration ]
!567 = !{!"0x2e\00iswgraph\00iswgraph\00\00128\000\000\000\000\00256\000\000", !543, !553, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 128] [scope 0] [iswgraph]
!568 = !{!"0x8\0095\00", !44, !569}               ; [ DW_TAG_imported_declaration ]
!569 = !{!"0x2e\00iswlower\00iswlower\00\00133\000\000\000\000\00256\000\000", !543, !553, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 133] [scope 0] [iswlower]
!570 = !{!"0x8\0096\00", !44, !571}               ; [ DW_TAG_imported_declaration ]
!571 = !{!"0x2e\00iswprint\00iswprint\00\00136\000\000\000\000\00256\000\000", !543, !553, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 136] [scope 0] [iswprint]
!572 = !{!"0x8\0097\00", !44, !573}               ; [ DW_TAG_imported_declaration ]
!573 = !{!"0x2e\00iswpunct\00iswpunct\00\00141\000\000\000\000\00256\000\000", !543, !553, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 141] [scope 0] [iswpunct]
!574 = !{!"0x8\0098\00", !44, !575}               ; [ DW_TAG_imported_declaration ]
!575 = !{!"0x2e\00iswspace\00iswspace\00\00146\000\000\000\000\00256\000\000", !543, !553, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 146] [scope 0] [iswspace]
!576 = !{!"0x8\0099\00", !44, !577}               ; [ DW_TAG_imported_declaration ]
!577 = !{!"0x2e\00iswupper\00iswupper\00\00151\000\000\000\000\00256\000\000", !543, !553, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 151] [scope 0] [iswupper]
!578 = !{!"0x8\00100\00", !44, !579}              ; [ DW_TAG_imported_declaration ]
!579 = !{!"0x2e\00iswxdigit\00iswxdigit\00\00156\000\000\000\000\00256\000\000", !543, !553, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 156] [scope 0] [iswxdigit]
!580 = !{!"0x8\00101\00", !44, !581}              ; [ DW_TAG_imported_declaration ]
!581 = !{!"0x2e\00towctrans\00towctrans\00\00221\000\000\000\000\00256\000\000", !543, !553, !582, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 221] [scope 0] [towctrans]
!582 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !583, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!583 = !{!238, !238, !542}
!584 = !{!"0x8\00102\00", !44, !585}              ; [ DW_TAG_imported_declaration ]
!585 = !{!"0x2e\00towlower\00towlower\00\00194\000\000\000\000\00256\000\000", !543, !553, !586, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 194] [scope 0] [towlower]
!586 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !587, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!587 = !{!238, !238}
!588 = !{!"0x8\00103\00", !44, !589}              ; [ DW_TAG_imported_declaration ]
!589 = !{!"0x2e\00towupper\00towupper\00\00197\000\000\000\000\00256\000\000", !543, !553, !586, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 197] [scope 0] [towupper]
!590 = !{!"0x8\00104\00", !44, !591}              ; [ DW_TAG_imported_declaration ]
!591 = !{!"0x2e\00wctrans\00wctrans\00\00218\000\000\000\000\00256\000\000", !543, !553, !592, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 218] [scope 0] [wctrans]
!592 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !593, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!593 = !{!542, !293}
!594 = !{!"0x8\00105\00", !44, !595}              ; [ DW_TAG_imported_declaration ]
!595 = !{!"0x2e\00wctype\00wctype\00\00171\000\000\000\000\00256\000\000", !543, !553, !596, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 171] [scope 0] [wctype]
!596 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !597, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!597 = !{!549, !293}
!598 = !{!"0x3a\0028\00", !0, !44}                ; [ DW_TAG_imported_module ]
!599 = !{i32 2, !"Dwarf Version", i32 4}
!600 = !{i32 2, !"Debug Info Version", i32 2}
!601 = !{!"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp", !0}
!602 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!603 = !MDLocation(line: 74, column: 25, scope: !195)
!604 = !{!"0x101\00x\0016777249\000", !199, !200, !19} ; [ DW_TAG_arg_variable ] [x] [line 33]
!605 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!606 = !MDLocation(line: 33, column: 26, scope: !199)
!607 = !{!"0x101\00y\0033554465\000", !199, !200, !19} ; [ DW_TAG_arg_variable ] [y] [line 33]
!608 = !MDLocation(line: 33, column: 33, scope: !199)
!609 = !{!"0x100\00no\0035\000", !199, !200, !19} ; [ DW_TAG_auto_variable ] [no] [line 35]
!610 = !MDLocation(line: 35, column: 6, scope: !199)
!611 = !MDLocation(line: 37, column: 5, scope: !612)
!612 = !{!"0xb\0037\005\000", !1, !199}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!613 = !MDLocation(line: 37, column: 5, scope: !199)
!614 = !MDLocation(line: 37, column: 14, scope: !615)
!615 = !{!"0xb\001", !1, !612}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!616 = !MDLocation(line: 37, column: 24, scope: !617)
!617 = !{!"0xb\002", !1, !612}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!618 = !MDLocation(line: 37, column: 33, scope: !619)
!619 = !{!"0xb\003", !1, !612}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!620 = !MDLocation(line: 39, column: 6, scope: !621)
!621 = !{!"0xb\0039\006\002", !1, !622}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!622 = !{!"0xb\0038\002\001", !1, !612}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!623 = !MDLocation(line: 39, column: 6, scope: !622)
!624 = !MDLocation(line: 40, column: 7, scope: !625)
!625 = !{!"0xb\0040\007\003", !1, !621}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!626 = !MDLocation(line: 40, column: 21, scope: !625)
!627 = !MDLocation(line: 40, column: 17, scope: !625)
!628 = !MDLocation(line: 40, column: 12, scope: !625)
!629 = !MDLocation(line: 40, column: 7, scope: !621)
!630 = !MDLocation(line: 41, column: 5, scope: !625)
!631 = !MDLocation(line: 40, column: 23, scope: !632)
!632 = !{!"0xb\001", !1, !625}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!633 = !MDLocation(line: 43, column: 6, scope: !634)
!634 = !{!"0xb\0043\006\004", !1, !622}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!635 = !MDLocation(line: 43, column: 6, scope: !622)
!636 = !MDLocation(line: 44, column: 7, scope: !637)
!637 = !{!"0xb\0044\007\005", !1, !634}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!638 = !MDLocation(line: 44, column: 13, scope: !637)
!639 = !MDLocation(line: 44, column: 7, scope: !634)
!640 = !MDLocation(line: 45, column: 5, scope: !637)
!641 = !MDLocation(line: 44, column: 18, scope: !642)
!642 = !{!"0xb\001", !1, !637}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!643 = !MDLocation(line: 47, column: 8, scope: !622)
!644 = !MDLocation(line: 47, column: 10, scope: !622)
!645 = !MDLocation(line: 47, column: 3, scope: !622)
!646 = !MDLocation(line: 49, column: 6, scope: !647)
!647 = !{!"0xb\0049\006\006", !1, !622}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!648 = !MDLocation(line: 49, column: 6, scope: !622)
!649 = !MDLocation(line: 49, column: 13, scope: !650)
!650 = !{!"0xb\001", !1, !647}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!651 = !MDLocation(line: 50, column: 6, scope: !652)
!652 = !{!"0xb\0050\006\007", !1, !622}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!653 = !MDLocation(line: 50, column: 6, scope: !622)
!654 = !MDLocation(line: 50, column: 13, scope: !655)
!655 = !{!"0xb\001", !1, !652}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!656 = !MDLocation(line: 51, column: 6, scope: !657)
!657 = !{!"0xb\0051\006\008", !1, !622}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!658 = !MDLocation(line: 51, column: 6, scope: !622)
!659 = !MDLocation(line: 51, column: 13, scope: !660)
!660 = !{!"0xb\001", !1, !657}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!661 = !MDLocation(line: 52, column: 6, scope: !662)
!662 = !{!"0xb\0052\006\009", !1, !622}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!663 = !MDLocation(line: 52, column: 6, scope: !622)
!664 = !MDLocation(line: 52, column: 13, scope: !665)
!665 = !{!"0xb\001", !1, !662}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!666 = !MDLocation(line: 53, column: 6, scope: !667)
!667 = !{!"0xb\0053\006\0010", !1, !622}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!668 = !MDLocation(line: 53, column: 6, scope: !622)
!669 = !MDLocation(line: 53, column: 13, scope: !670)
!670 = !{!"0xb\001", !1, !667}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!671 = !MDLocation(line: 54, column: 6, scope: !672)
!672 = !{!"0xb\0054\006\0011", !1, !622}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!673 = !MDLocation(line: 54, column: 6, scope: !622)
!674 = !MDLocation(line: 54, column: 13, scope: !675)
!675 = !{!"0xb\001", !1, !672}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!676 = !MDLocation(line: 55, column: 6, scope: !677)
!677 = !{!"0xb\0055\006\0012", !1, !622}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!678 = !MDLocation(line: 55, column: 6, scope: !622)
!679 = !MDLocation(line: 55, column: 13, scope: !680)
!680 = !{!"0xb\001", !1, !677}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!681 = !MDLocation(line: 56, column: 6, scope: !682)
!682 = !{!"0xb\0056\006\0013", !1, !622}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!683 = !MDLocation(line: 56, column: 6, scope: !622)
!684 = !MDLocation(line: 56, column: 13, scope: !685)
!685 = !{!"0xb\001", !1, !682}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!686 = !MDLocation(line: 58, column: 10, scope: !622)
!687 = !MDLocation(line: 58, column: 3, scope: !622)
!688 = !MDLocation(line: 61, column: 2, scope: !199)
!689 = !MDLocation(line: 62, column: 1, scope: !199)
!690 = !MDLocation(line: 66, column: 18, scope: !203)
!691 = !MDLocation(line: 66, column: 18, scope: !692)
!692 = !{!"0xb\004", !1, !693}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!693 = !{!"0xb\001", !1, !203}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!694 = !MDLocation(line: 66, column: 18, scope: !695)
!695 = !{!"0xb\002", !1, !203}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!696 = !MDLocation(line: 66, column: 2, scope: !697)
!697 = !{!"0xb\003", !1, !203}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!698 = !{!"0x100\00no\0068\000", !203, !200, !19} ; [ DW_TAG_auto_variable ] [no] [line 68]
!699 = !MDLocation(line: 68, column: 6, scope: !203)
!700 = !{!"0x100\00i\0070\000", !701, !200, !19}  ; [ DW_TAG_auto_variable ] [i] [line 70]
!701 = !{!"0xb\0070\002\0014", !1, !203}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!702 = !MDLocation(line: 70, column: 10, scope: !701)
!703 = !MDLocation(line: 70, column: 6, scope: !701)
!704 = !MDLocation(line: 70, column: 17, scope: !705)
!705 = !{!"0xb\002", !1, !706}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!706 = !{!"0xb\001", !1, !707}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!707 = !{!"0xb\0070\002\0015", !1, !701}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!708 = !MDLocation(line: 70, column: 2, scope: !701)
!709 = !MDLocation(line: 71, column: 17, scope: !707)
!710 = !MDLocation(line: 71, column: 3, scope: !707)
!711 = !MDLocation(line: 70, column: 25, scope: !707)
!712 = !MDLocation(line: 70, column: 2, scope: !707)
!713 = !MDLocation(line: 103, column: 1, scope: !203)
!714 = !MDLocation(line: 74, column: 10, scope: !715)
!715 = !{!"0xb\0074\002\0016", !1, !203}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!716 = !{!"0x100\00y\0074\000", !715, !200, !19}  ; [ DW_TAG_auto_variable ] [y] [line 74]
!717 = !MDLocation(line: 74, column: 6, scope: !715)
!718 = !MDLocation(line: 74, column: 17, scope: !719)
!719 = !{!"0xb\002", !1, !720}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!720 = !{!"0xb\001", !1, !721}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!721 = !{!"0xb\0074\002\0017", !1, !715}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!722 = !MDLocation(line: 74, column: 2, scope: !715)
!723 = !MDLocation(line: 76, column: 11, scope: !724)
!724 = !{!"0xb\0076\003\0019", !1, !725}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!725 = !{!"0xb\0075\002\0018", !1, !721}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!726 = !{!"0x100\00x\0076\000", !724, !200, !19}  ; [ DW_TAG_auto_variable ] [x] [line 76]
!727 = !MDLocation(line: 76, column: 7, scope: !724)
!728 = !MDLocation(line: 76, column: 18, scope: !729)
!729 = !{!"0xb\002", !1, !730}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!730 = !{!"0xb\001", !1, !731}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!731 = !{!"0xb\0076\003\0020", !1, !724}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!732 = !MDLocation(line: 76, column: 3, scope: !724)
!733 = !{!"0x100\00out\0078\000", !734, !200, !19} ; [ DW_TAG_auto_variable ] [out] [line 78]
!734 = !{!"0xb\0077\003\0021", !1, !731}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!735 = !MDLocation(line: 78, column: 8, scope: !734)
!736 = !MDLocation(line: 80, column: 7, scope: !737)
!737 = !{!"0xb\0080\007\0022", !1, !734}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!738 = !MDLocation(line: 80, column: 7, scope: !734)
!739 = !MDLocation(line: 80, column: 16, scope: !740)
!740 = !{!"0xb\001", !1, !737}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!741 = !MDLocation(line: 80, column: 26, scope: !742)
!742 = !{!"0xb\002", !1, !737}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!743 = !MDLocation(line: 80, column: 35, scope: !744)
!744 = !{!"0xb\003", !1, !737}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!745 = !MDLocation(line: 82, column: 8, scope: !746)
!746 = !{!"0xb\0082\008\0024", !1, !747}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!747 = !{!"0xb\0081\004\0023", !1, !737}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!748 = !MDLocation(line: 82, column: 8, scope: !747)
!749 = !MDLocation(line: 83, column: 9, scope: !750)
!750 = !{!"0xb\0083\009\0025", !1, !746}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!751 = !MDLocation(line: 83, column: 23, scope: !750)
!752 = !MDLocation(line: 83, column: 19, scope: !750)
!753 = !MDLocation(line: 83, column: 14, scope: !750)
!754 = !MDLocation(line: 83, column: 9, scope: !746)
!755 = !MDLocation(line: 84, column: 7, scope: !750)
!756 = !MDLocation(line: 83, column: 25, scope: !757)
!757 = !{!"0xb\001", !1, !750}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!758 = !MDLocation(line: 86, column: 8, scope: !759)
!759 = !{!"0xb\0086\008\0026", !1, !747}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!760 = !MDLocation(line: 86, column: 8, scope: !747)
!761 = !MDLocation(line: 87, column: 9, scope: !762)
!762 = !{!"0xb\0087\009\0027", !1, !759}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!763 = !MDLocation(line: 87, column: 15, scope: !762)
!764 = !MDLocation(line: 87, column: 9, scope: !759)
!765 = !MDLocation(line: 88, column: 7, scope: !762)
!766 = !MDLocation(line: 87, column: 20, scope: !767)
!767 = !{!"0xb\001", !1, !762}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!768 = !MDLocation(line: 89, column: 4, scope: !747)
!769 = !MDLocation(line: 91, column: 8, scope: !770)
!770 = !{!"0xb\0091\007\0028", !1, !734}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!771 = !MDLocation(line: 91, column: 7, scope: !734)
!772 = !MDLocation(line: 93, column: 19, scope: !773)
!773 = !{!"0xb\0092\004\0029", !1, !770}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!774 = !MDLocation(line: 93, column: 5, scope: !773)
!775 = !MDLocation(line: 93, column: 47, scope: !773)
!776 = !MDLocation(line: 93, column: 52, scope: !773)
!777 = !MDLocation(line: 93, column: 30, scope: !773)
!778 = !MDLocation(line: 94, column: 19, scope: !773)
!779 = !MDLocation(line: 94, column: 5, scope: !773)
!780 = !MDLocation(line: 94, column: 47, scope: !773)
!781 = !MDLocation(line: 94, column: 52, scope: !773)
!782 = !MDLocation(line: 94, column: 30, scope: !773)
!783 = !MDLocation(line: 95, column: 19, scope: !773)
!784 = !MDLocation(line: 95, column: 5, scope: !773)
!785 = !MDLocation(line: 95, column: 47, scope: !773)
!786 = !MDLocation(line: 95, column: 52, scope: !773)
!787 = !MDLocation(line: 95, column: 30, scope: !773)
!788 = !MDLocation(line: 96, column: 19, scope: !773)
!789 = !MDLocation(line: 96, column: 5, scope: !773)
!790 = !MDLocation(line: 96, column: 47, scope: !773)
!791 = !MDLocation(line: 96, column: 52, scope: !773)
!792 = !MDLocation(line: 96, column: 30, scope: !773)
!793 = !MDLocation(line: 97, column: 19, scope: !773)
!794 = !MDLocation(line: 97, column: 5, scope: !773)
!795 = !MDLocation(line: 97, column: 47, scope: !773)
!796 = !MDLocation(line: 97, column: 52, scope: !773)
!797 = !MDLocation(line: 97, column: 30, scope: !773)
!798 = !MDLocation(line: 98, column: 19, scope: !773)
!799 = !MDLocation(line: 98, column: 5, scope: !773)
!800 = !MDLocation(line: 98, column: 47, scope: !773)
!801 = !MDLocation(line: 98, column: 52, scope: !773)
!802 = !MDLocation(line: 98, column: 30, scope: !773)
!803 = !MDLocation(line: 99, column: 5, scope: !773)
!804 = !MDLocation(line: 100, column: 4, scope: !773)
!805 = !MDLocation(line: 101, column: 3, scope: !734)
!806 = !MDLocation(line: 76, column: 26, scope: !731)
!807 = !MDLocation(line: 76, column: 3, scope: !731)
!808 = !MDLocation(line: 102, column: 2, scope: !725)
!809 = !MDLocation(line: 74, column: 25, scope: !721)
!810 = !MDLocation(line: 74, column: 2, scope: !721)
!811 = !MDLocation(line: 103, column: 1, scope: !693)
!812 = !{!"0x101\00this\0016777216\001088", !225, null, !231} ; [ DW_TAG_arg_variable ] [this] [line 0]
!813 = !MDLocation(line: 0, scope: !225)
!814 = !MDLocation(line: 34, column: 20, scope: !225)
!815 = !{!"0x101\00this\0016777216\001088", !224, null, !231} ; [ DW_TAG_arg_variable ] [this] [line 0]
!816 = !MDLocation(line: 0, scope: !224)
!817 = !{!"0x101\00l\0033554467\000", !224, !818, !61} ; [ DW_TAG_arg_variable ] [l] [line 35]
!818 = !{!"0x29", !58}                            ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./bitboard64.h]
!819 = !MDLocation(line: 35, column: 22, scope: !224)
!820 = !{!"0x101\00h\0050331683\000", !224, !818, !61} ; [ DW_TAG_arg_variable ] [h] [line 35]
!821 = !MDLocation(line: 35, column: 34, scope: !224)
!822 = !MDLocation(line: 35, column: 48, scope: !823)
!823 = !{!"0xb\0035\0037\00124", !58, !224}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./bitboard64.h]
!824 = !MDLocation(line: 35, column: 38, scope: !823)
!825 = !MDLocation(line: 35, column: 62, scope: !823)
!826 = !MDLocation(line: 35, column: 64, scope: !224)
!827 = !MDLocation(line: 107, column: 17, scope: !204)
!828 = !MDLocation(line: 107, column: 17, scope: !829)
!829 = !{!"0xb\004", !1, !830}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!830 = !{!"0xb\001", !1, !204}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!831 = !MDLocation(line: 107, column: 17, scope: !832)
!832 = !{!"0xb\002", !1, !204}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!833 = !MDLocation(line: 107, column: 2, scope: !834)
!834 = !{!"0xb\003", !1, !204}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!835 = !{!"0x100\00no\00109\000", !204, !200, !19} ; [ DW_TAG_auto_variable ] [no] [line 109]
!836 = !MDLocation(line: 109, column: 6, scope: !204)
!837 = !{!"0x100\00i\00111\000", !838, !200, !19} ; [ DW_TAG_auto_variable ] [i] [line 111]
!838 = !{!"0xb\00111\002\0030", !1, !204}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!839 = !MDLocation(line: 111, column: 10, scope: !838)
!840 = !MDLocation(line: 111, column: 6, scope: !838)
!841 = !MDLocation(line: 111, column: 17, scope: !842)
!842 = !{!"0xb\002", !1, !843}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!843 = !{!"0xb\001", !1, !844}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!844 = !{!"0xb\00111\002\0031", !1, !838}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!845 = !MDLocation(line: 111, column: 2, scope: !838)
!846 = !MDLocation(line: 112, column: 16, scope: !844)
!847 = !MDLocation(line: 112, column: 3, scope: !844)
!848 = !MDLocation(line: 111, column: 25, scope: !844)
!849 = !MDLocation(line: 111, column: 2, scope: !844)
!850 = !MDLocation(line: 150, column: 1, scope: !204)
!851 = !MDLocation(line: 115, column: 10, scope: !852)
!852 = !{!"0xb\00115\002\0032", !1, !204}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!853 = !{!"0x100\00y\00115\000", !852, !200, !19} ; [ DW_TAG_auto_variable ] [y] [line 115]
!854 = !MDLocation(line: 115, column: 6, scope: !852)
!855 = !MDLocation(line: 115, column: 17, scope: !856)
!856 = !{!"0xb\002", !1, !857}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!857 = !{!"0xb\001", !1, !858}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!858 = !{!"0xb\00115\002\0033", !1, !852}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!859 = !MDLocation(line: 115, column: 2, scope: !852)
!860 = !MDLocation(line: 117, column: 11, scope: !861)
!861 = !{!"0xb\00117\003\0035", !1, !862}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!862 = !{!"0xb\00116\002\0034", !1, !858}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!863 = !{!"0x100\00x\00117\000", !861, !200, !19} ; [ DW_TAG_auto_variable ] [x] [line 117]
!864 = !MDLocation(line: 117, column: 7, scope: !861)
!865 = !MDLocation(line: 117, column: 18, scope: !866)
!866 = !{!"0xb\002", !1, !867}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!867 = !{!"0xb\001", !1, !868}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!868 = !{!"0xb\00117\003\0036", !1, !861}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!869 = !MDLocation(line: 117, column: 3, scope: !861)
!870 = !{!"0x100\00out\00119\000", !871, !200, !19} ; [ DW_TAG_auto_variable ] [out] [line 119]
!871 = !{!"0xb\00118\003\0037", !1, !868}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!872 = !MDLocation(line: 119, column: 8, scope: !871)
!873 = !MDLocation(line: 121, column: 7, scope: !874)
!874 = !{!"0xb\00121\007\0038", !1, !871}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!875 = !MDLocation(line: 121, column: 7, scope: !871)
!876 = !MDLocation(line: 121, column: 16, scope: !877)
!877 = !{!"0xb\001", !1, !874}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!878 = !MDLocation(line: 121, column: 26, scope: !879)
!879 = !{!"0xb\002", !1, !874}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!880 = !MDLocation(line: 121, column: 35, scope: !881)
!881 = !{!"0xb\003", !1, !874}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!882 = !MDLocation(line: 123, column: 8, scope: !883)
!883 = !{!"0xb\00123\008\0040", !1, !884}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!884 = !{!"0xb\00122\004\0039", !1, !874}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!885 = !MDLocation(line: 123, column: 8, scope: !884)
!886 = !MDLocation(line: 124, column: 9, scope: !887)
!887 = !{!"0xb\00124\009\0041", !1, !883}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!888 = !MDLocation(line: 124, column: 23, scope: !887)
!889 = !MDLocation(line: 124, column: 19, scope: !887)
!890 = !MDLocation(line: 124, column: 14, scope: !887)
!891 = !MDLocation(line: 124, column: 9, scope: !883)
!892 = !MDLocation(line: 125, column: 7, scope: !887)
!893 = !MDLocation(line: 124, column: 25, scope: !894)
!894 = !{!"0xb\001", !1, !887}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!895 = !MDLocation(line: 127, column: 8, scope: !896)
!896 = !{!"0xb\00127\008\0042", !1, !884}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!897 = !MDLocation(line: 127, column: 8, scope: !884)
!898 = !MDLocation(line: 128, column: 9, scope: !899)
!899 = !{!"0xb\00128\009\0043", !1, !896}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!900 = !MDLocation(line: 128, column: 15, scope: !899)
!901 = !MDLocation(line: 128, column: 9, scope: !896)
!902 = !MDLocation(line: 129, column: 7, scope: !899)
!903 = !MDLocation(line: 128, column: 20, scope: !904)
!904 = !{!"0xb\001", !1, !899}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!905 = !MDLocation(line: 130, column: 4, scope: !884)
!906 = !MDLocation(line: 132, column: 8, scope: !907)
!907 = !{!"0xb\00132\007\0044", !1, !871}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!908 = !MDLocation(line: 132, column: 7, scope: !871)
!909 = !MDLocation(line: 134, column: 18, scope: !910)
!910 = !{!"0xb\00133\004\0045", !1, !907}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!911 = !MDLocation(line: 134, column: 5, scope: !910)
!912 = !MDLocation(line: 134, column: 46, scope: !910)
!913 = !MDLocation(line: 134, column: 51, scope: !910)
!914 = !MDLocation(line: 134, column: 29, scope: !910)
!915 = !MDLocation(line: 135, column: 18, scope: !910)
!916 = !MDLocation(line: 135, column: 5, scope: !910)
!917 = !MDLocation(line: 135, column: 46, scope: !910)
!918 = !MDLocation(line: 135, column: 51, scope: !910)
!919 = !MDLocation(line: 135, column: 29, scope: !910)
!920 = !MDLocation(line: 136, column: 18, scope: !910)
!921 = !MDLocation(line: 136, column: 5, scope: !910)
!922 = !MDLocation(line: 136, column: 48, scope: !910)
!923 = !MDLocation(line: 136, column: 51, scope: !910)
!924 = !MDLocation(line: 136, column: 29, scope: !910)
!925 = !MDLocation(line: 137, column: 18, scope: !910)
!926 = !MDLocation(line: 137, column: 5, scope: !910)
!927 = !MDLocation(line: 137, column: 46, scope: !910)
!928 = !MDLocation(line: 137, column: 51, scope: !910)
!929 = !MDLocation(line: 137, column: 29, scope: !910)
!930 = !MDLocation(line: 138, column: 18, scope: !910)
!931 = !MDLocation(line: 138, column: 5, scope: !910)
!932 = !MDLocation(line: 138, column: 46, scope: !910)
!933 = !MDLocation(line: 138, column: 51, scope: !910)
!934 = !MDLocation(line: 138, column: 29, scope: !910)
!935 = !MDLocation(line: 139, column: 18, scope: !910)
!936 = !MDLocation(line: 139, column: 5, scope: !910)
!937 = !MDLocation(line: 139, column: 46, scope: !910)
!938 = !MDLocation(line: 139, column: 51, scope: !910)
!939 = !MDLocation(line: 139, column: 29, scope: !910)
!940 = !MDLocation(line: 140, column: 18, scope: !910)
!941 = !MDLocation(line: 140, column: 5, scope: !910)
!942 = !MDLocation(line: 140, column: 46, scope: !910)
!943 = !MDLocation(line: 140, column: 51, scope: !910)
!944 = !MDLocation(line: 140, column: 29, scope: !910)
!945 = !MDLocation(line: 141, column: 18, scope: !910)
!946 = !MDLocation(line: 141, column: 5, scope: !910)
!947 = !MDLocation(line: 141, column: 46, scope: !910)
!948 = !MDLocation(line: 141, column: 51, scope: !910)
!949 = !MDLocation(line: 141, column: 29, scope: !910)
!950 = !MDLocation(line: 142, column: 18, scope: !910)
!951 = !MDLocation(line: 142, column: 5, scope: !910)
!952 = !MDLocation(line: 142, column: 46, scope: !910)
!953 = !MDLocation(line: 142, column: 51, scope: !910)
!954 = !MDLocation(line: 142, column: 29, scope: !910)
!955 = !MDLocation(line: 143, column: 18, scope: !910)
!956 = !MDLocation(line: 143, column: 5, scope: !910)
!957 = !MDLocation(line: 143, column: 46, scope: !910)
!958 = !MDLocation(line: 143, column: 51, scope: !910)
!959 = !MDLocation(line: 143, column: 29, scope: !910)
!960 = !MDLocation(line: 144, column: 18, scope: !910)
!961 = !MDLocation(line: 144, column: 5, scope: !910)
!962 = !MDLocation(line: 144, column: 46, scope: !910)
!963 = !MDLocation(line: 144, column: 51, scope: !910)
!964 = !MDLocation(line: 144, column: 29, scope: !910)
!965 = !MDLocation(line: 145, column: 18, scope: !910)
!966 = !MDLocation(line: 145, column: 5, scope: !910)
!967 = !MDLocation(line: 145, column: 46, scope: !910)
!968 = !MDLocation(line: 145, column: 51, scope: !910)
!969 = !MDLocation(line: 145, column: 29, scope: !910)
!970 = !MDLocation(line: 146, column: 5, scope: !910)
!971 = !MDLocation(line: 147, column: 4, scope: !910)
!972 = !MDLocation(line: 148, column: 3, scope: !871)
!973 = !MDLocation(line: 117, column: 26, scope: !868)
!974 = !MDLocation(line: 117, column: 3, scope: !868)
!975 = !MDLocation(line: 149, column: 2, scope: !862)
!976 = !MDLocation(line: 115, column: 25, scope: !858)
!977 = !MDLocation(line: 115, column: 2, scope: !858)
!978 = !MDLocation(line: 150, column: 1, scope: !830)
!979 = !{!"0x101\00this\0016777216\001088", !205, null, !980} ; [ DW_TAG_arg_variable ] [this] [line 0]
!980 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS13HexxagonBoard]
!981 = !MDLocation(line: 0, scope: !205)
!982 = !{!"0x101\00copy\0033554584\000", !205, !200, !111} ; [ DW_TAG_arg_variable ] [copy] [line 152]
!983 = !MDLocation(line: 152, column: 51, scope: !205)
!984 = !MDLocation(line: 152, column: 16, scope: !205)
!985 = !MDLocation(line: 154, column: 2, scope: !986)
!986 = !{!"0xb\00153\001\0046", !1, !205}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!987 = !MDLocation(line: 155, column: 2, scope: !986)
!988 = !MDLocation(line: 156, column: 1, scope: !205)
!989 = !{!"0x101\00this\0016777216\001088", !206, null, !980} ; [ DW_TAG_arg_variable ] [this] [line 0]
!990 = !MDLocation(line: 0, scope: !206)
!991 = !{!"0x101\00right\0033554590\000", !206, !200, !111} ; [ DW_TAG_arg_variable ] [right] [line 158]
!992 = !MDLocation(line: 158, column: 61, scope: !206)
!993 = !MDLocation(line: 160, column: 2, scope: !206)
!994 = !MDLocation(line: 161, column: 2, scope: !206)
!995 = !MDLocation(line: 163, column: 2, scope: !206)
!996 = !{!"0x101\00this\0016777216\001088", !207, null, !980} ; [ DW_TAG_arg_variable ] [this] [line 0]
!997 = !MDLocation(line: 0, scope: !207)
!998 = !MDLocation(line: 168, column: 2, scope: !207)
!999 = !MDLocation(line: 169, column: 2, scope: !207)
!1000 = !MDLocation(line: 171, column: 2, scope: !207)
!1001 = !MDLocation(line: 171, column: 20, scope: !207)
!1002 = !MDLocation(line: 172, column: 5, scope: !207)
!1003 = !MDLocation(line: 172, column: 23, scope: !207)
!1004 = !MDLocation(line: 173, column: 2, scope: !207)
!1005 = !MDLocation(line: 173, column: 20, scope: !207)
!1006 = !MDLocation(line: 174, column: 2, scope: !207)
!1007 = !MDLocation(line: 175, column: 2, scope: !207)
!1008 = !MDLocation(line: 176, column: 2, scope: !207)
!1009 = !MDLocation(line: 177, column: 1, scope: !207)
!1010 = !{!"0x101\00this\0016777216\001088", !208, null, !980} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1011 = !MDLocation(line: 0, scope: !208)
!1012 = !{!"0x101\00player\0033554611\000", !208, !200, !19} ; [ DW_TAG_arg_variable ] [player] [line 179]
!1013 = !MDLocation(line: 179, column: 36, scope: !208)
!1014 = !{!"0x100\00good\00181\000", !208, !200, !19} ; [ DW_TAG_auto_variable ] [good] [line 181]
!1015 = !MDLocation(line: 181, column: 6, scope: !208)
!1016 = !{!"0x100\00bad\00181\000", !208, !200, !19} ; [ DW_TAG_auto_variable ] [bad] [line 181]
!1017 = !MDLocation(line: 181, column: 16, scope: !208)
!1018 = !{!"0x100\00i\00183\000", !1019, !200, !19} ; [ DW_TAG_auto_variable ] [i] [line 183]
!1019 = !{!"0xb\00183\002\0047", !1, !208}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1020 = !MDLocation(line: 183, column: 10, scope: !1019)
!1021 = !MDLocation(line: 183, column: 6, scope: !1019)
!1022 = !MDLocation(line: 183, column: 17, scope: !1023)
!1023 = !{!"0xb\002", !1, !1024}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1024 = !{!"0xb\001", !1, !1025}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1025 = !{!"0xb\00183\002\0048", !1, !1019}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1026 = !MDLocation(line: 183, column: 2, scope: !1019)
!1027 = !MDLocation(line: 185, column: 6, scope: !1028)
!1028 = !{!"0xb\00185\006\0050", !1, !1029}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1029 = !{!"0xb\00184\002\0049", !1, !1025}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1030 = !MDLocation(line: 185, column: 19, scope: !1028)
!1031 = !MDLocation(line: 185, column: 6, scope: !1029)
!1032 = !MDLocation(line: 187, column: 7, scope: !1033)
!1033 = !{!"0xb\00187\007\0052", !1, !1034}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1034 = !{!"0xb\00186\003\0051", !1, !1028}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1035 = !MDLocation(line: 187, column: 20, scope: !1033)
!1036 = !MDLocation(line: 187, column: 7, scope: !1034)
!1037 = !MDLocation(line: 188, column: 5, scope: !1033)
!1038 = !MDLocation(line: 190, column: 5, scope: !1033)
!1039 = !MDLocation(line: 191, column: 3, scope: !1034)
!1040 = !MDLocation(line: 192, column: 2, scope: !1029)
!1041 = !MDLocation(line: 183, column: 25, scope: !1025)
!1042 = !MDLocation(line: 183, column: 2, scope: !1025)
!1043 = !MDLocation(line: 194, column: 5, scope: !1044)
!1044 = !{!"0xb\00194\005\0053", !1, !208}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1045 = !MDLocation(line: 194, column: 5, scope: !208)
!1046 = !MDLocation(line: 195, column: 10, scope: !1044)
!1047 = !MDLocation(line: 195, column: 17, scope: !1044)
!1048 = !MDLocation(line: 195, column: 3, scope: !1044)
!1049 = !MDLocation(line: 196, column: 10, scope: !1050)
!1050 = !{!"0xb\00196\0010\0054", !1, !1044}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1051 = !MDLocation(line: 196, column: 10, scope: !1044)
!1052 = !MDLocation(line: 197, column: 10, scope: !1050)
!1053 = !MDLocation(line: 197, column: 3, scope: !1050)
!1054 = !MDLocation(line: 198, column: 10, scope: !1055)
!1055 = !{!"0xb\00198\0010\0055", !1, !1050}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1056 = !MDLocation(line: 198, column: 10, scope: !1050)
!1057 = !MDLocation(line: 199, column: 10, scope: !1055)
!1058 = !MDLocation(line: 199, column: 3, scope: !1055)
!1059 = !MDLocation(line: 201, column: 2, scope: !208)
!1060 = !MDLocation(line: 202, column: 1, scope: !208)
!1061 = !{!"0x101\00this\0016777216\001088", !209, null, !980} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1062 = !MDLocation(line: 0, scope: !209)
!1063 = !{!"0x100\00good\00206\000", !209, !200, !19} ; [ DW_TAG_auto_variable ] [good] [line 206]
!1064 = !MDLocation(line: 206, column: 6, scope: !209)
!1065 = !{!"0x100\00bad\00207\000", !209, !200, !19} ; [ DW_TAG_auto_variable ] [bad] [line 207]
!1066 = !MDLocation(line: 207, column: 6, scope: !209)
!1067 = !{!"0x100\00count\00208\000", !209, !200, !19} ; [ DW_TAG_auto_variable ] [count] [line 208]
!1068 = !MDLocation(line: 208, column: 6, scope: !209)
!1069 = !{!"0x100\00i\00210\000", !1070, !200, !19} ; [ DW_TAG_auto_variable ] [i] [line 210]
!1070 = !{!"0xb\00210\002\0056", !1, !209}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1071 = !MDLocation(line: 210, column: 10, scope: !1070)
!1072 = !MDLocation(line: 210, column: 6, scope: !1070)
!1073 = !MDLocation(line: 210, column: 17, scope: !1074)
!1074 = !{!"0xb\002", !1, !1075}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1075 = !{!"0xb\001", !1, !1076}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1076 = !{!"0xb\00210\002\0057", !1, !1070}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1077 = !MDLocation(line: 210, column: 2, scope: !1070)
!1078 = !MDLocation(line: 212, column: 6, scope: !1079)
!1079 = !{!"0xb\00212\006\0059", !1, !1080}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1080 = !{!"0xb\00211\002\0058", !1, !1076}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1081 = !MDLocation(line: 212, column: 19, scope: !1079)
!1082 = !MDLocation(line: 212, column: 6, scope: !1080)
!1083 = !MDLocation(line: 214, column: 4, scope: !1084)
!1084 = !{!"0xb\00213\003\0060", !1, !1079}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1085 = !MDLocation(line: 215, column: 7, scope: !1086)
!1086 = !{!"0xb\00215\007\0061", !1, !1084}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1087 = !MDLocation(line: 215, column: 20, scope: !1086)
!1088 = !MDLocation(line: 215, column: 7, scope: !1084)
!1089 = !MDLocation(line: 216, column: 5, scope: !1086)
!1090 = !MDLocation(line: 218, column: 5, scope: !1086)
!1091 = !MDLocation(line: 219, column: 3, scope: !1084)
!1092 = !MDLocation(line: 220, column: 2, scope: !1080)
!1093 = !MDLocation(line: 210, column: 25, scope: !1076)
!1094 = !MDLocation(line: 210, column: 2, scope: !1076)
!1095 = !{!"0x100\00score\00222\000", !209, !200, !19} ; [ DW_TAG_auto_variable ] [score] [line 222]
!1096 = !MDLocation(line: 222, column: 6, scope: !209)
!1097 = !MDLocation(line: 222, column: 14, scope: !209)
!1098 = !MDLocation(line: 222, column: 21, scope: !209)
!1099 = !MDLocation(line: 224, column: 5, scope: !1100)
!1100 = !{!"0xb\00224\005\0062", !1, !209}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1101 = !MDLocation(line: 224, column: 5, scope: !209)
!1102 = !MDLocation(line: 224, column: 18, scope: !1103)
!1103 = !{!"0xb\001", !1, !1100}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1104 = !MDLocation(line: 224, column: 30, scope: !1105)
!1105 = !{!"0xb\002", !1, !1100}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1106 = !MDLocation(line: 226, column: 6, scope: !1107)
!1107 = !{!"0xb\00226\006\0064", !1, !1108}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1108 = !{!"0xb\00225\002\0063", !1, !1100}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1109 = !MDLocation(line: 226, column: 6, scope: !1108)
!1110 = !MDLocation(line: 227, column: 4, scope: !1107)
!1111 = !MDLocation(line: 229, column: 6, scope: !1112)
!1112 = !{!"0xb\00229\006\0065", !1, !1108}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1113 = !MDLocation(line: 229, column: 6, scope: !1108)
!1114 = !MDLocation(line: 230, column: 4, scope: !1112)
!1115 = !MDLocation(line: 232, column: 6, scope: !1116)
!1116 = !{!"0xb\00232\006\0066", !1, !1108}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1117 = !MDLocation(line: 232, column: 6, scope: !1108)
!1118 = !MDLocation(line: 234, column: 7, scope: !1119)
!1119 = !{!"0xb\00234\007\0068", !1, !1120}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1120 = !{!"0xb\00233\003\0067", !1, !1116}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1121 = !MDLocation(line: 234, column: 14, scope: !1119)
!1122 = !MDLocation(line: 234, column: 7, scope: !1120)
!1123 = !MDLocation(line: 235, column: 5, scope: !1119)
!1124 = !MDLocation(line: 237, column: 7, scope: !1125)
!1125 = !{!"0xb\00237\007\0069", !1, !1120}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1126 = !MDLocation(line: 237, column: 15, scope: !1125)
!1127 = !MDLocation(line: 237, column: 7, scope: !1120)
!1128 = !MDLocation(line: 238, column: 5, scope: !1125)
!1129 = !MDLocation(line: 239, column: 3, scope: !1120)
!1130 = !MDLocation(line: 240, column: 2, scope: !1108)
!1131 = !MDLocation(line: 242, column: 9, scope: !209)
!1132 = !MDLocation(line: 242, column: 2, scope: !209)
!1133 = !{!"0x101\00this\0016777216\001088", !210, null, !980} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1134 = !MDLocation(line: 0, scope: !210)
!1135 = !{!"0x101\00i\0033554677\000", !210, !200, !19} ; [ DW_TAG_arg_variable ] [i] [line 245]
!1136 = !MDLocation(line: 245, column: 36, scope: !210)
!1137 = !MDLocation(line: 247, column: 5, scope: !1138)
!1138 = !{!"0xb\00247\005\0070", !1, !210}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1139 = !MDLocation(line: 247, column: 18, scope: !1138)
!1140 = !MDLocation(line: 247, column: 5, scope: !210)
!1141 = !MDLocation(line: 249, column: 6, scope: !1142)
!1142 = !{!"0xb\00249\006\0072", !1, !1143}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1143 = !{!"0xb\00248\002\0071", !1, !1138}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1144 = !MDLocation(line: 249, column: 19, scope: !1142)
!1145 = !MDLocation(line: 249, column: 6, scope: !1143)
!1146 = !MDLocation(line: 250, column: 4, scope: !1142)
!1147 = !MDLocation(line: 252, column: 4, scope: !1142)
!1148 = !MDLocation(line: 254, column: 3, scope: !1138)
!1149 = !MDLocation(line: 255, column: 1, scope: !210)
!1150 = !{!"0x101\00this\0016777216\001088", !211, null, !980} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1151 = !MDLocation(line: 0, scope: !211)
!1152 = !{!"0x101\00move\0033554689\000", !211, !200, !124} ; [ DW_TAG_arg_variable ] [move] [line 257]
!1153 = !MDLocation(line: 257, column: 44, scope: !211)
!1154 = !MDLocation(line: 259, column: 2, scope: !211)
!1155 = !MDLocation(line: 259, column: 15, scope: !211)
!1156 = !MDLocation(line: 260, column: 2, scope: !211)
!1157 = !MDLocation(line: 260, column: 15, scope: !211)
!1158 = !MDLocation(line: 262, column: 2, scope: !211)
!1159 = !MDLocation(line: 262, column: 10, scope: !211)
!1160 = !MDLocation(line: 262, column: 32, scope: !211)
!1161 = !MDLocation(line: 262, column: 18, scope: !211)
!1162 = !MDLocation(line: 264, column: 5, scope: !1163)
!1163 = !{!"0xb\00264\005\0073", !1, !211}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1164 = !MDLocation(line: 264, column: 18, scope: !1163)
!1165 = !MDLocation(line: 264, column: 5, scope: !211)
!1166 = !MDLocation(line: 265, column: 3, scope: !1163)
!1167 = !MDLocation(line: 265, column: 18, scope: !1163)
!1168 = !MDLocation(line: 267, column: 2, scope: !211)
!1169 = !MDLocation(line: 267, column: 10, scope: !211)
!1170 = !MDLocation(line: 269, column: 2, scope: !211)
!1171 = !{!"0x101\00this\0016777216\001088", !212, null, !980} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1172 = !MDLocation(line: 0, scope: !212)
!1173 = !{!"0x101\00move\0033554704\000", !212, !200, !124} ; [ DW_TAG_arg_variable ] [move] [line 272]
!1174 = !MDLocation(line: 272, column: 46, scope: !212)
!1175 = !{!"0x100\00mine\00274\000", !212, !200, !"_ZTS10BitBoard64"} ; [ DW_TAG_auto_variable ] [mine] [line 274]
!1176 = !MDLocation(line: 274, column: 14, scope: !212)
!1177 = !MDLocation(line: 274, column: 21, scope: !212)
!1178 = !MDLocation(line: 276, column: 7, scope: !1179)
!1179 = !{!"0xb\00276\006\0074", !1, !212}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1180 = !MDLocation(line: 276, column: 20, scope: !1179)
!1181 = !MDLocation(line: 276, column: 6, scope: !212)
!1182 = !MDLocation(line: 278, column: 8, scope: !1183)
!1183 = !{!"0xb\00278\008\0076", !1, !1184}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1184 = !{!"0xb\00277\003\0075", !1, !1179}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1185 = !MDLocation(line: 278, column: 21, scope: !1183)
!1186 = !MDLocation(line: 278, column: 8, scope: !1184)
!1187 = !MDLocation(line: 280, column: 31, scope: !1188)
!1188 = !{!"0xb\00280\0010\0078", !1, !1189}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1189 = !{!"0xb\00279\005\0077", !1, !1183}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1190 = !MDLocation(line: 280, column: 10, scope: !1188)
!1191 = !MDLocation(line: 280, column: 17, scope: !1188)
!1192 = !MDLocation(line: 280, column: 10, scope: !1189)
!1193 = !MDLocation(line: 281, column: 6, scope: !1188)
!1194 = !MDLocation(line: 282, column: 5, scope: !1189)
!1195 = !{!"0x100\00tmp\00285\000", !1196, !200, !"_ZTS10BitBoard64"} ; [ DW_TAG_auto_variable ] [tmp] [line 285]
!1196 = !{!"0xb\00284\005\0079", !1, !1183}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1197 = !MDLocation(line: 285, column: 18, scope: !1196)
!1198 = !MDLocation(line: 286, column: 18, scope: !1196)
!1199 = !MDLocation(line: 286, column: 7, scope: !1196)
!1200 = !MDLocation(line: 288, column: 29, scope: !1201)
!1201 = !{!"0xb\00288\0010\0080", !1, !1196}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1202 = !MDLocation(line: 288, column: 10, scope: !1201)
!1203 = !MDLocation(line: 288, column: 16, scope: !1201)
!1204 = !MDLocation(line: 288, column: 10, scope: !1196)
!1205 = !MDLocation(line: 289, column: 6, scope: !1201)
!1206 = !MDLocation(line: 291, column: 3, scope: !1184)
!1207 = !MDLocation(line: 293, column: 3, scope: !212)
!1208 = !MDLocation(line: 294, column: 1, scope: !212)
!1209 = !{!"0x101\00this\0016777216\001088", !213, null, !980} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1210 = !MDLocation(line: 0, scope: !213)
!1211 = !{!"0x100\00list\00298\000", !213, !200, !128} ; [ DW_TAG_auto_variable ] [list] [line 298]
!1212 = !MDLocation(line: 298, column: 20, scope: !213)
!1213 = !MDLocation(line: 298, column: 27, scope: !213)
!1214 = !MDLocation(line: 298, column: 20, scope: !1215)
!1215 = !{!"0xb\001", !1, !213}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1216 = !MDLocation(line: 300, column: 6, scope: !1217)
!1217 = !{!"0xb\00300\005\0081", !1, !213}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1218 = !MDLocation(line: 300, column: 5, scope: !213)
!1219 = !MDLocation(line: 302, column: 3, scope: !1220)
!1220 = !{!"0xb\00301\002\0082", !1, !1217}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1221 = !MDLocation(line: 303, column: 3, scope: !1220)
!1222 = !MDLocation(line: 336, column: 1, scope: !213)
!1223 = !MDLocation(line: 306, column: 10, scope: !1224)
!1224 = !{!"0xb\00306\002\0083", !1, !213}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1225 = !{!"0x100\00i\00306\000", !1224, !200, !19} ; [ DW_TAG_auto_variable ] [i] [line 306]
!1226 = !MDLocation(line: 306, column: 6, scope: !1224)
!1227 = !MDLocation(line: 306, column: 17, scope: !1228)
!1228 = !{!"0xb\002", !1, !1229}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1229 = !{!"0xb\001", !1, !1230}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1230 = !{!"0xb\00306\002\0084", !1, !1224}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1231 = !MDLocation(line: 306, column: 2, scope: !1224)
!1232 = !MDLocation(line: 308, column: 7, scope: !1233)
!1233 = !{!"0xb\00308\006\0086", !1, !1234}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1234 = !{!"0xb\00307\002\0085", !1, !1230}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1235 = !MDLocation(line: 308, column: 20, scope: !1233)
!1236 = !MDLocation(line: 308, column: 6, scope: !1234)
!1237 = !MDLocation(line: 310, column: 7, scope: !1238)
!1238 = !{!"0xb\00310\007\0088", !1, !1239}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1239 = !{!"0xb\00309\003\0087", !1, !1233}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1240 = !MDLocation(line: 310, column: 24, scope: !1238)
!1241 = !MDLocation(line: 310, column: 54, scope: !1238)
!1242 = !MDLocation(line: 310, column: 40, scope: !1238)
!1243 = !MDLocation(line: 310, column: 7, scope: !1239)
!1244 = !MDLocation(line: 312, column: 18, scope: !1245)
!1245 = !{!"0xb\00311\004\0089", !1, !1238}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1246 = !{!"0x100\00move\00312\000", !1245, !200, !"_ZTS12HexxagonMove"} ; [ DW_TAG_auto_variable ] [move] [line 312]
!1247 = !MDLocation(line: 312, column: 38, scope: !1245)
!1248 = !MDLocation(line: 313, column: 5, scope: !1245)
!1249 = !MDLocation(line: 314, column: 4, scope: !1245)
!1250 = !{!"0x100\00moves\00316\000", !1239, !200, !"_ZTS10BitBoard64"} ; [ DW_TAG_auto_variable ] [moves] [line 316]
!1251 = !MDLocation(line: 316, column: 15, scope: !1239)
!1252 = !MDLocation(line: 317, column: 18, scope: !1253)
!1253 = !{!"0xb\00317\007\0090", !1, !1239}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1254 = !MDLocation(line: 317, column: 39, scope: !1253)
!1255 = !MDLocation(line: 317, column: 26, scope: !1253)
!1256 = !MDLocation(line: 317, column: 17, scope: !1253)
!1257 = !MDLocation(line: 317, column: 8, scope: !1253)
!1258 = !MDLocation(line: 317, column: 7, scope: !1253)
!1259 = !MDLocation(line: 317, column: 7, scope: !1239)
!1260 = !MDLocation(line: 319, column: 13, scope: !1261)
!1261 = !{!"0xb\00319\005\0092", !1, !1262}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1262 = !{!"0xb\00318\004\0091", !1, !1253}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1263 = !{!"0x100\00j\00319\000", !1261, !200, !19} ; [ DW_TAG_auto_variable ] [j] [line 319]
!1264 = !MDLocation(line: 319, column: 9, scope: !1261)
!1265 = !MDLocation(line: 319, column: 20, scope: !1266)
!1266 = !{!"0xb\002", !1, !1267}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1267 = !{!"0xb\001", !1, !1268}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1268 = !{!"0xb\00319\005\0093", !1, !1261}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1269 = !MDLocation(line: 319, column: 5, scope: !1261)
!1270 = !MDLocation(line: 321, column: 22, scope: !1271)
!1271 = !{!"0xb\00321\009\0095", !1, !1272}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1272 = !{!"0xb\00320\005\0094", !1, !1268}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1273 = !MDLocation(line: 321, column: 9, scope: !1271)
!1274 = !MDLocation(line: 321, column: 9, scope: !1272)
!1275 = !MDLocation(line: 323, column: 20, scope: !1276)
!1276 = !{!"0xb\00322\006\0096", !1, !1271}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1277 = !{!"0x100\00move\00323\000", !1276, !200, !"_ZTS12HexxagonMove"} ; [ DW_TAG_auto_variable ] [move] [line 323]
!1278 = !MDLocation(line: 323, column: 40, scope: !1276)
!1279 = !MDLocation(line: 323, column: 43, scope: !1276)
!1280 = !MDLocation(line: 324, column: 7, scope: !1276)
!1281 = !MDLocation(line: 325, column: 6, scope: !1276)
!1282 = !MDLocation(line: 326, column: 5, scope: !1272)
!1283 = !MDLocation(line: 319, column: 28, scope: !1268)
!1284 = !MDLocation(line: 319, column: 5, scope: !1268)
!1285 = !MDLocation(line: 327, column: 4, scope: !1262)
!1286 = !MDLocation(line: 328, column: 3, scope: !1239)
!1287 = !MDLocation(line: 329, column: 2, scope: !1234)
!1288 = !MDLocation(line: 306, column: 25, scope: !1230)
!1289 = !MDLocation(line: 306, column: 2, scope: !1230)
!1290 = !MDLocation(line: 331, column: 5, scope: !1291)
!1291 = !{!"0xb\00331\005\0097", !1, !213}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1292 = !MDLocation(line: 331, column: 5, scope: !213)
!1293 = !MDLocation(line: 332, column: 10, scope: !1291)
!1294 = !MDLocation(line: 332, column: 3, scope: !1291)
!1295 = !MDLocation(line: 334, column: 9, scope: !213)
!1296 = !MDLocation(line: 334, column: 2, scope: !213)
!1297 = !MDLocation(line: 334, column: 2, scope: !1215)
!1298 = !MDLocation(line: 334, column: 2, scope: !1299)
!1299 = !{!"0xb\002", !1, !213}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1300 = !MDLocation(line: 335, column: 2, scope: !213)
!1301 = !MDLocation(line: 336, column: 1, scope: !1302)
!1302 = !{!"0xb\002", !1, !1215}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1303 = !{!"0x101\00this\0016777216\001088", !222, null, !128} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1304 = !MDLocation(line: 0, scope: !222)
!1305 = !MDLocation(line: 46, column: 31, scope: !1306)
!1306 = !{!"0xb\0046\0021\00122", !152, !222}     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!1307 = !MDLocation(line: 46, column: 31, scope: !1308)
!1308 = !{!"0xb\005", !152, !1309}                ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!1309 = !{!"0xb\001", !152, !1306}                ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!1310 = !MDLocation(line: 46, column: 31, scope: !1311)
!1311 = !{!"0xb\002", !152, !1306}                ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!1312 = !MDLocation(line: 46, column: 23, scope: !1313)
!1313 = !{!"0xb\004", !152, !1306}                ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!1314 = !MDLocation(line: 46, column: 65, scope: !1306)
!1315 = !MDLocation(line: 46, column: 79, scope: !222)
!1316 = !MDLocation(line: 46, column: 79, scope: !1317)
!1317 = !{!"0xb\003", !152, !1306}                ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!1318 = !MDLocation(line: 46, column: 79, scope: !1319)
!1319 = !{!"0xb\006", !152, !1306}                ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!1320 = !{!"0x101\00this\0016777216\001088", !221, null, !171} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1321 = !MDLocation(line: 0, scope: !221)
!1322 = !{!"0x101\00t\0033554468\000", !221, !1323, !19} ; [ DW_TAG_arg_variable ] [t] [line 36]
!1323 = !{!"0x29", !152}                          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!1324 = !MDLocation(line: 36, column: 19, scope: !221)
!1325 = !MDLocation(line: 36, column: 30, scope: !1326)
!1326 = !{!"0xb\0036\0022\00121", !152, !221}     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!1327 = !MDLocation(line: 36, column: 23, scope: !1326)
!1328 = !MDLocation(line: 36, column: 38, scope: !1326)
!1329 = !MDLocation(line: 36, column: 33, scope: !1326)
!1330 = !MDLocation(line: 36, column: 40, scope: !221)
!1331 = !{!"0x101\00this\0016777216\001088", !220, null, !171} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1332 = !MDLocation(line: 0, scope: !220)
!1333 = !{!"0x101\00f\0033554469\000", !220, !1323, !19} ; [ DW_TAG_arg_variable ] [f] [line 37]
!1334 = !MDLocation(line: 37, column: 19, scope: !220)
!1335 = !{!"0x101\00t\0050331685\000", !220, !1323, !19} ; [ DW_TAG_arg_variable ] [t] [line 37]
!1336 = !MDLocation(line: 37, column: 26, scope: !220)
!1337 = !MDLocation(line: 37, column: 37, scope: !1338)
!1338 = !{!"0xb\0037\0029\00120", !152, !220}     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!1339 = !MDLocation(line: 37, column: 30, scope: !1338)
!1340 = !MDLocation(line: 37, column: 45, scope: !1338)
!1341 = !MDLocation(line: 37, column: 40, scope: !1338)
!1342 = !MDLocation(line: 37, column: 47, scope: !220)
!1343 = !{!"0x101\00this\0016777216\001088", !219, null, !128} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1344 = !MDLocation(line: 0, scope: !219)
!1345 = !MDLocation(line: 47, column: 31, scope: !1346)
!1346 = !{!"0xb\0047\0022\00119", !152, !219}     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!1347 = !MDLocation(line: 47, column: 24, scope: !1346)
!1348 = !MDLocation(line: 47, column: 24, scope: !1349)
!1349 = !{!"0xb\002", !152, !1346}                ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!1350 = !MDLocation(line: 47, column: 38, scope: !1351)
!1351 = !{!"0xb\003", !152, !1352}                ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!1352 = !{!"0xb\001", !152, !219}                 ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!1353 = !{!"0x101\00this\0016777216\001088", !214, null, !980} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1354 = !MDLocation(line: 0, scope: !214)
!1355 = !{!"0x100\00movelist\00340\000", !214, !200, !128} ; [ DW_TAG_auto_variable ] [movelist] [line 340]
!1356 = !MDLocation(line: 340, column: 20, scope: !214)
!1357 = !MDLocation(line: 342, column: 13, scope: !214)
!1358 = !MDLocation(line: 342, column: 2, scope: !214)
!1359 = !MDLocation(line: 344, column: 6, scope: !1360)
!1360 = !{!"0xb\00344\005\0098", !1, !214}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1361 = !MDLocation(line: 344, column: 5, scope: !214)
!1362 = !MDLocation(line: 345, column: 3, scope: !1360)
!1363 = !MDLocation(line: 347, column: 9, scope: !214)
!1364 = !MDLocation(line: 347, column: 2, scope: !214)
!1365 = !MDLocation(line: 347, column: 2, scope: !1366)
!1366 = !{!"0xb\001", !1, !214}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1367 = !MDLocation(line: 347, column: 2, scope: !1368)
!1368 = !{!"0xb\002", !1, !214}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1369 = !MDLocation(line: 349, column: 2, scope: !214)
!1370 = !MDLocation(line: 350, column: 1, scope: !214)
!1371 = !MDLocation(line: 350, column: 1, scope: !1366)
!1372 = !{!"0x101\00this\0016777216\001088", !215, null, !980} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1373 = !MDLocation(line: 0, scope: !215)
!1374 = !{!"0x101\00depth\0033554784\000", !215, !200, !19} ; [ DW_TAG_arg_variable ] [depth] [line 352]
!1375 = !MDLocation(line: 352, column: 37, scope: !215)
!1376 = !{!"0x101\00callback\0050332000\000", !215, !200, !132} ; [ DW_TAG_arg_variable ] [callback] [line 352]
!1377 = !MDLocation(line: 352, column: 51, scope: !215)
!1378 = !{!"0x101\00maxtime\0067109216\000", !215, !200, !19} ; [ DW_TAG_arg_variable ] [maxtime] [line 352]
!1379 = !MDLocation(line: 352, column: 68, scope: !215)
!1380 = !{!"0x100\00movelist\00354\000", !215, !200, !128} ; [ DW_TAG_auto_variable ] [movelist] [line 354]
!1381 = !MDLocation(line: 354, column: 20, scope: !215)
!1382 = !MDLocation(line: 356, column: 18, scope: !1383)
!1383 = !{!"0xb\00356\005\0099", !1, !215}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1384 = !MDLocation(line: 356, column: 7, scope: !1383)
!1385 = !MDLocation(line: 356, column: 6, scope: !1383)
!1386 = !MDLocation(line: 356, column: 5, scope: !215)
!1387 = !MDLocation(line: 358, column: 3, scope: !1388)
!1388 = !{!"0xb\00357\002\00100", !1, !1383}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1389 = !MDLocation(line: 359, column: 3, scope: !1388)
!1390 = !MDLocation(line: 362, column: 2, scope: !215)
!1391 = !MDLocation(line: 362, column: 33, scope: !215)
!1392 = !MDLocation(line: 362, column: 40, scope: !215)
!1393 = !MDLocation(line: 362, column: 50, scope: !215)
!1394 = !MDLocation(line: 363, column: 14, scope: !215)
!1395 = !MDLocation(line: 363, column: 2, scope: !215)
!1396 = !MDLocation(line: 365, column: 9, scope: !215)
!1397 = !MDLocation(line: 365, column: 2, scope: !215)
!1398 = !MDLocation(line: 365, column: 2, scope: !1399)
!1399 = !{!"0xb\001", !1, !215}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1400 = !MDLocation(line: 365, column: 2, scope: !1401)
!1401 = !{!"0xb\002", !1, !215}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1402 = !MDLocation(line: 367, column: 2, scope: !215)
!1403 = !MDLocation(line: 368, column: 1, scope: !215)
!1404 = !MDLocation(line: 368, column: 1, scope: !1399)
!1405 = !{!"0x101\00this\0016777216\001088", !216, null, !980} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1406 = !MDLocation(line: 0, scope: !216)
!1407 = !{!"0x101\00file\0033554802\000", !216, !200, !96} ; [ DW_TAG_arg_variable ] [file] [line 370]
!1408 = !MDLocation(line: 370, column: 39, scope: !216)
!1409 = !MDLocation(line: 372, column: 5, scope: !1410)
!1410 = !{!"0xb\00372\005\00101", !1, !216}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1411 = !MDLocation(line: 372, column: 24, scope: !1410)
!1412 = !MDLocation(line: 372, column: 5, scope: !216)
!1413 = !MDLocation(line: 372, column: 33, scope: !1414)
!1414 = !{!"0xb\001", !1, !1410}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1415 = !MDLocation(line: 372, column: 52, scope: !1410)
!1416 = !MDLocation(line: 372, column: 33, scope: !1410)
!1417 = !MDLocation(line: 373, column: 3, scope: !1410)
!1418 = !MDLocation(line: 375, column: 3, scope: !1410)
!1419 = !MDLocation(line: 376, column: 1, scope: !216)
!1420 = !{!"0x101\00this\0016777216\001088", !217, null, !980} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1421 = !MDLocation(line: 0, scope: !217)
!1422 = !{!"0x101\00file\0033554810\000", !217, !200, !96} ; [ DW_TAG_arg_variable ] [file] [line 378]
!1423 = !MDLocation(line: 378, column: 38, scope: !217)
!1424 = !MDLocation(line: 380, column: 5, scope: !1425)
!1425 = !{!"0xb\00380\005\00102", !1, !217}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1426 = !MDLocation(line: 380, column: 23, scope: !1425)
!1427 = !MDLocation(line: 380, column: 5, scope: !217)
!1428 = !MDLocation(line: 380, column: 32, scope: !1429)
!1429 = !{!"0xb\001", !1, !1425}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1430 = !MDLocation(line: 380, column: 50, scope: !1425)
!1431 = !MDLocation(line: 380, column: 32, scope: !1425)
!1432 = !MDLocation(line: 381, column: 3, scope: !1425)
!1433 = !MDLocation(line: 383, column: 3, scope: !1425)
!1434 = !MDLocation(line: 384, column: 1, scope: !217)
!1435 = !{!"0x101\00this\0016777216\001088", !218, null, !980} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1436 = !MDLocation(line: 0, scope: !218)
!1437 = !{!"0x101\00turn\0033554818\000", !218, !200, !19} ; [ DW_TAG_arg_variable ] [turn] [line 386]
!1438 = !MDLocation(line: 386, column: 42, scope: !218)
!1439 = !{!"0x100\00c\00388\000", !218, !200, !"_ZTS10BitBoard64"} ; [ DW_TAG_auto_variable ] [c] [line 388]
!1440 = !MDLocation(line: 388, column: 13, scope: !218)
!1441 = !MDLocation(line: 390, column: 6, scope: !1442)
!1442 = !{!"0xb\00390\005\00103", !1, !218}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1443 = !MDLocation(line: 390, column: 5, scope: !218)
!1444 = !MDLocation(line: 391, column: 7, scope: !1442)
!1445 = !MDLocation(line: 391, column: 3, scope: !1442)
!1446 = !MDLocation(line: 393, column: 7, scope: !218)
!1447 = !MDLocation(line: 394, column: 7, scope: !218)
!1448 = !{!"0x100\00y\00396\000", !1449, !200, !19} ; [ DW_TAG_auto_variable ] [y] [line 396]
!1449 = !{!"0xb\00396\002\00104", !1, !218}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1450 = !MDLocation(line: 396, column: 10, scope: !1449)
!1451 = !MDLocation(line: 396, column: 6, scope: !1449)
!1452 = !MDLocation(line: 396, column: 17, scope: !1453)
!1453 = !{!"0xb\002", !1, !1454}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1454 = !{!"0xb\001", !1, !1455}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1455 = !{!"0xb\00396\002\00105", !1, !1449}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1456 = !MDLocation(line: 396, column: 2, scope: !1449)
!1457 = !MDLocation(line: 398, column: 11, scope: !1458)
!1458 = !{!"0xb\00397\002\00106", !1, !1455}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1459 = !MDLocation(line: 398, column: 3, scope: !1458)
!1460 = !MDLocation(line: 398, column: 13, scope: !1458)
!1461 = !MDLocation(line: 400, column: 6, scope: !1462)
!1462 = !{!"0xb\00400\006\00107", !1, !1458}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1463 = !MDLocation(line: 400, column: 6, scope: !1458)
!1464 = !MDLocation(line: 402, column: 12, scope: !1465)
!1465 = !{!"0xb\00402\004\00109", !1, !1466}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1466 = !{!"0xb\00401\003\00108", !1, !1462}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1467 = !{!"0x100\00off\00402\000", !1465, !200, !19} ; [ DW_TAG_auto_variable ] [off] [line 402]
!1468 = !MDLocation(line: 402, column: 8, scope: !1465)
!1469 = !MDLocation(line: 402, column: 21, scope: !1470)
!1470 = !{!"0xb\002", !1, !1471}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1471 = !{!"0xb\001", !1, !1472}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1472 = !{!"0xb\00402\004\00110", !1, !1465}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1473 = !MDLocation(line: 402, column: 32, scope: !1472)
!1474 = !MDLocation(line: 402, column: 28, scope: !1472)
!1475 = !MDLocation(line: 402, column: 21, scope: !1472)
!1476 = !MDLocation(line: 402, column: 4, scope: !1465)
!1477 = !MDLocation(line: 403, column: 10, scope: !1472)
!1478 = !MDLocation(line: 403, column: 5, scope: !1472)
!1479 = !MDLocation(line: 402, column: 36, scope: !1472)
!1480 = !MDLocation(line: 402, column: 4, scope: !1472)
!1481 = !MDLocation(line: 404, column: 3, scope: !1466)
!1482 = !MDLocation(line: 406, column: 11, scope: !1483)
!1483 = !{!"0xb\00406\003\00111", !1, !1458}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1484 = !{!"0x100\00x\00406\000", !1483, !200, !19} ; [ DW_TAG_auto_variable ] [x] [line 406]
!1485 = !MDLocation(line: 406, column: 7, scope: !1483)
!1486 = !MDLocation(line: 406, column: 18, scope: !1487)
!1487 = !{!"0xb\002", !1, !1488}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1488 = !{!"0xb\001", !1, !1489}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1489 = !{!"0xb\00406\003\00112", !1, !1483}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1490 = !MDLocation(line: 406, column: 3, scope: !1483)
!1491 = !{!"0x100\00no\00408\000", !1492, !200, !19} ; [ DW_TAG_auto_variable ] [no] [line 408]
!1492 = !{!"0xb\00407\003\00113", !1, !1489}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1493 = !MDLocation(line: 408, column: 8, scope: !1492)
!1494 = !MDLocation(line: 410, column: 30, scope: !1495)
!1495 = !{!"0xb\00410\007\00114", !1, !1492}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1496 = !MDLocation(line: 410, column: 33, scope: !1495)
!1497 = !MDLocation(line: 410, column: 13, scope: !1495)
!1498 = !MDLocation(line: 410, column: 8, scope: !1495)
!1499 = !MDLocation(line: 410, column: 7, scope: !1495)
!1500 = !MDLocation(line: 410, column: 7, scope: !1492)
!1501 = !MDLocation(line: 411, column: 10, scope: !1495)
!1502 = !MDLocation(line: 411, column: 5, scope: !1495)
!1503 = !MDLocation(line: 414, column: 8, scope: !1504)
!1504 = !{!"0xb\00414\008\00116", !1, !1505}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1505 = !{!"0xb\00413\004\00115", !1, !1495}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1506 = !MDLocation(line: 414, column: 21, scope: !1504)
!1507 = !MDLocation(line: 414, column: 8, scope: !1505)
!1508 = !MDLocation(line: 416, column: 35, scope: !1509)
!1509 = !{!"0xb\00416\009\00118", !1, !1510}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1510 = !{!"0xb\00415\005\00117", !1, !1504}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1511 = !MDLocation(line: 416, column: 38, scope: !1509)
!1512 = !MDLocation(line: 416, column: 18, scope: !1509)
!1513 = !MDLocation(line: 416, column: 9, scope: !1509)
!1514 = !MDLocation(line: 416, column: 9, scope: !1510)
!1515 = !MDLocation(line: 417, column: 12, scope: !1509)
!1516 = !MDLocation(line: 417, column: 7, scope: !1509)
!1517 = !MDLocation(line: 419, column: 12, scope: !1509)
!1518 = !MDLocation(line: 420, column: 5, scope: !1510)
!1519 = !MDLocation(line: 421, column: 11, scope: !1504)
!1520 = !MDLocation(line: 423, column: 3, scope: !1492)
!1521 = !MDLocation(line: 406, column: 26, scope: !1489)
!1522 = !MDLocation(line: 406, column: 3, scope: !1489)
!1523 = !MDLocation(line: 424, column: 8, scope: !1458)
!1524 = !MDLocation(line: 425, column: 2, scope: !1458)
!1525 = !MDLocation(line: 396, column: 25, scope: !1455)
!1526 = !MDLocation(line: 396, column: 2, scope: !1455)
!1527 = !{!"0x100\00empty\00427\000", !218, !200, !19} ; [ DW_TAG_auto_variable ] [empty] [line 427]
!1528 = !MDLocation(line: 427, column: 6, scope: !218)
!1529 = !MDLocation(line: 427, column: 21, scope: !218)
!1530 = !MDLocation(line: 427, column: 28, scope: !1531)
!1531 = !{!"0xb\001", !1, !218}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1532 = !MDLocation(line: 427, column: 45, scope: !1533)
!1533 = !{!"0xb\002", !1, !218}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1534 = !MDLocation(line: 428, column: 9, scope: !218)
!1535 = !MDLocation(line: 428, column: 16, scope: !1531)
!1536 = !MDLocation(line: 428, column: 33, scope: !1533)
!1537 = !MDLocation(line: 427, column: 20, scope: !218)
!1538 = !MDLocation(line: 427, column: 14, scope: !218)
!1539 = !MDLocation(line: 430, column: 7, scope: !218)
!1540 = !MDLocation(line: 430, column: 29, scope: !218)
!1541 = !MDLocation(line: 430, column: 36, scope: !1531)
!1542 = !MDLocation(line: 430, column: 53, scope: !1533)
!1543 = !MDLocation(line: 430, column: 7, scope: !1544)
!1544 = !{!"0xb\004", !1, !1545}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1545 = !{!"0xb\003", !1, !218}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonboard.cpp]
!1546 = !MDLocation(line: 431, column: 7, scope: !218)
!1547 = !MDLocation(line: 431, column: 21, scope: !218)
!1548 = !MDLocation(line: 431, column: 28, scope: !1531)
!1549 = !MDLocation(line: 431, column: 45, scope: !1533)
!1550 = !MDLocation(line: 431, column: 7, scope: !1544)
!1551 = !MDLocation(line: 432, column: 7, scope: !218)
!1552 = !MDLocation(line: 432, column: 24, scope: !218)
!1553 = !MDLocation(line: 432, column: 30, scope: !218)
!1554 = !MDLocation(line: 433, column: 7, scope: !218)
!1555 = !MDLocation(line: 433, column: 31, scope: !218)
!1556 = !MDLocation(line: 433, column: 30, scope: !218)
!1557 = !MDLocation(line: 433, column: 30, scope: !1531)
!1558 = !MDLocation(line: 433, column: 30, scope: !1533)
!1559 = !MDLocation(line: 433, column: 30, scope: !1544)
!1560 = !MDLocation(line: 433, column: 27, scope: !218)
!1561 = !MDLocation(line: 434, column: 11, scope: !218)
!1562 = !MDLocation(line: 434, column: 7, scope: !218)
!1563 = !MDLocation(line: 434, column: 46, scope: !218)
!1564 = !MDLocation(line: 435, column: 1, scope: !218)
!1565 = !{!"0x101\00this\0016777216\001088", !223, null, !171} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1566 = !MDLocation(line: 0, scope: !223)
!1567 = !MDLocation(line: 35, column: 18, scope: !223)
!1568 = !MDLocation(line: 0, scope: !226)
