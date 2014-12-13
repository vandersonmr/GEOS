; ModuleID = 'nsieve-bits.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"Primes up to %8d %8d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !30
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !30
  tail call void @llvm.dbg.value(metadata !31, i64 0, metadata !17), !dbg !32
  %1 = tail call noalias i8* @malloc(i64 5120004) #2, !dbg !33
  %2 = bitcast i8* %1 to i32*, !dbg !33
  tail call void @llvm.dbg.value(metadata !{i32* %2}, i64 0, metadata !18), !dbg !33
  %3 = icmp eq i8* %1, null, !dbg !34
  br i1 %3, label %30, label %.lr.ph5, !dbg !34

.lr.ph5:                                          ; preds = %0
  tail call void @llvm.dbg.value(metadata !36, i64 0, metadata !25), !dbg !37
  tail call void @llvm.dbg.value(metadata !31, i64 0, metadata !26), !dbg !37
  tail call void @llvm.memset.p0i8.i64(i8* %1, i8 -1, i64 5120004, i32 4, i1 false), !dbg !38
  tail call void @llvm.dbg.value(metadata !39, i64 0, metadata !21), !dbg !40
  br label %4, !dbg !40

; <label>:4                                       ; preds = %.lr.ph5, %.loopexit
  %count.04 = phi i32 [ 0, %.lr.ph5 ], [ %count.1, %.loopexit ]
  %i.03 = phi i32 [ 2, %.lr.ph5 ], [ %28, %.loopexit ]
  %div = lshr i32 %i.03, 5, !dbg !42
  %5 = zext i32 %div to i64, !dbg !42
  %6 = getelementptr inbounds i32* %2, i64 %5, !dbg !42
  %7 = load i32* %6, align 4, !dbg !42, !tbaa !44
  %8 = and i32 %i.03, 31, !dbg !42
  %9 = shl i32 1, %8, !dbg !42
  %10 = and i32 %7, %9, !dbg !42
  %11 = icmp eq i32 %10, 0, !dbg !42
  br i1 %11, label %.loopexit, label %12, !dbg !42

; <label>:12                                      ; preds = %4
  %13 = add i32 %count.04, 1, !dbg !48
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !25), !dbg !48
  %14 = shl i32 %i.03, 1, !dbg !50
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !24), !dbg !50
  %15 = icmp ugt i32 %14, 40960000, !dbg !50
  br i1 %15, label %.loopexit, label %.lr.ph, !dbg !50

.lr.ph:                                           ; preds = %12, %25
  %j.02 = phi i32 [ %26, %25 ], [ %14, %12 ]
  %div1 = lshr i32 %j.02, 5, !dbg !52
  %16 = zext i32 %div1 to i64, !dbg !52
  %17 = getelementptr inbounds i32* %2, i64 %16, !dbg !52
  %18 = load i32* %17, align 4, !dbg !52, !tbaa !44
  %19 = and i32 %j.02, 31, !dbg !52
  %20 = shl i32 1, %19, !dbg !52
  %21 = and i32 %18, %20, !dbg !52
  %22 = icmp eq i32 %21, 0, !dbg !52
  br i1 %22, label %25, label %23, !dbg !52

; <label>:23                                      ; preds = %.lr.ph
  %24 = xor i32 %18, %20, !dbg !52
  store i32 %24, i32* %17, align 4, !dbg !52, !tbaa !44
  br label %25, !dbg !52

; <label>:25                                      ; preds = %.lr.ph, %23
  %26 = add i32 %j.02, %i.03, !dbg !50
  tail call void @llvm.dbg.value(metadata !{i32 %26}, i64 0, metadata !24), !dbg !50
  %27 = icmp ugt i32 %26, 40960000, !dbg !50
  br i1 %27, label %.loopexit, label %.lr.ph, !dbg !50

.loopexit:                                        ; preds = %25, %12, %4
  %count.1 = phi i32 [ %count.04, %4 ], [ %13, %12 ], [ %13, %25 ]
  %28 = add i32 %i.03, 1, !dbg !40
  tail call void @llvm.dbg.value(metadata !{i32 %28}, i64 0, metadata !21), !dbg !40
  %29 = icmp ugt i32 %28, 40960000, !dbg !40
  br i1 %29, label %.lr.ph5.1, label %4, !dbg !40

; <label>:30                                      ; preds = %0, %._crit_edge.2
  %.0 = phi i32 [ 0, %._crit_edge.2 ], [ 1, %0 ]
  ret i32 %.0, !dbg !54

.lr.ph5.1:                                        ; preds = %.loopexit
  %31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 40960000, i32 %count.1) #2, !dbg !55
  tail call void @llvm.dbg.value(metadata !56, i64 0, metadata !15), !dbg !57
  tail call void @llvm.dbg.value(metadata !36, i64 0, metadata !25), !dbg !37
  tail call void @llvm.dbg.value(metadata !31, i64 0, metadata !26), !dbg !37
  tail call void @llvm.memset.p0i8.i64(i8* %1, i8 -1, i64 2560004, i32 4, i1 false), !dbg !38
  tail call void @llvm.dbg.value(metadata !39, i64 0, metadata !21), !dbg !40
  br label %32, !dbg !40

; <label>:32                                      ; preds = %.loopexit.1, %.lr.ph5.1
  %count.04.1 = phi i32 [ 0, %.lr.ph5.1 ], [ %count.1.1, %.loopexit.1 ]
  %i.03.1 = phi i32 [ 2, %.lr.ph5.1 ], [ %56, %.loopexit.1 ]
  %div.1 = lshr i32 %i.03.1, 5, !dbg !42
  %33 = zext i32 %div.1 to i64, !dbg !42
  %34 = getelementptr inbounds i32* %2, i64 %33, !dbg !42
  %35 = load i32* %34, align 4, !dbg !42, !tbaa !44
  %36 = and i32 %i.03.1, 31, !dbg !42
  %37 = shl i32 1, %36, !dbg !42
  %38 = and i32 %35, %37, !dbg !42
  %39 = icmp eq i32 %38, 0, !dbg !42
  br i1 %39, label %.loopexit.1, label %40, !dbg !42

; <label>:40                                      ; preds = %32
  %41 = add i32 %count.04.1, 1, !dbg !48
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !25), !dbg !48
  %42 = shl i32 %i.03.1, 1, !dbg !50
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !24), !dbg !50
  %43 = icmp ugt i32 %42, 20480000, !dbg !50
  br i1 %43, label %.loopexit.1, label %.lr.ph.1, !dbg !50

.lr.ph.1:                                         ; preds = %40, %53
  %j.02.1 = phi i32 [ %54, %53 ], [ %42, %40 ]
  %div1.1 = lshr i32 %j.02.1, 5, !dbg !52
  %44 = zext i32 %div1.1 to i64, !dbg !52
  %45 = getelementptr inbounds i32* %2, i64 %44, !dbg !52
  %46 = load i32* %45, align 4, !dbg !52, !tbaa !44
  %47 = and i32 %j.02.1, 31, !dbg !52
  %48 = shl i32 1, %47, !dbg !52
  %49 = and i32 %46, %48, !dbg !52
  %50 = icmp eq i32 %49, 0, !dbg !52
  br i1 %50, label %53, label %51, !dbg !52

; <label>:51                                      ; preds = %.lr.ph.1
  %52 = xor i32 %46, %48, !dbg !52
  store i32 %52, i32* %45, align 4, !dbg !52, !tbaa !44
  br label %53, !dbg !52

; <label>:53                                      ; preds = %51, %.lr.ph.1
  %54 = add i32 %j.02.1, %i.03.1, !dbg !50
  tail call void @llvm.dbg.value(metadata !{i32 %26}, i64 0, metadata !24), !dbg !50
  %55 = icmp ugt i32 %54, 20480000, !dbg !50
  br i1 %55, label %.loopexit.1, label %.lr.ph.1, !dbg !50

.loopexit.1:                                      ; preds = %53, %40, %32
  %count.1.1 = phi i32 [ %count.04.1, %32 ], [ %41, %40 ], [ %41, %53 ]
  %56 = add i32 %i.03.1, 1, !dbg !40
  tail call void @llvm.dbg.value(metadata !{i32 %28}, i64 0, metadata !21), !dbg !40
  %57 = icmp ugt i32 %56, 20480000, !dbg !40
  br i1 %57, label %.lr.ph5.2, label %32, !dbg !40

.lr.ph5.2:                                        ; preds = %.loopexit.1
  %58 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 20480000, i32 %count.1.1) #2, !dbg !55
  tail call void @llvm.dbg.value(metadata !56, i64 0, metadata !15), !dbg !57
  tail call void @llvm.dbg.value(metadata !36, i64 0, metadata !25), !dbg !37
  tail call void @llvm.dbg.value(metadata !31, i64 0, metadata !26), !dbg !37
  tail call void @llvm.memset.p0i8.i64(i8* %1, i8 -1, i64 1280004, i32 4, i1 false), !dbg !38
  tail call void @llvm.dbg.value(metadata !39, i64 0, metadata !21), !dbg !40
  br label %59, !dbg !40

; <label>:59                                      ; preds = %.loopexit.2, %.lr.ph5.2
  %count.04.2 = phi i32 [ 0, %.lr.ph5.2 ], [ %count.1.2, %.loopexit.2 ]
  %i.03.2 = phi i32 [ 2, %.lr.ph5.2 ], [ %83, %.loopexit.2 ]
  %div.2 = lshr i32 %i.03.2, 5, !dbg !42
  %60 = zext i32 %div.2 to i64, !dbg !42
  %61 = getelementptr inbounds i32* %2, i64 %60, !dbg !42
  %62 = load i32* %61, align 4, !dbg !42, !tbaa !44
  %63 = and i32 %i.03.2, 31, !dbg !42
  %64 = shl i32 1, %63, !dbg !42
  %65 = and i32 %62, %64, !dbg !42
  %66 = icmp eq i32 %65, 0, !dbg !42
  br i1 %66, label %.loopexit.2, label %67, !dbg !42

; <label>:67                                      ; preds = %59
  %68 = add i32 %count.04.2, 1, !dbg !48
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !25), !dbg !48
  %69 = shl i32 %i.03.2, 1, !dbg !50
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !24), !dbg !50
  %70 = icmp ugt i32 %69, 10240000, !dbg !50
  br i1 %70, label %.loopexit.2, label %.lr.ph.2, !dbg !50

.lr.ph.2:                                         ; preds = %67, %80
  %j.02.2 = phi i32 [ %81, %80 ], [ %69, %67 ]
  %div1.2 = lshr i32 %j.02.2, 5, !dbg !52
  %71 = zext i32 %div1.2 to i64, !dbg !52
  %72 = getelementptr inbounds i32* %2, i64 %71, !dbg !52
  %73 = load i32* %72, align 4, !dbg !52, !tbaa !44
  %74 = and i32 %j.02.2, 31, !dbg !52
  %75 = shl i32 1, %74, !dbg !52
  %76 = and i32 %73, %75, !dbg !52
  %77 = icmp eq i32 %76, 0, !dbg !52
  br i1 %77, label %80, label %78, !dbg !52

; <label>:78                                      ; preds = %.lr.ph.2
  %79 = xor i32 %73, %75, !dbg !52
  store i32 %79, i32* %72, align 4, !dbg !52, !tbaa !44
  br label %80, !dbg !52

; <label>:80                                      ; preds = %78, %.lr.ph.2
  %81 = add i32 %j.02.2, %i.03.2, !dbg !50
  tail call void @llvm.dbg.value(metadata !{i32 %26}, i64 0, metadata !24), !dbg !50
  %82 = icmp ugt i32 %81, 10240000, !dbg !50
  br i1 %82, label %.loopexit.2, label %.lr.ph.2, !dbg !50

.loopexit.2:                                      ; preds = %80, %67, %59
  %count.1.2 = phi i32 [ %count.04.2, %59 ], [ %68, %67 ], [ %68, %80 ]
  %83 = add i32 %i.03.2, 1, !dbg !40
  tail call void @llvm.dbg.value(metadata !{i32 %28}, i64 0, metadata !21), !dbg !40
  %84 = icmp ugt i32 %83, 10240000, !dbg !40
  br i1 %84, label %._crit_edge.2, label %59, !dbg !40

._crit_edge.2:                                    ; preds = %.loopexit.2
  %85 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 10240000, i32 %count.1.2) #2, !dbg !55
  tail call void @llvm.dbg.value(metadata !56, i64 0, metadata !15), !dbg !57
  tail call void @free(i8* %1) #2, !dbg !58
  br label %30, !dbg !59
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!27, !28}
!llvm.ident = !{!29}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c] [DW_LANG_C99]
!1 = metadata !{metadata !"nsieve-bits.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 18, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !12, i32 19} ; [ DW_TAG_subprogram ] [line 18] [def] [scope 19] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !17, metadata !18, metadata !21, metadata !24, metadata !25, metadata !26}
!13 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777234, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 18]
!14 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554450, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 18]
!15 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 20, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 20]
!16 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!17 = metadata !{i32 786688, metadata !4, metadata !"sz", metadata !5, i32 20, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sz] [line 20]
!18 = metadata !{i32 786688, metadata !4, metadata !"primes", metadata !5, i32 21, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [primes] [line 21]
!19 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from bits]
!20 = metadata !{i32 786454, metadata !1, null, metadata !"bits", i32 11, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ] [bits] [line 11, size 0, align 0, offset 0] [from unsigned int]
!21 = metadata !{i32 786688, metadata !22, metadata !"i", metadata !5, i32 24, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 24]
!22 = metadata !{i32 786443, metadata !1, metadata !23, i32 23, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!23 = metadata !{i32 786443, metadata !1, metadata !4, i32 23, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!24 = metadata !{i32 786688, metadata !22, metadata !"j", metadata !5, i32 24, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 24]
!25 = metadata !{i32 786688, metadata !22, metadata !"count", metadata !5, i32 24, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 24]
!26 = metadata !{i32 786688, metadata !22, metadata !"n", metadata !5, i32 24, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 24]
!27 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!28 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!29 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!30 = metadata !{i32 18, i32 0, metadata !4, null}
!31 = metadata !{i32 40960000}
!32 = metadata !{i32 20, i32 0, metadata !4, null}
!33 = metadata !{i32 21, i32 0, metadata !4, null}
!34 = metadata !{i32 22, i32 0, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !4, i32 22, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!36 = metadata !{i32 0}
!37 = metadata !{i32 24, i32 0, metadata !22, null}
!38 = metadata !{i32 25, i32 0, metadata !22, null}
!39 = metadata !{i32 2}
!40 = metadata !{i32 26, i32 0, metadata !41, null}
!41 = metadata !{i32 786443, metadata !1, metadata !22, i32 26, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!42 = metadata !{i32 27, i32 0, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !41, i32 27, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!44 = metadata !{metadata !45, metadata !45, i64 0}
!45 = metadata !{metadata !"int", metadata !46, i64 0}
!46 = metadata !{metadata !"omnipotent char", metadata !47, i64 0}
!47 = metadata !{metadata !"Simple C/C++ TBAA"}
!48 = metadata !{i32 28, i32 0, metadata !49, null}
!49 = metadata !{i32 786443, metadata !1, metadata !43, i32 27, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!50 = metadata !{i32 29, i32 0, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !49, i32 29, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!52 = metadata !{i32 30, i32 0, metadata !53, null}
!53 = metadata !{i32 786443, metadata !1, metadata !51, i32 30, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!54 = metadata !{i32 36, i32 0, metadata !4, null}
!55 = metadata !{i32 32, i32 0, metadata !22, null}
!56 = metadata !{i32 1}
!57 = metadata !{i32 23, i32 0, metadata !23, null}
!58 = metadata !{i32 34, i32 0, metadata !4, null}
!59 = metadata !{i32 35, i32 0, metadata !4, null}
