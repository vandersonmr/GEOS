; ModuleID = 'hexxagonmove.cpp'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%class.HexxagonMoveList = type { i32, %class.HexxagonMove* }
%class.HexxagonMove = type { i8, i8, i32 }
%struct.timeb = type { i64, i16, i16, i16 }
%class.HexxagonBoard = type { %class.BitBoard64, %class.BitBoard64 }
%class.BitBoard64 = type { i32, i32 }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@hexx_count = global i8 0, align 1
@__llvm_gcov_ctr = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr1 = internal global [24 x i64] zeroinitializer
@__llvm_gcda_edge_table = internal unnamed_addr constant [2 x i64*] [i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 11), i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 12)]
@__llvm_gcov_global_state_pred = internal unnamed_addr global i32 -1
@__llvm_gcov_ctr2 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr3 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr4 = internal global [14 x i64] zeroinitializer
@__llvm_gcov_ctr5 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr6 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr7 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr8 = internal global [40 x i64] zeroinitializer
@__llvm_gcda_edge_table9 = internal unnamed_addr constant [2 x i64*] [i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 34), i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 35)]
@__llvm_gcov_global_state_pred10 = internal unnamed_addr global i32 -1
@__llvm_gcov_ctr11 = internal global [21 x i64] zeroinitializer
@__llvm_gcov_ctr12 = internal global [6 x i64] zeroinitializer
@__llvm_gcov_ctr13 = internal global [5 x i64] zeroinitializer
@__llvm_gcov_ctr14 = internal global [2 x i64] zeroinitializer
@0 = private unnamed_addr constant [5 x i8] c"*204\00"
@1 = private unnamed_addr constant [94 x i8] c"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.gcda\00"
@2 = private unnamed_addr constant [22 x i8] c"__cxx_global_var_init\00"
@3 = private unnamed_addr constant [46 x i8] c"_ZN16HexxagonMoveList7addMoveER12HexxagonMove\00"
@4 = private unnamed_addr constant [17 x i8] c"_Z7comparePKvS0_\00"
@5 = private unnamed_addr constant [39 x i8] c"_ZN16HexxagonMoveList13sortListQuickEv\00"
@6 = private unnamed_addr constant [33 x i8] c"_ZN16HexxagonMoveList8sortListEv\00"
@7 = private unnamed_addr constant [12 x i8] c"_Z7getTimev\00"
@8 = private unnamed_addr constant [32 x i8] c"_ZN16HexxagonMoveList7getMoveEi\00"
@9 = private unnamed_addr constant [36 x i8] c"_ZN16HexxagonMoveList10getNrMovesEv\00"
@10 = private unnamed_addr constant [37 x i8] c"_Z9alphaBetaR13HexxagonBoardiiiPFvvE\00"
@11 = private unnamed_addr constant [60 x i8] c"_ZN16HexxagonMoveList13scoreAllMovesE13HexxagonBoardiPFvvEi\00"
@12 = private unnamed_addr constant [37 x i8] c"_ZN16HexxagonMoveList11getBestMoveEv\00"
@13 = private unnamed_addr constant [26 x i8] c"_ZN16HexxagonMoveListD2Ev\00"
@14 = private unnamed_addr constant [22 x i8] c"_ZN12HexxagonMoveC2Ev\00"
@llvm.global_ctors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_hexxagonmove.cpp, i8* null }, { i32, void ()*, i8* } { i32 0, void ()* @__llvm_gcov_init, i8* null }]

define internal void @__cxx_global_var_init() section ".text.startup" {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr, i64 0, i64 0)
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr, i64 0, i64 1), !dbg !602
  %4 = add i64 %3, 1, !dbg !602
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr, i64 0, i64 1), !dbg !602
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !602
  %5 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #1, !dbg !602
  ret void, !dbg !602
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) #0

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) #0

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #1

; Function Attrs: uwtable
define void @_ZN16HexxagonMoveList7addMoveER12HexxagonMove(%class.HexxagonMoveList* %this, %class.HexxagonMove* dereferenceable(8) %move) #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonMoveList*, align 8
  %move.addr = alloca %class.HexxagonMove*, align 8
  %i = alloca i32, align 4
  %tmp = alloca %class.HexxagonMove*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonMoveList* %this, %class.HexxagonMoveList** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMoveList** %this.addr, metadata !603, metadata !604), !dbg !605
  store %class.HexxagonMove* %move, %class.HexxagonMove** %move.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMove** %move.addr, metadata !606, metadata !604), !dbg !607
  %this1 = load %class.HexxagonMoveList** %this.addr
  %nr_moves = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 0, !dbg !608
  %3 = load i32* %nr_moves, align 4, !dbg !608
  %and = and i32 %3, 15, !dbg !608
  %tobool = icmp ne i32 %and, 0, !dbg !610
  %4 = select i1 %tobool, i64 1, i64 2, !dbg !611
  %5 = getelementptr inbounds [24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 %4, !dbg !611
  %6 = load i64* %5, !dbg !611
  %7 = add i64 %6, 1, !dbg !611
  store i64 %7, i64* %5, !dbg !611
  br i1 %tobool, label %if.end10, label %if.then, !dbg !611

if.then:                                          ; preds = %2
  %8 = load i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 3), !dbg !612
  %9 = add i64 %8, 1, !dbg !612
  store i64 %9, i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 3), !dbg !612
  call void @llvm.dbg.declare(metadata i32* %i, metadata !615, metadata !604), !dbg !612
  store i32 16, i32* %i, align 4, !dbg !612
  br label %for.cond, !dbg !616

for.cond:                                         ; preds = %for.inc, %if.then
  %10 = load i32* %i, align 4, !dbg !617
  %nr_moves2 = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 0, !dbg !621
  %11 = load i32* %nr_moves2, align 4, !dbg !621
  %cmp = icmp sle i32 %10, %11, !dbg !622
  %12 = select i1 %cmp, i64 4, i64 5, !dbg !623
  %13 = getelementptr inbounds [24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 %12, !dbg !623
  %14 = load i64* %13, !dbg !623
  %15 = add i64 %14, 1, !dbg !623
  store i64 %15, i64* %13, !dbg !623
  br i1 %cmp, label %for.body, label %for.end, !dbg !623

for.body:                                         ; preds = %for.cond
  %nr_moves3 = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 0, !dbg !624
  %16 = load i32* %nr_moves3, align 4, !dbg !624
  %17 = load i32* %i, align 4, !dbg !627
  %cmp4 = icmp eq i32 %16, %17, !dbg !624
  %18 = select i1 %cmp4, i64 6, i64 7, !dbg !628
  %19 = getelementptr inbounds [24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 %18, !dbg !628
  %20 = load i64* %19, !dbg !628
  %21 = add i64 %20, 1, !dbg !628
  store i64 %21, i64* %19, !dbg !628
  br i1 %cmp4, label %if.then5, label %if.end, !dbg !628

if.then5:                                         ; preds = %for.body
  call void @llvm.dbg.declare(metadata %class.HexxagonMove** %tmp, metadata !629, metadata !604), !dbg !631
  %22 = load i32* %i, align 4, !dbg !632
  %mul = mul nsw i32 %22, 2, !dbg !632
  %23 = sext i32 %mul to i64, !dbg !633
  %24 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %23, i64 8), !dbg !633
  %25 = extractvalue { i64, i1 } %24, 1, !dbg !633
  %26 = extractvalue { i64, i1 } %24, 0, !dbg !633
  %27 = select i1 %25, i64 -1, i64 %26, !dbg !633
  %call = call noalias i8* @_Znam(i64 %27) #9, !dbg !633
  %28 = bitcast i8* %call to %class.HexxagonMove*, !dbg !633
  %isempty = icmp eq i64 %23, 0, !dbg !633
  %29 = select i1 %isempty, i64 8, i64 9, !dbg !633
  %30 = getelementptr inbounds [24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 %29, !dbg !633
  %31 = load i64* %30, !dbg !633
  %32 = add i64 %31, 1, !dbg !633
  store i64 %32, i64* %30, !dbg !633
  br i1 %isempty, label %arrayctor.cont, label %new.ctorloop, !dbg !633

new.ctorloop:                                     ; preds = %if.then5
  %33 = load i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 10), !dbg !634
  %34 = add i64 %33, 1, !dbg !634
  store i64 %34, i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 10), !dbg !634
  %arrayctor.end = getelementptr inbounds %class.HexxagonMove* %28, i64 %23, !dbg !634
  br label %arrayctor.loop, !dbg !634

arrayctor.loop:                                   ; preds = %invoke.cont, %new.ctorloop
  %arrayctor.cur = phi %class.HexxagonMove* [ %28, %new.ctorloop ], [ %arrayctor.next, %invoke.cont ], !dbg !633
  store i32 0, i32* @__llvm_gcov_global_state_pred, !dbg !636
  invoke void @_ZN12HexxagonMoveC2Ev(%class.HexxagonMove* %arrayctor.cur)
          to label %invoke.cont unwind label %lpad, !dbg !636

invoke.cont:                                      ; preds = %arrayctor.loop
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table, i64 0, i64 0)), !dbg !639
  %arrayctor.next = getelementptr inbounds %class.HexxagonMove* %arrayctor.cur, i64 1, !dbg !639
  %arrayctor.done = icmp eq %class.HexxagonMove* %arrayctor.next, %arrayctor.end, !dbg !639
  %35 = select i1 %arrayctor.done, i64 13, i64 14, !dbg !639
  %36 = getelementptr inbounds [24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 %35, !dbg !639
  %37 = load i64* %36, !dbg !639
  %38 = add i64 %37, 1, !dbg !639
  store i64 %38, i64* %36, !dbg !639
  br i1 %arrayctor.done, label %arrayctor.cont, label %arrayctor.loop, !dbg !639

arrayctor.cont:                                   ; preds = %if.then5, %invoke.cont
  store %class.HexxagonMove* %28, %class.HexxagonMove** %tmp, align 8, !dbg !641
  %39 = load %class.HexxagonMove** %tmp, align 8, !dbg !644
  %40 = bitcast %class.HexxagonMove* %39 to i8*, !dbg !645
  %moves = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 1, !dbg !646
  %41 = load %class.HexxagonMove** %moves, align 8, !dbg !646
  %42 = bitcast %class.HexxagonMove* %41 to i8*, !dbg !645
  %43 = load i32* %i, align 4, !dbg !647
  %conv = sext i32 %43 to i64, !dbg !647
  %mul6 = mul i64 %conv, 8, !dbg !647
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %40, i8* %42, i64 %mul6, i32 4, i1 false), !dbg !645
  %moves7 = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 1, !dbg !648
  %44 = load %class.HexxagonMove** %moves7, align 8, !dbg !648
  %isnull = icmp eq %class.HexxagonMove* %44, null, !dbg !649
  %45 = select i1 %isnull, i64 15, i64 16, !dbg !649
  %46 = getelementptr inbounds [24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 %45, !dbg !649
  %47 = load i64* %46, !dbg !649
  %48 = add i64 %47, 1, !dbg !649
  store i64 %48, i64* %46, !dbg !649
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !649

delete.notnull:                                   ; preds = %arrayctor.cont
  %49 = load i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 17), !dbg !650
  %50 = add i64 %49, 1, !dbg !650
  store i64 %50, i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 17), !dbg !650
  %51 = bitcast %class.HexxagonMove* %44 to i8*, !dbg !650
  call void @_ZdlPv(i8* %51) #10, !dbg !650
  br label %delete.end, !dbg !650

delete.end:                                       ; preds = %delete.notnull, %arrayctor.cont
  %52 = load i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 18), !dbg !651
  %53 = add i64 %52, 1, !dbg !651
  store i64 %53, i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 18), !dbg !651
  %54 = load %class.HexxagonMove** %tmp, align 8, !dbg !651
  %moves8 = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 1, !dbg !652
  store %class.HexxagonMove* %54, %class.HexxagonMove** %moves8, align 8, !dbg !652
  br label %if.end, !dbg !653

lpad:                                             ; preds = %arrayctor.loop
  %55 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !654
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table, i64 0, i64 1)), !dbg !654
  %56 = load i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 19), !dbg !654
  %57 = add i64 %56, 1, !dbg !654
  store i64 %57, i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 19), !dbg !654
  %58 = extractvalue { i8*, i32 } %55, 0, !dbg !654
  store i8* %58, i8** %exn.slot, !dbg !654
  %59 = extractvalue { i8*, i32 } %55, 1, !dbg !654
  store i32 %59, i32* %ehselector.slot, !dbg !654
  call void @_ZdaPv(i8* %call) #10, !dbg !654
  br label %eh.resume, !dbg !654

if.end:                                           ; preds = %delete.end, %for.body
  %60 = load i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 20), !dbg !655
  %61 = add i64 %60, 1, !dbg !655
  store i64 %61, i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 20), !dbg !655
  br label %for.inc, !dbg !655

for.inc:                                          ; preds = %if.end
  %62 = load i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 21), !dbg !656
  %63 = add i64 %62, 1, !dbg !656
  store i64 %63, i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 21), !dbg !656
  %64 = load i32* %i, align 4, !dbg !656
  %mul9 = mul nsw i32 %64, 2, !dbg !656
  store i32 %mul9, i32* %i, align 4, !dbg !656
  br label %for.cond, !dbg !657

for.end:                                          ; preds = %for.cond
  %65 = load i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 22), !dbg !658
  %66 = add i64 %65, 1, !dbg !658
  store i64 %66, i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 22), !dbg !658
  br label %if.end10, !dbg !658

if.end10:                                         ; preds = %for.end, %2
  %67 = load i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 23), !dbg !659
  %68 = add i64 %67, 1, !dbg !659
  store i64 %68, i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 23), !dbg !659
  %nr_moves11 = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 0, !dbg !659
  %69 = load i32* %nr_moves11, align 4, !dbg !659
  %idxprom = sext i32 %69 to i64, !dbg !660
  %moves12 = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 1, !dbg !660
  %70 = load %class.HexxagonMove** %moves12, align 8, !dbg !660
  %arrayidx = getelementptr inbounds %class.HexxagonMove* %70, i64 %idxprom, !dbg !660
  %71 = load %class.HexxagonMove** %move.addr, align 8, !dbg !660
  %72 = bitcast %class.HexxagonMove* %arrayidx to i8*, !dbg !660
  %73 = bitcast %class.HexxagonMove* %71 to i8*, !dbg !660
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %72, i8* %73, i64 8, i32 4, i1 false), !dbg !660
  %nr_moves13 = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 0, !dbg !661
  %74 = load i32* %nr_moves13, align 4, !dbg !661
  %inc = add nsw i32 %74, 1, !dbg !661
  store i32 %inc, i32* %nr_moves13, align 4, !dbg !661
  ret void, !dbg !662

eh.resume:                                        ; preds = %lpad
  %exn = load i8** %exn.slot, !dbg !663
  %sel = load i32* %ehselector.slot, !dbg !663
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !663
  %lpad.val14 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !663
  resume { i8*, i32 } %lpad.val14, !dbg !663
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #3

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #4

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN12HexxagonMoveC2Ev(%class.HexxagonMove* %this) unnamed_addr #5 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr14, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr14, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonMove*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr14, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr14, i64 0, i64 1)
  store %class.HexxagonMove* %this, %class.HexxagonMove** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMove** %this.addr, metadata !664, metadata !604), !dbg !665
  %this1 = load %class.HexxagonMove** %this.addr
  ret void, !dbg !666
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) #6

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #6

; Function Attrs: nounwind uwtable
define i32 @_Z7comparePKvS0_(i8* %mp1, i8* %mp2) #5 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr2, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr2, i64 0, i64 0)
  %mp1.addr = alloca i8*, align 8
  %mp2.addr = alloca i8*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr2, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr2, i64 0, i64 1)
  store i8* %mp1, i8** %mp1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %mp1.addr, metadata !667, metadata !604), !dbg !668
  store i8* %mp2, i8** %mp2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %mp2.addr, metadata !669, metadata !604), !dbg !670
  %5 = load i8** %mp2.addr, align 8, !dbg !671
  %6 = bitcast i8* %5 to %class.HexxagonMove*, !dbg !672
  %score = getelementptr inbounds %class.HexxagonMove* %6, i32 0, i32 2, !dbg !673
  %7 = load i32* %score, align 4, !dbg !673
  %8 = load i8** %mp1.addr, align 8, !dbg !674
  %9 = bitcast i8* %8 to %class.HexxagonMove*, !dbg !675
  %score1 = getelementptr inbounds %class.HexxagonMove* %9, i32 0, i32 2, !dbg !676
  %10 = load i32* %score1, align 4, !dbg !676
  %sub = sub nsw i32 %7, %10, !dbg !673
  ret i32 %sub, !dbg !677
}

; Function Attrs: uwtable
define void @_ZN16HexxagonMoveList13sortListQuickEv(%class.HexxagonMoveList* %this) #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr3, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr3, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonMoveList*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr3, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr3, i64 0, i64 1)
  store %class.HexxagonMoveList* %this, %class.HexxagonMoveList** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMoveList** %this.addr, metadata !678, metadata !604), !dbg !679
  %this1 = load %class.HexxagonMoveList** %this.addr
  %moves = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 1, !dbg !680
  %5 = load %class.HexxagonMove** %moves, align 8, !dbg !680
  %6 = bitcast %class.HexxagonMove* %5 to i8*, !dbg !680
  %nr_moves = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 0, !dbg !681
  %7 = load i32* %nr_moves, align 4, !dbg !681
  %conv = sext i32 %7 to i64, !dbg !681
  call void @qsort(i8* %6, i64 %conv, i64 8, i32 (i8*, i8*)* @_Z7comparePKvS0_), !dbg !682
  ret void, !dbg !683
}

declare void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #0

; Function Attrs: uwtable
define void @_ZN16HexxagonMoveList8sortListEv(%class.HexxagonMoveList* %this) #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonMoveList*, align 8
  %move = alloca i32, align 4
  %i = alloca i32, align 4
  %tmp = alloca %class.HexxagonMove, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 1)
  store %class.HexxagonMoveList* %this, %class.HexxagonMoveList** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMoveList** %this.addr, metadata !684, metadata !604), !dbg !685
  %this1 = load %class.HexxagonMoveList** %this.addr
  call void @llvm.dbg.declare(metadata i32* %move, metadata !686, metadata !604), !dbg !687
  store i32 1, i32* %move, align 4, !dbg !687
  br label %while.cond, !dbg !688

while.cond:                                       ; preds = %for.end, %2
  %5 = load i32* %move, align 4, !dbg !689
  %tobool = icmp ne i32 %5, 0, !dbg !689
  %6 = select i1 %tobool, i64 2, i64 3, !dbg !688
  %7 = getelementptr inbounds [14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 %6, !dbg !688
  %8 = load i64* %7, !dbg !688
  %9 = add i64 %8, 1, !dbg !688
  store i64 %9, i64* %7, !dbg !688
  br i1 %tobool, label %while.body, label %while.end, !dbg !688

while.body:                                       ; preds = %while.cond
  %10 = load i64* getelementptr inbounds ([14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 4), !dbg !692
  %11 = add i64 %10, 1, !dbg !692
  store i64 %11, i64* getelementptr inbounds ([14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 4), !dbg !692
  store i32 0, i32* %move, align 4, !dbg !692
  call void @llvm.dbg.declare(metadata i32* %i, metadata !694, metadata !604), !dbg !696
  store i32 0, i32* %i, align 4, !dbg !696
  br label %for.cond, !dbg !697

for.cond:                                         ; preds = %for.inc, %while.body
  %12 = load i32* %i, align 4, !dbg !698
  %nr_moves = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 0, !dbg !702
  %13 = load i32* %nr_moves, align 4, !dbg !702
  %sub = sub nsw i32 %13, 1, !dbg !702
  %cmp = icmp slt i32 %12, %sub, !dbg !703
  %14 = select i1 %cmp, i64 5, i64 6, !dbg !704
  %15 = getelementptr inbounds [14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 %14, !dbg !704
  %16 = load i64* %15, !dbg !704
  %17 = add i64 %16, 1, !dbg !704
  store i64 %17, i64* %15, !dbg !704
  br i1 %cmp, label %for.body, label %for.end, !dbg !704

for.body:                                         ; preds = %for.cond
  %18 = load i32* %i, align 4, !dbg !705
  %idxprom = sext i32 %18 to i64, !dbg !708
  %moves = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 1, !dbg !708
  %19 = load %class.HexxagonMove** %moves, align 8, !dbg !708
  %arrayidx = getelementptr inbounds %class.HexxagonMove* %19, i64 %idxprom, !dbg !708
  %score = getelementptr inbounds %class.HexxagonMove* %arrayidx, i32 0, i32 2, !dbg !708
  %20 = load i32* %score, align 4, !dbg !708
  %21 = load i32* %i, align 4, !dbg !709
  %add = add nsw i32 %21, 1, !dbg !709
  %idxprom2 = sext i32 %add to i64, !dbg !710
  %moves3 = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 1, !dbg !710
  %22 = load %class.HexxagonMove** %moves3, align 8, !dbg !710
  %arrayidx4 = getelementptr inbounds %class.HexxagonMove* %22, i64 %idxprom2, !dbg !710
  %score5 = getelementptr inbounds %class.HexxagonMove* %arrayidx4, i32 0, i32 2, !dbg !710
  %23 = load i32* %score5, align 4, !dbg !710
  %cmp6 = icmp slt i32 %20, %23, !dbg !708
  %24 = select i1 %cmp6, i64 7, i64 8, !dbg !711
  %25 = getelementptr inbounds [14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 %24, !dbg !711
  %26 = load i64* %25, !dbg !711
  %27 = add i64 %26, 1, !dbg !711
  store i64 %27, i64* %25, !dbg !711
  br i1 %cmp6, label %if.then, label %if.end, !dbg !711

if.then:                                          ; preds = %for.body
  %28 = load i64* getelementptr inbounds ([14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 9), !dbg !712
  %29 = add i64 %28, 1, !dbg !712
  store i64 %29, i64* getelementptr inbounds ([14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 9), !dbg !712
  store i32 1, i32* %move, align 4, !dbg !712
  call void @llvm.dbg.declare(metadata %class.HexxagonMove* %tmp, metadata !714, metadata !604), !dbg !715
  call void @_ZN12HexxagonMoveC2Ev(%class.HexxagonMove* %tmp), !dbg !715
  %30 = bitcast %class.HexxagonMove* %tmp to i8*, !dbg !716
  %31 = load i32* %i, align 4, !dbg !717
  %idxprom7 = sext i32 %31 to i64, !dbg !716
  %moves8 = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 1, !dbg !718
  %32 = load %class.HexxagonMove** %moves8, align 8, !dbg !718
  %arrayidx9 = getelementptr inbounds %class.HexxagonMove* %32, i64 %idxprom7, !dbg !716
  %33 = bitcast %class.HexxagonMove* %arrayidx9 to i8*, !dbg !716
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %30, i8* %33, i64 8, i32 4, i1 false), !dbg !716
  %34 = load i32* %i, align 4, !dbg !719
  %idxprom10 = sext i32 %34 to i64, !dbg !720
  %moves11 = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 1, !dbg !721
  %35 = load %class.HexxagonMove** %moves11, align 8, !dbg !721
  %arrayidx12 = getelementptr inbounds %class.HexxagonMove* %35, i64 %idxprom10, !dbg !720
  %36 = bitcast %class.HexxagonMove* %arrayidx12 to i8*, !dbg !720
  %37 = load i32* %i, align 4, !dbg !722
  %add13 = add nsw i32 %37, 1, !dbg !722
  %idxprom14 = sext i32 %add13 to i64, !dbg !720
  %moves15 = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 1, !dbg !723
  %38 = load %class.HexxagonMove** %moves15, align 8, !dbg !723
  %arrayidx16 = getelementptr inbounds %class.HexxagonMove* %38, i64 %idxprom14, !dbg !720
  %39 = bitcast %class.HexxagonMove* %arrayidx16 to i8*, !dbg !720
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %36, i8* %39, i64 8, i32 4, i1 false), !dbg !720
  %40 = load i32* %i, align 4, !dbg !724
  %add17 = add nsw i32 %40, 1, !dbg !724
  %idxprom18 = sext i32 %add17 to i64, !dbg !725
  %moves19 = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 1, !dbg !726
  %41 = load %class.HexxagonMove** %moves19, align 8, !dbg !726
  %arrayidx20 = getelementptr inbounds %class.HexxagonMove* %41, i64 %idxprom18, !dbg !725
  %42 = bitcast %class.HexxagonMove* %arrayidx20 to i8*, !dbg !725
  %43 = bitcast %class.HexxagonMove* %tmp to i8*, !dbg !725
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %42, i8* %43, i64 8, i32 4, i1 false), !dbg !725
  br label %if.end, !dbg !727

if.end:                                           ; preds = %if.then, %for.body
  %44 = load i64* getelementptr inbounds ([14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 10), !dbg !728
  %45 = add i64 %44, 1, !dbg !728
  store i64 %45, i64* getelementptr inbounds ([14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 10), !dbg !728
  br label %for.inc, !dbg !728

for.inc:                                          ; preds = %if.end
  %46 = load i64* getelementptr inbounds ([14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 11), !dbg !729
  %47 = add i64 %46, 1, !dbg !729
  store i64 %47, i64* getelementptr inbounds ([14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 11), !dbg !729
  %48 = load i32* %i, align 4, !dbg !729
  %inc = add nsw i32 %48, 1, !dbg !729
  store i32 %inc, i32* %i, align 4, !dbg !729
  br label %for.cond, !dbg !730

for.end:                                          ; preds = %for.cond
  %49 = load i64* getelementptr inbounds ([14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 12), !dbg !688
  %50 = add i64 %49, 1, !dbg !688
  store i64 %50, i64* getelementptr inbounds ([14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 12), !dbg !688
  br label %while.cond, !dbg !688

while.end:                                        ; preds = %while.cond
  %51 = load i64* getelementptr inbounds ([14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 13), !dbg !731
  %52 = add i64 %51, 1, !dbg !731
  store i64 %52, i64* getelementptr inbounds ([14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 13), !dbg !731
  ret void, !dbg !731
}

; Function Attrs: uwtable
define i32 @_Z7getTimev() #2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr5, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr5, i64 0, i64 0)
  %tb = alloca %struct.timeb, align 8
  call void @llvm.dbg.declare(metadata %struct.timeb* %tb, metadata !732, metadata !604), !dbg !733
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr5, i64 0, i64 1), !dbg !734
  %4 = add i64 %3, 1, !dbg !734
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr5, i64 0, i64 1), !dbg !734
  %call = call i32 @ftime(%struct.timeb* %tb), !dbg !734
  %time = getelementptr inbounds %struct.timeb* %tb, i32 0, i32 0, !dbg !735
  %5 = load i64* %time, align 8, !dbg !735
  %mul = mul nsw i64 %5, 1000, !dbg !735
  %millitm = getelementptr inbounds %struct.timeb* %tb, i32 0, i32 1, !dbg !736
  %6 = load i16* %millitm, align 2, !dbg !736
  %conv = zext i16 %6 to i64, !dbg !736
  %add = add nsw i64 %mul, %conv, !dbg !737
  %conv1 = trunc i64 %add to i32, !dbg !737
  ret i32 %conv1, !dbg !738
}

declare i32 @ftime(%struct.timeb*) #0

; Function Attrs: nounwind uwtable
define %class.HexxagonMove* @_ZN16HexxagonMoveList7getMoveEi(%class.HexxagonMoveList* %this, i32 %i) #5 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr6, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr6, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonMoveList*, align 8
  %i.addr = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr6, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr6, i64 0, i64 1)
  store %class.HexxagonMoveList* %this, %class.HexxagonMoveList** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMoveList** %this.addr, metadata !739, metadata !604), !dbg !740
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !741, metadata !604), !dbg !742
  %this1 = load %class.HexxagonMoveList** %this.addr
  %5 = load i32* %i.addr, align 4, !dbg !743
  %idxprom = sext i32 %5 to i64, !dbg !744
  %moves = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 1, !dbg !745
  %6 = load %class.HexxagonMove** %moves, align 8, !dbg !745
  %arrayidx = getelementptr inbounds %class.HexxagonMove* %6, i64 %idxprom, !dbg !744
  ret %class.HexxagonMove* %arrayidx, !dbg !746
}

; Function Attrs: nounwind uwtable
define i32 @_ZN16HexxagonMoveList10getNrMovesEv(%class.HexxagonMoveList* %this) #5 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr7, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr7, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonMoveList*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr7, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr7, i64 0, i64 1)
  store %class.HexxagonMoveList* %this, %class.HexxagonMoveList** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMoveList** %this.addr, metadata !747, metadata !604), !dbg !748
  %this1 = load %class.HexxagonMoveList** %this.addr
  %nr_moves = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 0, !dbg !749
  %5 = load i32* %nr_moves, align 4, !dbg !749
  ret i32 %5, !dbg !750
}

; Function Attrs: uwtable
define i32 @_Z9alphaBetaR13HexxagonBoardiiiPFvvE(%class.HexxagonBoard* dereferenceable(16) %board, i32 %level, i32 %alpha, i32 %beta, void ()* %callback) #2 {
entry:
  %0 = load i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 0)
  %retval = alloca i32, align 4
  %board.addr = alloca %class.HexxagonBoard*, align 8
  %level.addr = alloca i32, align 4
  %alpha.addr = alloca i32, align 4
  %beta.addr = alloca i32, align 4
  %callback.addr = alloca void ()*, align 8
  %best = alloca i32, align 4
  %moves = alloca %class.HexxagonMoveList*, align 8
  %score = alloca i32, align 4
  %i = alloca i32, align 4
  %newboard = alloca %class.HexxagonBoard, align 4
  %value = alloca i32, align 4
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonBoard* %board, %class.HexxagonBoard** %board.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %board.addr, metadata !751, metadata !604), !dbg !752
  store i32 %level, i32* %level.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %level.addr, metadata !753, metadata !604), !dbg !754
  store i32 %alpha, i32* %alpha.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %alpha.addr, metadata !755, metadata !604), !dbg !756
  store i32 %beta, i32* %beta.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %beta.addr, metadata !757, metadata !604), !dbg !758
  store void ()* %callback, void ()** %callback.addr, align 8
  call void @llvm.dbg.declare(metadata void ()** %callback.addr, metadata !759, metadata !604), !dbg !760
  call void @llvm.dbg.declare(metadata i32* %best, metadata !761, metadata !604), !dbg !762
  store i32 -32000, i32* %best, align 4, !dbg !762
  %3 = load i32* %level.addr, align 4, !dbg !763
  %tobool = icmp ne i32 %3, 0, !dbg !763
  %4 = select i1 %tobool, i64 1, i64 2, !dbg !765
  %5 = getelementptr inbounds [40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 %4, !dbg !765
  %6 = load i64* %5, !dbg !765
  %7 = add i64 %6, 1, !dbg !765
  store i64 %7, i64* %5, !dbg !765
  br i1 %tobool, label %if.end, label %if.then, !dbg !765

if.then:                                          ; preds = %2
  %8 = load i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 3), !dbg !766
  %9 = add i64 %8, 1, !dbg !766
  store i64 %9, i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 3), !dbg !766
  %10 = load %class.HexxagonBoard** %board.addr, align 8, !dbg !766
  %call = call i32 @_ZN13HexxagonBoard8evaluateEv(%class.HexxagonBoard* %10), !dbg !766
  store i32 %call, i32* %retval, !dbg !767
  br label %return, !dbg !767

if.end:                                           ; preds = %2
  call void @llvm.dbg.declare(metadata %class.HexxagonMoveList** %moves, metadata !768, metadata !604), !dbg !769
  %11 = load %class.HexxagonBoard** %board.addr, align 8, !dbg !770
  %call1 = call %class.HexxagonMoveList* @_ZN13HexxagonBoard16generateMoveListEv(%class.HexxagonBoard* %11), !dbg !770
  store %class.HexxagonMoveList* %call1, %class.HexxagonMoveList** %moves, align 8, !dbg !769
  %12 = load %class.HexxagonMoveList** %moves, align 8, !dbg !771
  %tobool2 = icmp ne %class.HexxagonMoveList* %12, null, !dbg !771
  %13 = select i1 %tobool2, i64 4, i64 5, !dbg !773
  %14 = getelementptr inbounds [40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 %13, !dbg !773
  %15 = load i64* %14, !dbg !773
  %16 = add i64 %15, 1, !dbg !773
  store i64 %16, i64* %14, !dbg !773
  br i1 %tobool2, label %if.end10, label %if.then3, !dbg !773

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %score, metadata !774, metadata !604), !dbg !776
  %17 = load %class.HexxagonBoard** %board.addr, align 8, !dbg !777
  %call4 = call i32 @_ZN13HexxagonBoard11countBricksEi(%class.HexxagonBoard* %17, i32 0), !dbg !777
  store i32 %call4, i32* %score, align 4, !dbg !776
  %18 = load i32* %score, align 4, !dbg !778
  %cmp = icmp sgt i32 %18, 0, !dbg !778
  %19 = select i1 %cmp, i64 6, i64 7, !dbg !780
  %20 = getelementptr inbounds [40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 %19, !dbg !780
  %21 = load i64* %20, !dbg !780
  %22 = add i64 %21, 1, !dbg !780
  store i64 %22, i64* %20, !dbg !780
  br i1 %cmp, label %if.then5, label %if.else, !dbg !780

if.then5:                                         ; preds = %if.then3
  %23 = load i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 8), !dbg !781
  %24 = add i64 %23, 1, !dbg !781
  store i64 %24, i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 8), !dbg !781
  %25 = load i32* %score, align 4, !dbg !781
  %add = add nsw i32 %25, 20000, !dbg !781
  store i32 %add, i32* %retval, !dbg !782
  br label %return, !dbg !782

if.else:                                          ; preds = %if.then3
  %26 = load i32* %score, align 4, !dbg !783
  %cmp6 = icmp slt i32 %26, 0, !dbg !783
  %27 = select i1 %cmp6, i64 9, i64 10, !dbg !785
  %28 = getelementptr inbounds [40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 %27, !dbg !785
  %29 = load i64* %28, !dbg !785
  %30 = add i64 %29, 1, !dbg !785
  store i64 %30, i64* %28, !dbg !785
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !785

if.then7:                                         ; preds = %if.else
  %31 = load i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 11), !dbg !786
  %32 = add i64 %31, 1, !dbg !786
  store i64 %32, i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 11), !dbg !786
  %33 = load i32* %score, align 4, !dbg !786
  %sub = sub nsw i32 %33, 20000, !dbg !786
  store i32 %sub, i32* %retval, !dbg !787
  br label %return, !dbg !787

if.else8:                                         ; preds = %if.else
  %34 = load i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 12), !dbg !788
  %35 = add i64 %34, 1, !dbg !788
  store i64 %35, i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 12), !dbg !788
  %36 = load %class.HexxagonBoard** %board.addr, align 8, !dbg !788
  %call9 = call i32 @_ZN13HexxagonBoard8evaluateEv(%class.HexxagonBoard* %36), !dbg !788
  store i32 %call9, i32* %retval, !dbg !789
  br label %return, !dbg !789

if.end10:                                         ; preds = %if.end
  %37 = load i8* @hexx_count, align 1, !dbg !790
  %inc = add i8 %37, 1, !dbg !790
  store i8 %inc, i8* @hexx_count, align 1, !dbg !790
  %38 = load i8* @hexx_count, align 1, !dbg !791
  %tobool11 = icmp ne i8 %38, 0, !dbg !791
  %39 = select i1 %tobool11, i64 13, i64 14, !dbg !793
  %40 = getelementptr inbounds [40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 %39, !dbg !793
  %41 = load i64* %40, !dbg !793
  %42 = add i64 %41, 1, !dbg !793
  store i64 %42, i64* %40, !dbg !793
  br i1 %tobool11, label %if.end14, label %land.lhs.true, !dbg !793

land.lhs.true:                                    ; preds = %if.end10
  %43 = load void ()** %callback.addr, align 8, !dbg !794
  %tobool12 = icmp ne void ()* %43, null, !dbg !794
  %44 = select i1 %tobool12, i64 15, i64 16, !dbg !793
  %45 = getelementptr inbounds [40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 %44, !dbg !793
  %46 = load i64* %45, !dbg !793
  %47 = add i64 %46, 1, !dbg !793
  store i64 %47, i64* %45, !dbg !793
  br i1 %tobool12, label %if.then13, label %if.end14, !dbg !793

if.then13:                                        ; preds = %land.lhs.true
  %48 = load i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 17), !dbg !796
  %49 = add i64 %48, 1, !dbg !796
  store i64 %49, i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 17), !dbg !796
  %50 = load void ()** %callback.addr, align 8, !dbg !796
  call void %50(), !dbg !796
  br label %if.end14, !dbg !796

if.end14:                                         ; preds = %if.then13, %land.lhs.true, %if.end10
  %51 = load i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 18), !dbg !797
  %52 = add i64 %51, 1, !dbg !797
  store i64 %52, i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 18), !dbg !797
  call void @llvm.dbg.declare(metadata i32* %i, metadata !799, metadata !604), !dbg !797
  store i32 0, i32* %i, align 4, !dbg !797
  br label %for.cond, !dbg !800

for.cond:                                         ; preds = %for.inc, %if.end14
  %53 = load i32* %i, align 4, !dbg !801
  %54 = load %class.HexxagonMoveList** %moves, align 8, !dbg !805
  %call15 = call i32 @_ZN16HexxagonMoveList10getNrMovesEv(%class.HexxagonMoveList* %54), !dbg !805
  %cmp16 = icmp slt i32 %53, %call15, !dbg !806
  %55 = select i1 %cmp16, i64 19, i64 20, !dbg !807
  %56 = getelementptr inbounds [40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 %55, !dbg !807
  %57 = load i64* %56, !dbg !807
  %58 = add i64 %57, 1, !dbg !807
  store i64 %58, i64* %56, !dbg !807
  br i1 %cmp16, label %land.rhs, label %land.end, !dbg !807

land.rhs:                                         ; preds = %for.cond
  %59 = load i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 21), !dbg !808
  %60 = add i64 %59, 1, !dbg !808
  store i64 %60, i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 21), !dbg !808
  %61 = load i32* %best, align 4, !dbg !808
  %62 = load i32* %beta.addr, align 4, !dbg !810
  %cmp17 = icmp slt i32 %61, %62, !dbg !811
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %63 = phi i1 [ false, %for.cond ], [ %cmp17, %land.rhs ]
  %64 = select i1 %63, i64 22, i64 23, !dbg !812
  %65 = getelementptr inbounds [40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 %64, !dbg !812
  %66 = load i64* %65, !dbg !812
  %67 = add i64 %66, 1, !dbg !812
  store i64 %67, i64* %65, !dbg !812
  br i1 %63, label %for.body, label %for.end, !dbg !812

for.body:                                         ; preds = %land.end
  %68 = load i32* %best, align 4, !dbg !814
  %69 = load i32* %alpha.addr, align 4, !dbg !817
  %cmp18 = icmp sgt i32 %68, %69, !dbg !814
  %70 = select i1 %cmp18, i64 24, i64 25, !dbg !818
  %71 = getelementptr inbounds [40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 %70, !dbg !818
  %72 = load i64* %71, !dbg !818
  %73 = add i64 %72, 1, !dbg !818
  store i64 %73, i64* %71, !dbg !818
  br i1 %cmp18, label %if.then19, label %if.end20, !dbg !818

if.then19:                                        ; preds = %for.body
  %74 = load i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 26), !dbg !819
  %75 = add i64 %74, 1, !dbg !819
  store i64 %75, i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 26), !dbg !819
  %76 = load i32* %best, align 4, !dbg !819
  store i32 %76, i32* %alpha.addr, align 4, !dbg !820
  br label %if.end20, !dbg !820

if.end20:                                         ; preds = %if.then19, %for.body
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard* %newboard, metadata !821, metadata !604), !dbg !822
  %77 = load %class.HexxagonBoard** %board.addr, align 8, !dbg !822
  call void @_ZN13HexxagonBoardC1ERKS_(%class.HexxagonBoard* %newboard, %class.HexxagonBoard* dereferenceable(16) %77), !dbg !822
  %78 = load %class.HexxagonMoveList** %moves, align 8, !dbg !823
  %79 = load i32* %i, align 4, !dbg !824
  %call21 = call %class.HexxagonMove* @_ZN16HexxagonMoveList7getMoveEi(%class.HexxagonMoveList* %78, i32 %79), !dbg !823
  %call22 = call i32 @_ZN13HexxagonBoard9applyMoveER12HexxagonMove(%class.HexxagonBoard* %newboard, %class.HexxagonMove* dereferenceable(8) %call21), !dbg !825
  call void @llvm.dbg.declare(metadata i32* %value, metadata !826, metadata !604), !dbg !827
  %80 = load i32* %level.addr, align 4, !dbg !828
  %sub23 = sub nsw i32 %80, 1, !dbg !828
  %81 = load i32* %beta.addr, align 4, !dbg !829
  %sub24 = sub nsw i32 0, %81, !dbg !830
  %82 = load i32* %alpha.addr, align 4, !dbg !831
  %sub25 = sub nsw i32 0, %82, !dbg !832
  %83 = load void ()** %callback.addr, align 8, !dbg !833
  %call26 = call i32 @_Z9alphaBetaR13HexxagonBoardiiiPFvvE(%class.HexxagonBoard* dereferenceable(16) %newboard, i32 %sub23, i32 %sub24, i32 %sub25, void ()* %83), !dbg !834
  %sub27 = sub nsw i32 0, %call26, !dbg !835
  store i32 %sub27, i32* %value, align 4, !dbg !827
  %84 = load i32* %value, align 4, !dbg !836
  %85 = load i32* %best, align 4, !dbg !838
  %cmp28 = icmp sgt i32 %84, %85, !dbg !836
  %86 = select i1 %cmp28, i64 27, i64 28, !dbg !839
  %87 = getelementptr inbounds [40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 %86, !dbg !839
  %88 = load i64* %87, !dbg !839
  %89 = add i64 %88, 1, !dbg !839
  store i64 %89, i64* %87, !dbg !839
  br i1 %cmp28, label %if.then29, label %if.end30, !dbg !839

if.then29:                                        ; preds = %if.end20
  %90 = load i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 29), !dbg !840
  %91 = add i64 %90, 1, !dbg !840
  store i64 %91, i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 29), !dbg !840
  %92 = load i32* %value, align 4, !dbg !840
  store i32 %92, i32* %best, align 4, !dbg !841
  br label %if.end30, !dbg !841

if.end30:                                         ; preds = %if.then29, %if.end20
  %93 = load i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 30), !dbg !842
  %94 = add i64 %93, 1, !dbg !842
  store i64 %94, i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 30), !dbg !842
  br label %for.inc, !dbg !842

for.inc:                                          ; preds = %if.end30
  %95 = load i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 31), !dbg !843
  %96 = add i64 %95, 1, !dbg !843
  store i64 %96, i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 31), !dbg !843
  %97 = load i32* %i, align 4, !dbg !843
  %inc31 = add nsw i32 %97, 1, !dbg !843
  store i32 %inc31, i32* %i, align 4, !dbg !843
  br label %for.cond, !dbg !844

for.end:                                          ; preds = %land.end
  %98 = load %class.HexxagonMoveList** %moves, align 8, !dbg !845
  %isnull = icmp eq %class.HexxagonMoveList* %98, null, !dbg !846
  %99 = select i1 %isnull, i64 32, i64 33, !dbg !846
  %100 = getelementptr inbounds [40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 %99, !dbg !846
  %101 = load i64* %100, !dbg !846
  %102 = add i64 %101, 1, !dbg !846
  store i64 %102, i64* %100, !dbg !846
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !846

delete.notnull:                                   ; preds = %for.end
  store i32 0, i32* @__llvm_gcov_global_state_pred10, !dbg !847
  invoke void @_ZN16HexxagonMoveListD2Ev(%class.HexxagonMoveList* %98)
          to label %invoke.cont unwind label %lpad, !dbg !847

invoke.cont:                                      ; preds = %delete.notnull
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred10, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table9, i64 0, i64 0)), !dbg !849
  %103 = load i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 36), !dbg !849
  %104 = add i64 %103, 1, !dbg !849
  store i64 %104, i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 36), !dbg !849
  %105 = bitcast %class.HexxagonMoveList* %98 to i8*, !dbg !849
  call void @_ZdlPv(i8* %105) #10, !dbg !849
  br label %delete.end, !dbg !849

delete.end:                                       ; preds = %invoke.cont, %for.end
  %106 = load i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 37), !dbg !851
  %107 = add i64 %106, 1, !dbg !851
  store i64 %107, i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 37), !dbg !851
  %108 = load i32* %best, align 4, !dbg !851
  store i32 %108, i32* %retval, !dbg !852
  br label %return, !dbg !852

lpad:                                             ; preds = %delete.notnull
  %109 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !853
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred10, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table9, i64 0, i64 1)), !dbg !853
  %110 = load i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 38), !dbg !853
  %111 = add i64 %110, 1, !dbg !853
  store i64 %111, i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 38), !dbg !853
  %112 = extractvalue { i8*, i32 } %109, 0, !dbg !853
  store i8* %112, i8** %exn.slot, !dbg !853
  %113 = extractvalue { i8*, i32 } %109, 1, !dbg !853
  store i32 %113, i32* %ehselector.slot, !dbg !853
  %114 = bitcast %class.HexxagonMoveList* %98 to i8*, !dbg !853
  call void @_ZdlPv(i8* %114) #10, !dbg !853
  br label %eh.resume, !dbg !853

return:                                           ; preds = %delete.end, %if.else8, %if.then7, %if.then5, %if.then
  %115 = load i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 39), !dbg !853
  %116 = add i64 %115, 1, !dbg !853
  store i64 %116, i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 39), !dbg !853
  %117 = load i32* %retval, !dbg !853
  ret i32 %117, !dbg !853

eh.resume:                                        ; preds = %lpad
  %exn = load i8** %exn.slot, !dbg !854
  %sel = load i32* %ehselector.slot, !dbg !854
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !854
  %lpad.val32 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !854
  resume { i8*, i32 } %lpad.val32, !dbg !854
}

declare i32 @_ZN13HexxagonBoard8evaluateEv(%class.HexxagonBoard*) #0

declare %class.HexxagonMoveList* @_ZN13HexxagonBoard16generateMoveListEv(%class.HexxagonBoard*) #0

declare i32 @_ZN13HexxagonBoard11countBricksEi(%class.HexxagonBoard*, i32) #0

declare void @_ZN13HexxagonBoardC1ERKS_(%class.HexxagonBoard*, %class.HexxagonBoard* dereferenceable(16)) #0

declare i32 @_ZN13HexxagonBoard9applyMoveER12HexxagonMove(%class.HexxagonBoard*, %class.HexxagonMove* dereferenceable(8)) #0

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN16HexxagonMoveListD2Ev(%class.HexxagonMoveList* %this) unnamed_addr #5 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr13, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr13, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonMoveList*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonMoveList* %this, %class.HexxagonMoveList** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMoveList** %this.addr, metadata !855, metadata !604), !dbg !856
  %this1 = load %class.HexxagonMoveList** %this.addr
  %moves = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 1, !dbg !857
  %3 = load %class.HexxagonMove** %moves, align 8, !dbg !857
  %isnull = icmp eq %class.HexxagonMove* %3, null, !dbg !859
  %4 = select i1 %isnull, i64 1, i64 2, !dbg !859
  %5 = getelementptr inbounds [5 x i64]* @__llvm_gcov_ctr13, i64 0, i64 %4, !dbg !859
  %6 = load i64* %5, !dbg !859
  %7 = add i64 %6, 1, !dbg !859
  store i64 %7, i64* %5, !dbg !859
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !859

delete.notnull:                                   ; preds = %2
  %8 = load i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr13, i64 0, i64 3), !dbg !860
  %9 = add i64 %8, 1, !dbg !860
  store i64 %9, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr13, i64 0, i64 3), !dbg !860
  %10 = bitcast %class.HexxagonMove* %3 to i8*, !dbg !860
  call void @_ZdlPv(i8* %10) #10, !dbg !860
  br label %delete.end, !dbg !860

delete.end:                                       ; preds = %delete.notnull, %2
  %11 = load i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr13, i64 0, i64 4), !dbg !862
  %12 = add i64 %11, 1, !dbg !862
  store i64 %12, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr13, i64 0, i64 4), !dbg !862
  ret void, !dbg !862
}

; Function Attrs: uwtable
define void @_ZN16HexxagonMoveList13scoreAllMovesE13HexxagonBoardiPFvvEi(%class.HexxagonMoveList* %this, %class.HexxagonBoard* %board, i32 %depth, void ()* %callback, i32 %maxtime) #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonMoveList*, align 8
  %depth.addr = alloca i32, align 4
  %callback.addr = alloca void ()*, align 8
  %maxtime.addr = alloca i32, align 4
  %t = alloca i32, align 4
  %i = alloca i32, align 4
  %best = alloca i32, align 4
  %alpha = alloca i32, align 4
  %beta = alloca i32, align 4
  %j = alloca i32, align 4
  %newboard = alloca %class.HexxagonBoard, align 4
  %value = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 1)
  store %class.HexxagonMoveList* %this, %class.HexxagonMoveList** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMoveList** %this.addr, metadata !865, metadata !604), !dbg !866
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard* %board, metadata !867, metadata !604), !dbg !868
  store i32 %depth, i32* %depth.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %depth.addr, metadata !869, metadata !604), !dbg !870
  store void ()* %callback, void ()** %callback.addr, align 8
  call void @llvm.dbg.declare(metadata void ()** %callback.addr, metadata !871, metadata !604), !dbg !872
  store i32 %maxtime, i32* %maxtime.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %maxtime.addr, metadata !873, metadata !604), !dbg !874
  %this1 = load %class.HexxagonMoveList** %this.addr
  call void @llvm.dbg.declare(metadata i32* %t, metadata !875, metadata !604), !dbg !876
  %call = call i32 @_Z7getTimev(), !dbg !877
  store i32 %call, i32* %t, align 4, !dbg !876
  call void @llvm.dbg.declare(metadata i32* %i, metadata !878, metadata !604), !dbg !880
  store i32 1, i32* %i, align 4, !dbg !880
  br label %for.cond, !dbg !881

for.cond:                                         ; preds = %for.inc17, %2
  %5 = load i32* %i, align 4, !dbg !882
  %6 = load i32* %depth.addr, align 4, !dbg !886
  %cmp = icmp slt i32 %5, %6, !dbg !887
  %7 = select i1 %cmp, i64 2, i64 3, !dbg !888
  %8 = getelementptr inbounds [21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 %7, !dbg !888
  %9 = load i64* %8, !dbg !888
  %10 = add i64 %9, 1, !dbg !888
  store i64 %10, i64* %8, !dbg !888
  br i1 %cmp, label %for.body, label %for.end19, !dbg !888

for.body:                                         ; preds = %for.cond
  %11 = load i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 4), !dbg !889
  %12 = add i64 %11, 1, !dbg !889
  store i64 %12, i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 4), !dbg !889
  call void @llvm.dbg.declare(metadata i32* %best, metadata !891, metadata !604), !dbg !889
  store i32 -32000, i32* %best, align 4, !dbg !889
  call void @llvm.dbg.declare(metadata i32* %alpha, metadata !892, metadata !604), !dbg !893
  store i32 -32000, i32* %alpha, align 4, !dbg !893
  call void @llvm.dbg.declare(metadata i32* %beta, metadata !894, metadata !604), !dbg !895
  store i32 32000, i32* %beta, align 4, !dbg !895
  call void @llvm.dbg.declare(metadata i32* %j, metadata !896, metadata !604), !dbg !898
  store i32 0, i32* %j, align 4, !dbg !898
  br label %for.cond2, !dbg !899

for.cond2:                                        ; preds = %for.inc, %for.body
  %13 = load i32* %j, align 4, !dbg !900
  %call3 = call i32 @_ZN16HexxagonMoveList10getNrMovesEv(%class.HexxagonMoveList* %this1), !dbg !904
  %cmp4 = icmp slt i32 %13, %call3, !dbg !905
  %14 = select i1 %cmp4, i64 5, i64 6, !dbg !906
  %15 = getelementptr inbounds [21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 %14, !dbg !906
  %16 = load i64* %15, !dbg !906
  %17 = add i64 %16, 1, !dbg !906
  store i64 %17, i64* %15, !dbg !906
  br i1 %cmp4, label %land.rhs, label %land.end, !dbg !906

land.rhs:                                         ; preds = %for.cond2
  %18 = load i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 7), !dbg !907
  %19 = add i64 %18, 1, !dbg !907
  store i64 %19, i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 7), !dbg !907
  %20 = load i32* %best, align 4, !dbg !907
  %21 = load i32* %beta, align 4, !dbg !909
  %cmp5 = icmp slt i32 %20, %21, !dbg !910
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond2
  %22 = phi i1 [ false, %for.cond2 ], [ %cmp5, %land.rhs ]
  %23 = select i1 %22, i64 8, i64 9, !dbg !911
  %24 = getelementptr inbounds [21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 %23, !dbg !911
  %25 = load i64* %24, !dbg !911
  %26 = add i64 %25, 1, !dbg !911
  store i64 %26, i64* %24, !dbg !911
  br i1 %22, label %for.body6, label %for.end, !dbg !911

for.body6:                                        ; preds = %land.end
  %27 = load i32* %best, align 4, !dbg !913
  %28 = load i32* %alpha, align 4, !dbg !916
  %cmp7 = icmp sgt i32 %27, %28, !dbg !913
  %29 = select i1 %cmp7, i64 10, i64 11, !dbg !917
  %30 = getelementptr inbounds [21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 %29, !dbg !917
  %31 = load i64* %30, !dbg !917
  %32 = add i64 %31, 1, !dbg !917
  store i64 %32, i64* %30, !dbg !917
  br i1 %cmp7, label %if.then, label %if.end, !dbg !917

if.then:                                          ; preds = %for.body6
  %33 = load i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 12), !dbg !918
  %34 = add i64 %33, 1, !dbg !918
  store i64 %34, i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 12), !dbg !918
  %35 = load i32* %best, align 4, !dbg !918
  store i32 %35, i32* %alpha, align 4, !dbg !919
  br label %if.end, !dbg !919

if.end:                                           ; preds = %if.then, %for.body6
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard* %newboard, metadata !920, metadata !604), !dbg !921
  call void @_ZN13HexxagonBoardC1ERKS_(%class.HexxagonBoard* %newboard, %class.HexxagonBoard* dereferenceable(16) %board), !dbg !921
  %36 = load i32* %j, align 4, !dbg !922
  %call8 = call %class.HexxagonMove* @_ZN16HexxagonMoveList7getMoveEi(%class.HexxagonMoveList* %this1, i32 %36), !dbg !923
  %call9 = call i32 @_ZN13HexxagonBoard9applyMoveER12HexxagonMove(%class.HexxagonBoard* %newboard, %class.HexxagonMove* dereferenceable(8) %call8), !dbg !924
  call void @llvm.dbg.declare(metadata i32* %value, metadata !925, metadata !604), !dbg !926
  %37 = load i32* %i, align 4, !dbg !927
  %38 = load i32* %beta, align 4, !dbg !928
  %sub = sub nsw i32 0, %38, !dbg !929
  %39 = load i32* %alpha, align 4, !dbg !930
  %sub10 = sub nsw i32 0, %39, !dbg !931
  %40 = load void ()** %callback.addr, align 8, !dbg !932
  %call11 = call i32 @_Z9alphaBetaR13HexxagonBoardiiiPFvvE(%class.HexxagonBoard* dereferenceable(16) %newboard, i32 %37, i32 %sub, i32 %sub10, void ()* %40), !dbg !933
  %sub12 = sub nsw i32 0, %call11, !dbg !934
  store i32 %sub12, i32* %value, align 4, !dbg !926
  %41 = load i32* %value, align 4, !dbg !935
  %42 = load i32* %j, align 4, !dbg !936
  %call13 = call %class.HexxagonMove* @_ZN16HexxagonMoveList7getMoveEi(%class.HexxagonMoveList* %this1, i32 %42), !dbg !937
  %score = getelementptr inbounds %class.HexxagonMove* %call13, i32 0, i32 2, !dbg !937
  store i32 %41, i32* %score, align 4, !dbg !937
  %43 = load i32* %value, align 4, !dbg !938
  %44 = load i32* %best, align 4, !dbg !940
  %cmp14 = icmp sgt i32 %43, %44, !dbg !938
  %45 = select i1 %cmp14, i64 13, i64 14, !dbg !941
  %46 = getelementptr inbounds [21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 %45, !dbg !941
  %47 = load i64* %46, !dbg !941
  %48 = add i64 %47, 1, !dbg !941
  store i64 %48, i64* %46, !dbg !941
  br i1 %cmp14, label %if.then15, label %if.end16, !dbg !941

if.then15:                                        ; preds = %if.end
  %49 = load i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 15), !dbg !942
  %50 = add i64 %49, 1, !dbg !942
  store i64 %50, i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 15), !dbg !942
  %51 = load i32* %value, align 4, !dbg !942
  store i32 %51, i32* %best, align 4, !dbg !943
  br label %if.end16, !dbg !943

if.end16:                                         ; preds = %if.then15, %if.end
  %52 = load i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 16), !dbg !944
  %53 = add i64 %52, 1, !dbg !944
  store i64 %53, i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 16), !dbg !944
  br label %for.inc, !dbg !944

for.inc:                                          ; preds = %if.end16
  %54 = load i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 17), !dbg !945
  %55 = add i64 %54, 1, !dbg !945
  store i64 %55, i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 17), !dbg !945
  %56 = load i32* %j, align 4, !dbg !945
  %inc = add nsw i32 %56, 1, !dbg !945
  store i32 %inc, i32* %j, align 4, !dbg !945
  br label %for.cond2, !dbg !946

for.end:                                          ; preds = %land.end
  %57 = load i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 18), !dbg !947
  %58 = add i64 %57, 1, !dbg !947
  store i64 %58, i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 18), !dbg !947
  call void @_ZN16HexxagonMoveList8sortListEv(%class.HexxagonMoveList* %this1), !dbg !947
  br label %for.inc17, !dbg !948

for.inc17:                                        ; preds = %for.end
  %59 = load i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 19), !dbg !949
  %60 = add i64 %59, 1, !dbg !949
  store i64 %60, i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 19), !dbg !949
  %61 = load i32* %i, align 4, !dbg !949
  %inc18 = add nsw i32 %61, 1, !dbg !949
  store i32 %inc18, i32* %i, align 4, !dbg !949
  br label %for.cond, !dbg !950

for.end19:                                        ; preds = %for.cond
  %62 = load i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 20), !dbg !951
  %63 = add i64 %62, 1, !dbg !951
  store i64 %63, i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 20), !dbg !951
  ret void, !dbg !951
}

; Function Attrs: uwtable
define %class.HexxagonMove* @_ZN16HexxagonMoveList11getBestMoveEv(%class.HexxagonMoveList* %this) #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr12, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr12, i64 0, i64 0)
  %retval = alloca %class.HexxagonMove*, align 8
  %this.addr = alloca %class.HexxagonMoveList*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonMoveList* %this, %class.HexxagonMoveList** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMoveList** %this.addr, metadata !952, metadata !604), !dbg !953
  %this1 = load %class.HexxagonMoveList** %this.addr
  %call = call i32 @_Z7getTimev(), !dbg !954
  call void @srandom(i32 %call) #1, !dbg !955
  %nr_moves = getelementptr inbounds %class.HexxagonMoveList* %this1, i32 0, i32 0, !dbg !956
  %3 = load i32* %nr_moves, align 4, !dbg !956
  %tobool = icmp ne i32 %3, 0, !dbg !956
  %4 = select i1 %tobool, i64 1, i64 2, !dbg !958
  %5 = getelementptr inbounds [6 x i64]* @__llvm_gcov_ctr12, i64 0, i64 %4, !dbg !958
  %6 = load i64* %5, !dbg !958
  %7 = add i64 %6, 1, !dbg !958
  store i64 %7, i64* %5, !dbg !958
  br i1 %tobool, label %if.then, label %if.end, !dbg !958

if.then:                                          ; preds = %2
  %8 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr12, i64 0, i64 3), !dbg !959
  %9 = add i64 %8, 1, !dbg !959
  store i64 %9, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr12, i64 0, i64 3), !dbg !959
  %call2 = call %class.HexxagonMove* @_ZN16HexxagonMoveList7getMoveEi(%class.HexxagonMoveList* %this1, i32 0), !dbg !959
  store %class.HexxagonMove* %call2, %class.HexxagonMove** %retval, !dbg !960
  br label %return, !dbg !960

if.end:                                           ; preds = %2
  %10 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr12, i64 0, i64 4), !dbg !961
  %11 = add i64 %10, 1, !dbg !961
  store i64 %11, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr12, i64 0, i64 4), !dbg !961
  store %class.HexxagonMove* null, %class.HexxagonMove** %retval, !dbg !961
  br label %return, !dbg !961

return:                                           ; preds = %if.end, %if.then
  %12 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr12, i64 0, i64 5), !dbg !962
  %13 = add i64 %12, 1, !dbg !962
  store i64 %13, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr12, i64 0, i64 5), !dbg !962
  %14 = load %class.HexxagonMove** %retval, !dbg !962
  ret %class.HexxagonMove* %14, !dbg !962
}

; Function Attrs: nounwind
declare void @srandom(i32) #7

define internal void @_GLOBAL__sub_I_hexxagonmove.cpp() section ".text.startup" {
entry:
  call void @__cxx_global_var_init(), !dbg !963
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
  call void @llvm_gcda_start_file(i8* getelementptr inbounds ([94 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @0, i32 0, i32 0), i32 -1706612757)
  call void @llvm_gcda_emit_function(i32 0, i8* getelementptr inbounds ([22 x i8]* @2, i32 0, i32 0), i32 -343593632, i8 0, i32 -1706612757)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 1, i8* getelementptr inbounds ([46 x i8]* @3, i32 0, i32 0), i32 -155987748, i8 0, i32 -1706612757)
  call void @llvm_gcda_emit_arcs(i32 24, i64* getelementptr inbounds ([24 x i64]* @__llvm_gcov_ctr1, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 2, i8* getelementptr inbounds ([17 x i8]* @4, i32 0, i32 0), i32 -1188376052, i8 0, i32 -1706612757)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr2, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 3, i8* getelementptr inbounds ([39 x i8]* @5, i32 0, i32 0), i32 4616716, i8 0, i32 -1706612757)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr3, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 4, i8* getelementptr inbounds ([33 x i8]* @6, i32 0, i32 0), i32 1165797623, i8 0, i32 -1706612757)
  call void @llvm_gcda_emit_arcs(i32 14, i64* getelementptr inbounds ([14 x i64]* @__llvm_gcov_ctr4, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 5, i8* getelementptr inbounds ([12 x i8]* @7, i32 0, i32 0), i32 1533058185, i8 0, i32 -1706612757)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr5, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 6, i8* getelementptr inbounds ([32 x i8]* @8, i32 0, i32 0), i32 -2092375297, i8 0, i32 -1706612757)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr6, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 7, i8* getelementptr inbounds ([36 x i8]* @9, i32 0, i32 0), i32 1794206935, i8 0, i32 -1706612757)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr7, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 8, i8* getelementptr inbounds ([37 x i8]* @10, i32 0, i32 0), i32 1063745004, i8 0, i32 -1706612757)
  call void @llvm_gcda_emit_arcs(i32 40, i64* getelementptr inbounds ([40 x i64]* @__llvm_gcov_ctr8, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 9, i8* getelementptr inbounds ([60 x i8]* @11, i32 0, i32 0), i32 585896056, i8 0, i32 -1706612757)
  call void @llvm_gcda_emit_arcs(i32 21, i64* getelementptr inbounds ([21 x i64]* @__llvm_gcov_ctr11, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 10, i8* getelementptr inbounds ([37 x i8]* @12, i32 0, i32 0), i32 -906031579, i8 0, i32 -1706612757)
  call void @llvm_gcda_emit_arcs(i32 6, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr12, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 11, i8* getelementptr inbounds ([26 x i8]* @13, i32 0, i32 0), i32 1494599864, i8 0, i32 -1706612757)
  call void @llvm_gcda_emit_arcs(i32 5, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr13, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 12, i8* getelementptr inbounds ([22 x i8]* @14, i32 0, i32 0), i32 -269156019, i8 0, i32 -1706612757)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr14, i64 0, i64 0))
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
  store [24 x i64] zeroinitializer, [24 x i64]* @__llvm_gcov_ctr1
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr2
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr3
  store [14 x i64] zeroinitializer, [14 x i64]* @__llvm_gcov_ctr4
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr5
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr6
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr7
  store [40 x i64] zeroinitializer, [40 x i64]* @__llvm_gcov_ctr8
  store [21 x i64] zeroinitializer, [21 x i64]* @__llvm_gcov_ctr11
  store [6 x i64] zeroinitializer, [6 x i64]* @__llvm_gcov_ctr12
  store [5 x i64] zeroinitializer, [5 x i64]* @__llvm_gcov_ctr13
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr14
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
attributes #2 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nobuiltin "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nobuiltin nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noinline }
attributes #9 = { builtin }
attributes #10 = { builtin nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!598, !599}
!llvm.gcov = !{!600}
!llvm.ident = !{!601}

!0 = !{!"0x11\004\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !8, !202, !231, !234} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp] [DW_LANG_C_plus_plus]
!1 = !{!"hexxagonmove.cpp", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!2 = !{!3}
!3 = !{!"0x4\00\0031\0032\0032\000\000\000", !4, null, null, !5, null, null, null} ; [ DW_TAG_enumeration_type ] [line 31, size 32, align 32, offset 0] [def] [from ]
!4 = !{!"./hexxagonboard.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!5 = !{!6, !7}
!6 = !{!"0x28\00SCR_WIN\0020000"}                 ; [ DW_TAG_enumerator ] [SCR_WIN :: 20000]
!7 = !{!"0x28\00SCR_INFINITY\0032000"}            ; [ DW_TAG_enumerator ] [SCR_INFINITY :: 32000]
!8 = !{!9, !15, !24, !26, !33, !34, !36, !39, !51, !83, !98, !56, !148, !162}
!9 = !{!"0x13\00\0082\0064\0032\000\000\000", !10, null, null, !11, null, null, !"_ZTS11__mbstate_t"} ; [ DW_TAG_structure_type ] [line 82, size 64, align 32, offset 0] [def] [from ]
!10 = !{!"/usr/include/wchar.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!11 = !{!12, !14}
!12 = !{!"0xd\00__count\0084\0032\0032\000\000", !10, !"_ZTS11__mbstate_t", !13} ; [ DW_TAG_member ] [__count] [line 84, size 32, align 32, offset 0] [from int]
!13 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = !{!"0xd\00__value\0093\0032\0032\0032\000", !10, !"_ZTS11__mbstate_t", !"_ZTSN11__mbstate_tUt_E"} ; [ DW_TAG_member ] [__value] [line 93, size 32, align 32, offset 32] [from _ZTSN11__mbstate_tUt_E]
!15 = !{!"0x17\00\0085\0032\0032\000\000\000", !10, !"_ZTS11__mbstate_t", null, !16, null, null, !"_ZTSN11__mbstate_tUt_E"} ; [ DW_TAG_union_type ] [line 85, size 32, align 32, offset 0] [def] [from ]
!16 = !{!17, !19}
!17 = !{!"0xd\00__wch\0088\0032\0032\000\000", !10, !"_ZTSN11__mbstate_tUt_E", !18} ; [ DW_TAG_member ] [__wch] [line 88, size 32, align 32, offset 0] [from unsigned int]
!18 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!19 = !{!"0xd\00__wchb\0092\0032\008\000\000", !10, !"_ZTSN11__mbstate_tUt_E", !20} ; [ DW_TAG_member ] [__wchb] [line 92, size 32, align 8, offset 0] [from ]
!20 = !{!"0x1\00\000\0032\008\000\000\000", null, null, !21, !22, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32, align 8, offset 0] [from char]
!21 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!22 = !{!23}
!23 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!24 = !{!"0x13\00_IO_FILE\00245\000\000\000\004\000", !25, null, null, null, null, null, !"_ZTS8_IO_FILE"} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 0, align 0, offset 0] [decl] [from ]
!25 = !{!"/usr/include/libio.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!26 = !{!"0x13\00__va_list_tag\000\00192\0064\000\000\000", !1, null, null, !27, null, null, !"_ZTS13__va_list_tag"} ; [ DW_TAG_structure_type ] [__va_list_tag] [line 0, size 192, align 64, offset 0] [def] [from ]
!27 = !{!28, !29, !30, !32}
!28 = !{!"0xd\00gp_offset\000\0032\0032\000\000", !1, !"_ZTS13__va_list_tag", !18} ; [ DW_TAG_member ] [gp_offset] [line 0, size 32, align 32, offset 0] [from unsigned int]
!29 = !{!"0xd\00fp_offset\000\0032\0032\0032\000", !1, !"_ZTS13__va_list_tag", !18} ; [ DW_TAG_member ] [fp_offset] [line 0, size 32, align 32, offset 32] [from unsigned int]
!30 = !{!"0xd\00overflow_arg_area\000\0064\0064\0064\000", !1, !"_ZTS13__va_list_tag", !31} ; [ DW_TAG_member ] [overflow_arg_area] [line 0, size 64, align 64, offset 64] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!32 = !{!"0xd\00reg_save_area\000\0064\0064\00128\000", !1, !"_ZTS13__va_list_tag", !31} ; [ DW_TAG_member ] [reg_save_area] [line 0, size 64, align 64, offset 128] [from ]
!33 = !{!"0x13\00tm\00137\000\000\000\004\000", !10, null, null, null, null, null, !"_ZTS2tm"} ; [ DW_TAG_structure_type ] [tm] [line 137, size 0, align 0, offset 0] [decl] [from ]
!34 = !{!"0x13\00lconv\0053\000\000\000\004\000", !35, null, null, null, null, null, !"_ZTS5lconv"} ; [ DW_TAG_structure_type ] [lconv] [line 53, size 0, align 0, offset 0] [decl] [from ]
!35 = !{!"/usr/include/locale.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!36 = !{!"0x2\00ios_base\00199\000\000\000\004\000", !37, !38, null, null, null, null, !"_ZTSSt8ios_base"} ; [ DW_TAG_class_type ] [ios_base] [line 199, size 0, align 0, offset 0] [decl] [from ]
!37 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/ios_base.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!38 = !{!"0x39\00std\000", !1, null}              ; [ DW_TAG_namespace ] [std] [line 0]
!39 = !{!"0x2\00Init\00533\008\008\000\000\000", !37, !"_ZTSSt8ios_base", null, !40, null, null, !"_ZTSNSt8ios_base4InitE"} ; [ DW_TAG_class_type ] [Init] [line 533, size 8, align 8, offset 0] [def] [from ]
!40 = !{!41, !44, !46, !50}
!41 = !{!"0xd\00_S_refcount\00541\000\000\000\004096", !37, !"_ZTSNSt8ios_base4InitE", !42, null} ; [ DW_TAG_member ] [_S_refcount] [line 541, size 0, align 0, offset 0] [static] [from _Atomic_word]
!42 = !{!"0x16\00_Atomic_word\0032\000\000\000\000", !43, null, !13} ; [ DW_TAG_typedef ] [_Atomic_word] [line 32, size 0, align 0, offset 0] [from int]
!43 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/x86_64-linux-gnu/c++/4.8/bits/atomic_word.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!44 = !{!"0xd\00_S_synced_with_stdio\00542\000\000\000\004096", !37, !"_ZTSNSt8ios_base4InitE", !45, null} ; [ DW_TAG_member ] [_S_synced_with_stdio] [line 542, size 0, align 0, offset 0] [static] [from bool]
!45 = !{!"0x24\00bool\000\008\008\000\000\002", null, null} ; [ DW_TAG_base_type ] [bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!46 = !{!"0x2e\00Init\00Init\00\00537\000\000\000\000\00259\000\00537", !37, !"_ZTSNSt8ios_base4InitE", !47, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 537] [public] [Init]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{null, !49}
!49 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTSNSt8ios_base4InitE"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTSNSt8ios_base4InitE]
!50 = !{!"0x2e\00~Init\00~Init\00\00538\000\000\000\000\00259\000\00538", !37, !"_ZTSNSt8ios_base4InitE", !47, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 538] [public] [~Init]
!51 = !{!"0x2\00HexxagonMoveList\0043\00128\0064\000\000\000", !52, null, null, !53, null, null, !"_ZTS16HexxagonMoveList"} ; [ DW_TAG_class_type ] [HexxagonMoveList] [line 43, size 128, align 64, offset 0] [def] [from ]
!52 = !{!"./hexxagonmove.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!53 = !{!54, !55, !57, !61, !62, !68, !69, !70, !73, !77, !80}
!54 = !{!"0xd\00nr_moves\0062\0032\0032\000\000", !52, !"_ZTS16HexxagonMoveList", !13} ; [ DW_TAG_member ] [nr_moves] [line 62, size 32, align 32, offset 0] [from int]
!55 = !{!"0xd\00moves\0063\0064\0064\0064\000", !52, !"_ZTS16HexxagonMoveList", !56} ; [ DW_TAG_member ] [moves] [line 63, size 64, align 64, offset 64] [from ]
!56 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS12HexxagonMove"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS12HexxagonMove]
!57 = !{!"0x2e\00HexxagonMoveList\00HexxagonMoveList\00\0046\000\000\000\000\00259\000\0046", !52, !"_ZTS16HexxagonMoveList", !58, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 46] [public] [HexxagonMoveList]
!58 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !59, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = !{null, !60}
!60 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS16HexxagonMoveList"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS16HexxagonMoveList]
!61 = !{!"0x2e\00~HexxagonMoveList\00~HexxagonMoveList\00\0047\000\000\000\000\00259\000\0047", !52, !"_ZTS16HexxagonMoveList", !58, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 47] [public] [~HexxagonMoveList]
!62 = !{!"0x2e\00scoreAllMoves\00scoreAllMoves\00_ZN16HexxagonMoveList13scoreAllMovesE13HexxagonBoardiPFvvEi\0049\000\000\000\000\00259\000\0049", !52, !"_ZTS16HexxagonMoveList", !63, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 49] [public] [scoreAllMoves]
!63 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !64, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = !{null, !60, !"_ZTS13HexxagonBoard", !13, !65, !13}
!65 = !{!"0xf\00\000\0064\0064\000\000", null, null, !66} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!66 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !67, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!67 = !{null}
!68 = !{!"0x2e\00sortList\00sortList\00_ZN16HexxagonMoveList8sortListEv\0050\000\000\000\000\00259\000\0050", !52, !"_ZTS16HexxagonMoveList", !58, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 50] [public] [sortList]
!69 = !{!"0x2e\00sortListQuick\00sortListQuick\00_ZN16HexxagonMoveList13sortListQuickEv\0051\000\000\000\000\00259\000\0051", !52, !"_ZTS16HexxagonMoveList", !58, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 51] [public] [sortListQuick]
!70 = !{!"0x2e\00getNrMoves\00getNrMoves\00_ZN16HexxagonMoveList10getNrMovesEv\0053\000\000\000\000\00259\000\0053", !52, !"_ZTS16HexxagonMoveList", !71, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 53] [public] [getNrMoves]
!71 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !72, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!72 = !{!13, !60}
!73 = !{!"0x2e\00addMove\00addMove\00_ZN16HexxagonMoveList7addMoveER12HexxagonMove\0055\000\000\000\000\00259\000\0055", !52, !"_ZTS16HexxagonMoveList", !74, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 55] [public] [addMove]
!74 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !75, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!75 = !{null, !60, !76}
!76 = !{!"0x10\00\000\000\000\000\000", null, null, !"_ZTS12HexxagonMove"} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from _ZTS12HexxagonMove]
!77 = !{!"0x2e\00getMove\00getMove\00_ZN16HexxagonMoveList7getMoveEi\0056\000\000\000\000\00259\000\0056", !52, !"_ZTS16HexxagonMoveList", !78, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 56] [public] [getMove]
!78 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !79, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!79 = !{!56, !60, !13}
!80 = !{!"0x2e\00getBestMove\00getBestMove\00_ZN16HexxagonMoveList11getBestMoveEv\0058\000\000\000\000\00259\000\0058", !52, !"_ZTS16HexxagonMoveList", !81, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 58] [public] [getBestMove]
!81 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !82, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = !{!56, !60}
!83 = !{!"0x2\00HexxagonMove\0032\0064\0032\000\000\000", !52, null, null, !84, null, null, !"_ZTS12HexxagonMove"} ; [ DW_TAG_class_type ] [HexxagonMove] [line 32, size 64, align 32, offset 0] [def] [from ]
!84 = !{!85, !86, !87, !88, !92, !95}
!85 = !{!"0xd\00from\0039\008\008\000\003", !52, !"_ZTS12HexxagonMove", !21} ; [ DW_TAG_member ] [from] [line 39, size 8, align 8, offset 0] [public] [from char]
!86 = !{!"0xd\00to\0039\008\008\008\003", !52, !"_ZTS12HexxagonMove", !21} ; [ DW_TAG_member ] [to] [line 39, size 8, align 8, offset 8] [public] [from char]
!87 = !{!"0xd\00score\0040\0032\0032\0032\003", !52, !"_ZTS12HexxagonMove", !13} ; [ DW_TAG_member ] [score] [line 40, size 32, align 32, offset 32] [public] [from int]
!88 = !{!"0x2e\00HexxagonMove\00HexxagonMove\00\0035\000\000\000\000\00259\000\0035", !52, !"_ZTS12HexxagonMove", !89, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 35] [public] [HexxagonMove]
!89 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !90, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!90 = !{null, !91}
!91 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS12HexxagonMove"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS12HexxagonMove]
!92 = !{!"0x2e\00HexxagonMove\00HexxagonMove\00\0036\000\000\000\000\00259\000\0036", !52, !"_ZTS12HexxagonMove", !93, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 36] [public] [HexxagonMove]
!93 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !94, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!94 = !{null, !91, !13}
!95 = !{!"0x2e\00HexxagonMove\00HexxagonMove\00\0037\000\000\000\000\00259\000\0037", !52, !"_ZTS12HexxagonMove", !96, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 37] [public] [HexxagonMove]
!96 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !97, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!97 = !{null, !91, !13, !13}
!98 = !{!"0x2\00HexxagonBoard\0050\00128\0032\000\000\000", !4, null, null, !99, null, null, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_class_type ] [HexxagonBoard] [line 50, size 128, align 32, offset 0] [def] [from ]
!99 = !{!100, !101, !102, !106, !111, !112, !115, !118, !119, !122, !126, !129, !130, !131, !134, !135, !138, !144, !145}
!100 = !{!"0xd\00board\0080\0064\0032\000\002", !4, !"_ZTS13HexxagonBoard", !"_ZTS10BitBoard64"} ; [ DW_TAG_member ] [board] [line 80, size 64, align 32, offset 0] [protected] [from _ZTS10BitBoard64]
!101 = !{!"0xd\00color\0081\0064\0032\0064\002", !4, !"_ZTS13HexxagonBoard", !"_ZTS10BitBoard64"} ; [ DW_TAG_member ] [color] [line 81, size 64, align 32, offset 64] [protected] [from _ZTS10BitBoard64]
!102 = !{!"0x2e\00HexxagonBoard\00HexxagonBoard\00\0054\000\000\000\000\00259\000\0054", !4, !"_ZTS13HexxagonBoard", !103, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 54] [public] [HexxagonBoard]
!103 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !104, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!104 = !{null, !105}
!105 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS13HexxagonBoard]
!106 = !{!"0x2e\00HexxagonBoard\00HexxagonBoard\00\0055\000\000\000\000\00259\000\0055", !4, !"_ZTS13HexxagonBoard", !107, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 55] [public] [HexxagonBoard]
!107 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !108, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!108 = !{null, !105, !109}
!109 = !{!"0x10\00\000\000\000\000\000", null, null, !110} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!110 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS13HexxagonBoard]
!111 = !{!"0x2e\00init\00init\00_ZN13HexxagonBoard4initEv\0057\000\000\000\000\00259\000\0057", !4, !"_ZTS13HexxagonBoard", !103, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 57] [public] [init]
!112 = !{!"0x2e\00evaluate\00evaluate\00_ZN13HexxagonBoard8evaluateEv\0058\000\000\000\000\00259\000\0058", !4, !"_ZTS13HexxagonBoard", !113, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 58] [public] [evaluate]
!113 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !114, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!114 = !{!13, !105}
!115 = !{!"0x2e\00countBricks\00countBricks\00_ZN13HexxagonBoard11countBricksEi\0059\000\000\000\000\00259\000\0059", !4, !"_ZTS13HexxagonBoard", !116, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 59] [public] [countBricks]
!116 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !117, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!117 = !{!13, !105, !13}
!118 = !{!"0x2e\00getHexxagon\00getHexxagon\00_ZN13HexxagonBoard11getHexxagonEi\0060\000\000\000\000\00259\000\0060", !4, !"_ZTS13HexxagonBoard", !116, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 60] [public] [getHexxagon]
!119 = !{!"0x2e\00applyMove\00applyMove\00_ZN13HexxagonBoard9applyMoveER12HexxagonMove\0061\000\000\000\000\00259\000\0061", !4, !"_ZTS13HexxagonBoard", !120, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 61] [public] [applyMove]
!120 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !121, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!121 = !{!13, !105, !76}
!122 = !{!"0x2e\00generateMoveList\00generateMoveList\00_ZN13HexxagonBoard16generateMoveListEv\0063\000\000\000\000\00259\000\0063", !4, !"_ZTS13HexxagonBoard", !123, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 63] [public] [generateMoveList]
!123 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !124, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!124 = !{!125, !105}
!125 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS16HexxagonMoveList"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS16HexxagonMoveList]
!126 = !{!"0x2e\00computerMove\00computerMove\00_ZN13HexxagonBoard12computerMoveEiPFvvEi\0065\000\000\000\000\00259\000\0065", !4, !"_ZTS13HexxagonBoard", !127, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 65] [public] [computerMove]
!127 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !128, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!128 = !{!13, !105, !13, !65, !13}
!129 = !{!"0x2e\00endOfGame\00endOfGame\00_ZN13HexxagonBoard9endOfGameEv\0066\000\000\000\000\00259\000\0066", !4, !"_ZTS13HexxagonBoard", !113, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 66] [public] [endOfGame]
!130 = !{!"0x2e\00isMoveValid\00isMoveValid\00_ZN13HexxagonBoard11isMoveValidER12HexxagonMove\0067\000\000\000\000\00259\000\0067", !4, !"_ZTS13HexxagonBoard", !120, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 67] [public] [isMoveValid]
!131 = !{!"0x2e\00getBBBoard\00getBBBoard\00_ZN13HexxagonBoard10getBBBoardEv\0069\000\000\000\000\00259\000\0069", !4, !"_ZTS13HexxagonBoard", !132, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 69] [public] [getBBBoard]
!132 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !133, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!133 = !{!"_ZTS10BitBoard64", !105}
!134 = !{!"0x2e\00getBBColor\00getBBColor\00_ZN13HexxagonBoard10getBBColorEv\0070\000\000\000\000\00259\000\0070", !4, !"_ZTS13HexxagonBoard", !132, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 70] [public] [getBBColor]
!135 = !{!"0x2e\00operator=\00operator=\00_ZN13HexxagonBoardaSERKS_\0072\000\000\000\000\00259\000\0072", !4, !"_ZTS13HexxagonBoard", !136, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 72] [public] [operator=]
!136 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !137, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!137 = !{!"_ZTS13HexxagonBoard", !105, !109}
!138 = !{!"0x2e\00readFromFile\00readFromFile\00_ZN13HexxagonBoard12readFromFileEP8_IO_FILE\0074\000\000\000\000\00259\000\0074", !4, !"_ZTS13HexxagonBoard", !139, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 74] [public] [readFromFile]
!139 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !140, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!140 = !{!13, !105, !141}
!141 = !{!"0xf\00\000\0064\0064\000\000", null, null, !142} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!142 = !{!"0x16\00FILE\0048\000\000\000\000", !143, null, !"_ZTS8_IO_FILE"} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _ZTS8_IO_FILE]
!143 = !{!"/usr/include/stdio.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!144 = !{!"0x2e\00writeToFile\00writeToFile\00_ZN13HexxagonBoard11writeToFileEP8_IO_FILE\0075\000\000\000\000\00259\000\0075", !4, !"_ZTS13HexxagonBoard", !139, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 75] [public] [writeToFile]
!145 = !{!"0x2e\00displayBoardText\00displayBoardText\00_ZN13HexxagonBoard16displayBoardTextEi\0077\000\000\000\000\00259\000\0077", !4, !"_ZTS13HexxagonBoard", !146, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 77] [public] [displayBoardText]
!146 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !147, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!147 = !{null, !105, !13}
!148 = !{!"0x13\00timeb\0031\00128\0064\000\000\000", !149, null, null, !150, null, null, !"_ZTS5timeb"} ; [ DW_TAG_structure_type ] [timeb] [line 31, size 128, align 64, offset 0] [def] [from ]
!149 = !{!"/usr/include/x86_64-linux-gnu/sys/timeb.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!150 = !{!151, !157, !159, !161}
!151 = !{!"0xd\00time\0033\0064\0064\000\000", !149, !"_ZTS5timeb", !152} ; [ DW_TAG_member ] [time] [line 33, size 64, align 64, offset 0] [from time_t]
!152 = !{!"0x16\00time_t\0075\000\000\000\000", !153, null, !154} ; [ DW_TAG_typedef ] [time_t] [line 75, size 0, align 0, offset 0] [from __time_t]
!153 = !{!"/usr/include/time.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!154 = !{!"0x16\00__time_t\00139\000\000\000\000", !155, null, !156} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!155 = !{!"/usr/include/x86_64-linux-gnu/bits/types.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!156 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!157 = !{!"0xd\00millitm\0034\0016\0016\0064\000", !149, !"_ZTS5timeb", !158} ; [ DW_TAG_member ] [millitm] [line 34, size 16, align 16, offset 64] [from unsigned short]
!158 = !{!"0x24\00unsigned short\000\0016\0016\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!159 = !{!"0xd\00timezone\0035\0016\0016\0080\000", !149, !"_ZTS5timeb", !160} ; [ DW_TAG_member ] [timezone] [line 35, size 16, align 16, offset 80] [from short]
!160 = !{!"0x24\00short\000\0016\0016\000\000\005", null, null} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!161 = !{!"0xd\00dstflag\0036\0016\0016\0096\000", !149, !"_ZTS5timeb", !160} ; [ DW_TAG_member ] [dstflag] [line 36, size 16, align 16, offset 96] [from short]
!162 = !{!"0x2\00BitBoard64\0031\0064\0032\000\000\000", !163, null, null, !164, null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_class_type ] [BitBoard64] [line 31, size 64, align 32, offset 0] [def] [from ]
!163 = !{!"./bitboard64.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!164 = !{!165, !168, !169, !173, !176, !179, !180, !183, !188, !189, !190, !191, !194, !197, !198, !201}
!165 = !{!"0xd\00lowbits\0056\0032\0032\000\000", !163, !"_ZTS10BitBoard64", !166} ; [ DW_TAG_member ] [lowbits] [line 56, size 32, align 32, offset 0] [from uint32_t]
!166 = !{!"0x16\00uint32_t\0051\000\000\000\000", !167, null, !18} ; [ DW_TAG_typedef ] [uint32_t] [line 51, size 0, align 0, offset 0] [from unsigned int]
!167 = !{!"/usr/include/stdint.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!168 = !{!"0xd\00highbits\0056\0032\0032\0032\000", !163, !"_ZTS10BitBoard64", !166} ; [ DW_TAG_member ] [highbits] [line 56, size 32, align 32, offset 32] [from uint32_t]
!169 = !{!"0x2e\00BitBoard64\00BitBoard64\00\0034\000\000\000\000\00259\000\0034", !163, !"_ZTS10BitBoard64", !170, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 34] [public] [BitBoard64]
!170 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !171, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!171 = !{null, !172}
!172 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS10BitBoard64]
!173 = !{!"0x2e\00BitBoard64\00BitBoard64\00\0035\000\000\000\000\00259\000\0035", !163, !"_ZTS10BitBoard64", !174, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 35] [public] [BitBoard64]
!174 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !175, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!175 = !{null, !172, !166, !166}
!176 = !{!"0x2e\00setBit\00setBit\00_ZN10BitBoard646setBitEi\0037\000\000\000\000\00259\000\0037", !163, !"_ZTS10BitBoard64", !177, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 37] [public] [setBit]
!177 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !178, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!178 = !{null, !172, !13}
!179 = !{!"0x2e\00unSetBit\00unSetBit\00_ZN10BitBoard648unSetBitEi\0038\000\000\000\000\00259\000\0038", !163, !"_ZTS10BitBoard64", !177, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 38] [public] [unSetBit]
!180 = !{!"0x2e\00getBit\00getBit\00_ZN10BitBoard646getBitEi\0039\000\000\000\000\00259\000\0039", !163, !"_ZTS10BitBoard64", !181, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 39] [public] [getBit]
!181 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !182, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!182 = !{!13, !172, !13}
!183 = !{!"0x2e\00operator&\00operator&\00_ZN10BitBoard64anERKS_\0041\000\000\000\000\00259\000\0041", !163, !"_ZTS10BitBoard64", !184, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 41] [public] [operator&]
!184 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !185, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!185 = !{!"_ZTS10BitBoard64", !172, !186}
!186 = !{!"0x10\00\000\000\000\000\000", null, null, !187} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!187 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS10BitBoard64]
!188 = !{!"0x2e\00operator|\00operator|\00_ZN10BitBoard64orERKS_\0042\000\000\000\000\00259\000\0042", !163, !"_ZTS10BitBoard64", !184, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 42] [public] [operator|]
!189 = !{!"0x2e\00operator^\00operator^\00_ZN10BitBoard64eoERKS_\0043\000\000\000\000\00259\000\0043", !163, !"_ZTS10BitBoard64", !184, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 43] [public] [operator^]
!190 = !{!"0x2e\00operator=\00operator=\00_ZN10BitBoard64aSERKS_\0044\000\000\000\000\00259\000\0044", !163, !"_ZTS10BitBoard64", !184, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 44] [public] [operator=]
!191 = !{!"0x2e\00operator~\00operator~\00_ZN10BitBoard64coEv\0045\000\000\000\000\00259\000\0045", !163, !"_ZTS10BitBoard64", !192, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 45] [public] [operator~]
!192 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !193, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!193 = !{!"_ZTS10BitBoard64", !172}
!194 = !{!"0x2e\00operator bool\00operator bool\00_ZN10BitBoard64cvbEv\0047\000\000\000\000\00259\000\0047", !163, !"_ZTS10BitBoard64", !195, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 47] [public] [operator bool]
!195 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !196, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!196 = !{!45, !172}
!197 = !{!"0x2e\00print\00print\00_ZN10BitBoard645printEv\0049\000\000\000\000\00259\000\0049", !163, !"_ZTS10BitBoard64", !170, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 49] [public] [print]
!198 = !{!"0x2e\00readFromFile\00readFromFile\00_ZN10BitBoard6412readFromFileEP8_IO_FILE\0051\000\000\000\000\00259\000\0051", !163, !"_ZTS10BitBoard64", !199, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 51] [public] [readFromFile]
!199 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !200, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!200 = !{!13, !172, !141}
!201 = !{!"0x2e\00writeToFile\00writeToFile\00_ZN10BitBoard6411writeToFileEP8_IO_FILE\0052\000\000\000\000\00259\000\0052", !163, !"_ZTS10BitBoard64", !199, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 52] [public] [writeToFile]
!202 = !{!203, !207, !208, !214, !215, !216, !219, !220, !221, !225, !226, !227, !228, !229}
!203 = !{!"0x2e\00__cxx_global_var_init\00__cxx_global_var_init\00\0074\001\001\000\000\00256\000\0074", !204, !205, !66, null, void ()* @__cxx_global_var_init, null, null, !206} ; [ DW_TAG_subprogram ] [line 74] [local] [def] [__cxx_global_var_init]
!204 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/iostream", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!205 = !{!"0x29", !204}                           ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon//usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/iostream]
!206 = !{}
!207 = !{!"0x2e\00addMove\00addMove\00_ZN16HexxagonMoveList7addMoveER12HexxagonMove\0041\000\001\000\000\00256\000\0042", !1, !"_ZTS16HexxagonMoveList", !74, null, void (%class.HexxagonMoveList*, %class.HexxagonMove*)* @_ZN16HexxagonMoveList7addMoveER12HexxagonMove, null, !73, !206} ; [ DW_TAG_subprogram ] [line 41] [def] [scope 42] [addMove]
!208 = !{!"0x2e\00compare\00compare\00_Z7comparePKvS0_\0061\000\001\000\000\00256\000\0062", !1, !209, !210, null, i32 (i8*, i8*)* @_Z7comparePKvS0_, null, null, !206} ; [ DW_TAG_subprogram ] [line 61] [def] [scope 62] [compare]
!209 = !{!"0x29", !1}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!210 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !211, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!211 = !{!13, !212, !212}
!212 = !{!"0xf\00\000\0064\0064\000\000", null, null, !213} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!213 = !{!"0x26\00\000\000\000\000\000", null, null, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!214 = !{!"0x2e\00sortListQuick\00sortListQuick\00_ZN16HexxagonMoveList13sortListQuickEv\0066\000\001\000\000\00256\000\0067", !1, !"_ZTS16HexxagonMoveList", !58, null, void (%class.HexxagonMoveList*)* @_ZN16HexxagonMoveList13sortListQuickEv, null, !69, !206} ; [ DW_TAG_subprogram ] [line 66] [def] [scope 67] [sortListQuick]
!215 = !{!"0x2e\00sortList\00sortList\00_ZN16HexxagonMoveList8sortListEv\0071\000\001\000\000\00256\000\0072", !1, !"_ZTS16HexxagonMoveList", !58, null, void (%class.HexxagonMoveList*)* @_ZN16HexxagonMoveList8sortListEv, null, !68, !206} ; [ DW_TAG_subprogram ] [line 71] [def] [scope 72] [sortList]
!216 = !{!"0x2e\00getTime\00getTime\00_Z7getTimev\0092\000\001\000\000\00256\000\0093", !1, !209, !217, null, i32 ()* @_Z7getTimev, null, null, !206} ; [ DW_TAG_subprogram ] [line 92] [def] [scope 93] [getTime]
!217 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !218, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!218 = !{!13}
!219 = !{!"0x2e\00getMove\00getMove\00_ZN16HexxagonMoveList7getMoveEi\00107\000\001\000\000\00256\000\00108", !1, !"_ZTS16HexxagonMoveList", !78, null, %class.HexxagonMove* (%class.HexxagonMoveList*, i32)* @_ZN16HexxagonMoveList7getMoveEi, null, !77, !206} ; [ DW_TAG_subprogram ] [line 107] [def] [scope 108] [getMove]
!220 = !{!"0x2e\00getNrMoves\00getNrMoves\00_ZN16HexxagonMoveList10getNrMovesEv\00112\000\001\000\000\00256\000\00113", !1, !"_ZTS16HexxagonMoveList", !71, null, i32 (%class.HexxagonMoveList*)* @_ZN16HexxagonMoveList10getNrMovesEv, null, !70, !206} ; [ DW_TAG_subprogram ] [line 112] [def] [scope 113] [getNrMoves]
!221 = !{!"0x2e\00alphaBeta\00alphaBeta\00_Z9alphaBetaR13HexxagonBoardiiiPFvvE\00118\000\001\000\000\00256\000\00119", !1, !209, !222, null, i32 (%class.HexxagonBoard*, i32, i32, i32, void ()*)* @_Z9alphaBetaR13HexxagonBoardiiiPFvvE, null, null, !206} ; [ DW_TAG_subprogram ] [line 118] [def] [scope 119] [alphaBeta]
!222 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !223, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!223 = !{!13, !224, !13, !13, !13, !65}
!224 = !{!"0x10\00\000\000\000\000\000", null, null, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from _ZTS13HexxagonBoard]
!225 = !{!"0x2e\00scoreAllMoves\00scoreAllMoves\00_ZN16HexxagonMoveList13scoreAllMovesE13HexxagonBoardiPFvvEi\00161\000\001\000\000\00256\000\00162", !1, !"_ZTS16HexxagonMoveList", !63, null, void (%class.HexxagonMoveList*, %class.HexxagonBoard*, i32, void ()*, i32)* @_ZN16HexxagonMoveList13scoreAllMovesE13HexxagonBoardiPFvvEi, null, !62, !206} ; [ DW_TAG_subprogram ] [line 161] [def] [scope 162] [scoreAllMoves]
!226 = !{!"0x2e\00getBestMove\00getBestMove\00_ZN16HexxagonMoveList11getBestMoveEv\00194\000\001\000\000\00256\000\00195", !1, !"_ZTS16HexxagonMoveList", !81, null, %class.HexxagonMove* (%class.HexxagonMoveList*)* @_ZN16HexxagonMoveList11getBestMoveEv, null, !80, !206} ; [ DW_TAG_subprogram ] [line 194] [def] [scope 195] [getBestMove]
!227 = !{!"0x2e\00~HexxagonMoveList\00~HexxagonMoveList\00_ZN16HexxagonMoveListD2Ev\0047\000\001\000\000\00256\000\0047", !52, !"_ZTS16HexxagonMoveList", !58, null, void (%class.HexxagonMoveList*)* @_ZN16HexxagonMoveListD2Ev, null, !61, !206} ; [ DW_TAG_subprogram ] [line 47] [def] [~HexxagonMoveList]
!228 = !{!"0x2e\00HexxagonMove\00HexxagonMove\00_ZN12HexxagonMoveC2Ev\0035\000\001\000\000\00256\000\0035", !52, !"_ZTS12HexxagonMove", !89, null, void (%class.HexxagonMove*)* @_ZN12HexxagonMoveC2Ev, null, !88, !206} ; [ DW_TAG_subprogram ] [line 35] [def] [HexxagonMove]
!229 = !{!"0x2e\00\00\00_GLOBAL__sub_I_hexxagonmove.cpp\000\001\001\000\000\0064\000\000", !1, !209, !230, null, void ()* @_GLOBAL__sub_I_hexxagonmove.cpp, null, null, !206} ; [ DW_TAG_subprogram ] [line 0] [local] [def]
!230 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !206, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!231 = !{!232, !233}
!232 = !{!"0x34\00__ioinit\00__ioinit\00_ZStL8__ioinit\0074\001\001", !38, !205, !"_ZTSNSt8ios_base4InitE", %"class.std::ios_base::Init"* @_ZStL8__ioinit, null} ; [ DW_TAG_variable ] [__ioinit] [line 74] [local] [def]
!233 = !{!"0x34\00hexx_count\00hexx_count\00\00117\000\001", null, !209, !21, i8* @hexx_count, null} ; [ DW_TAG_variable ] [hexx_count] [line 117] [def]
!234 = !{!235, !238, !241, !246, !252, !260, !264, !271, !275, !279, !281, !283, !287, !298, !302, !308, !314, !316, !320, !324, !328, !332, !338, !340, !344, !348, !352, !354, !360, !364, !368, !370, !372, !376, !383, !387, !391, !395, !397, !403, !405, !412, !417, !421, !425, !429, !433, !437, !439, !441, !445, !449, !453, !455, !459, !463, !465, !467, !471, !478, !483, !488, !489, !490, !491, !495, !496, !501, !506, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !539, !541, !547, !549, !550, !553, !555, !557, !559, !563, !565, !567, !569, !571, !573, !575, !577, !579, !583, !587, !589, !593, !597}
!235 = !{!"0x8\0064\00", !38, !236}               ; [ DW_TAG_imported_declaration ]
!236 = !{!"0x16\00mbstate_t\00106\000\000\000\000", !10, null, !237} ; [ DW_TAG_typedef ] [mbstate_t] [line 106, size 0, align 0, offset 0] [from __mbstate_t]
!237 = !{!"0x16\00__mbstate_t\0094\000\000\000\000", !10, null, !"_ZTS11__mbstate_t"} ; [ DW_TAG_typedef ] [__mbstate_t] [line 94, size 0, align 0, offset 0] [from _ZTS11__mbstate_t]
!238 = !{!"0x8\00139\00", !38, !239}              ; [ DW_TAG_imported_declaration ]
!239 = !{!"0x16\00wint_t\00132\000\000\000\000", !240, null, !18} ; [ DW_TAG_typedef ] [wint_t] [line 132, size 0, align 0, offset 0] [from unsigned int]
!240 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!241 = !{!"0x8\00141\00", !38, !242}              ; [ DW_TAG_imported_declaration ]
!242 = !{!"0x2e\00btowc\00btowc\00\00353\000\000\000\000\00256\000\000", !10, !243, !244, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 353] [scope 0] [btowc]
!243 = !{!"0x29", !10}                            ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon//usr/include/wchar.h]
!244 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !245, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!245 = !{!239, !13}
!246 = !{!"0x8\00142\00", !38, !247}              ; [ DW_TAG_imported_declaration ]
!247 = !{!"0x2e\00fgetwc\00fgetwc\00\00745\000\000\000\000\00256\000\000", !10, !243, !248, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 745] [scope 0] [fgetwc]
!248 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !249, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!249 = !{!239, !250}
!250 = !{!"0xf\00\000\0064\0064\000\000", null, null, !251} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from __FILE]
!251 = !{!"0x16\00__FILE\0064\000\000\000\000", !143, null, !"_ZTS8_IO_FILE"} ; [ DW_TAG_typedef ] [__FILE] [line 64, size 0, align 0, offset 0] [from _ZTS8_IO_FILE]
!252 = !{!"0x8\00143\00", !38, !253}              ; [ DW_TAG_imported_declaration ]
!253 = !{!"0x2e\00fgetws\00fgetws\00\00774\000\000\000\000\00256\000\000", !10, !243, !254, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 774] [scope 0] [fgetws]
!254 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !255, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!255 = !{!256, !258, !13, !259}
!256 = !{!"0xf\00\000\0064\0064\000\000", null, null, !257} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from wchar_t]
!257 = !{!"0x24\00wchar_t\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [wchar_t] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!258 = !{!"0x37\00\000\000\000\000\000", null, null, !256} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!259 = !{!"0x37\00\000\000\000\000\000", null, null, !250} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!260 = !{!"0x8\00144\00", !38, !261}              ; [ DW_TAG_imported_declaration ]
!261 = !{!"0x2e\00fputwc\00fputwc\00\00759\000\000\000\000\00256\000\000", !10, !243, !262, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 759] [scope 0] [fputwc]
!262 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !263, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!263 = !{!239, !257, !250}
!264 = !{!"0x8\00145\00", !38, !265}              ; [ DW_TAG_imported_declaration ]
!265 = !{!"0x2e\00fputws\00fputws\00\00781\000\000\000\000\00256\000\000", !10, !243, !266, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 781] [scope 0] [fputws]
!266 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !267, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!267 = !{!13, !268, !259}
!268 = !{!"0x37\00\000\000\000\000\000", null, null, !269} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!269 = !{!"0xf\00\000\0064\0064\000\000", null, null, !270} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!270 = !{!"0x26\00\000\000\000\000\000", null, null, !257} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from wchar_t]
!271 = !{!"0x8\00146\00", !38, !272}              ; [ DW_TAG_imported_declaration ]
!272 = !{!"0x2e\00fwide\00fwide\00\00587\000\000\000\000\00256\000\000", !10, !243, !273, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 587] [scope 0] [fwide]
!273 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !274, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!274 = !{!13, !250, !13}
!275 = !{!"0x8\00147\00", !38, !276}              ; [ DW_TAG_imported_declaration ]
!276 = !{!"0x2e\00fwprintf\00fwprintf\00\00594\000\000\000\000\00256\000\000", !10, !243, !277, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 594] [scope 0] [fwprintf]
!277 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !278, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!278 = !{!13, !259, !268, null}
!279 = !{!"0x8\00148\00", !38, !280}              ; [ DW_TAG_imported_declaration ]
!280 = !{!"0x2e\00fwscanf\00fwscanf\00\00635\000\000\000\000\00256\000\000", !10, !243, !277, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 635] [scope 0] [fwscanf]
!281 = !{!"0x8\00149\00", !38, !282}              ; [ DW_TAG_imported_declaration ]
!282 = !{!"0x2e\00getwc\00getwc\00\00746\000\000\000\000\00256\000\000", !10, !243, !248, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 746] [scope 0] [getwc]
!283 = !{!"0x8\00150\00", !38, !284}              ; [ DW_TAG_imported_declaration ]
!284 = !{!"0x2e\00getwchar\00getwchar\00\00752\000\000\000\000\00256\000\000", !10, !243, !285, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 752] [scope 0] [getwchar]
!285 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !286, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!286 = !{!239}
!287 = !{!"0x8\00151\00", !38, !288}              ; [ DW_TAG_imported_declaration ]
!288 = !{!"0x2e\00mbrlen\00mbrlen\00\00376\000\000\000\000\00256\000\000", !10, !243, !289, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 376] [scope 0] [mbrlen]
!289 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !290, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!290 = !{!291, !293, !291, !296}
!291 = !{!"0x16\00size_t\0062\000\000\000\000", !240, null, !292} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!292 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!293 = !{!"0x37\00\000\000\000\000\000", null, null, !294} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!294 = !{!"0xf\00\000\0064\0064\000\000", null, null, !295} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!295 = !{!"0x26\00\000\000\000\000\000", null, null, !21} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!296 = !{!"0x37\00\000\000\000\000\000", null, null, !297} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!297 = !{!"0xf\00\000\0064\0064\000\000", null, null, !236} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from mbstate_t]
!298 = !{!"0x8\00152\00", !38, !299}              ; [ DW_TAG_imported_declaration ]
!299 = !{!"0x2e\00mbrtowc\00mbrtowc\00\00365\000\000\000\000\00256\000\000", !10, !243, !300, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 365] [scope 0] [mbrtowc]
!300 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !301, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!301 = !{!291, !258, !293, !291, !296}
!302 = !{!"0x8\00153\00", !38, !303}              ; [ DW_TAG_imported_declaration ]
!303 = !{!"0x2e\00mbsinit\00mbsinit\00\00361\000\000\000\000\00256\000\000", !10, !243, !304, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 361] [scope 0] [mbsinit]
!304 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !305, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!305 = !{!13, !306}
!306 = !{!"0xf\00\000\0064\0064\000\000", null, null, !307} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!307 = !{!"0x26\00\000\000\000\000\000", null, null, !236} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from mbstate_t]
!308 = !{!"0x8\00154\00", !38, !309}              ; [ DW_TAG_imported_declaration ]
!309 = !{!"0x2e\00mbsrtowcs\00mbsrtowcs\00\00408\000\000\000\000\00256\000\000", !10, !243, !310, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 408] [scope 0] [mbsrtowcs]
!310 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !311, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!311 = !{!291, !258, !312, !291, !296}
!312 = !{!"0x37\00\000\000\000\000\000", null, null, !313} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!313 = !{!"0xf\00\000\0064\0064\000\000", null, null, !294} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!314 = !{!"0x8\00155\00", !38, !315}              ; [ DW_TAG_imported_declaration ]
!315 = !{!"0x2e\00putwc\00putwc\00\00760\000\000\000\000\00256\000\000", !10, !243, !262, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 760] [scope 0] [putwc]
!316 = !{!"0x8\00156\00", !38, !317}              ; [ DW_TAG_imported_declaration ]
!317 = !{!"0x2e\00putwchar\00putwchar\00\00766\000\000\000\000\00256\000\000", !10, !243, !318, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 766] [scope 0] [putwchar]
!318 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !319, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!319 = !{!239, !257}
!320 = !{!"0x8\00158\00", !38, !321}              ; [ DW_TAG_imported_declaration ]
!321 = !{!"0x2e\00swprintf\00swprintf\00\00604\000\000\000\000\00256\000\000", !10, !243, !322, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 604] [scope 0] [swprintf]
!322 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !323, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!323 = !{!13, !258, !291, !268, null}
!324 = !{!"0x8\00160\00", !38, !325}              ; [ DW_TAG_imported_declaration ]
!325 = !{!"0x2e\00swscanf\00swscanf\00\00645\000\000\000\000\00256\000\000", !10, !243, !326, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 645] [scope 0] [swscanf]
!326 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !327, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!327 = !{!13, !268, !268, null}
!328 = !{!"0x8\00161\00", !38, !329}              ; [ DW_TAG_imported_declaration ]
!329 = !{!"0x2e\00ungetwc\00ungetwc\00\00789\000\000\000\000\00256\000\000", !10, !243, !330, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 789] [scope 0] [ungetwc]
!330 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !331, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!331 = !{!239, !239, !250}
!332 = !{!"0x8\00162\00", !38, !333}              ; [ DW_TAG_imported_declaration ]
!333 = !{!"0x2e\00vfwprintf\00vfwprintf\00\00612\000\000\000\000\00256\000\000", !10, !243, !334, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 612] [scope 0] [vfwprintf]
!334 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !335, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!335 = !{!13, !259, !268, !336}
!336 = !{!"0xf\00\000\0064\0064\000\000", null, null, !337} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from __va_list_tag]
!337 = !{!"0x16\00__va_list_tag\000\000\000\000\000", !1, null, !"_ZTS13__va_list_tag"} ; [ DW_TAG_typedef ] [__va_list_tag] [line 0, size 0, align 0, offset 0] [from _ZTS13__va_list_tag]
!338 = !{!"0x8\00164\00", !38, !339}              ; [ DW_TAG_imported_declaration ]
!339 = !{!"0x2e\00vfwscanf\00vfwscanf\00\00689\000\000\000\000\00256\000\000", !10, !243, !334, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 689] [scope 0] [vfwscanf]
!340 = !{!"0x8\00167\00", !38, !341}              ; [ DW_TAG_imported_declaration ]
!341 = !{!"0x2e\00vswprintf\00vswprintf\00\00625\000\000\000\000\00256\000\000", !10, !243, !342, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 625] [scope 0] [vswprintf]
!342 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !343, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!343 = !{!13, !258, !291, !268, !336}
!344 = !{!"0x8\00170\00", !38, !345}              ; [ DW_TAG_imported_declaration ]
!345 = !{!"0x2e\00vswscanf\00vswscanf\00\00701\000\000\000\000\00256\000\000", !10, !243, !346, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 701] [scope 0] [vswscanf]
!346 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !347, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!347 = !{!13, !268, !268, !336}
!348 = !{!"0x8\00172\00", !38, !349}              ; [ DW_TAG_imported_declaration ]
!349 = !{!"0x2e\00vwprintf\00vwprintf\00\00620\000\000\000\000\00256\000\000", !10, !243, !350, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 620] [scope 0] [vwprintf]
!350 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !351, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!351 = !{!13, !268, !336}
!352 = !{!"0x8\00174\00", !38, !353}              ; [ DW_TAG_imported_declaration ]
!353 = !{!"0x2e\00vwscanf\00vwscanf\00\00697\000\000\000\000\00256\000\000", !10, !243, !350, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 697] [scope 0] [vwscanf]
!354 = !{!"0x8\00176\00", !38, !355}              ; [ DW_TAG_imported_declaration ]
!355 = !{!"0x2e\00wcrtomb\00wcrtomb\00\00370\000\000\000\000\00256\000\000", !10, !243, !356, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 370] [scope 0] [wcrtomb]
!356 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !357, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!357 = !{!291, !358, !257, !296}
!358 = !{!"0x37\00\000\000\000\000\000", null, null, !359} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!359 = !{!"0xf\00\000\0064\0064\000\000", null, null, !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!360 = !{!"0x8\00177\00", !38, !361}              ; [ DW_TAG_imported_declaration ]
!361 = !{!"0x2e\00wcscat\00wcscat\00\00155\000\000\000\000\00256\000\000", !10, !243, !362, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 155] [scope 0] [wcscat]
!362 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !363, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!363 = !{!256, !258, !268}
!364 = !{!"0x8\00178\00", !38, !365}              ; [ DW_TAG_imported_declaration ]
!365 = !{!"0x2e\00wcscmp\00wcscmp\00\00163\000\000\000\000\00256\000\000", !10, !243, !366, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 163] [scope 0] [wcscmp]
!366 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !367, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!367 = !{!13, !269, !269}
!368 = !{!"0x8\00179\00", !38, !369}              ; [ DW_TAG_imported_declaration ]
!369 = !{!"0x2e\00wcscoll\00wcscoll\00\00192\000\000\000\000\00256\000\000", !10, !243, !366, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 192] [scope 0] [wcscoll]
!370 = !{!"0x8\00180\00", !38, !371}              ; [ DW_TAG_imported_declaration ]
!371 = !{!"0x2e\00wcscpy\00wcscpy\00\00147\000\000\000\000\00256\000\000", !10, !243, !362, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 147] [scope 0] [wcscpy]
!372 = !{!"0x8\00181\00", !38, !373}              ; [ DW_TAG_imported_declaration ]
!373 = !{!"0x2e\00wcscspn\00wcscspn\00\00252\000\000\000\000\00256\000\000", !10, !243, !374, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 252] [scope 0] [wcscspn]
!374 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !375, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!375 = !{!291, !269, !269}
!376 = !{!"0x8\00182\00", !38, !377}              ; [ DW_TAG_imported_declaration ]
!377 = !{!"0x2e\00wcsftime\00wcsftime\00\00855\000\000\000\000\00256\000\000", !10, !243, !378, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 855] [scope 0] [wcsftime]
!378 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !379, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!379 = !{!291, !258, !291, !268, !380}
!380 = !{!"0x37\00\000\000\000\000\000", null, null, !381} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!381 = !{!"0xf\00\000\0064\0064\000\000", null, null, !382} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!382 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS2tm"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS2tm]
!383 = !{!"0x8\00183\00", !38, !384}              ; [ DW_TAG_imported_declaration ]
!384 = !{!"0x2e\00wcslen\00wcslen\00\00287\000\000\000\000\00256\000\000", !10, !243, !385, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 287] [scope 0] [wcslen]
!385 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !386, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!386 = !{!291, !269}
!387 = !{!"0x8\00184\00", !38, !388}              ; [ DW_TAG_imported_declaration ]
!388 = !{!"0x2e\00wcsncat\00wcsncat\00\00158\000\000\000\000\00256\000\000", !10, !243, !389, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 158] [scope 0] [wcsncat]
!389 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !390, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!390 = !{!256, !258, !268, !291}
!391 = !{!"0x8\00185\00", !38, !392}              ; [ DW_TAG_imported_declaration ]
!392 = !{!"0x2e\00wcsncmp\00wcsncmp\00\00166\000\000\000\000\00256\000\000", !10, !243, !393, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 166] [scope 0] [wcsncmp]
!393 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !394, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!394 = !{!13, !269, !269, !291}
!395 = !{!"0x8\00186\00", !38, !396}              ; [ DW_TAG_imported_declaration ]
!396 = !{!"0x2e\00wcsncpy\00wcsncpy\00\00150\000\000\000\000\00256\000\000", !10, !243, !389, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 150] [scope 0] [wcsncpy]
!397 = !{!"0x8\00187\00", !38, !398}              ; [ DW_TAG_imported_declaration ]
!398 = !{!"0x2e\00wcsrtombs\00wcsrtombs\00\00414\000\000\000\000\00256\000\000", !10, !243, !399, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 414] [scope 0] [wcsrtombs]
!399 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !400, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!400 = !{!291, !358, !401, !291, !296}
!401 = !{!"0x37\00\000\000\000\000\000", null, null, !402} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!402 = !{!"0xf\00\000\0064\0064\000\000", null, null, !269} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!403 = !{!"0x8\00188\00", !38, !404}              ; [ DW_TAG_imported_declaration ]
!404 = !{!"0x2e\00wcsspn\00wcsspn\00\00256\000\000\000\000\00256\000\000", !10, !243, !374, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 256] [scope 0] [wcsspn]
!405 = !{!"0x8\00189\00", !38, !406}              ; [ DW_TAG_imported_declaration ]
!406 = !{!"0x2e\00wcstod\00wcstod\00\00450\000\000\000\000\00256\000\000", !10, !243, !407, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 450] [scope 0] [wcstod]
!407 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !408, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!408 = !{!409, !268, !410}
!409 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!410 = !{!"0x37\00\000\000\000\000\000", null, null, !411} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!411 = !{!"0xf\00\000\0064\0064\000\000", null, null, !256} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!412 = !{!"0x8\00191\00", !38, !413}              ; [ DW_TAG_imported_declaration ]
!413 = !{!"0x2e\00wcstof\00wcstof\00\00457\000\000\000\000\00256\000\000", !10, !243, !414, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 457] [scope 0] [wcstof]
!414 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !415, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!415 = !{!416, !268, !410}
!416 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!417 = !{!"0x8\00193\00", !38, !418}              ; [ DW_TAG_imported_declaration ]
!418 = !{!"0x2e\00wcstok\00wcstok\00\00282\000\000\000\000\00256\000\000", !10, !243, !419, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 282] [scope 0] [wcstok]
!419 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !420, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!420 = !{!256, !258, !268, !410}
!421 = !{!"0x8\00194\00", !38, !422}              ; [ DW_TAG_imported_declaration ]
!422 = !{!"0x2e\00wcstol\00wcstol\00\00468\000\000\000\000\00256\000\000", !10, !243, !423, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 468] [scope 0] [wcstol]
!423 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !424, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!424 = !{!156, !268, !410, !13}
!425 = !{!"0x8\00195\00", !38, !426}              ; [ DW_TAG_imported_declaration ]
!426 = !{!"0x2e\00wcstoul\00wcstoul\00\00473\000\000\000\000\00256\000\000", !10, !243, !427, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 473] [scope 0] [wcstoul]
!427 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !428, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!428 = !{!292, !268, !410, !13}
!429 = !{!"0x8\00196\00", !38, !430}              ; [ DW_TAG_imported_declaration ]
!430 = !{!"0x2e\00wcsxfrm\00wcsxfrm\00\00196\000\000\000\000\00256\000\000", !10, !243, !431, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 196] [scope 0] [wcsxfrm]
!431 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !432, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!432 = !{!291, !258, !268, !291}
!433 = !{!"0x8\00197\00", !38, !434}              ; [ DW_TAG_imported_declaration ]
!434 = !{!"0x2e\00wctob\00wctob\00\00357\000\000\000\000\00256\000\000", !10, !243, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 357] [scope 0] [wctob]
!435 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !436, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!436 = !{!13, !239}
!437 = !{!"0x8\00198\00", !38, !438}              ; [ DW_TAG_imported_declaration ]
!438 = !{!"0x2e\00wmemcmp\00wmemcmp\00\00325\000\000\000\000\00256\000\000", !10, !243, !393, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 325] [scope 0] [wmemcmp]
!439 = !{!"0x8\00199\00", !38, !440}              ; [ DW_TAG_imported_declaration ]
!440 = !{!"0x2e\00wmemcpy\00wmemcpy\00\00329\000\000\000\000\00256\000\000", !10, !243, !389, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 329] [scope 0] [wmemcpy]
!441 = !{!"0x8\00200\00", !38, !442}              ; [ DW_TAG_imported_declaration ]
!442 = !{!"0x2e\00wmemmove\00wmemmove\00\00334\000\000\000\000\00256\000\000", !10, !243, !443, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 334] [scope 0] [wmemmove]
!443 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !444, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!444 = !{!256, !256, !269, !291}
!445 = !{!"0x8\00201\00", !38, !446}              ; [ DW_TAG_imported_declaration ]
!446 = !{!"0x2e\00wmemset\00wmemset\00\00338\000\000\000\000\00256\000\000", !10, !243, !447, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 338] [scope 0] [wmemset]
!447 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !448, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!448 = !{!256, !256, !257, !291}
!449 = !{!"0x8\00202\00", !38, !450}              ; [ DW_TAG_imported_declaration ]
!450 = !{!"0x2e\00wprintf\00wprintf\00\00601\000\000\000\000\00256\000\000", !10, !243, !451, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 601] [scope 0] [wprintf]
!451 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !452, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!452 = !{!13, !268, null}
!453 = !{!"0x8\00203\00", !38, !454}              ; [ DW_TAG_imported_declaration ]
!454 = !{!"0x2e\00wscanf\00wscanf\00\00642\000\000\000\000\00256\000\000", !10, !243, !451, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 642] [scope 0] [wscanf]
!455 = !{!"0x8\00204\00", !38, !456}              ; [ DW_TAG_imported_declaration ]
!456 = !{!"0x2e\00wcschr\00wcschr\00\00227\000\000\000\000\00256\000\000", !10, !243, !457, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 227] [scope 0] [wcschr]
!457 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !458, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!458 = !{!256, !269, !257}
!459 = !{!"0x8\00205\00", !38, !460}              ; [ DW_TAG_imported_declaration ]
!460 = !{!"0x2e\00wcspbrk\00wcspbrk\00\00266\000\000\000\000\00256\000\000", !10, !243, !461, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 266] [scope 0] [wcspbrk]
!461 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !462, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!462 = !{!256, !269, !269}
!463 = !{!"0x8\00206\00", !38, !464}              ; [ DW_TAG_imported_declaration ]
!464 = !{!"0x2e\00wcsrchr\00wcsrchr\00\00237\000\000\000\000\00256\000\000", !10, !243, !457, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 237] [scope 0] [wcsrchr]
!465 = !{!"0x8\00207\00", !38, !466}              ; [ DW_TAG_imported_declaration ]
!466 = !{!"0x2e\00wcsstr\00wcsstr\00\00277\000\000\000\000\00256\000\000", !10, !243, !461, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 277] [scope 0] [wcsstr]
!467 = !{!"0x8\00208\00", !38, !468}              ; [ DW_TAG_imported_declaration ]
!468 = !{!"0x2e\00wmemchr\00wmemchr\00\00320\000\000\000\000\00256\000\000", !10, !243, !469, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 320] [scope 0] [wmemchr]
!469 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !470, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!470 = !{!256, !269, !257, !291}
!471 = !{!"0x8\00248\00", !472, !474}             ; [ DW_TAG_imported_declaration ]
!472 = !{!"0x39\00__gnu_cxx\00241", !473, null}   ; [ DW_TAG_namespace ] [__gnu_cxx] [line 241]
!473 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/cwchar", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!474 = !{!"0x2e\00wcstold\00wcstold\00\00459\000\000\000\000\00256\000\000", !10, !243, !475, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 459] [scope 0] [wcstold]
!475 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !476, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!476 = !{!477, !268, !410}
!477 = !{!"0x24\00long double\000\00128\00128\000\000\004", null, null} ; [ DW_TAG_base_type ] [long double] [line 0, size 128, align 128, offset 0, enc DW_ATE_float]
!478 = !{!"0x8\00257\00", !472, !479}             ; [ DW_TAG_imported_declaration ]
!479 = !{!"0x2e\00wcstoll\00wcstoll\00\00483\000\000\000\000\00256\000\000", !10, !243, !480, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 483] [scope 0] [wcstoll]
!480 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !481, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!481 = !{!482, !268, !410, !13}
!482 = !{!"0x24\00long long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!483 = !{!"0x8\00258\00", !472, !484}             ; [ DW_TAG_imported_declaration ]
!484 = !{!"0x2e\00wcstoull\00wcstoull\00\00490\000\000\000\000\00256\000\000", !10, !243, !485, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 490] [scope 0] [wcstoull]
!485 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !486, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!486 = !{!487, !268, !410, !13}
!487 = !{!"0x24\00long long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!488 = !{!"0x8\00264\00", !38, !474}              ; [ DW_TAG_imported_declaration ]
!489 = !{!"0x8\00265\00", !38, !479}              ; [ DW_TAG_imported_declaration ]
!490 = !{!"0x8\00266\00", !38, !484}              ; [ DW_TAG_imported_declaration ]
!491 = !{!"0x3a\0056\00", !492, !494}             ; [ DW_TAG_imported_module ]
!492 = !{!"0x39\00__gnu_debug\0054", !493, null}  ; [ DW_TAG_namespace ] [__gnu_debug] [line 54]
!493 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/debug/debug.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!494 = !{!"0x39\00__debug\0048", !493, !38}       ; [ DW_TAG_namespace ] [__debug] [line 48]
!495 = !{!"0x8\0053\00", !38, !"_ZTS5lconv"}      ; [ DW_TAG_imported_declaration ]
!496 = !{!"0x8\0054\00", !38, !497}               ; [ DW_TAG_imported_declaration ]
!497 = !{!"0x2e\00setlocale\00setlocale\00\00124\000\000\000\000\00256\000\000", !35, !498, !499, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 124] [scope 0] [setlocale]
!498 = !{!"0x29", !35}                            ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon//usr/include/locale.h]
!499 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !500, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!500 = !{!359, !13, !294}
!501 = !{!"0x8\0055\00", !38, !502}               ; [ DW_TAG_imported_declaration ]
!502 = !{!"0x2e\00localeconv\00localeconv\00\00127\000\000\000\000\00256\000\000", !35, !498, !503, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 127] [scope 0] [localeconv]
!503 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !504, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!504 = !{!505}
!505 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS5lconv"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS5lconv]
!506 = !{!"0x8\0064\00", !38, !507}               ; [ DW_TAG_imported_declaration ]
!507 = !{!"0x2e\00isalnum\00isalnum\00\00110\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 110] [scope 0] [isalnum]
!508 = !{!"/usr/include/ctype.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!509 = !{!"0x29", !508}                           ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon//usr/include/ctype.h]
!510 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !511, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!511 = !{!13, !13}
!512 = !{!"0x8\0065\00", !38, !513}               ; [ DW_TAG_imported_declaration ]
!513 = !{!"0x2e\00isalpha\00isalpha\00\00111\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 111] [scope 0] [isalpha]
!514 = !{!"0x8\0066\00", !38, !515}               ; [ DW_TAG_imported_declaration ]
!515 = !{!"0x2e\00iscntrl\00iscntrl\00\00112\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 112] [scope 0] [iscntrl]
!516 = !{!"0x8\0067\00", !38, !517}               ; [ DW_TAG_imported_declaration ]
!517 = !{!"0x2e\00isdigit\00isdigit\00\00113\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 113] [scope 0] [isdigit]
!518 = !{!"0x8\0068\00", !38, !519}               ; [ DW_TAG_imported_declaration ]
!519 = !{!"0x2e\00isgraph\00isgraph\00\00115\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 115] [scope 0] [isgraph]
!520 = !{!"0x8\0069\00", !38, !521}               ; [ DW_TAG_imported_declaration ]
!521 = !{!"0x2e\00islower\00islower\00\00114\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 114] [scope 0] [islower]
!522 = !{!"0x8\0070\00", !38, !523}               ; [ DW_TAG_imported_declaration ]
!523 = !{!"0x2e\00isprint\00isprint\00\00116\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 116] [scope 0] [isprint]
!524 = !{!"0x8\0071\00", !38, !525}               ; [ DW_TAG_imported_declaration ]
!525 = !{!"0x2e\00ispunct\00ispunct\00\00117\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 117] [scope 0] [ispunct]
!526 = !{!"0x8\0072\00", !38, !527}               ; [ DW_TAG_imported_declaration ]
!527 = !{!"0x2e\00isspace\00isspace\00\00118\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 118] [scope 0] [isspace]
!528 = !{!"0x8\0073\00", !38, !529}               ; [ DW_TAG_imported_declaration ]
!529 = !{!"0x2e\00isupper\00isupper\00\00119\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 119] [scope 0] [isupper]
!530 = !{!"0x8\0074\00", !38, !531}               ; [ DW_TAG_imported_declaration ]
!531 = !{!"0x2e\00isxdigit\00isxdigit\00\00120\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 120] [scope 0] [isxdigit]
!532 = !{!"0x8\0075\00", !38, !533}               ; [ DW_TAG_imported_declaration ]
!533 = !{!"0x2e\00tolower\00tolower\00\00124\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 124] [scope 0] [tolower]
!534 = !{!"0x8\0076\00", !38, !535}               ; [ DW_TAG_imported_declaration ]
!535 = !{!"0x2e\00toupper\00toupper\00\00127\000\000\000\000\00256\000\000", !508, !509, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 127] [scope 0] [toupper]
!536 = !{!"0x8\0044\00", !472, !537}              ; [ DW_TAG_imported_declaration ]
!537 = !{!"0x16\00size_t\00186\000\000\000\000", !538, !38, !292} ; [ DW_TAG_typedef ] [size_t] [line 186, size 0, align 0, offset 0] [from long unsigned int]
!538 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/x86_64-linux-gnu/c++/4.8/bits/c++config.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!539 = !{!"0x8\0045\00", !472, !540}              ; [ DW_TAG_imported_declaration ]
!540 = !{!"0x16\00ptrdiff_t\00187\000\000\000\000", !538, !38, !156} ; [ DW_TAG_typedef ] [ptrdiff_t] [line 187, size 0, align 0, offset 0] [from long int]
!541 = !{!"0x8\0082\00", !38, !542}               ; [ DW_TAG_imported_declaration ]
!542 = !{!"0x16\00wctrans_t\00186\000\000\000\000", !543, null, !544} ; [ DW_TAG_typedef ] [wctrans_t] [line 186, size 0, align 0, offset 0] [from ]
!543 = !{!"/usr/include/wctype.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!544 = !{!"0xf\00\000\0064\0064\000\000", null, null, !545} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!545 = !{!"0x26\00\000\000\000\000\000", null, null, !546} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from __int32_t]
!546 = !{!"0x16\00__int32_t\0040\000\000\000\000", !155, null, !13} ; [ DW_TAG_typedef ] [__int32_t] [line 40, size 0, align 0, offset 0] [from int]
!547 = !{!"0x8\0083\00", !38, !548}               ; [ DW_TAG_imported_declaration ]
!548 = !{!"0x16\00wctype_t\0052\000\000\000\000", !543, null, !292} ; [ DW_TAG_typedef ] [wctype_t] [line 52, size 0, align 0, offset 0] [from long unsigned int]
!549 = !{!"0x8\0084\00", !38, !239}               ; [ DW_TAG_imported_declaration ]
!550 = !{!"0x8\0086\00", !38, !551}               ; [ DW_TAG_imported_declaration ]
!551 = !{!"0x2e\00iswalnum\00iswalnum\00\00111\000\000\000\000\00256\000\000", !543, !552, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 111] [scope 0] [iswalnum]
!552 = !{!"0x29", !543}                           ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon//usr/include/wctype.h]
!553 = !{!"0x8\0087\00", !38, !554}               ; [ DW_TAG_imported_declaration ]
!554 = !{!"0x2e\00iswalpha\00iswalpha\00\00117\000\000\000\000\00256\000\000", !543, !552, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 117] [scope 0] [iswalpha]
!555 = !{!"0x8\0089\00", !38, !556}               ; [ DW_TAG_imported_declaration ]
!556 = !{!"0x2e\00iswblank\00iswblank\00\00162\000\000\000\000\00256\000\000", !543, !552, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 162] [scope 0] [iswblank]
!557 = !{!"0x8\0091\00", !38, !558}               ; [ DW_TAG_imported_declaration ]
!558 = !{!"0x2e\00iswcntrl\00iswcntrl\00\00120\000\000\000\000\00256\000\000", !543, !552, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 120] [scope 0] [iswcntrl]
!559 = !{!"0x8\0092\00", !38, !560}               ; [ DW_TAG_imported_declaration ]
!560 = !{!"0x2e\00iswctype\00iswctype\00\00175\000\000\000\000\00256\000\000", !543, !552, !561, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 175] [scope 0] [iswctype]
!561 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !562, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!562 = !{!13, !239, !548}
!563 = !{!"0x8\0093\00", !38, !564}               ; [ DW_TAG_imported_declaration ]
!564 = !{!"0x2e\00iswdigit\00iswdigit\00\00124\000\000\000\000\00256\000\000", !543, !552, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 124] [scope 0] [iswdigit]
!565 = !{!"0x8\0094\00", !38, !566}               ; [ DW_TAG_imported_declaration ]
!566 = !{!"0x2e\00iswgraph\00iswgraph\00\00128\000\000\000\000\00256\000\000", !543, !552, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 128] [scope 0] [iswgraph]
!567 = !{!"0x8\0095\00", !38, !568}               ; [ DW_TAG_imported_declaration ]
!568 = !{!"0x2e\00iswlower\00iswlower\00\00133\000\000\000\000\00256\000\000", !543, !552, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 133] [scope 0] [iswlower]
!569 = !{!"0x8\0096\00", !38, !570}               ; [ DW_TAG_imported_declaration ]
!570 = !{!"0x2e\00iswprint\00iswprint\00\00136\000\000\000\000\00256\000\000", !543, !552, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 136] [scope 0] [iswprint]
!571 = !{!"0x8\0097\00", !38, !572}               ; [ DW_TAG_imported_declaration ]
!572 = !{!"0x2e\00iswpunct\00iswpunct\00\00141\000\000\000\000\00256\000\000", !543, !552, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 141] [scope 0] [iswpunct]
!573 = !{!"0x8\0098\00", !38, !574}               ; [ DW_TAG_imported_declaration ]
!574 = !{!"0x2e\00iswspace\00iswspace\00\00146\000\000\000\000\00256\000\000", !543, !552, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 146] [scope 0] [iswspace]
!575 = !{!"0x8\0099\00", !38, !576}               ; [ DW_TAG_imported_declaration ]
!576 = !{!"0x2e\00iswupper\00iswupper\00\00151\000\000\000\000\00256\000\000", !543, !552, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 151] [scope 0] [iswupper]
!577 = !{!"0x8\00100\00", !38, !578}              ; [ DW_TAG_imported_declaration ]
!578 = !{!"0x2e\00iswxdigit\00iswxdigit\00\00156\000\000\000\000\00256\000\000", !543, !552, !435, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 156] [scope 0] [iswxdigit]
!579 = !{!"0x8\00101\00", !38, !580}              ; [ DW_TAG_imported_declaration ]
!580 = !{!"0x2e\00towctrans\00towctrans\00\00221\000\000\000\000\00256\000\000", !543, !552, !581, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 221] [scope 0] [towctrans]
!581 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !582, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!582 = !{!239, !239, !542}
!583 = !{!"0x8\00102\00", !38, !584}              ; [ DW_TAG_imported_declaration ]
!584 = !{!"0x2e\00towlower\00towlower\00\00194\000\000\000\000\00256\000\000", !543, !552, !585, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 194] [scope 0] [towlower]
!585 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !586, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!586 = !{!239, !239}
!587 = !{!"0x8\00103\00", !38, !588}              ; [ DW_TAG_imported_declaration ]
!588 = !{!"0x2e\00towupper\00towupper\00\00197\000\000\000\000\00256\000\000", !543, !552, !585, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 197] [scope 0] [towupper]
!589 = !{!"0x8\00104\00", !38, !590}              ; [ DW_TAG_imported_declaration ]
!590 = !{!"0x2e\00wctrans\00wctrans\00\00218\000\000\000\000\00256\000\000", !543, !552, !591, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 218] [scope 0] [wctrans]
!591 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !592, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!592 = !{!542, !294}
!593 = !{!"0x8\00105\00", !38, !594}              ; [ DW_TAG_imported_declaration ]
!594 = !{!"0x2e\00wctype\00wctype\00\00171\000\000\000\000\00256\000\000", !543, !552, !595, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 171] [scope 0] [wctype]
!595 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !596, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!596 = !{!548, !294}
!597 = !{!"0x3a\0039\00", !0, !38}                ; [ DW_TAG_imported_module ]
!598 = !{i32 2, !"Dwarf Version", i32 4}
!599 = !{i32 2, !"Debug Info Version", i32 2}
!600 = !{!"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp", !0}
!601 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!602 = !MDLocation(line: 74, column: 25, scope: !203)
!603 = !{!"0x101\00this\0016777216\001088", !207, null, !125} ; [ DW_TAG_arg_variable ] [this] [line 0]
!604 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!605 = !MDLocation(line: 0, scope: !207)
!606 = !{!"0x101\00move\0033554473\000", !207, !209, !76} ; [ DW_TAG_arg_variable ] [move] [line 41]
!607 = !MDLocation(line: 41, column: 46, scope: !207)
!608 = !MDLocation(line: 43, column: 7, scope: !609)
!609 = !{!"0xb\0043\005\000", !1, !207}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!610 = !MDLocation(line: 43, column: 6, scope: !609)
!611 = !MDLocation(line: 43, column: 5, scope: !207)
!612 = !MDLocation(line: 45, column: 11, scope: !613)
!613 = !{!"0xb\0045\003\002", !1, !614}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!614 = !{!"0xb\0044\002\001", !1, !609}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!615 = !{!"0x100\00i\0045\000", !613, !209, !13}  ; [ DW_TAG_auto_variable ] [i] [line 45]
!616 = !MDLocation(line: 45, column: 7, scope: !613)
!617 = !MDLocation(line: 45, column: 31, scope: !618)
!618 = !{!"0xb\002", !1, !619}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!619 = !{!"0xb\001", !1, !620}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!620 = !{!"0xb\0045\003\003", !1, !613}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!621 = !MDLocation(line: 45, column: 36, scope: !620)
!622 = !MDLocation(line: 45, column: 31, scope: !620)
!623 = !MDLocation(line: 45, column: 3, scope: !613)
!624 = !MDLocation(line: 47, column: 7, scope: !625)
!625 = !{!"0xb\0047\007\005", !1, !626}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!626 = !{!"0xb\0046\003\004", !1, !620}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!627 = !MDLocation(line: 47, column: 19, scope: !625)
!628 = !MDLocation(line: 47, column: 7, scope: !626)
!629 = !{!"0x100\00tmp\0049\000", !630, !209, !56} ; [ DW_TAG_auto_variable ] [tmp] [line 49]
!630 = !{!"0xb\0048\004\006", !1, !625}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!631 = !MDLocation(line: 49, column: 19, scope: !630)
!632 = !MDLocation(line: 49, column: 42, scope: !630)
!633 = !MDLocation(line: 49, column: 25, scope: !630)
!634 = !MDLocation(line: 49, column: 25, scope: !635)
!635 = !{!"0xb\002", !1, !630}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!636 = !MDLocation(line: 49, column: 25, scope: !637)
!637 = !{!"0xb\006", !1, !638}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!638 = !{!"0xb\003", !1, !630}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!639 = !MDLocation(line: 49, column: 25, scope: !640)
!640 = !{!"0xb\004", !1, !630}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!641 = !MDLocation(line: 49, column: 19, scope: !642)
!642 = !{!"0xb\005", !1, !643}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!643 = !{!"0xb\001", !1, !630}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!644 = !MDLocation(line: 50, column: 12, scope: !630)
!645 = !MDLocation(line: 50, column: 5, scope: !630)
!646 = !MDLocation(line: 50, column: 17, scope: !630)
!647 = !MDLocation(line: 50, column: 24, scope: !630)
!648 = !MDLocation(line: 51, column: 12, scope: !630)
!649 = !MDLocation(line: 51, column: 5, scope: !630)
!650 = !MDLocation(line: 51, column: 5, scope: !643)
!651 = !MDLocation(line: 52, column: 13, scope: !630)
!652 = !MDLocation(line: 52, column: 5, scope: !630)
!653 = !MDLocation(line: 53, column: 4, scope: !630)
!654 = !MDLocation(line: 59, column: 1, scope: !630)
!655 = !MDLocation(line: 54, column: 3, scope: !626)
!656 = !MDLocation(line: 45, column: 46, scope: !620)
!657 = !MDLocation(line: 45, column: 3, scope: !620)
!658 = !MDLocation(line: 55, column: 2, scope: !614)
!659 = !MDLocation(line: 57, column: 9, scope: !207)
!660 = !MDLocation(line: 57, column: 3, scope: !207)
!661 = !MDLocation(line: 58, column: 2, scope: !207)
!662 = !MDLocation(line: 59, column: 1, scope: !207)
!663 = !MDLocation(line: 59, column: 1, scope: !643)
!664 = !{!"0x101\00this\0016777216\001088", !228, null, !56} ; [ DW_TAG_arg_variable ] [this] [line 0]
!665 = !MDLocation(line: 0, scope: !228)
!666 = !MDLocation(line: 35, column: 18, scope: !228)
!667 = !{!"0x101\00mp1\0016777277\000", !208, !209, !212} ; [ DW_TAG_arg_variable ] [mp1] [line 61]
!668 = !MDLocation(line: 61, column: 25, scope: !208)
!669 = !{!"0x101\00mp2\0033554493\000", !208, !209, !212} ; [ DW_TAG_arg_variable ] [mp2] [line 61]
!670 = !MDLocation(line: 61, column: 42, scope: !208)
!671 = !MDLocation(line: 63, column: 25, scope: !208)
!672 = !MDLocation(line: 63, column: 10, scope: !208)
!673 = !MDLocation(line: 63, column: 9, scope: !208)
!674 = !MDLocation(line: 63, column: 55, scope: !208)
!675 = !MDLocation(line: 63, column: 40, scope: !208)
!676 = !MDLocation(line: 63, column: 39, scope: !208)
!677 = !MDLocation(line: 63, column: 2, scope: !208)
!678 = !{!"0x101\00this\0016777216\001088", !214, null, !125} ; [ DW_TAG_arg_variable ] [this] [line 0]
!679 = !MDLocation(line: 0, scope: !214)
!680 = !MDLocation(line: 68, column: 8, scope: !214)
!681 = !MDLocation(line: 68, column: 15, scope: !214)
!682 = !MDLocation(line: 68, column: 2, scope: !214)
!683 = !MDLocation(line: 69, column: 1, scope: !214)
!684 = !{!"0x101\00this\0016777216\001088", !215, null, !125} ; [ DW_TAG_arg_variable ] [this] [line 0]
!685 = !MDLocation(line: 0, scope: !215)
!686 = !{!"0x100\00move\0073\000", !215, !209, !13} ; [ DW_TAG_auto_variable ] [move] [line 73]
!687 = !MDLocation(line: 73, column: 6, scope: !215)
!688 = !MDLocation(line: 75, column: 2, scope: !215)
!689 = !MDLocation(line: 75, column: 8, scope: !690)
!690 = !{!"0xb\002", !1, !691}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!691 = !{!"0xb\001", !1, !215}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!692 = !MDLocation(line: 77, column: 3, scope: !693)
!693 = !{!"0xb\0076\002\007", !1, !215}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!694 = !{!"0x100\00i\0078\000", !695, !209, !13}  ; [ DW_TAG_auto_variable ] [i] [line 78]
!695 = !{!"0xb\0078\003\008", !1, !693}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!696 = !MDLocation(line: 78, column: 11, scope: !695)
!697 = !MDLocation(line: 78, column: 7, scope: !695)
!698 = !MDLocation(line: 78, column: 18, scope: !699)
!699 = !{!"0xb\002", !1, !700}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!700 = !{!"0xb\001", !1, !701}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!701 = !{!"0xb\0078\003\009", !1, !695}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!702 = !MDLocation(line: 78, column: 23, scope: !701)
!703 = !MDLocation(line: 78, column: 18, scope: !701)
!704 = !MDLocation(line: 78, column: 3, scope: !695)
!705 = !MDLocation(line: 80, column: 13, scope: !706)
!706 = !{!"0xb\0080\007\0011", !1, !707}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!707 = !{!"0xb\0079\003\0010", !1, !701}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!708 = !MDLocation(line: 80, column: 7, scope: !706)
!709 = !MDLocation(line: 80, column: 30, scope: !706)
!710 = !MDLocation(line: 80, column: 24, scope: !706)
!711 = !MDLocation(line: 80, column: 7, scope: !707)
!712 = !MDLocation(line: 82, column: 5, scope: !713)
!713 = !{!"0xb\0081\004\0012", !1, !706}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!714 = !{!"0x100\00tmp\0083\000", !713, !209, !"_ZTS12HexxagonMove"} ; [ DW_TAG_auto_variable ] [tmp] [line 83]
!715 = !MDLocation(line: 83, column: 18, scope: !713)
!716 = !MDLocation(line: 84, column: 5, scope: !713)
!717 = !MDLocation(line: 84, column: 25, scope: !713)
!718 = !MDLocation(line: 84, column: 19, scope: !713)
!719 = !MDLocation(line: 85, column: 19, scope: !713)
!720 = !MDLocation(line: 85, column: 5, scope: !713)
!721 = !MDLocation(line: 85, column: 13, scope: !713)
!722 = !MDLocation(line: 85, column: 30, scope: !713)
!723 = !MDLocation(line: 85, column: 24, scope: !713)
!724 = !MDLocation(line: 86, column: 19, scope: !713)
!725 = !MDLocation(line: 86, column: 5, scope: !713)
!726 = !MDLocation(line: 86, column: 13, scope: !713)
!727 = !MDLocation(line: 87, column: 4, scope: !713)
!728 = !MDLocation(line: 88, column: 3, scope: !707)
!729 = !MDLocation(line: 78, column: 38, scope: !701)
!730 = !MDLocation(line: 78, column: 3, scope: !701)
!731 = !MDLocation(line: 90, column: 1, scope: !215)
!732 = !{!"0x100\00tb\00100\000", !216, !209, !"_ZTS5timeb"} ; [ DW_TAG_auto_variable ] [tb] [line 100]
!733 = !MDLocation(line: 100, column: 15, scope: !216)
!734 = !MDLocation(line: 102, column: 2, scope: !216)
!735 = !MDLocation(line: 103, column: 10, scope: !216)
!736 = !MDLocation(line: 103, column: 28, scope: !216)
!737 = !MDLocation(line: 103, column: 9, scope: !216)
!738 = !MDLocation(line: 103, column: 2, scope: !216)
!739 = !{!"0x101\00this\0016777216\001088", !219, null, !125} ; [ DW_TAG_arg_variable ] [this] [line 0]
!740 = !MDLocation(line: 0, scope: !219)
!741 = !{!"0x101\00i\0033554539\000", !219, !209, !13} ; [ DW_TAG_arg_variable ] [i] [line 107]
!742 = !MDLocation(line: 107, column: 45, scope: !219)
!743 = !MDLocation(line: 109, column: 16, scope: !219)
!744 = !MDLocation(line: 109, column: 9, scope: !219)
!745 = !MDLocation(line: 109, column: 10, scope: !219)
!746 = !MDLocation(line: 109, column: 2, scope: !219)
!747 = !{!"0x101\00this\0016777216\001088", !220, null, !125} ; [ DW_TAG_arg_variable ] [this] [line 0]
!748 = !MDLocation(line: 0, scope: !220)
!749 = !MDLocation(line: 114, column: 9, scope: !220)
!750 = !MDLocation(line: 114, column: 2, scope: !220)
!751 = !{!"0x101\00board\0016777334\000", !221, !209, !224} ; [ DW_TAG_arg_variable ] [board] [line 118]
!752 = !MDLocation(line: 118, column: 30, scope: !221)
!753 = !{!"0x101\00level\0033554550\000", !221, !209, !13} ; [ DW_TAG_arg_variable ] [level] [line 118]
!754 = !MDLocation(line: 118, column: 41, scope: !221)
!755 = !{!"0x101\00alpha\0050331766\000", !221, !209, !13} ; [ DW_TAG_arg_variable ] [alpha] [line 118]
!756 = !MDLocation(line: 118, column: 52, scope: !221)
!757 = !{!"0x101\00beta\0067108982\000", !221, !209, !13} ; [ DW_TAG_arg_variable ] [beta] [line 118]
!758 = !MDLocation(line: 118, column: 63, scope: !221)
!759 = !{!"0x101\00callback\0083886198\000", !221, !209, !65} ; [ DW_TAG_arg_variable ] [callback] [line 118]
!760 = !MDLocation(line: 118, column: 76, scope: !221)
!761 = !{!"0x100\00best\00120\000", !221, !209, !13} ; [ DW_TAG_auto_variable ] [best] [line 120]
!762 = !MDLocation(line: 120, column: 6, scope: !221)
!763 = !MDLocation(line: 122, column: 6, scope: !764)
!764 = !{!"0xb\00122\005\0013", !1, !221}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!765 = !MDLocation(line: 122, column: 5, scope: !221)
!766 = !MDLocation(line: 123, column: 10, scope: !764)
!767 = !MDLocation(line: 123, column: 3, scope: !764)
!768 = !{!"0x100\00moves\00125\000", !221, !209, !125} ; [ DW_TAG_auto_variable ] [moves] [line 125]
!769 = !MDLocation(line: 125, column: 20, scope: !221)
!770 = !MDLocation(line: 125, column: 28, scope: !221)
!771 = !MDLocation(line: 127, column: 6, scope: !772)
!772 = !{!"0xb\00127\005\0014", !1, !221}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!773 = !MDLocation(line: 127, column: 5, scope: !221)
!774 = !{!"0x100\00score\00129\000", !775, !209, !13} ; [ DW_TAG_auto_variable ] [score] [line 129]
!775 = !{!"0xb\00128\002\0015", !1, !772}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!776 = !MDLocation(line: 129, column: 7, scope: !775)
!777 = !MDLocation(line: 129, column: 15, scope: !775)
!778 = !MDLocation(line: 131, column: 6, scope: !779)
!779 = !{!"0xb\00131\006\0016", !1, !775}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!780 = !MDLocation(line: 131, column: 6, scope: !775)
!781 = !MDLocation(line: 132, column: 11, scope: !779)
!782 = !MDLocation(line: 132, column: 4, scope: !779)
!783 = !MDLocation(line: 133, column: 11, scope: !784)
!784 = !{!"0xb\00133\0011\0017", !1, !779}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!785 = !MDLocation(line: 133, column: 11, scope: !779)
!786 = !MDLocation(line: 134, column: 11, scope: !784)
!787 = !MDLocation(line: 134, column: 4, scope: !784)
!788 = !MDLocation(line: 136, column: 11, scope: !784)
!789 = !MDLocation(line: 136, column: 4, scope: !784)
!790 = !MDLocation(line: 139, column: 2, scope: !221)
!791 = !MDLocation(line: 140, column: 6, scope: !792)
!792 = !{!"0xb\00140\005\0018", !1, !221}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!793 = !MDLocation(line: 140, column: 5, scope: !221)
!794 = !MDLocation(line: 140, column: 20, scope: !795)
!795 = !{!"0xb\001", !1, !792}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!796 = !MDLocation(line: 141, column: 3, scope: !792)
!797 = !MDLocation(line: 143, column: 10, scope: !798)
!798 = !{!"0xb\00143\002\0019", !1, !221}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!799 = !{!"0x100\00i\00143\000", !798, !209, !13} ; [ DW_TAG_auto_variable ] [i] [line 143]
!800 = !MDLocation(line: 143, column: 6, scope: !798)
!801 = !MDLocation(line: 143, column: 18, scope: !802)
!802 = !{!"0xb\004", !1, !803}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!803 = !{!"0xb\001", !1, !804}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!804 = !{!"0xb\00143\002\0020", !1, !798}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!805 = !MDLocation(line: 143, column: 22, scope: !804)
!806 = !MDLocation(line: 143, column: 18, scope: !804)
!807 = !MDLocation(line: 143, column: 17, scope: !804)
!808 = !MDLocation(line: 143, column: 47, scope: !809)
!809 = !{!"0xb\002", !1, !804}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!810 = !MDLocation(line: 143, column: 54, scope: !804)
!811 = !MDLocation(line: 143, column: 47, scope: !804)
!812 = !MDLocation(line: 143, column: 2, scope: !813)
!813 = !{!"0xb\003", !1, !798}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!814 = !MDLocation(line: 145, column: 6, scope: !815)
!815 = !{!"0xb\00145\006\0022", !1, !816}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!816 = !{!"0xb\00144\002\0021", !1, !804}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!817 = !MDLocation(line: 145, column: 13, scope: !815)
!818 = !MDLocation(line: 145, column: 6, scope: !816)
!819 = !MDLocation(line: 146, column: 12, scope: !815)
!820 = !MDLocation(line: 146, column: 4, scope: !815)
!821 = !{!"0x100\00newboard\00148\000", !816, !209, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_auto_variable ] [newboard] [line 148]
!822 = !MDLocation(line: 148, column: 17, scope: !816)
!823 = !MDLocation(line: 149, column: 24, scope: !816)
!824 = !MDLocation(line: 149, column: 39, scope: !816)
!825 = !MDLocation(line: 149, column: 3, scope: !816)
!826 = !{!"0x100\00value\00150\000", !816, !209, !13} ; [ DW_TAG_auto_variable ] [value] [line 150]
!827 = !MDLocation(line: 150, column: 7, scope: !816)
!828 = !MDLocation(line: 150, column: 36, scope: !816)
!829 = !MDLocation(line: 150, column: 48, scope: !816)
!830 = !MDLocation(line: 150, column: 47, scope: !816)
!831 = !MDLocation(line: 150, column: 55, scope: !816)
!832 = !MDLocation(line: 150, column: 54, scope: !816)
!833 = !MDLocation(line: 150, column: 62, scope: !816)
!834 = !MDLocation(line: 150, column: 16, scope: !816)
!835 = !MDLocation(line: 150, column: 15, scope: !816)
!836 = !MDLocation(line: 152, column: 6, scope: !837)
!837 = !{!"0xb\00152\006\0023", !1, !816}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!838 = !MDLocation(line: 152, column: 14, scope: !837)
!839 = !MDLocation(line: 152, column: 6, scope: !816)
!840 = !MDLocation(line: 153, column: 11, scope: !837)
!841 = !MDLocation(line: 153, column: 4, scope: !837)
!842 = !MDLocation(line: 154, column: 2, scope: !816)
!843 = !MDLocation(line: 143, column: 61, scope: !804)
!844 = !MDLocation(line: 143, column: 2, scope: !804)
!845 = !MDLocation(line: 156, column: 9, scope: !221)
!846 = !MDLocation(line: 156, column: 2, scope: !221)
!847 = !MDLocation(line: 156, column: 2, scope: !848)
!848 = !{!"0xb\001", !1, !221}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!849 = !MDLocation(line: 156, column: 2, scope: !850)
!850 = !{!"0xb\002", !1, !221}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!851 = !MDLocation(line: 158, column: 9, scope: !221)
!852 = !MDLocation(line: 158, column: 2, scope: !221)
!853 = !MDLocation(line: 159, column: 1, scope: !221)
!854 = !MDLocation(line: 159, column: 1, scope: !848)
!855 = !{!"0x101\00this\0016777216\001088", !227, null, !125} ; [ DW_TAG_arg_variable ] [this] [line 0]
!856 = !MDLocation(line: 0, scope: !227)
!857 = !MDLocation(line: 47, column: 31, scope: !858)
!858 = !{!"0xb\0047\0022\0033", !52, !227}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!859 = !MDLocation(line: 47, column: 24, scope: !858)
!860 = !MDLocation(line: 47, column: 24, scope: !861)
!861 = !{!"0xb\002", !52, !858}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!862 = !MDLocation(line: 47, column: 38, scope: !863)
!863 = !{!"0xb\003", !52, !864}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!864 = !{!"0xb\001", !52, !227}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagonmove.h]
!865 = !{!"0x101\00this\0016777216\001088", !225, null, !125} ; [ DW_TAG_arg_variable ] [this] [line 0]
!866 = !MDLocation(line: 0, scope: !225)
!867 = !{!"0x101\00board\0033554593\008192", !225, !209, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_arg_variable ] [board] [line 161]
!868 = !MDLocation(line: 161, column: 52, scope: !225)
!869 = !{!"0x101\00depth\0050331809\000", !225, !209, !13} ; [ DW_TAG_arg_variable ] [depth] [line 161]
!870 = !MDLocation(line: 161, column: 63, scope: !225)
!871 = !{!"0x101\00callback\0067109025\000", !225, !209, !65} ; [ DW_TAG_arg_variable ] [callback] [line 161]
!872 = !MDLocation(line: 161, column: 77, scope: !225)
!873 = !{!"0x101\00maxtime\0083886241\000", !225, !209, !13} ; [ DW_TAG_arg_variable ] [maxtime] [line 161]
!874 = !MDLocation(line: 161, column: 94, scope: !225)
!875 = !{!"0x100\00t\00163\000", !225, !209, !13} ; [ DW_TAG_auto_variable ] [t] [line 163]
!876 = !MDLocation(line: 163, column: 6, scope: !225)
!877 = !MDLocation(line: 163, column: 10, scope: !225)
!878 = !{!"0x100\00i\00165\000", !879, !209, !13} ; [ DW_TAG_auto_variable ] [i] [line 165]
!879 = !{!"0xb\00165\002\0024", !1, !225}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!880 = !MDLocation(line: 165, column: 10, scope: !879)
!881 = !MDLocation(line: 165, column: 6, scope: !879)
!882 = !MDLocation(line: 165, column: 18, scope: !883)
!883 = !{!"0xb\002", !1, !884}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!884 = !{!"0xb\001", !1, !885}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!885 = !{!"0xb\00165\002\0025", !1, !879}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!886 = !MDLocation(line: 165, column: 22, scope: !885)
!887 = !MDLocation(line: 165, column: 18, scope: !885)
!888 = !MDLocation(line: 165, column: 2, scope: !879)
!889 = !MDLocation(line: 167, column: 7, scope: !890)
!890 = !{!"0xb\00166\002\0026", !1, !885}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!891 = !{!"0x100\00best\00167\000", !890, !209, !13} ; [ DW_TAG_auto_variable ] [best] [line 167]
!892 = !{!"0x100\00alpha\00168\000", !890, !209, !13} ; [ DW_TAG_auto_variable ] [alpha] [line 168]
!893 = !MDLocation(line: 168, column: 7, scope: !890)
!894 = !{!"0x100\00beta\00169\000", !890, !209, !13} ; [ DW_TAG_auto_variable ] [beta] [line 169]
!895 = !MDLocation(line: 169, column: 7, scope: !890)
!896 = !{!"0x100\00j\00171\000", !897, !209, !13} ; [ DW_TAG_auto_variable ] [j] [line 171]
!897 = !{!"0xb\00171\003\0027", !1, !890}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!898 = !MDLocation(line: 171, column: 11, scope: !897)
!899 = !MDLocation(line: 171, column: 7, scope: !897)
!900 = !MDLocation(line: 171, column: 19, scope: !901)
!901 = !{!"0xb\004", !1, !902}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!902 = !{!"0xb\001", !1, !903}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!903 = !{!"0xb\00171\003\0028", !1, !897}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!904 = !MDLocation(line: 171, column: 23, scope: !903)
!905 = !MDLocation(line: 171, column: 19, scope: !903)
!906 = !MDLocation(line: 171, column: 18, scope: !903)
!907 = !MDLocation(line: 171, column: 77, scope: !908)
!908 = !{!"0xb\002", !1, !903}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!909 = !MDLocation(line: 171, column: 84, scope: !903)
!910 = !MDLocation(line: 171, column: 77, scope: !903)
!911 = !MDLocation(line: 171, column: 3, scope: !912)
!912 = !{!"0xb\003", !1, !897}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!913 = !MDLocation(line: 173, column: 7, scope: !914)
!914 = !{!"0xb\00173\007\0030", !1, !915}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!915 = !{!"0xb\00172\003\0029", !1, !903}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!916 = !MDLocation(line: 173, column: 14, scope: !914)
!917 = !MDLocation(line: 173, column: 7, scope: !915)
!918 = !MDLocation(line: 174, column: 13, scope: !914)
!919 = !MDLocation(line: 174, column: 5, scope: !914)
!920 = !{!"0x100\00newboard\00176\000", !915, !209, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_auto_variable ] [newboard] [line 176]
!921 = !MDLocation(line: 176, column: 18, scope: !915)
!922 = !MDLocation(line: 177, column: 32, scope: !915)
!923 = !MDLocation(line: 177, column: 24, scope: !915)
!924 = !MDLocation(line: 177, column: 4, scope: !915)
!925 = !{!"0x100\00value\00178\000", !915, !209, !13} ; [ DW_TAG_auto_variable ] [value] [line 178]
!926 = !MDLocation(line: 178, column: 8, scope: !915)
!927 = !MDLocation(line: 178, column: 37, scope: !915)
!928 = !MDLocation(line: 178, column: 41, scope: !915)
!929 = !MDLocation(line: 178, column: 40, scope: !915)
!930 = !MDLocation(line: 178, column: 48, scope: !915)
!931 = !MDLocation(line: 178, column: 47, scope: !915)
!932 = !MDLocation(line: 178, column: 55, scope: !915)
!933 = !MDLocation(line: 178, column: 17, scope: !915)
!934 = !MDLocation(line: 178, column: 16, scope: !915)
!935 = !MDLocation(line: 180, column: 24, scope: !915)
!936 = !MDLocation(line: 180, column: 12, scope: !915)
!937 = !MDLocation(line: 180, column: 4, scope: !915)
!938 = !MDLocation(line: 182, column: 7, scope: !939)
!939 = !{!"0xb\00182\007\0031", !1, !915}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!940 = !MDLocation(line: 182, column: 15, scope: !939)
!941 = !MDLocation(line: 182, column: 7, scope: !915)
!942 = !MDLocation(line: 183, column: 12, scope: !939)
!943 = !MDLocation(line: 183, column: 5, scope: !939)
!944 = !MDLocation(line: 184, column: 3, scope: !915)
!945 = !MDLocation(line: 171, column: 91, scope: !903)
!946 = !MDLocation(line: 171, column: 3, scope: !903)
!947 = !MDLocation(line: 186, column: 3, scope: !890)
!948 = !MDLocation(line: 187, column: 2, scope: !890)
!949 = !MDLocation(line: 165, column: 65, scope: !885)
!950 = !MDLocation(line: 165, column: 2, scope: !885)
!951 = !MDLocation(line: 192, column: 1, scope: !225)
!952 = !{!"0x101\00this\0016777216\001088", !226, null, !125} ; [ DW_TAG_arg_variable ] [this] [line 0]
!953 = !MDLocation(line: 0, scope: !226)
!954 = !MDLocation(line: 196, column: 10, scope: !226)
!955 = !MDLocation(line: 196, column: 2, scope: !226)
!956 = !MDLocation(line: 198, column: 5, scope: !957)
!957 = !{!"0xb\00198\005\0032", !1, !226}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagonmove.cpp]
!958 = !MDLocation(line: 198, column: 5, scope: !226)
!959 = !MDLocation(line: 199, column: 10, scope: !957)
!960 = !MDLocation(line: 199, column: 3, scope: !957)
!961 = !MDLocation(line: 201, column: 2, scope: !226)
!962 = !MDLocation(line: 202, column: 1, scope: !226)
!963 = !MDLocation(line: 0, scope: !229)
