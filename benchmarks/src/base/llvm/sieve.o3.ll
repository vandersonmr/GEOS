; ModuleID = 'sieve.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.flags = internal unnamed_addr global [8193 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [11 x i8] c"Count: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !37
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !37
  %1 = icmp eq i32 %argc, 2, !dbg !38
  br i1 %1, label %.preheader2, label %.preheader1, !dbg !38

.preheader2:                                      ; preds = %0
  %2 = getelementptr inbounds i8** %argv, i64 1, !dbg !39
  %3 = load i8** %2, align 8, !dbg !39, !tbaa !40
  tail call void @llvm.dbg.value(metadata !{i8* %3}, i64 0, metadata !44) #3, !dbg !45
  %4 = tail call i64 @strtol(i8* nocapture %3, i8** null, i32 10) #3, !dbg !46
  %5 = trunc i64 %4 to i32, !dbg !46
  %6 = icmp eq i32 %5, 0, !dbg !48
  br i1 %6, label %._crit_edge7, label %.preheader1, !dbg !48

.loopexit:                                        ; preds = %18
  %7 = add nsw i32 %.in, -1, !dbg !48
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !15), !dbg !48
  %8 = icmp eq i32 %7, 0, !dbg !48
  br i1 %8, label %._crit_edge7, label %.preheader1, !dbg !48

.preheader1:                                      ; preds = %0, %.preheader2, %.loopexit
  %.in = phi i32 [ %7, %.loopexit ], [ 170000, %0 ], [ %5, %.preheader2 ]
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([8193 x i8]* @main.flags, i64 0, i64 2), i8 1, i64 8191, i32 2, i1 false), !dbg !49
  br label %9, !dbg !53

; <label>:9                                       ; preds = %._crit_edge8, %.preheader1
  %10 = phi i1 [ false, %.preheader1 ], [ %phitmp, %._crit_edge8 ]
  %count.16 = phi i32 [ 0, %.preheader1 ], [ %count.2, %._crit_edge8 ]
  %i.15 = phi i64 [ 2, %.preheader1 ], [ %19, %._crit_edge8 ]
  br i1 %10, label %18, label %11, !dbg !55

; <label>:11                                      ; preds = %9
  %12 = shl nsw i64 %i.15, 1, !dbg !58
  tail call void @llvm.dbg.value(metadata !{i64 %12}, i64 0, metadata !18), !dbg !58
  %13 = icmp slt i64 %12, 8193, !dbg !58
  br i1 %13, label %.lr.ph, label %._crit_edge, !dbg !58

.lr.ph:                                           ; preds = %11, %.lr.ph
  %k.04 = phi i64 [ %15, %.lr.ph ], [ %12, %11 ]
  %14 = getelementptr inbounds [8193 x i8]* @main.flags, i64 0, i64 %k.04, !dbg !61
  store i8 0, i8* %14, align 1, !dbg !61, !tbaa !63
  %15 = add nsw i64 %k.04, %i.15, !dbg !58
  tail call void @llvm.dbg.value(metadata !{i64 %15}, i64 0, metadata !18), !dbg !58
  %16 = icmp slt i64 %15, 8193, !dbg !58
  br i1 %16, label %.lr.ph, label %._crit_edge, !dbg !58

._crit_edge:                                      ; preds = %.lr.ph, %11
  %17 = add nsw i32 %count.16, 1, !dbg !64
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !19), !dbg !64
  br label %18, !dbg !65

; <label>:18                                      ; preds = %9, %._crit_edge
  %count.2 = phi i32 [ %17, %._crit_edge ], [ %count.16, %9 ]
  %19 = add nsw i64 %i.15, 1, !dbg !53
  tail call void @llvm.dbg.value(metadata !{i64 %19}, i64 0, metadata !16), !dbg !53
  %exitcond = icmp eq i64 %19, 8193, !dbg !53
  br i1 %exitcond, label %.loopexit, label %._crit_edge8, !dbg !53

._crit_edge8:                                     ; preds = %18
  %.phi.trans.insert = getelementptr inbounds [8193 x i8]* @main.flags, i64 0, i64 %19
  %.pre = load i8* %.phi.trans.insert, align 1, !dbg !55, !tbaa !63
  %phitmp = icmp eq i8 %.pre, 0, !dbg !53
  br label %9, !dbg !53

._crit_edge7:                                     ; preds = %.loopexit, %.preheader2
  %count.0.lcssa = phi i32 [ 0, %.preheader2 ], [ %count.2, %.loopexit ]
  %20 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 %count.0.lcssa) #3, !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!34, !35}
!llvm.ident = !{!36}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !29, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c] [DW_LANG_C99]
!1 = metadata !{metadata !"sieve.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !20}
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
!20 = metadata !{i32 786478, metadata !21, metadata !22, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !23, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !27, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!21 = metadata !{metadata !"/usr/include/stdlib.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!22 = metadata !{i32 786473, metadata !21}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!23 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = metadata !{metadata !8, metadata !25}
!25 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !26} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!26 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!27 = metadata !{metadata !28}
!28 = metadata !{i32 786689, metadata !20, metadata !"__nptr", metadata !22, i32 16777494, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!29 = metadata !{metadata !30}
!30 = metadata !{i32 786484, i32 0, metadata !4, metadata !"flags", metadata !"flags", metadata !"", metadata !5, i32 17, metadata !31, i32 1, i32 1, [8193 x i8]* @main.flags, null} ; [ DW_TAG_variable ] [flags] [line 17] [local] [def]
!31 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 65544, i64 8, i32 0, i32 0, metadata !11, metadata !32, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65544, align 8, offset 0] [from char]
!32 = metadata !{metadata !33}
!33 = metadata !{i32 786465, i64 0, i64 8193}     ; [ DW_TAG_subrange_type ] [0, 8192]
!34 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!35 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!36 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!37 = metadata !{i32 10, i32 0, metadata !4, null}
!38 = metadata !{i32 16, i32 0, metadata !4, null}
!39 = metadata !{i32 16, i32 30, metadata !4, null}
!40 = metadata !{metadata !41, metadata !41, i64 0}
!41 = metadata !{metadata !"any pointer", metadata !42, i64 0}
!42 = metadata !{metadata !"omnipotent char", metadata !43, i64 0}
!43 = metadata !{metadata !"Simple C/C++ TBAA"}
!44 = metadata !{i32 786689, metadata !20, metadata !"__nptr", metadata !22, i32 16777494, metadata !25, i32 0, metadata !39} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!45 = metadata !{i32 278, i32 0, metadata !20, metadata !39}
!46 = metadata !{i32 280, i32 0, metadata !47, metadata !39}
!47 = metadata !{i32 786443, metadata !21, metadata !20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!48 = metadata !{i32 21, i32 0, metadata !4, null}
!49 = metadata !{i32 24, i32 0, metadata !50, null}
!50 = metadata !{i32 786443, metadata !1, metadata !51, i32 23, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!51 = metadata !{i32 786443, metadata !1, metadata !52, i32 23, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!52 = metadata !{i32 786443, metadata !1, metadata !4, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!53 = metadata !{i32 26, i32 0, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !52, i32 26, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!55 = metadata !{i32 27, i32 0, metadata !56, null}
!56 = metadata !{i32 786443, metadata !1, metadata !57, i32 27, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!57 = metadata !{i32 786443, metadata !1, metadata !54, i32 26, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!58 = metadata !{i32 29, i32 0, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !60, i32 29, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!60 = metadata !{i32 786443, metadata !1, metadata !56, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!61 = metadata !{i32 30, i32 0, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !59, i32 29, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!63 = metadata !{metadata !42, metadata !42, i64 0}
!64 = metadata !{i32 32, i32 0, metadata !60, null}
!65 = metadata !{i32 33, i32 0, metadata !60, null}
!66 = metadata !{i32 36, i32 0, metadata !4, null}
!67 = metadata !{i32 37, i32 0, metadata !4, null}
