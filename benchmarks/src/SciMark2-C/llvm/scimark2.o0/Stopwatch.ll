; ModuleID = 'Stopwatch.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Stopwatch_struct = type { i32, double, double }

@seconds.t = internal global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define double @seconds() #0 {
  %1 = load double* @seconds.t, align 8, !dbg !36
  %2 = fadd double %1, 1.000000e+00, !dbg !36
  store double %2, double* @seconds.t, align 8, !dbg !36
  ret double %2, !dbg !36
}

; Function Attrs: nounwind uwtable
define void @Stopwtach_reset(%struct.Stopwatch_struct* %Q) #0 {
  %1 = alloca %struct.Stopwatch_struct*, align 8
  store %struct.Stopwatch_struct* %Q, %struct.Stopwatch_struct** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Stopwatch_struct** %1}, metadata !37), !dbg !38
  %2 = load %struct.Stopwatch_struct** %1, align 8, !dbg !39
  %3 = getelementptr inbounds %struct.Stopwatch_struct* %2, i32 0, i32 0, !dbg !39
  store i32 0, i32* %3, align 4, !dbg !39
  %4 = load %struct.Stopwatch_struct** %1, align 8, !dbg !40
  %5 = getelementptr inbounds %struct.Stopwatch_struct* %4, i32 0, i32 1, !dbg !40
  store double 0.000000e+00, double* %5, align 8, !dbg !40
  %6 = load %struct.Stopwatch_struct** %1, align 8, !dbg !41
  %7 = getelementptr inbounds %struct.Stopwatch_struct* %6, i32 0, i32 2, !dbg !41
  store double 0.000000e+00, double* %7, align 8, !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define %struct.Stopwatch_struct* @new_Stopwatch() #0 {
  %1 = alloca %struct.Stopwatch_struct*, align 8
  %S = alloca %struct.Stopwatch_struct*, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Stopwatch_struct** %S}, metadata !43), !dbg !44
  %2 = call noalias i8* @malloc(i64 24) #3, !dbg !44
  %3 = bitcast i8* %2 to %struct.Stopwatch_struct*, !dbg !44
  store %struct.Stopwatch_struct* %3, %struct.Stopwatch_struct** %S, align 8, !dbg !44
  %4 = load %struct.Stopwatch_struct** %S, align 8, !dbg !45
  %5 = icmp eq %struct.Stopwatch_struct* %4, null, !dbg !45
  br i1 %5, label %6, label %7, !dbg !45

; <label>:6                                       ; preds = %0
  store %struct.Stopwatch_struct* null, %struct.Stopwatch_struct** %1, !dbg !47
  br label %10, !dbg !47

; <label>:7                                       ; preds = %0
  %8 = load %struct.Stopwatch_struct** %S, align 8, !dbg !48
  call void @Stopwtach_reset(%struct.Stopwatch_struct* %8), !dbg !48
  %9 = load %struct.Stopwatch_struct** %S, align 8, !dbg !49
  store %struct.Stopwatch_struct* %9, %struct.Stopwatch_struct** %1, !dbg !49
  br label %10, !dbg !49

; <label>:10                                      ; preds = %7, %6
  %11 = load %struct.Stopwatch_struct** %1, !dbg !50
  ret %struct.Stopwatch_struct* %11, !dbg !50
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define void @Stopwatch_delete(%struct.Stopwatch_struct* %S) #0 {
  %1 = alloca %struct.Stopwatch_struct*, align 8
  store %struct.Stopwatch_struct* %S, %struct.Stopwatch_struct** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Stopwatch_struct** %1}, metadata !51), !dbg !52
  %2 = load %struct.Stopwatch_struct** %1, align 8, !dbg !53
  %3 = icmp ne %struct.Stopwatch_struct* %2, null, !dbg !53
  br i1 %3, label %4, label %7, !dbg !53

; <label>:4                                       ; preds = %0
  %5 = load %struct.Stopwatch_struct** %1, align 8, !dbg !55
  %6 = bitcast %struct.Stopwatch_struct* %5 to i8*, !dbg !55
  call void @free(i8* %6) #3, !dbg !55
  br label %7, !dbg !55

; <label>:7                                       ; preds = %4, %0
  ret void, !dbg !56
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @Stopwatch_start(%struct.Stopwatch_struct* %Q) #0 {
  %1 = alloca %struct.Stopwatch_struct*, align 8
  store %struct.Stopwatch_struct* %Q, %struct.Stopwatch_struct** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Stopwatch_struct** %1}, metadata !57), !dbg !58
  %2 = load %struct.Stopwatch_struct** %1, align 8, !dbg !59
  %3 = getelementptr inbounds %struct.Stopwatch_struct* %2, i32 0, i32 0, !dbg !59
  %4 = load i32* %3, align 4, !dbg !59
  %5 = icmp ne i32 %4, 0, !dbg !59
  br i1 %5, label %14, label %6, !dbg !59

; <label>:6                                       ; preds = %0
  %7 = load %struct.Stopwatch_struct** %1, align 8, !dbg !61
  %8 = getelementptr inbounds %struct.Stopwatch_struct* %7, i32 0, i32 0, !dbg !61
  store i32 1, i32* %8, align 4, !dbg !61
  %9 = load %struct.Stopwatch_struct** %1, align 8, !dbg !63
  %10 = getelementptr inbounds %struct.Stopwatch_struct* %9, i32 0, i32 2, !dbg !63
  store double 0.000000e+00, double* %10, align 8, !dbg !63
  %11 = call double @seconds(), !dbg !64
  %12 = load %struct.Stopwatch_struct** %1, align 8, !dbg !64
  %13 = getelementptr inbounds %struct.Stopwatch_struct* %12, i32 0, i32 1, !dbg !64
  store double %11, double* %13, align 8, !dbg !64
  br label %14, !dbg !65

; <label>:14                                      ; preds = %6, %0
  ret void, !dbg !66
}

; Function Attrs: nounwind uwtable
define void @Stopwatch_resume(%struct.Stopwatch_struct* %Q) #0 {
  %1 = alloca %struct.Stopwatch_struct*, align 8
  store %struct.Stopwatch_struct* %Q, %struct.Stopwatch_struct** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Stopwatch_struct** %1}, metadata !67), !dbg !68
  %2 = load %struct.Stopwatch_struct** %1, align 8, !dbg !69
  %3 = getelementptr inbounds %struct.Stopwatch_struct* %2, i32 0, i32 0, !dbg !69
  %4 = load i32* %3, align 4, !dbg !69
  %5 = icmp ne i32 %4, 0, !dbg !69
  br i1 %5, label %12, label %6, !dbg !69

; <label>:6                                       ; preds = %0
  %7 = call double @seconds(), !dbg !71
  %8 = load %struct.Stopwatch_struct** %1, align 8, !dbg !71
  %9 = getelementptr inbounds %struct.Stopwatch_struct* %8, i32 0, i32 1, !dbg !71
  store double %7, double* %9, align 8, !dbg !71
  %10 = load %struct.Stopwatch_struct** %1, align 8, !dbg !73
  %11 = getelementptr inbounds %struct.Stopwatch_struct* %10, i32 0, i32 0, !dbg !73
  store i32 1, i32* %11, align 4, !dbg !73
  br label %12, !dbg !74

; <label>:12                                      ; preds = %6, %0
  ret void, !dbg !75
}

; Function Attrs: nounwind uwtable
define void @Stopwatch_stop(%struct.Stopwatch_struct* %Q) #0 {
  %1 = alloca %struct.Stopwatch_struct*, align 8
  store %struct.Stopwatch_struct* %Q, %struct.Stopwatch_struct** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Stopwatch_struct** %1}, metadata !76), !dbg !77
  %2 = load %struct.Stopwatch_struct** %1, align 8, !dbg !78
  %3 = getelementptr inbounds %struct.Stopwatch_struct* %2, i32 0, i32 0, !dbg !78
  %4 = load i32* %3, align 4, !dbg !78
  %5 = icmp ne i32 %4, 0, !dbg !78
  br i1 %5, label %6, label %18, !dbg !78

; <label>:6                                       ; preds = %0
  %7 = call double @seconds(), !dbg !80
  %8 = load %struct.Stopwatch_struct** %1, align 8, !dbg !80
  %9 = getelementptr inbounds %struct.Stopwatch_struct* %8, i32 0, i32 1, !dbg !80
  %10 = load double* %9, align 8, !dbg !80
  %11 = fsub double %7, %10, !dbg !80
  %12 = load %struct.Stopwatch_struct** %1, align 8, !dbg !80
  %13 = getelementptr inbounds %struct.Stopwatch_struct* %12, i32 0, i32 2, !dbg !80
  %14 = load double* %13, align 8, !dbg !80
  %15 = fadd double %14, %11, !dbg !80
  store double %15, double* %13, align 8, !dbg !80
  %16 = load %struct.Stopwatch_struct** %1, align 8, !dbg !82
  %17 = getelementptr inbounds %struct.Stopwatch_struct* %16, i32 0, i32 0, !dbg !82
  store i32 0, i32* %17, align 4, !dbg !82
  br label %18, !dbg !83

; <label>:18                                      ; preds = %6, %0
  ret void, !dbg !84
}

; Function Attrs: nounwind uwtable
define double @Stopwatch_read(%struct.Stopwatch_struct* %Q) #0 {
  %1 = alloca %struct.Stopwatch_struct*, align 8
  %t = alloca double, align 8
  store %struct.Stopwatch_struct* %Q, %struct.Stopwatch_struct** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Stopwatch_struct** %1}, metadata !85), !dbg !86
  %2 = load %struct.Stopwatch_struct** %1, align 8, !dbg !87
  %3 = getelementptr inbounds %struct.Stopwatch_struct* %2, i32 0, i32 0, !dbg !87
  %4 = load i32* %3, align 4, !dbg !87
  %5 = icmp ne i32 %4, 0, !dbg !87
  br i1 %5, label %6, label %20, !dbg !87

; <label>:6                                       ; preds = %0
  call void @llvm.dbg.declare(metadata !{double* %t}, metadata !89), !dbg !91
  %7 = call double @seconds(), !dbg !91
  store double %7, double* %t, align 8, !dbg !91
  %8 = load double* %t, align 8, !dbg !92
  %9 = load %struct.Stopwatch_struct** %1, align 8, !dbg !92
  %10 = getelementptr inbounds %struct.Stopwatch_struct* %9, i32 0, i32 1, !dbg !92
  %11 = load double* %10, align 8, !dbg !92
  %12 = fsub double %8, %11, !dbg !92
  %13 = load %struct.Stopwatch_struct** %1, align 8, !dbg !92
  %14 = getelementptr inbounds %struct.Stopwatch_struct* %13, i32 0, i32 2, !dbg !92
  %15 = load double* %14, align 8, !dbg !92
  %16 = fadd double %15, %12, !dbg !92
  store double %16, double* %14, align 8, !dbg !92
  %17 = load double* %t, align 8, !dbg !93
  %18 = load %struct.Stopwatch_struct** %1, align 8, !dbg !93
  %19 = getelementptr inbounds %struct.Stopwatch_struct* %18, i32 0, i32 1, !dbg !93
  store double %17, double* %19, align 8, !dbg !93
  br label %20, !dbg !94

; <label>:20                                      ; preds = %6, %0
  %21 = load %struct.Stopwatch_struct** %1, align 8, !dbg !95
  %22 = getelementptr inbounds %struct.Stopwatch_struct* %21, i32 0, i32 2, !dbg !95
  %23 = load double* %22, align 8, !dbg !95
  ret double %23, !dbg !95
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!33, !34}
!llvm.ident = !{!35}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !31, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c] [DW_LANG_C99]
!1 = metadata !{metadata !"Stopwatch.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !21, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"seconds", metadata !"seconds", metadata !"", i32 4, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, double ()* @seconds, null, null, metadata !2, i32 5} ; [ DW_TAG_subprogram ] [line 4] [def] [scope 5] [seconds]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Stopwtach_reset", metadata !"Stopwtach_reset", metadata !"", i32 11, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.Stopwatch_struct*)* @Stopwtach_reset, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 12] [Stopwtach_reset]
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
!21 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"new_Stopwatch", metadata !"new_Stopwatch", metadata !"", i32 19, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.Stopwatch_struct* ()* @new_Stopwatch, null, null, metadata !2, i32 20} ; [ DW_TAG_subprogram ] [line 19] [def] [scope 20] [new_Stopwatch]
!22 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{metadata !12}
!24 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Stopwatch_delete", metadata !"Stopwatch_delete", metadata !"", i32 29, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.Stopwatch_struct*)* @Stopwatch_delete, null, null, metadata !2, i32 30} ; [ DW_TAG_subprogram ] [line 29] [def] [scope 30] [Stopwatch_delete]
!25 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Stopwatch_start", metadata !"Stopwatch_start", metadata !"", i32 38, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.Stopwatch_struct*)* @Stopwatch_start, null, null, metadata !2, i32 39} ; [ DW_TAG_subprogram ] [line 38] [def] [scope 39] [Stopwatch_start]
!26 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Stopwatch_resume", metadata !"Stopwatch_resume", metadata !"", i32 54, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.Stopwatch_struct*)* @Stopwatch_resume, null, null, metadata !2, i32 55} ; [ DW_TAG_subprogram ] [line 54] [def] [scope 55] [Stopwatch_resume]
!27 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Stopwatch_stop", metadata !"Stopwatch_stop", metadata !"", i32 63, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.Stopwatch_struct*)* @Stopwatch_stop, null, null, metadata !2, i32 64} ; [ DW_TAG_subprogram ] [line 63] [def] [scope 64] [Stopwatch_stop]
!28 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Stopwatch_read", metadata !"Stopwatch_read", metadata !"", i32 73, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (%struct.Stopwatch_struct*)* @Stopwatch_read, null, null, metadata !2, i32 74} ; [ DW_TAG_subprogram ] [line 73] [def] [scope 74] [Stopwatch_read]
!29 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{metadata !8, metadata !12}
!31 = metadata !{metadata !32}
!32 = metadata !{i32 786484, i32 0, metadata !4, metadata !"t", metadata !"t", metadata !"", metadata !5, i32 7, metadata !8, i32 1, i32 1, double* @seconds.t, null} ; [ DW_TAG_variable ] [t] [line 7] [local] [def]
!33 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!34 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!35 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!36 = metadata !{i32 8, i32 0, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!37 = metadata !{i32 786689, metadata !9, metadata !"Q", metadata !5, i32 16777227, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Q] [line 11]
!38 = metadata !{i32 11, i32 0, metadata !9, null}
!39 = metadata !{i32 13, i32 0, metadata !9, null}
!40 = metadata !{i32 14, i32 0, metadata !9, null}
!41 = metadata !{i32 15, i32 0, metadata !9, null}
!42 = metadata !{i32 16, i32 0, metadata !9, null}
!43 = metadata !{i32 786688, metadata !21, metadata !"S", metadata !5, i32 21, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [S] [line 21]
!44 = metadata !{i32 21, i32 0, metadata !21, null}
!45 = metadata !{i32 22, i32 0, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !21, i32 22, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!47 = metadata !{i32 23, i32 0, metadata !46, null}
!48 = metadata !{i32 25, i32 0, metadata !21, null}
!49 = metadata !{i32 26, i32 0, metadata !21, null}
!50 = metadata !{i32 27, i32 0, metadata !21, null}
!51 = metadata !{i32 786689, metadata !24, metadata !"S", metadata !5, i32 16777245, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [S] [line 29]
!52 = metadata !{i32 29, i32 0, metadata !24, null}
!53 = metadata !{i32 31, i32 0, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !24, i32 31, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!55 = metadata !{i32 32, i32 0, metadata !54, null}
!56 = metadata !{i32 33, i32 0, metadata !24, null}
!57 = metadata !{i32 786689, metadata !25, metadata !"Q", metadata !5, i32 16777254, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Q] [line 38]
!58 = metadata !{i32 38, i32 0, metadata !25, null}
!59 = metadata !{i32 40, i32 0, metadata !60, null}
!60 = metadata !{i32 786443, metadata !1, metadata !25, i32 40, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!61 = metadata !{i32 42, i32 0, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !60, i32 41, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!63 = metadata !{i32 43, i32 0, metadata !62, null}
!64 = metadata !{i32 44, i32 0, metadata !62, null}
!65 = metadata !{i32 45, i32 0, metadata !62, null}
!66 = metadata !{i32 46, i32 0, metadata !25, null}
!67 = metadata !{i32 786689, metadata !26, metadata !"Q", metadata !5, i32 16777270, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Q] [line 54]
!68 = metadata !{i32 54, i32 0, metadata !26, null}
!69 = metadata !{i32 56, i32 0, metadata !70, null}
!70 = metadata !{i32 786443, metadata !1, metadata !26, i32 56, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!71 = metadata !{i32 58, i32 0, metadata !72, null} ; [ DW_TAG_imported_module ]
!72 = metadata !{i32 786443, metadata !1, metadata !70, i32 57, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!73 = metadata !{i32 59, i32 0, metadata !72, null}
!74 = metadata !{i32 60, i32 0, metadata !72, null}
!75 = metadata !{i32 61, i32 0, metadata !26, null}
!76 = metadata !{i32 786689, metadata !27, metadata !"Q", metadata !5, i32 16777279, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Q] [line 63]
!77 = metadata !{i32 63, i32 0, metadata !27, null}
!78 = metadata !{i32 65, i32 0, metadata !79, null}
!79 = metadata !{i32 786443, metadata !1, metadata !27, i32 65, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!80 = metadata !{i32 67, i32 0, metadata !81, null}
!81 = metadata !{i32 786443, metadata !1, metadata !79, i32 66, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!82 = metadata !{i32 68, i32 0, metadata !81, null}
!83 = metadata !{i32 69, i32 0, metadata !81, null}
!84 = metadata !{i32 70, i32 0, metadata !27, null}
!85 = metadata !{i32 786689, metadata !28, metadata !"Q", metadata !5, i32 16777289, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Q] [line 73]
!86 = metadata !{i32 73, i32 0, metadata !28, null}
!87 = metadata !{i32 76, i32 0, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !28, i32 76, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!89 = metadata !{i32 786688, metadata !90, metadata !"t", metadata !5, i32 78, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 78]
!90 = metadata !{i32 786443, metadata !1, metadata !88, i32 77, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Stopwatch.c]
!91 = metadata !{i32 78, i32 0, metadata !90, null}
!92 = metadata !{i32 79, i32 0, metadata !90, null}
!93 = metadata !{i32 80, i32 0, metadata !90, null}
!94 = metadata !{i32 81, i32 0, metadata !90, null}
!95 = metadata !{i32 82, i32 0, metadata !28, null}
