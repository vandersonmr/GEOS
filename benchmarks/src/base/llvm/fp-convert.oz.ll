; ModuleID = 'fp-convert.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"Total is %g\0A\00", align 1

; Function Attrs: minsize nounwind optsize readonly uwtable
define double @loop(float* nocapture readonly %x, float* nocapture readonly %y, i64 %length) #0 {
  tail call void @llvm.dbg.value(metadata !{float* %x}, i64 0, metadata !13), !dbg !41
  tail call void @llvm.dbg.value(metadata !{float* %y}, i64 0, metadata !14), !dbg !41
  tail call void @llvm.dbg.value(metadata !{i64 %length}, i64 0, metadata !15), !dbg !41
  tail call void @llvm.dbg.value(metadata !42, i64 0, metadata !17), !dbg !43
  tail call void @llvm.dbg.value(metadata !44, i64 0, metadata !16), !dbg !45
  %1 = icmp sgt i64 %length, 0, !dbg !45
  br i1 %1, label %.lr.ph, label %._crit_edge, !dbg !45

.lr.ph:                                           ; preds = %0, %.lr.ph
  %accumulator.02 = phi double [ %9, %.lr.ph ], [ 0.000000e+00, %0 ]
  %i.01 = phi i64 [ %10, %.lr.ph ], [ 0, %0 ]
  %2 = getelementptr inbounds float* %x, i64 %i.01, !dbg !47
  %3 = load float* %2, align 4, !dbg !47, !tbaa !49
  %4 = fpext float %3 to double, !dbg !47
  %5 = getelementptr inbounds float* %y, i64 %i.01, !dbg !47
  %6 = load float* %5, align 4, !dbg !47, !tbaa !49
  %7 = fpext float %6 to double, !dbg !47
  %8 = fmul double %4, %7, !dbg !47
  %9 = fadd double %accumulator.02, %8, !dbg !47
  tail call void @llvm.dbg.value(metadata !{double %9}, i64 0, metadata !17), !dbg !47
  %10 = add nsw i64 %i.01, 1, !dbg !45
  tail call void @llvm.dbg.value(metadata !{i64 %10}, i64 0, metadata !16), !dbg !45
  %exitcond = icmp eq i64 %10, %length, !dbg !45
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !45

._crit_edge:                                      ; preds = %.lr.ph, %0
  %accumulator.0.lcssa = phi double [ 0.000000e+00, %0 ], [ %9, %.lr.ph ]
  ret double %accumulator.0.lcssa, !dbg !53
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #2 {
  %x = alloca [2048 x float], align 16
  %y = alloca [2048 x float], align 16
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !26), !dbg !54
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !27), !dbg !54
  %1 = bitcast [2048 x float]* %x to i8*, !dbg !55
  call void @llvm.lifetime.start(i64 8192, i8* %1) #3, !dbg !55
  tail call void @llvm.dbg.declare(metadata !{[2048 x float]* %x}, metadata !30), !dbg !55
  %2 = bitcast [2048 x float]* %y to i8*, !dbg !56
  call void @llvm.lifetime.start(i64 8192, i8* %2) #3, !dbg !56
  tail call void @llvm.dbg.declare(metadata !{[2048 x float]* %y}, metadata !34), !dbg !56
  tail call void @llvm.dbg.value(metadata !42, i64 0, metadata !35), !dbg !57
  tail call void @llvm.dbg.value(metadata !58, i64 0, metadata !36), !dbg !59
  tail call void @llvm.dbg.value(metadata !60, i64 0, metadata !37), !dbg !61
  tail call void @llvm.dbg.value(metadata !62, i64 0, metadata !28), !dbg !63
  %3 = getelementptr inbounds [2048 x float]* %x, i64 0, i64 0, !dbg !65
  %4 = getelementptr inbounds [2048 x float]* %y, i64 0, i64 0, !dbg !65
  br label %5, !dbg !63

; <label>:5                                       ; preds = %22, %0
  %total.03 = phi double [ 0.000000e+00, %0 ], [ %24, %22 ]
  %i.02 = phi i32 [ 0, %0 ], [ %25, %22 ]
  %6 = phi <2 x float> [ <float 0.000000e+00, float 1.000000e+00>, %0 ], [ %12, %22 ]
  %7 = srem i32 %i.02, 10, !dbg !67
  %8 = icmp eq i32 %7, 0, !dbg !67
  br i1 %8, label %9, label %11, !dbg !67

; <label>:9                                       ; preds = %5
  tail call void @llvm.dbg.value(metadata !69, i64 0, metadata !36), !dbg !70
  %10 = fadd <2 x float> %6, <float 0x3FB99999A0000000, float 0x3FC99999A0000000>, !dbg !70
  tail call void @llvm.dbg.value(metadata !69, i64 0, metadata !37), !dbg !72
  br label %11

; <label>:11                                      ; preds = %5, %9
  %12 = phi <2 x float> [ %10, %9 ], [ <float 0.000000e+00, float 1.000000e+00>, %5 ]
  %13 = extractelement <2 x float> %12, i32 1, !dbg !73
  %14 = extractelement <2 x float> %12, i32 0, !dbg !73
  tail call void @llvm.dbg.value(metadata !62, i64 0, metadata !29), !dbg !73
  br label %15, !dbg !73

; <label>:15                                      ; preds = %15, %11
  %indvars.iv = phi i64 [ 0, %11 ], [ %indvars.iv.next, %15 ]
  %16 = trunc i64 %indvars.iv to i32, !dbg !75
  %17 = sitofp i32 %16 to float, !dbg !75
  %18 = fadd float %14, %17, !dbg !75
  %19 = getelementptr inbounds [2048 x float]* %x, i64 0, i64 %indvars.iv, !dbg !75
  store float %18, float* %19, align 4, !dbg !75, !tbaa !49
  %20 = fadd float %13, %17, !dbg !77
  %21 = getelementptr inbounds [2048 x float]* %y, i64 0, i64 %indvars.iv, !dbg !77
  store float %20, float* %21, align 4, !dbg !77, !tbaa !49
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !73
  %exitcond = icmp eq i64 %indvars.iv.next, 2048, !dbg !73
  br i1 %exitcond, label %22, label %15, !dbg !73

; <label>:22                                      ; preds = %15
  %23 = call double @loop(float* %3, float* %4, i64 2048) #5, !dbg !65
  %24 = fadd double %total.03, %23, !dbg !65
  tail call void @llvm.dbg.value(metadata !{double %24}, i64 0, metadata !35), !dbg !65
  %25 = add nsw i32 %i.02, 1, !dbg !63
  tail call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !28), !dbg !63
  %exitcond6 = icmp eq i32 %25, 500000, !dbg !63
  br i1 %exitcond6, label %26, label %5, !dbg !63

; <label>:26                                      ; preds = %22
  %27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), double %24) #6, !dbg !78
  call void @llvm.lifetime.end(i64 8192, i8* %2) #3, !dbg !79
  call void @llvm.lifetime.end(i64 8192, i8* %1) #3, !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #4

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { minsize nounwind optsize readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { minsize optsize }
attributes #6 = { minsize nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!38, !39}
!llvm.ident = !{!40}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c] [DW_LANG_C99]
!1 = metadata !{metadata !"fp-convert.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !18}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"loop", metadata !"loop", metadata !"", i32 4, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (float*, float*, i64)* @loop, null, null, metadata !12, i32 4} ; [ DW_TAG_subprogram ] [line 4] [def] [loop]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !9, metadata !11}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!10 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!11 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16, metadata !17}
!13 = metadata !{i32 786689, metadata !4, metadata !"x", metadata !5, i32 16777220, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 4]
!14 = metadata !{i32 786689, metadata !4, metadata !"y", metadata !5, i32 33554436, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 4]
!15 = metadata !{i32 786689, metadata !4, metadata !"length", metadata !5, i32 50331652, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [length] [line 4]
!16 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 5, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 5]
!17 = metadata !{i32 786688, metadata !4, metadata !"accumulator", metadata !5, i32 6, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [accumulator] [line 6]
!18 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 19, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !25, i32 19} ; [ DW_TAG_subprogram ] [line 19] [def] [main]
!19 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = metadata !{metadata !21, metadata !21, metadata !22}
!21 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!24 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!25 = metadata !{metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !34, metadata !35, metadata !36, metadata !37}
!26 = metadata !{i32 786689, metadata !18, metadata !"argc", metadata !5, i32 16777235, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 19]
!27 = metadata !{i32 786689, metadata !18, metadata !"argv", metadata !5, i32 33554451, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 19]
!28 = metadata !{i32 786688, metadata !18, metadata !"i", metadata !5, i32 20, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 20]
!29 = metadata !{i32 786688, metadata !18, metadata !"j", metadata !5, i32 20, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 20]
!30 = metadata !{i32 786688, metadata !18, metadata !"x", metadata !5, i32 21, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 21]
!31 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 65536, i64 32, i32 0, i32 0, metadata !10, metadata !32, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 32, offset 0] [from float]
!32 = metadata !{metadata !33}
!33 = metadata !{i32 786465, i64 0, i64 2048}     ; [ DW_TAG_subrange_type ] [0, 2047]
!34 = metadata !{i32 786688, metadata !18, metadata !"y", metadata !5, i32 22, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 22]
!35 = metadata !{i32 786688, metadata !18, metadata !"total", metadata !5, i32 23, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [total] [line 23]
!36 = metadata !{i32 786688, metadata !18, metadata !"a", metadata !5, i32 24, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 24]
!37 = metadata !{i32 786688, metadata !18, metadata !"b", metadata !5, i32 25, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 25]
!38 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!39 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!40 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!41 = metadata !{i32 4, i32 0, metadata !4, null}
!42 = metadata !{double 0.000000e+00}
!43 = metadata !{i32 6, i32 0, metadata !4, null}
!44 = metadata !{i64 0}
!45 = metadata !{i32 7, i32 0, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !4, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!47 = metadata !{i32 8, i32 0, metadata !48, null} ; [ DW_TAG_imported_declaration ]
!48 = metadata !{i32 786443, metadata !1, metadata !46, i32 7, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!49 = metadata !{metadata !50, metadata !50, i64 0}
!50 = metadata !{metadata !"float", metadata !51, i64 0}
!51 = metadata !{metadata !"omnipotent char", metadata !52, i64 0}
!52 = metadata !{metadata !"Simple C/C++ TBAA"}
!53 = metadata !{i32 10, i32 0, metadata !4, null}
!54 = metadata !{i32 19, i32 0, metadata !18, null}
!55 = metadata !{i32 21, i32 0, metadata !18, null}
!56 = metadata !{i32 22, i32 0, metadata !18, null}
!57 = metadata !{i32 23, i32 0, metadata !18, null}
!58 = metadata !{float 0.000000e+00}
!59 = metadata !{i32 24, i32 0, metadata !18, null}
!60 = metadata !{float 1.000000e+00}
!61 = metadata !{i32 25, i32 0, metadata !18, null}
!62 = metadata !{i32 0}
!63 = metadata !{i32 27, i32 0, metadata !64, null}
!64 = metadata !{i32 786443, metadata !1, metadata !18, i32 27, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!65 = metadata !{i32 39, i32 0, metadata !66, null}
!66 = metadata !{i32 786443, metadata !1, metadata !64, i32 27, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!67 = metadata !{i32 28, i32 0, metadata !68, null}
!68 = metadata !{i32 786443, metadata !1, metadata !66, i32 28, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!69 = metadata !{float undef}
!70 = metadata !{i32 32, i32 0, metadata !71, null}
!71 = metadata !{i32 786443, metadata !1, metadata !68, i32 31, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!72 = metadata !{i32 33, i32 0, metadata !71, null}
!73 = metadata !{i32 35, i32 0, metadata !74, null}
!74 = metadata !{i32 786443, metadata !1, metadata !66, i32 35, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!75 = metadata !{i32 36, i32 0, metadata !76, null}
!76 = metadata !{i32 786443, metadata !1, metadata !74, i32 35, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!77 = metadata !{i32 37, i32 0, metadata !76, null}
!78 = metadata !{i32 42, i32 0, metadata !18, null}
!79 = metadata !{i32 44, i32 0, metadata !18, null}
!80 = metadata !{i32 45, i32 0, metadata !18, null}
