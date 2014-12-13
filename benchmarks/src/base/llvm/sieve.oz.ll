; ModuleID = 'sieve.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.flags = internal unnamed_addr global [8193 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [11 x i8] c"Count: %d\0A\00", align 1

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !28
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !28
  %1 = icmp eq i32 %argc, 2, !dbg !29
  br i1 %1, label %.preheader2, label %.preheader1, !dbg !29

.preheader2:                                      ; preds = %0
  %2 = getelementptr inbounds i8** %argv, i64 1, !dbg !29
  %3 = load i8** %2, align 8, !dbg !29, !tbaa !30
  %4 = tail call i32 @atoi(i8* %3) #5, !dbg !29
  %5 = icmp eq i32 %4, 0, !dbg !34
  br i1 %5, label %._crit_edge7, label %.preheader1, !dbg !34

.loopexit:                                        ; preds = %17
  %6 = add nsw i32 %.in, -1, !dbg !34
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !15), !dbg !34
  %7 = icmp eq i32 %6, 0, !dbg !34
  br i1 %7, label %._crit_edge7, label %.preheader1, !dbg !34

.preheader1:                                      ; preds = %0, %.preheader2, %.loopexit
  %.in = phi i32 [ %6, %.loopexit ], [ 170000, %0 ], [ %4, %.preheader2 ]
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([8193 x i8]* @main.flags, i64 0, i64 2), i8 1, i64 8191, i32 2, i1 false), !dbg !35
  br label %8, !dbg !39

; <label>:8                                       ; preds = %._crit_edge8, %.preheader1
  %9 = phi i1 [ false, %.preheader1 ], [ %phitmp, %._crit_edge8 ]
  %count.16 = phi i32 [ 0, %.preheader1 ], [ %count.2, %._crit_edge8 ]
  %i.15 = phi i64 [ 2, %.preheader1 ], [ %18, %._crit_edge8 ]
  br i1 %9, label %17, label %10, !dbg !41

; <label>:10                                      ; preds = %8
  %11 = shl nsw i64 %i.15, 1, !dbg !44
  tail call void @llvm.dbg.value(metadata !{i64 %11}, i64 0, metadata !18), !dbg !44
  %12 = icmp slt i64 %11, 8193, !dbg !44
  br i1 %12, label %.lr.ph, label %._crit_edge, !dbg !44

.lr.ph:                                           ; preds = %10, %.lr.ph
  %k.04 = phi i64 [ %14, %.lr.ph ], [ %11, %10 ]
  %13 = getelementptr inbounds [8193 x i8]* @main.flags, i64 0, i64 %k.04, !dbg !47
  store i8 0, i8* %13, align 1, !dbg !47, !tbaa !49
  %14 = add nsw i64 %k.04, %i.15, !dbg !44
  tail call void @llvm.dbg.value(metadata !{i64 %14}, i64 0, metadata !18), !dbg !44
  %15 = icmp slt i64 %14, 8193, !dbg !44
  br i1 %15, label %.lr.ph, label %._crit_edge, !dbg !44

._crit_edge:                                      ; preds = %.lr.ph, %10
  %16 = add nsw i32 %count.16, 1, !dbg !50
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !19), !dbg !50
  br label %17, !dbg !51

; <label>:17                                      ; preds = %8, %._crit_edge
  %count.2 = phi i32 [ %16, %._crit_edge ], [ %count.16, %8 ]
  %18 = add nsw i64 %i.15, 1, !dbg !39
  tail call void @llvm.dbg.value(metadata !{i64 %18}, i64 0, metadata !16), !dbg !39
  %exitcond = icmp eq i64 %18, 8193, !dbg !39
  br i1 %exitcond, label %.loopexit, label %._crit_edge8, !dbg !39

._crit_edge8:                                     ; preds = %17
  %.phi.trans.insert = getelementptr inbounds [8193 x i8]* @main.flags, i64 0, i64 %18
  %.pre = load i8* %.phi.trans.insert, align 1, !dbg !41, !tbaa !49
  %phitmp = icmp eq i8 %.pre, 0, !dbg !39
  br label %8, !dbg !39

._crit_edge7:                                     ; preds = %.loopexit, %.preheader2
  %count.0.lcssa = phi i32 [ 0, %.preheader2 ], [ %count.2, %.loopexit ]
  %19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 %count.0.lcssa) #6, !dbg !52
  ret i32 0, !dbg !53
}

; Function Attrs: minsize nounwind optsize readonly
declare i32 @atoi(i8* nocapture) #1

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { minsize nounwind optsize readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { minsize nounwind optsize readonly }
attributes #6 = { minsize nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!25, !26}
!llvm.ident = !{!27}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !20, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c] [DW_LANG_C99]
!1 = metadata !{metadata !"sieve.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !12, i32 10} ; [ DW_TAG_subprogram ] [line 10] [def] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16, metadata !18, metadata !19}
!13 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777226, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 10]
!14 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554442, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 10]
!15 = metadata !{i32 786688, metadata !4, metadata !"NUM", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [NUM] [line 16]
!16 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 18, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 18]
!17 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!18 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 18, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 18]
!19 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 19, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 19]
!20 = metadata !{metadata !21}
!21 = metadata !{i32 786484, i32 0, metadata !4, metadata !"flags", metadata !"flags", metadata !"", metadata !5, i32 17, metadata !22, i32 1, i32 1, [8193 x i8]* @main.flags, null} ; [ DW_TAG_variable ] [flags] [line 17] [local] [def]
!22 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 65544, i64 8, i32 0, i32 0, metadata !11, metadata !23, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65544, align 8, offset 0] [from char]
!23 = metadata !{metadata !24}
!24 = metadata !{i32 786465, i64 0, i64 8193}     ; [ DW_TAG_subrange_type ] [0, 8192]
!25 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!26 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!27 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!28 = metadata !{i32 10, i32 0, metadata !4, null}
!29 = metadata !{i32 16, i32 0, metadata !4, null}
!30 = metadata !{metadata !31, metadata !31, i64 0}
!31 = metadata !{metadata !"any pointer", metadata !32, i64 0}
!32 = metadata !{metadata !"omnipotent char", metadata !33, i64 0}
!33 = metadata !{metadata !"Simple C/C++ TBAA"}
!34 = metadata !{i32 21, i32 0, metadata !4, null}
!35 = metadata !{i32 24, i32 0, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !37, i32 23, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!37 = metadata !{i32 786443, metadata !1, metadata !38, i32 23, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!38 = metadata !{i32 786443, metadata !1, metadata !4, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!39 = metadata !{i32 26, i32 0, metadata !40, null}
!40 = metadata !{i32 786443, metadata !1, metadata !38, i32 26, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!41 = metadata !{i32 27, i32 0, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !43, i32 27, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!43 = metadata !{i32 786443, metadata !1, metadata !40, i32 26, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!44 = metadata !{i32 29, i32 0, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !46, i32 29, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!46 = metadata !{i32 786443, metadata !1, metadata !42, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!47 = metadata !{i32 30, i32 0, metadata !48, null}
!48 = metadata !{i32 786443, metadata !1, metadata !45, i32 29, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!49 = metadata !{metadata !32, metadata !32, i64 0}
!50 = metadata !{i32 32, i32 0, metadata !46, null}
!51 = metadata !{i32 33, i32 0, metadata !46, null}
!52 = metadata !{i32 36, i32 0, metadata !4, null}
!53 = metadata !{i32 37, i32 0, metadata !4, null}
