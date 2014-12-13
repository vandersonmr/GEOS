; ModuleID = 'strcat.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"calloc strbuf\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"realloc strbuf\00", align 1
@.str2 = private unnamed_addr constant [7 x i8] c"hello\0A\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !33
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !33
  %1 = icmp eq i32 %argc, 2, !dbg !34
  br i1 %1, label %2, label %6, !dbg !34

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !35
  %4 = load i8** %3, align 8, !dbg !35, !tbaa !36
  %5 = tail call i32 @atoi(i8* %4) #7, !dbg !35
  br label %6, !dbg !35

; <label>:6                                       ; preds = %0, %2
  %7 = phi i32 [ %5, %2 ], [ 10000000, %0 ], !dbg !35
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !15), !dbg !35
  tail call void @llvm.dbg.value(metadata !40, i64 0, metadata !17), !dbg !41
  %8 = tail call noalias i8* @calloc(i64 1, i64 32) #6, !dbg !42
  tail call void @llvm.dbg.value(metadata !{i8* %8}, i64 0, metadata !18), !dbg !42
  tail call void @llvm.dbg.value(metadata !{i8* %8}, i64 0, metadata !19), !dbg !43
  tail call void @llvm.dbg.value(metadata !44, i64 0, metadata !20), !dbg !45
  %9 = icmp eq i8* %8, null, !dbg !46
  br i1 %9, label %11, label %.preheader, !dbg !46

.preheader:                                       ; preds = %6
  %10 = icmp sgt i32 %7, 0, !dbg !48
  br i1 %10, label %.lr.ph, label %._crit_edge, !dbg !48

; <label>:11                                      ; preds = %6
  tail call void @perror(i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0)) #8, !dbg !50
  tail call void @exit(i32 1) #9, !dbg !50
  unreachable, !dbg !50

.lr.ph:                                           ; preds = %.preheader, %27
  %i.05 = phi i32 [ %29, %27 ], [ 0, %.preheader ]
  %strend.04 = phi i8* [ %28, %27 ], [ %8, %.preheader ]
  %strbuf.03 = phi i8* [ %strbuf.1, %27 ], [ %8, %.preheader ]
  %buflen.02 = phi i32 [ %buflen.1, %27 ], [ 32, %.preheader ]
  %12 = sext i32 %buflen.02 to i64, !dbg !52
  %13 = getelementptr inbounds i8* %strbuf.03, i64 %12, !dbg !52
  %14 = ptrtoint i8* %13 to i64, !dbg !52
  %15 = ptrtoint i8* %strend.04 to i64, !dbg !52
  %16 = sub i64 %14, %15, !dbg !52
  %17 = icmp slt i64 %16, 7, !dbg !52
  br i1 %17, label %18, label %27, !dbg !52

; <label>:18                                      ; preds = %.lr.ph
  %19 = shl nsw i32 %buflen.02, 1, !dbg !55
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !17), !dbg !55
  %20 = sext i32 %19 to i64, !dbg !57
  %21 = tail call i8* @realloc(i8* %strbuf.03, i64 %20) #6, !dbg !57
  tail call void @llvm.dbg.value(metadata !{i8* %21}, i64 0, metadata !18), !dbg !57
  %22 = icmp eq i8* %21, null, !dbg !58
  br i1 %22, label %23, label %24, !dbg !58

; <label>:23                                      ; preds = %18
  tail call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0)) #8, !dbg !60
  tail call void @exit(i32 1) #9, !dbg !60
  unreachable, !dbg !60

; <label>:24                                      ; preds = %18
  %25 = tail call i64 @strlen(i8* %21) #7, !dbg !62
  %26 = getelementptr inbounds i8* %21, i64 %25, !dbg !62
  tail call void @llvm.dbg.value(metadata !{i8* %26}, i64 0, metadata !19), !dbg !62
  br label %27, !dbg !63

; <label>:27                                      ; preds = %24, %.lr.ph
  %buflen.1 = phi i32 [ %19, %24 ], [ %buflen.02, %.lr.ph ]
  %strbuf.1 = phi i8* [ %21, %24 ], [ %strbuf.03, %.lr.ph ]
  %strend.1 = phi i8* [ %26, %24 ], [ %strend.04, %.lr.ph ]
  %strlen = tail call i64 @strlen(i8* %strend.1), !dbg !64
  %endptr = getelementptr i8* %strend.1, i64 %strlen, !dbg !64
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %endptr, i8* getelementptr inbounds ([7 x i8]* @.str2, i64 0, i64 0), i64 7, i32 1, i1 false), !dbg !64
  %28 = getelementptr inbounds i8* %strend.1, i64 6, !dbg !65
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !19), !dbg !65
  %29 = add nsw i32 %i.05, 1, !dbg !48
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !16), !dbg !48
  %30 = icmp slt i32 %29, %7, !dbg !48
  br i1 %30, label %.lr.ph, label %._crit_edge, !dbg !48

._crit_edge:                                      ; preds = %27, %.preheader
  %strbuf.0.lcssa = phi i8* [ %8, %.preheader ], [ %strbuf.1, %27 ]
  %31 = tail call i64 @strlen(i8* %strbuf.0.lcssa) #7, !dbg !66
  %32 = trunc i64 %31 to i32, !dbg !66
  %33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 %32) #6, !dbg !66
  tail call void @free(i8* %strbuf.0.lcssa) #6, !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture readonly %__nptr) #1 {
  tail call void @llvm.dbg.value(metadata !{i8* %__nptr}, i64 0, metadata !29), !dbg !69
  %1 = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #6, !dbg !70
  %2 = trunc i64 %1 to i32, !dbg !70
  ret i32 %2, !dbg !70
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare void @perror(i8* nocapture readonly) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare noalias i8* @realloc(i8* nocapture, i64) #2

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #5

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #6

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }
attributes #8 = { cold nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!30, !31}
!llvm.ident = !{!32}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c] [DW_LANG_C99]
!1 = metadata !{metadata !"strcat.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !21}
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
!21 = metadata !{i32 786478, metadata !22, metadata !23, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @atoi, null, null, metadata !28, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!22 = metadata !{metadata !"/usr/include/stdlib.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!23 = metadata !{i32 786473, metadata !22}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{metadata !8, metadata !26}
!26 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!27 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!28 = metadata !{metadata !29}
!29 = metadata !{i32 786689, metadata !21, metadata !"__nptr", metadata !23, i32 16777494, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!30 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!31 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!32 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!33 = metadata !{i32 13, i32 0, metadata !4, null}
!34 = metadata !{i32 14, i32 0, metadata !4, null}
!35 = metadata !{i32 14, i32 28, metadata !4, null}
!36 = metadata !{metadata !37, metadata !37, i64 0}
!37 = metadata !{metadata !"any pointer", metadata !38, i64 0}
!38 = metadata !{metadata !"omnipotent char", metadata !39, i64 0}
!39 = metadata !{metadata !"Simple C/C++ TBAA"}
!40 = metadata !{i32 32}
!41 = metadata !{i32 15, i32 0, metadata !4, null}
!42 = metadata !{i32 16, i32 0, metadata !4, null}
!43 = metadata !{i32 17, i32 0, metadata !4, null}
!44 = metadata !{i32 6}
!45 = metadata !{i32 18, i32 0, metadata !4, null}
!46 = metadata !{i32 20, i32 0, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !4, i32 20, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!48 = metadata !{i32 21, i32 0, metadata !49, null}
!49 = metadata !{i32 786443, metadata !1, metadata !4, i32 21, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!50 = metadata !{i32 20, i32 0, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !47, i32 20, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!52 = metadata !{i32 22, i32 0, metadata !53, null}
!53 = metadata !{i32 786443, metadata !1, metadata !54, i32 22, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!54 = metadata !{i32 786443, metadata !1, metadata !49, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!55 = metadata !{i32 23, i32 0, metadata !56, null}
!56 = metadata !{i32 786443, metadata !1, metadata !53, i32 22, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!57 = metadata !{i32 24, i32 0, metadata !56, null}
!58 = metadata !{i32 25, i32 0, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !56, i32 25, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!60 = metadata !{i32 25, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !59, i32 25, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!62 = metadata !{i32 26, i32 0, metadata !56, null}
!63 = metadata !{i32 27, i32 0, metadata !56, null}
!64 = metadata !{i32 29, i32 0, metadata !54, null}
!65 = metadata !{i32 30, i32 0, metadata !54, null}
!66 = metadata !{i32 32, i32 0, metadata !4, null}
!67 = metadata !{i32 33, i32 0, metadata !4, null}
!68 = metadata !{i32 35, i32 0, metadata !4, null}
!69 = metadata !{i32 278, i32 0, metadata !21, null}
!70 = metadata !{i32 280, i32 0, metadata !71, null}
!71 = metadata !{i32 786443, metadata !22, metadata !21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
