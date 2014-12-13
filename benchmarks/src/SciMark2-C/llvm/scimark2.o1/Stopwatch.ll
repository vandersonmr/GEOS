; ModuleID = 'Stopwatch.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Stopwatch_struct = type { i32, double, double }

@seconds.t = internal unnamed_addr global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define double @seconds() #0 {
  %1 = load double* @seconds.t, align 8, !dbg !53, !tbaa !54
  %2 = fadd double %1, 1.000000e+00, !dbg !53
  store double %2, double* @seconds.t, align 8, !dbg !53, !tbaa !54
  ret double %2, !dbg !53
}

; Function Attrs: nounwind uwtable
define void @Stopwtach_reset(%struct.Stopwatch_struct* nocapture %Q) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Stopwatch_struct* %Q}, i64 0, metadata !22), !dbg !58
  %1 = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 0, !dbg !59
  store i32 0, i32* %1, align 4, !dbg !59, !tbaa !60
  %2 = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 1, !dbg !63
  %3 = bitcast double* %2 to i8*, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 16, i32 8, i1 false), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nounwind uwtable
define noalias %struct.Stopwatch_struct* @new_Stopwatch() #0 {
  %1 = tail call noalias i8* @malloc(i64 24) #3, !dbg !65
  %2 = bitcast i8* %1 to %struct.Stopwatch_struct*, !dbg !65
  tail call void @llvm.dbg.value(metadata !{%struct.Stopwatch_struct* %2}, i64 0, metadata !27), !dbg !65
  %3 = icmp eq i8* %1, null, !dbg !66
  br i1 %3, label %5, label %4, !dbg !66

; <label>:4                                       ; preds = %0
  tail call void @Stopwtach_reset(%struct.Stopwatch_struct* %2), !dbg !68
  br label %5, !dbg !69

; <label>:5                                       ; preds = %0, %4
  %.0 = phi %struct.Stopwatch_struct* [ %2, %4 ], [ null, %0 ]
  ret %struct.Stopwatch_struct* %.0, !dbg !70
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define void @Stopwatch_delete(%struct.Stopwatch_struct* %S) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Stopwatch_struct* %S}, i64 0, metadata !30), !dbg !71
  %1 = icmp eq %struct.Stopwatch_struct* %S, null, !dbg !72
  br i1 %1, label %4, label %2, !dbg !72

; <label>:2                                       ; preds = %0
  %3 = bitcast %struct.Stopwatch_struct* %S to i8*, !dbg !74
  tail call void @free(i8* %3) #3, !dbg !74
  br label %4, !dbg !74

; <label>:4                                       ; preds = %0, %2
  ret void, !dbg !75
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @Stopwatch_start(%struct.Stopwatch_struct* nocapture %Q) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Stopwatch_struct* %Q}, i64 0, metadata !33), !dbg !76
  %1 = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 0, !dbg !77
  %2 = load i32* %1, align 4, !dbg !77, !tbaa !60
  %3 = icmp eq i32 %2, 0, !dbg !77
  br i1 %3, label %4, label %8, !dbg !77

; <label>:4                                       ; preds = %0
  store i32 1, i32* %1, align 4, !dbg !79, !tbaa !60
  %5 = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 2, !dbg !81
  store double 0.000000e+00, double* %5, align 8, !dbg !81, !tbaa !82
  %6 = tail call double @seconds(), !dbg !83
  %7 = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 1, !dbg !83
  store double %6, double* %7, align 8, !dbg !83, !tbaa !84
  br label %8, !dbg !85

; <label>:8                                       ; preds = %0, %4
  ret void, !dbg !86
}

; Function Attrs: nounwind uwtable
define void @Stopwatch_resume(%struct.Stopwatch_struct* nocapture %Q) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Stopwatch_struct* %Q}, i64 0, metadata !36), !dbg !87
  %1 = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 0, !dbg !88
  %2 = load i32* %1, align 4, !dbg !88, !tbaa !60
  %3 = icmp eq i32 %2, 0, !dbg !88
  br i1 %3, label %4, label %7, !dbg !88

; <label>:4                                       ; preds = %0
  %5 = tail call double @seconds(), !dbg !90
  %6 = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 1, !dbg !90
  store double %5, double* %6, align 8, !dbg !90, !tbaa !84
  store i32 1, i32* %1, align 4, !dbg !92, !tbaa !60
  br label %7, !dbg !93

; <label>:7                                       ; preds = %0, %4
  ret void, !dbg !94
}

; Function Attrs: nounwind uwtable
define void @Stopwatch_stop(%struct.Stopwatch_struct* nocapture %Q) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Stopwatch_struct* %Q}, i64 0, metadata !39), !dbg !95
  %1 = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 0, !dbg !96
  %2 = load i32* %1, align 4, !dbg !96, !tbaa !60
  %3 = icmp eq i32 %2, 0, !dbg !96
  br i1 %3, label %12, label %4, !dbg !96

; <label>:4                                       ; preds = %0
  %5 = tail call double @seconds(), !dbg !98
  %6 = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 1, !dbg !98
  %7 = load double* %6, align 8, !dbg !98, !tbaa !84
  %8 = fsub double %5, %7, !dbg !98
  %9 = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 2, !dbg !98
  %10 = load double* %9, align 8, !dbg !98, !tbaa !82
  %11 = fadd double %10, %8, !dbg !98
  store double %11, double* %9, align 8, !dbg !98, !tbaa !82
  store i32 0, i32* %1, align 4, !dbg !100, !tbaa !60
  br label %12, !dbg !101

; <label>:12                                      ; preds = %0, %4
  ret void, !dbg !102
}

; Function Attrs: nounwind uwtable
define double @Stopwatch_read(%struct.Stopwatch_struct* nocapture %Q) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Stopwatch_struct* %Q}, i64 0, metadata !44), !dbg !103
  %1 = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 0, !dbg !104
  %2 = load i32* %1, align 4, !dbg !104, !tbaa !60
  %3 = icmp eq i32 %2, 0, !dbg !104
  br i1 %3, label %12, label %4, !dbg !104

; <label>:4                                       ; preds = %0
  %5 = tail call double @seconds(), !dbg !105
  tail call void @llvm.dbg.value(metadata !{double %5}, i64 0, metadata !45), !dbg !105
  %6 = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 1, !dbg !106
  %7 = load double* %6, align 8, !dbg !106, !tbaa !84
  %8 = fsub double %5, %7, !dbg !106
  %9 = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 2, !dbg !106
  %10 = load double* %9, align 8, !dbg !106, !tbaa !82
  %11 = fadd double %10, %8, !dbg !106
  store double %11, double* %9, align 8, !dbg !106, !tbaa !82
  store double %5, double* %6, align 8, !dbg !107, !tbaa !84
  br label %12, !dbg !108

; <label>:12                                      ; preds = %0, %4
  %13 = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 2, !dbg !109
  %14 = load double* %13, align 8, !dbg !109, !tbaa !82
  ret double %14, !dbg !109
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!50, !51}
!llvm.ident = !{!52}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !48, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c] [DW_LANG_C99]
!1 = metadata !{metadata !"Stopwatch.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !23, metadata !28, metadata !31, metadata !34, metadata !37, metadata !40}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"seconds", metadata !"seconds", metadata !"", i32 4, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, double ()* @seconds, null, null, metadata !2, i32 5} ; [ DW_TAG_subprogram ] [line 4] [def] [scope 5] [seconds]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Stopwtach_reset", metadata !"Stopwtach_reset", metadata !"", i32 11, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.Stopwatch_struct*)* @Stopwtach_reset, null, null, metadata !21, i32 12} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 12] [Stopwtach_reset]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null, metadata !12}
!12 = metadata !{i32 786454, metadata !13, null, metadata !"Stopwatch", i32 9, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_typedef ] [Stopwatch] [line 9, size 0, align 0, offset 0] [from ]
!13 = metadata !{metadata !"./Stopwatch.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!14 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!15 = metadata !{i32 786451, metadata !13, null, metadata !"", i32 4, i64 192, i64 64, i32 0, i32 0, null, metadata !16, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 4, size 192, align 64, offset 0] [def] [from ]
!16 = metadata !{metadata !17, metadata !19, metadata !20}
!17 = metadata !{i32 786445, metadata !13, metadata !15, metadata !"running", i32 5, i64 32, i64 32, i64 0, i32 0, metadata !18} ; [ DW_TAG_member ] [running] [line 5, size 32, align 32, offset 0] [from int]
!18 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!19 = metadata !{i32 786445, metadata !13, metadata !15, metadata !"last_time", i32 6, i64 64, i64 64, i64 64, i32 0, metadata !8} ; [ DW_TAG_member ] [last_time] [line 6, size 64, align 64, offset 64] [from double]
!20 = metadata !{i32 786445, metadata !13, metadata !15, metadata !"total", i32 7, i64 64, i64 64, i64 128, i32 0, metadata !8} ; [ DW_TAG_member ] [total] [line 7, size 64, align 64, offset 128] [from double]
!21 = metadata !{metadata !22}
!22 = metadata !{i32 786689, metadata !9, metadata !"Q", metadata !5, i32 16777227, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Q] [line 11]
!23 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"new_Stopwatch", metadata !"new_Stopwatch", metadata !"", i32 19, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.Stopwatch_struct* ()* @new_Stopwatch, null, null, metadata !26, i32 20} ; [ DW_TAG_subprogram ] [line 19] [def] [scope 20] [new_Stopwatch]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{metadata !12}
!26 = metadata !{metadata !27}
!27 = metadata !{i32 786688, metadata !23, metadata !"S", metadata !5, i32 21, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [S] [line 21]
!28 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Stopwatch_delete", metadata !"Stopwatch_delete", metadata !"", i32 29, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.Stopwatch_struct*)* @Stopwatch_delete, null, null, metadata !29, i32 30} ; [ DW_TAG_subprogram ] [line 29] [def] [scope 30] [Stopwatch_delete]
!29 = metadata !{metadata !30}
!30 = metadata !{i32 786689, metadata !28, metadata !"S", metadata !5, i32 16777245, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [S] [line 29]
!31 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Stopwatch_start", metadata !"Stopwatch_start", metadata !"", i32 38, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.Stopwatch_struct*)* @Stopwatch_start, null, null, metadata !32, i32 39} ; [ DW_TAG_subprogram ] [line 38] [def] [scope 39] [Stopwatch_start]
!32 = metadata !{metadata !33}
!33 = metadata !{i32 786689, metadata !31, metadata !"Q", metadata !5, i32 16777254, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Q] [line 38]
!34 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Stopwatch_resume", metadata !"Stopwatch_resume", metadata !"", i32 54, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.Stopwatch_struct*)* @Stopwatch_resume, null, null, metadata !35, i32 55} ; [ DW_TAG_subprogram ] [line 54] [def] [scope 55] [Stopwatch_resume]
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786689, metadata !34, metadata !"Q", metadata !5, i32 16777270, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Q] [line 54]
!37 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Stopwatch_stop", metadata !"Stopwatch_stop", metadata !"", i32 63, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.Stopwatch_struct*)* @Stopwatch_stop, null, null, metadata !38, i32 64} ; [ DW_TAG_subprogram ] [line 63] [def] [scope 64] [Stopwatch_stop]
!38 = metadata !{metadata !39}
!39 = metadata !{i32 786689, metadata !37, metadata !"Q", metadata !5, i32 16777279, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Q] [line 63]
!40 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Stopwatch_read", metadata !"Stopwatch_read", metadata !"", i32 73, metadata !41, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (%struct.Stopwatch_struct*)* @Stopwatch_read, null, null, metadata !43, i32 74} ; [ DW_TAG_subprogram ] [line 73] [def] [scope 74] [Stopwatch_read]
!41 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !42, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = metadata !{metadata !8, metadata !12}
!43 = metadata !{metadata !44, metadata !45}
!44 = metadata !{i32 786689, metadata !40, metadata !"Q", metadata !5, i32 16777289, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Q] [line 73]
!45 = metadata !{i32 786688, metadata !46, metadata !"t", metadata !5, i32 78, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 78]
!46 = metadata !{i32 786443, metadata !1, metadata !47, i32 77, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!47 = metadata !{i32 786443, metadata !1, metadata !40, i32 76, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!48 = metadata !{metadata !49}
!49 = metadata !{i32 786484, i32 0, metadata !4, metadata !"t", metadata !"t", metadata !"", metadata !5, i32 7, metadata !8, i32 1, i32 1, double* @seconds.t, null} ; [ DW_TAG_variable ] [t] [line 7] [local] [def]
!50 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!51 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!52 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!53 = metadata !{i32 8, i32 0, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!54 = metadata !{metadata !55, metadata !55, i64 0}
!55 = metadata !{metadata !"double", metadata !56, i64 0}
!56 = metadata !{metadata !"omnipotent char", metadata !57, i64 0}
!57 = metadata !{metadata !"Simple C/C++ TBAA"}
!58 = metadata !{i32 11, i32 0, metadata !9, null}
!59 = metadata !{i32 13, i32 0, metadata !9, null}
!60 = metadata !{metadata !61, metadata !62, i64 0}
!61 = metadata !{metadata !"", metadata !62, i64 0, metadata !55, i64 8, metadata !55, i64 16}
!62 = metadata !{metadata !"int", metadata !56, i64 0}
!63 = metadata !{i32 14, i32 0, metadata !9, null}
!64 = metadata !{i32 16, i32 0, metadata !9, null}
!65 = metadata !{i32 21, i32 0, metadata !23, null}
!66 = metadata !{i32 22, i32 0, metadata !67, null}
!67 = metadata !{i32 786443, metadata !1, metadata !23, i32 22, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!68 = metadata !{i32 25, i32 0, metadata !23, null}
!69 = metadata !{i32 26, i32 0, metadata !23, null}
!70 = metadata !{i32 27, i32 0, metadata !23, null}
!71 = metadata !{i32 29, i32 0, metadata !28, null}
!72 = metadata !{i32 31, i32 0, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !28, i32 31, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!74 = metadata !{i32 32, i32 0, metadata !73, null}
!75 = metadata !{i32 33, i32 0, metadata !28, null}
!76 = metadata !{i32 38, i32 0, metadata !31, null}
!77 = metadata !{i32 40, i32 0, metadata !78, null}
!78 = metadata !{i32 786443, metadata !1, metadata !31, i32 40, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!79 = metadata !{i32 42, i32 0, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !78, i32 41, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!81 = metadata !{i32 43, i32 0, metadata !80, null}
!82 = metadata !{metadata !61, metadata !55, i64 16}
!83 = metadata !{i32 44, i32 0, metadata !80, null}
!84 = metadata !{metadata !61, metadata !55, i64 8}
!85 = metadata !{i32 45, i32 0, metadata !80, null}
!86 = metadata !{i32 46, i32 0, metadata !31, null}
!87 = metadata !{i32 54, i32 0, metadata !34, null}
!88 = metadata !{i32 56, i32 0, metadata !89, null}
!89 = metadata !{i32 786443, metadata !1, metadata !34, i32 56, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!90 = metadata !{i32 58, i32 0, metadata !91, null} ; [ DW_TAG_imported_module ]
!91 = metadata !{i32 786443, metadata !1, metadata !89, i32 57, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!92 = metadata !{i32 59, i32 0, metadata !91, null}
!93 = metadata !{i32 60, i32 0, metadata !91, null}
!94 = metadata !{i32 61, i32 0, metadata !34, null}
!95 = metadata !{i32 63, i32 0, metadata !37, null}
!96 = metadata !{i32 65, i32 0, metadata !97, null}
!97 = metadata !{i32 786443, metadata !1, metadata !37, i32 65, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!98 = metadata !{i32 67, i32 0, metadata !99, null}
!99 = metadata !{i32 786443, metadata !1, metadata !97, i32 66, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!100 = metadata !{i32 68, i32 0, metadata !99, null}
!101 = metadata !{i32 69, i32 0, metadata !99, null}
!102 = metadata !{i32 70, i32 0, metadata !37, null}
!103 = metadata !{i32 73, i32 0, metadata !40, null}
!104 = metadata !{i32 76, i32 0, metadata !47, null}
!105 = metadata !{i32 78, i32 0, metadata !46, null}
!106 = metadata !{i32 79, i32 0, metadata !46, null}
!107 = metadata !{i32 80, i32 0, metadata !46, null}
!108 = metadata !{i32 81, i32 0, metadata !46, null}
!109 = metadata !{i32 82, i32 0, metadata !40, null}
