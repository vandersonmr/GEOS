; ModuleID = 'strcat.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"calloc strbuf\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"realloc strbuf\00", align 1
@.str2 = private unnamed_addr constant [7 x i8] c"hello\0A\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !24
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !24
  %1 = icmp eq i32 %argc, 2, !dbg !25
  br i1 %1, label %2, label %6, !dbg !25

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !25
  %4 = load i8** %3, align 8, !dbg !25, !tbaa !26
  %5 = tail call i32 @atoi(i8* %4) #6, !dbg !25
  br label %6, !dbg !25

; <label>:6                                       ; preds = %0, %2
  %7 = phi i32 [ %5, %2 ], [ 10000000, %0 ], !dbg !25
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !15), !dbg !25
  tail call void @llvm.dbg.value(metadata !30, i64 0, metadata !17), !dbg !31
  %8 = tail call noalias i8* @calloc(i64 1, i64 32) #7, !dbg !32
  tail call void @llvm.dbg.value(metadata !{i8* %8}, i64 0, metadata !18), !dbg !32
  tail call void @llvm.dbg.value(metadata !{i8* %8}, i64 0, metadata !19), !dbg !33
  tail call void @llvm.dbg.value(metadata !34, i64 0, metadata !20), !dbg !35
  %9 = icmp eq i8* %8, null, !dbg !36
  br i1 %9, label %11, label %.preheader, !dbg !36

.preheader:                                       ; preds = %6
  %10 = icmp sgt i32 %7, 0, !dbg !38
  br i1 %10, label %.lr.ph, label %._crit_edge, !dbg !38

; <label>:11                                      ; preds = %6
  tail call void @perror(i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0)) #8, !dbg !40
  tail call void @exit(i32 1) #9, !dbg !40
  unreachable, !dbg !40

.lr.ph:                                           ; preds = %.preheader, %27
  %i.05 = phi i32 [ %29, %27 ], [ 0, %.preheader ]
  %strend.04 = phi i8* [ %28, %27 ], [ %8, %.preheader ]
  %strbuf.03 = phi i8* [ %strbuf.1, %27 ], [ %8, %.preheader ]
  %buflen.02 = phi i32 [ %buflen.1, %27 ], [ 32, %.preheader ]
  %12 = sext i32 %buflen.02 to i64, !dbg !42
  %13 = getelementptr inbounds i8* %strbuf.03, i64 %12, !dbg !42
  %14 = ptrtoint i8* %13 to i64, !dbg !42
  %15 = ptrtoint i8* %strend.04 to i64, !dbg !42
  %16 = sub i64 %14, %15, !dbg !42
  %17 = icmp slt i64 %16, 7, !dbg !42
  br i1 %17, label %18, label %27, !dbg !42

; <label>:18                                      ; preds = %.lr.ph
  %19 = shl nsw i32 %buflen.02, 1, !dbg !45
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !17), !dbg !45
  %20 = sext i32 %19 to i64, !dbg !47
  %21 = tail call i8* @realloc(i8* %strbuf.03, i64 %20) #7, !dbg !47
  tail call void @llvm.dbg.value(metadata !{i8* %21}, i64 0, metadata !18), !dbg !47
  %22 = icmp eq i8* %21, null, !dbg !48
  br i1 %22, label %23, label %24, !dbg !48

; <label>:23                                      ; preds = %18
  tail call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0)) #8, !dbg !50
  tail call void @exit(i32 1) #9, !dbg !50
  unreachable, !dbg !50

; <label>:24                                      ; preds = %18
  %25 = tail call i64 @strlen(i8* %21) #6, !dbg !52
  %26 = getelementptr inbounds i8* %21, i64 %25, !dbg !52
  tail call void @llvm.dbg.value(metadata !{i8* %26}, i64 0, metadata !19), !dbg !52
  br label %27, !dbg !53

; <label>:27                                      ; preds = %24, %.lr.ph
  %buflen.1 = phi i32 [ %19, %24 ], [ %buflen.02, %.lr.ph ]
  %strbuf.1 = phi i8* [ %21, %24 ], [ %strbuf.03, %.lr.ph ]
  %strend.1 = phi i8* [ %26, %24 ], [ %strend.04, %.lr.ph ]
  %strlen = tail call i64 @strlen(i8* %strend.1), !dbg !54
  %endptr = getelementptr i8* %strend.1, i64 %strlen, !dbg !54
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %endptr, i8* getelementptr inbounds ([7 x i8]* @.str2, i64 0, i64 0), i64 7, i32 1, i1 false), !dbg !54
  %28 = getelementptr inbounds i8* %strend.1, i64 6, !dbg !55
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !19), !dbg !55
  %29 = add nsw i32 %i.05, 1, !dbg !38
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !16), !dbg !38
  %30 = icmp slt i32 %29, %7, !dbg !38
  br i1 %30, label %.lr.ph, label %._crit_edge, !dbg !38

._crit_edge:                                      ; preds = %27, %.preheader
  %strbuf.0.lcssa = phi i8* [ %8, %.preheader ], [ %strbuf.1, %27 ]
  %31 = tail call i64 @strlen(i8* %strbuf.0.lcssa) #6, !dbg !56
  %32 = trunc i64 %31 to i32, !dbg !56
  %33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 %32) #7, !dbg !56
  tail call void @free(i8* %strbuf.0.lcssa) #7, !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: minsize nounwind optsize readonly
declare i32 @atoi(i8* nocapture) #1

; Function Attrs: minsize nounwind optsize
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: minsize nounwind optsize
declare void @perror(i8* nocapture readonly) #2

; Function Attrs: minsize noreturn nounwind optsize
declare void @exit(i32) #3

; Function Attrs: minsize nounwind optsize
declare noalias i8* @realloc(i8* nocapture, i64) #2

; Function Attrs: minsize nounwind optsize readonly
declare i64 @strlen(i8* nocapture) #1

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: minsize nounwind optsize
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #4

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #5

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { minsize nounwind optsize readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { minsize noreturn nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { minsize nounwind optsize readonly }
attributes #7 = { minsize nounwind optsize }
attributes #8 = { cold minsize nounwind optsize }
attributes #9 = { minsize noreturn nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!21, !22}
!llvm.ident = !{!23}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c] [DW_LANG_C99]
!1 = metadata !{metadata !"strcat.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 13, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !12, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20}
!13 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 13]
!14 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554445, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 13]
!15 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 14]
!16 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 15, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 15]
!17 = metadata !{i32 786688, metadata !4, metadata !"buflen", metadata !5, i32 15, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buflen] [line 15]
!18 = metadata !{i32 786688, metadata !4, metadata !"strbuf", metadata !5, i32 16, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [strbuf] [line 16]
!19 = metadata !{i32 786688, metadata !4, metadata !"strend", metadata !5, i32 17, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [strend] [line 17]
!20 = metadata !{i32 786688, metadata !4, metadata !"stufflen", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [stufflen] [line 18]
!21 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!22 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!23 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!24 = metadata !{i32 13, i32 0, metadata !4, null}
!25 = metadata !{i32 14, i32 0, metadata !4, null}
!26 = metadata !{metadata !27, metadata !27, i64 0}
!27 = metadata !{metadata !"any pointer", metadata !28, i64 0}
!28 = metadata !{metadata !"omnipotent char", metadata !29, i64 0}
!29 = metadata !{metadata !"Simple C/C++ TBAA"}
!30 = metadata !{i32 32}
!31 = metadata !{i32 15, i32 0, metadata !4, null}
!32 = metadata !{i32 16, i32 0, metadata !4, null}
!33 = metadata !{i32 17, i32 0, metadata !4, null}
!34 = metadata !{i32 6}
!35 = metadata !{i32 18, i32 0, metadata !4, null}
!36 = metadata !{i32 20, i32 0, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !4, i32 20, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!38 = metadata !{i32 21, i32 0, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !4, i32 21, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!40 = metadata !{i32 20, i32 0, metadata !41, null}
!41 = metadata !{i32 786443, metadata !1, metadata !37, i32 20, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!42 = metadata !{i32 22, i32 0, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !44, i32 22, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!44 = metadata !{i32 786443, metadata !1, metadata !39, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!45 = metadata !{i32 23, i32 0, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !43, i32 22, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!47 = metadata !{i32 24, i32 0, metadata !46, null}
!48 = metadata !{i32 25, i32 0, metadata !49, null}
!49 = metadata !{i32 786443, metadata !1, metadata !46, i32 25, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!50 = metadata !{i32 25, i32 0, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !49, i32 25, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!52 = metadata !{i32 26, i32 0, metadata !46, null}
!53 = metadata !{i32 27, i32 0, metadata !46, null}
!54 = metadata !{i32 29, i32 0, metadata !44, null}
!55 = metadata !{i32 30, i32 0, metadata !44, null}
!56 = metadata !{i32 32, i32 0, metadata !4, null}
!57 = metadata !{i32 33, i32 0, metadata !4, null}
!58 = metadata !{i32 35, i32 0, metadata !4, null}
